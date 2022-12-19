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

# check
# ttcn/doc/User Guide
# https://gitlab.eclipse.org/eclipse/titan/titan.core/tree/master/usrguide/referenceguide

--------------------------------------------------
            module
- top obligatory container of ttcn code
- contain declaration part and control part
- able to import other modules

---------------
            data types
- basic:        integer, boolean, float, charstring
- structure:    enumerated, record, set, union
- list:         array, set of, record of
-               ASN1
-               verdicttype

--------------------------------------------------
            workflow
- Generating and editing a Makefile
- Building the executable
- Executing test suites
- Analyzing the execution log files
--------------------------------------------------
            Links

https://projects.eclipse.org/projects/tools.titan/downloads
https://ftp.yz.yamagata-u.ac.jp/pub/eclipse/titan/installationguide.pdf
~/ttcn/demo/doc

