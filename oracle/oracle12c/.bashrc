#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export DISPLAY=:0
export ORACLE_BASE=/home/oracle/app/oracle
export ORACLE_HOME=/home/oracle/app/oracle/product/12.2.0/dbhome
export ORACLE_SID=orcl
export ORACLE_INVENTORY=/home/oracle/app/oraInventory
export ORACLE_BASE ORACLE_SID ORACLE_HOME
export PATH=$ORACLE_HOME/bin:$PATH
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$ORACLE_HOME/inventory/Scripts/ext/lib:$LD_LIBRARY_PATH