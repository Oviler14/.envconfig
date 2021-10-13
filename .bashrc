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
module load swdev git/git/2.28.0
module load arm/clusterfg/1.0
module load util vim/vim/8.2

# Terminal Options
export PS1="\n\[\033[38;5;134m\]\h\[$(tput sgr0)\] \[\033[38;5;79m\]\w\[$(tput sgr0)\]\n\\$\[$(tput sgr0)\] "
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
function cd_up() {
  case $1 in
    *[!0-9]*)                                          # if no a number
        [[ $PWD =~ (.*/$1[^/]*/).* ]] && cd ${BASH_REMATCH[1]}
        # cd $( pwd | sed -r "s|(.*/$1[^/]*/).*|\1|" )     # search dir_name in current path, if found - cd to it
      ;;                                               # if not found - not cd
    *)  
      cd $(printf "%0.0s../" $(seq 1 $1));             # cd ../../../../  (N dirs)
    ;;  
  esac
}
alias 'up'='cd_up'                                # can not name function 'cd..'
bind '"\t":menu-complete'
bind '"`":menu-complete-backward'
bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"
bind "set menu-complete-display-prefix on"
bind '"\C-d": backward-kill-word'
bind '"\C-f": \e'

# General
alias ll='ls -la'
alias Brc='vim ~/.bashrc'
alias Vrc='vim ~/.vimrc' 
alias push='git push origin HEAD:refs/for/dev'
alias push7='git push origin HEAD:refs/for/release/20210613/DEV7/0'
alias ls='ls $LS_OPTIONS'
alias C='clear'
alias lt='ls --human-readable --size -1 -S --classify'
alias bsub_16G='bsub -P PJ1000598 -M 16777216 -R 'select[rhe7]' -W 24:00 -Is'
alias bsub_16G_rhe6='bsub -P PJ1000598 -M 16777216 -R 'select[rhe6]' -W 24:00 -Is'
alias bsub_32G='bsub -P PJ1000598 -M 33554432 -R 'select[rhe7]' -W 24:00 -Is'
alias bsub_4G='bsub -P PJ1000598 -M 4194304  -R 'select[rhe7]' -W 24:00 -Is'

# Eon
export oli=/projects/ssg/pj10000083_refsys/users/oliman01
export eon=$oli/eon
export eds=$eon/pcierefsys.ip/logical
export scr=$eds/scripts
export etop=$eds/pcierefsys/pcierefsys_f1_top
export etb=$eon/pcierefsys_tb.ip/logical/top_tb
export etbe=$etb/tbench
export etes=$etb/test
alias Eon='cd $eon'
alias Etl='cd $edes/pcierefsys/pcierefsys_f1_top/verilog'
alias Etb='cd $etb'
alias Eds='cd $eds'
alias  Esrc='pushd $PWD > /dev/null; \
             echo "Sourcing sourceme.bash from $eon"; cd $eon; source sourceme.bash; \
             popd > /dev/null;'

# Genesis
export gen=/projects/ssg/refsys_perseus/users/oliman01/genesis
export gca=$gen/small.canvas
export gtb=$gca/css_tb/css_top_tb
export for=$gtb/test/formal
alias Gen='cd $gen'
alias Gca='cd $gca'
alias Gtb='cd $gtb'
alias For='cd $for'
alias Mscp='cd $for/reset_sync_mscp_conn_check'
alias Clk='cd $gtb/test/sim/clock_test/clk_boundary_test'
alias Gsrc='pushd $PWD > /dev/null; \
            echo "Sourcing sourceme.bash from $gen"; cd $gen; source sourceme.bash; \
            popd > /dev/null;'


# MCN
export mcn=/projects/ssg/pj1000598/users/oliman01/
export sys=$mcn/systems
export perf=$mcn/perf_models
alias Sys='cd $sys'
alias Perf='cd $perf'
alias MCN='cd /projects/ssg/pj1000598/users/oliman01'
alias Msrc='pushd $PWD > /dev/null; \
            echo "Sourcing:"; \
            . $sys/etc/euhpc-env.sh; echo "euhpc-env.sh"; \
            . $sys/etc/euhpc-env-systemc-8.3.sh; echo "euhpc-env-systemc-8.3.sh"; \
            . $sys/etc/setup.sh; echo "setup.sh"; \
            export TURSE_INSTALL_DIR=/projects/ssg/pj1000598/users/syejaf01/work/databuffer/systems/external-models/Turse; \
            export LSB_DEFAULTPROJECT=PJ1000598; \
            popd > /dev/null;'
