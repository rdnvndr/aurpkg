#!/bin/bash

MEGASYNC='/usr/bin/megacopy'
MEGARM='/usr/bin/megarm'
LOCALDIR=$1
REMOTEDIR=$2
SEDLOCALDIR="${LOCALDIR//\//\\/}"
SEDREMOTEDIR="${REMOTEDIR//\//\\/}"
BACKUP_TIME=`date +%c`
hostname=`hostname`

#Obtain the files that not exists in the local server
DELETE=` $MEGASYNC --dryrun --reload --download --local $LOCALDIR --remote $REMOTEDIR 2>/dev/null | sed 's/F '$SEDLOCALDIR'/'$SEDREMOTEDIR'/g' | sed 's/D '$SEDLOCALDIR'/'$SEDREMOTEDIR'/g' `

# And remove it

for i in $DELETE; do
    $MEGARM $i
done

# Run the synchronization to Mega

SYNC=`$MEGASYNC --no-progress --local $LOCALDIR --remote $REMOTEDIR 2>/dev/null`

echo "[$BACKUP_TIME][$(hostname)] synchronization to mega done!!"
echo "Files removed $DELETE"
echo "Files synchronized"