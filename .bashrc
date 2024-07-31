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
module load util swdev
module load git/git/2.37.0
module load vim/vim/9.0.5
module load neovim/neovim/0.9.0
module load python/python/2.7.8
module load armandino/txtstyle/1.1.2
module load burntsushi/ripgrep/13.0.0
module load rust/rust-fd/8.2.1

# Terminal Options
export PS1="\n\[\033[38;5;134m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')\[$(tput sgr0)\] \[\033[38;5;110m\]\t\[$(tput sgr0)\] \[\033[38;5;79m\]\w\[$(tput sgr0)\]\n\\$\[$(tput sgr0)\] "
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Z
[ -f ~/.z_cd/z.sh ] && source ~/.z_cd/z.sh

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
#bind '"`":menu-complete-backward'
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
alias Socrates='module load eda arm/socrates/socrates_1.7.4; \
                bsub_8G ARM-Socrates'
alias vim='nvim'

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
  case $2 in
    des ) command genp "$1" $can/packages.yaml:scp_customization "$3" ;;
    tb ) command genp "$1" $can/packages.yaml:scp_top_tb "$3" ;;
  esac
}

export pjcode=pj32000042
function Bsub() {
  memory="$1"
  shift
  bsub -P $pjcode -M "$memory"  -R 'select[centos7 && pricing==ondemand]' -W 24:00 -Is $@
}

export scp=/projects/se/pj32000042_blackbird_css/users/oliman01/e_scp_f4
export bb=/projects/se/pj32000042_blackbird_css/users/oliman01/bb24_comss
export tcs=/projects/se/pj32000042_blackbird_css/users/oliman01/tcs2025

function SCP
{
export can=$scp/scp.canvas
export top=$can/scp_top_tb/logical/scp_top_tb
export cdes=$can/scp_customization/logical/scp_customization/verilog
export des=$scp/design_library/scp_customization.ip/logical/scp_customization/verilog
export tb=$scp/verif_library/scp_tb.ip/logical/scp_top_tb
alias Top='cd $top'
alias Can='cd $can'
alias Des='cd $des'
alias Cdes='cd $cdes'
alias Tb='cd $tb'
alias Src='pushd $PWD > /dev/null; \
           echo "Sourcing sourceme.bash from $scp"; cd $scp; source sourceme; \
           popd > /dev/null;'
cd $scp
}

function BB 
{
export can=$bb/bb24_comss.canvas
export top=$can/bb24_comss_0_tb/logical/bb24_comss_0_tb
export des=$bb/design_library/comss.ip/logical
export tb=$bb/verif_library/comss_tb.ip/logical/comss_tb
alias Can='cd $can'
alias Des='cd $des'
alias Top='cd $top'
alias Tb='cd $tb'
alias Src='pushd $PWD > /dev/null; \
           echo "Sourcing sourceme.bash from $bb"; cd $bb; source sourceme.bash; \
           popd > /dev/null;'
cd $bb
}

function TCS 
{
export can=$tcs/tcs2025_comss.canvas
export top=$can/tcs2025_comss_0_tb/logical/tcs2025_comss_0_tb
export des=$tcs/design_library/comss.ip/logical
export tb=$tcs/verif_library/comss_tb.ip/logical/comss_tb
alias Can='cd $can'
alias Des='cd $des'
alias Top='cd $top'
alias Tb='cd $tb'
alias Src='pushd $PWD > /dev/null; \
           echo "Sourcing sourceme.bash from $tcs"; cd $tcs; source sourceme.bash; \
           popd > /dev/null;'
cd $tcs
}

function Vis() {
  module load eda mentor/questasim/2023.4 mentor/questavdbg/2023.4
  Bsub 4G visualizer -wavefile $1 -designfile $2
}

SCP
