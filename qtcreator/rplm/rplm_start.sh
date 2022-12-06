killall RPLM.IP.Server RPLM.File.Server
cd /home/andrey/projects/tfs/install/unix/Debug/bin/
mkdir FileServerStorage
rplm.sh ./RPLM.File.Server &
rplm.sh ./RPLM.IP.Server &
