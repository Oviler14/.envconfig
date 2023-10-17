#
#  For information on ARMs infrastructure refer to the training document:
#  http://wiki.arm.com/Sysadmin/ClusterEnvironmentTraining
#  modulesinfrastructuretraining.pptx
#######################################
#
# => USER SET => LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=<user setting>
# - user setting will be appended to $LD_LIBRARY_PATH
#######################################
#
# => USER SET => PATH
# export PATH=<user settings>
# - user setting will be appended to $PATH
#######################################
#
# => STANDARD shell init & cluster access
#######################################
source /arm/tools/setup/init/bash
module load arm/cluster
#
# => BEGIN CUSTOMIZATION
#######################################

# Modules
module load swdev git/git/2.37.0
#module load arm/clusterfg/1.0
module load util vim/vim/8.2
module load swdev python/python/2.7.8
module load util armandino/txtstyle/1.1.2

# Terminal Options
export PS1="\n\[\033[38;5;134m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')\[$(tput sgr0)\] \[\033[38;5;110m\]\t\[$(tput sgr0)\] \[\033[38;5;79m\]\w\[$(tput sgr0)\]\n\\$\[$(tput sgr0)\] "
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function up() {
  case $1 in
    *[!0-9]*)
        [[ $PWD =~ (.*/$1[^/]*/).* ]] && cd ${BASH_REMATCH[1]}
      ;;
    *)
      cd $(printf "%0.0s../" $(seq 1 $1));
    ;;
  esac
}
function Du() {
  du -hd $1 | sort -hr
}
bind '"\t":menu-complete'
bind '"`":menu-complete-backward'
bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"
bind "set menu-complete-display-prefix on"
bind '"\C-d": backward-kill-word'



# General
alias ll='ls -lah'
alias Brc='vim ~/.bashrc'
alias Vrc='vim ~/.vimrc'
alias ls='ls $LS_OPTIONS'
alias C='clear'
alias lt='ls --human-readable --size -1 -S --classify'
alias dusize='du -h | sort -h'
alias fg='module load arm/clusterfg/1.0'
alias Find='find . -iname'
alias Lock='lsof +D'
alias Colours='for COLOR in {1..255}; do echo -en "\e[38;5;${COLOR}m${COLOR} "; done; echo;'
alias Track='git log --follow -p --'

CI() {
  git push origin HEAD:refs/for/"$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
}

rund() { 
  command rund "$@" | txts -n luna_log 
}

function Commitnt() {
  git reset HEAD~$1 --soft
}

# Project bindings
function Genp() {
  case $* in
    des* ) shift 1; command genp df $pol/packages.yaml:scp_customization "$@" ;;
    tb* ) shift 1; command genp df $pol/packages.yaml:scp_top_tb "$@" ;;
  esac
}

function SCP
{
export scp=/projects/ssg/pj32000042_blackbird/users/oliman01/e_scp_f4
export pol=$scp/client_polaris.canvas
export top=$pol/scp_top_tb/logical/scp_top_tb
export can=$pol/scp_customization/logical/scp_customization/verilog
export des=$scp/design_library/scp_customization.ip/logical/scp_customization/verilog
export tb=$scp/verif_library/scp_tb.ip/logical/scp_top_tb
alias SCP='cd $scp'
alias Top='cd $top'
alias Can='cd $can'
alias Des='cd $des'
alias Pol='cd $pol'
alias Tb='cd $tb'
alias Src='pushd $PWD > /dev/null; \
           echo "Sourcing sourceme.bash from $scp"; cd $scp; source sourceme; \
           popd > /dev/null;'
cd $scp
}

function BB 
{
export bb=/projects/ssg/pj32000042_blackbird/users/oliman01/bb24_comss
export can=$bb/bb24_comss.canvas
export top=$can/bb24_comss_0_tb/logical/bb24_comss_0_tb
export des=$bb/design_library/comss.ip/logical
export tb=$bb/verif_library/comss_tb.ip/logical/comss_tb
alias BB='cd $bb'
alias Can='cd $can'
alias Des='cd $des'
alias Top='cd $top'
alias Tb='cd $tb'
alias Src='pushd $PWD > /dev/null; \
           echo "Sourcing sourceme.bash from $bb"; cd $bb; source sourceme.bash; \
           popd > /dev/null;'
cd $bb
}

function LCP 
{
export voy=/projects/ssg/pj33000227_voyager/users/oliman01/voyager_lcp
export can=$voy/fremont.canvas
export top=$voy/verif_library/lcp_tb/logical/lcp_top_tb
export des=$voy/design_library/lcp.ip/logical/lcp_top/verilog
alias Voy='cd $voy'
alias Can='cd $can'
alias Top='cd $top'
alias Des='cd $des'
alias Src='pushd $PWD > /dev/null; \
           echo "Sourcing sourceme.bash from $voy"; cd $voy; source sourceme.bash; \
           popd > /dev/null;'
cd $voy
}

function Voy
{
export voy=/projects/ssg/pj33000227_voyager/users/oliman01/voyager_dev
export can=$voy/fpga.canvas
export top=$can/css_tb/css_top_tb
export tb=$voy/verif_library/css_top_tb/logical/css_top_tb
alias Voy='cd $voy'
alias Top='cd $top'
alias Tb='cd $tb'
alias Src='pushd $PWD > /dev/null; \
           echo "Sourcing sourceme.bash from $voy"; cd $voy; source sourceme.bash; \
           popd > /dev/null;'
cd $voy
}

export pjcode=pj32000042
alias bsub_4G='bsub -P $pjcode -M 4G  -R 'select[rhe7]' -W 24:00 -Is'
alias bsub_8G='bsub -P $pjcode -M 8G -R 'select[rhe7]' -W 24:00 -Is'
alias bsub_16G='bsub -P $pjcode -M 16G -R 'select[rhe7]' -W 24:00 -Is'
alias bsub_16G_rhe6='bsub -P $pjcode -M 16G -R 'select[rhe6]' -W 24:00 -Is'
alias bsub_32G='bsub -P $pjcode -M 32G -R 'select[rhe7]' -W 48:00 -Is'
alias VCS='bsub_8G vcs -sverilog'

alias LCM='cd /projects/ssg/pj31000117_kydos/users/oliman01/lcm'
alias MCN='cd /projects/ssg/pj1000598/users/oliman01'
alias Gen='cd /projects/ssg/refsys_perseus/users/oliman01/genesis'
alias Gtop='cd /projects/ssg/refsys_perseus/users/oliman01/genesis/small.canvas/css_tb/css_top_tb'

SCP
