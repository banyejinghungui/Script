#!/bin/bash
#
# Perform hot backups of Oracle databases.
#-------------------------------------------------------------#
#                           variable
#-------------------------------------------------------------#
GREEN="\033[0;32m"
NC="\033[0m"
#-------------------------------------------------------------#
#                           function
#-------------------------------------------------------------#

function print_green(){
  echo -e "${GREEN} $1 ${NC}" 
}



#######################################
# exit code with message
# Globals:
#   None
# Arguments:
#   exit code, message
# Outputs:
#   Writes location to stdout
#######################################
exit_code()
{
	exit_code=$1
	shift
	echo "$*"
	exit $exit_code
}

valid_dir()
{
	file_dir=$1
	[ ! -d "${file_dir}" ] && exit_code "2" "FILE_DIR does not exit. \n\n $USAGE"
	
	LEAD_DIR=`each ${file_dir} | sed s/\///`
	if [ ${LEAD_DIR%%%/*} != "KEYWORD" ] ; then
		exit_code "2" "FILE directory ${file_dir} is invalid. Must start with …"
	fi
}

#######################################
# Get configuration directory.
# Globals:
#   SOMEDIR
# Arguments:
#   None
# Outputs:
#   Writes location to stdout
#######################################
function get_dir() {
  echo "${SOMEDIR}"
}

#######################################
# Delete a file in a sophisticated manner.
# Arguments:
#   File to delete, a path.
# Returns:
#   0 if thing was deleted, non-zero on error.
#######################################
function del_thing() {
  rm "$1"
}

#######################################
# Cleanup files from the backup directory.
# Globals:
#   BACKUP_DIR
#   ORACLE_SID
# Arguments:
#   None
#######################################
function cleanup() {
  …
}

#-------------------------------------------------------------#
#                           main
#-------------------------------------------------------------#

# Log
print_green "`date +'%Y/%m/%d %r'`  ******" >&2 tee <log_file>


# If inside a function, consider declaring the loop variable as
# a local to avoid it leaking into the global environment:
# local dir
for dir in "${dirs_to_cleanup[@]}"; do
  if [[ -d "${dir}/${ORACLE_SID}" ]]; then
    log_date "Cleaning up old files in ${dir}/${ORACLE_SID}"
    rm "${dir}/${ORACLE_SID}/"*
    if (( $? != 0 )); then
      error_message
    fi
  else
    mkdir -p "${dir}/${ORACLE_SID}"
    if (( $? != 0 )); then
      error_message
    fi
  fi
done

####################################
if [[ $var = "<status1>" ]]; then
  <command1>
elif [[$var = "<status2>" ]]
then
  <command2>
else
  <command3>
fi
####################################

for item in <list of items. e.g. item1 item2 item3. or `cat list.txt`  or $(cat list.txt) or {0..10}>
do
  <command> $item
done
####################################
for (( item = 0; item <= 0; item++ ))
do
  <command>
done
####################################
while [ $var = "value" ]
do

break
continue

done
####################################

case "${expression}" in
  a)
    variable="…"
    some_command "${variable}" "${other_expr}" …
    ;;
  absolute)
    actions="relative"
    another_command "${actions}" "${other_expr}" …
    ;;
  *)
    error "Unexpected expression '${expression}'"
    ;;
esac
####################################
verbose='false'
aflag=''
bflag=''
files=''
while getopts 'abf:v' flag; do
  case "${flag}" in
    a) aflag='true' ;;
    b) bflag='true' ;;
    f) files="${OPTARG}" ;;
    v) verbose='true' ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done
####################################
echo $? 


