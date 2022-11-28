            Install

sudo apt install libssl-dev expect

mkdir /home/mt/ttcn
cd /home/mt/ttcn

wget https://ftp.yz.yamagata-u.ac.jp/pub/eclipse//titan/ttcn3-8.3.0-linux64-gcc7-ubuntu_18.04.6_lts_foss.tgz
tar zxvf ttcn3-8.3.0-linux64-gcc7-ubuntu_18.04.6_lts_foss.tgz

vi /home/mt/.bashrc

##### add below lines to .bashrc
##### begin
TTCN3_DIR=/home/mt/ttcn
PATH=$TTCN3_DIR/bin:$PATH
LD_LIBRARY_PATH=$TTCN3_DIR/lib:$LD_LIBRARY_PATH
MANPATH=$MANPATH:$TTCN3_DIR/man
export TTCN3_DIR PATH LD_LIBRARY_PATH MANPATH TTCN3_LICENSE_FILE
# TTCN3_LICENSE_FILE=/home/mt/license.dat
##### end

source /home/mt/.bashrc

--------------------------------------------------
            Hello World
            
cd ~/ttcn/demo/
make
ttcn3_start MyExample


--------------------------------------------------
            Links

https://projects.eclipse.org/projects/tools.titan/downloads
https://ftp.yz.yamagata-u.ac.jp/pub/eclipse/titan/installationguide.pdf
~/ttcn/demo/doc

