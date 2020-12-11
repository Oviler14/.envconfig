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
PS1="\[\033[38;5;79m\]\w\[$(tput sgr0)\]\n\\$\[$(tput sgr0)\]"
alias C='clear'
alias ll='ls -la'
alias Bashrc='vi ~/.bashrc'
