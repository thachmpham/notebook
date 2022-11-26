# execute on Host, Moba Xterm
remote_user=mt
remote_ip=127.0.0.1
remote_port=2222

PATH=$PATH:'/drives/c/Program Files/Oracle/VirtualBox'

ssh -p $remote_port $remote_user@$remote_ip "mkdir /home/$remote_user/tmp"
# put VBoxGuestAdditions.iso to guest
sftp -oPort=$remote_port $remote_user@$remote_ip:/home/$remote_user/tmp <<< $"put '/drives/c/Program Files/Oracle/VirtualBox/VBoxGuestAdditions.iso'"

VBoxManage list vms
#example output: us

VBoxManage controlvm us poweroff

# create shared folder: d:/com <--> /home/mt/com
# VBoxManage sharedfolder add "<virtual machine>" -name "<share name>" -hostpath "<host path>" --automount --auto-mount-point=<path>
VBoxManage sharedfolder add "us" -name "com" -hostpath "d:/com" --automount
# VBoxManage sharedfolder remove "us" -name "com"
VBoxManage showvminfo us | grep com
VBoxManage startvm us --type headless

ssh -p $remote_port $remote_user@$remote_ip


# execute on Guest
sudo mkdir /media/GuestAdditionsISO
sudo mount -o loop ~/tmp/VBoxGuestAdditions.iso /media/GuestAdditionsISO
sudo /media/GuestAdditionsISO/VBoxLinuxAdditions.run
sudo shutdown -r now

mkdir /home/mt/com
sudo mount -t vboxsf com /home/mt/com

sudo vi /etc/fstab
shared	/home/mt/com	vboxsf	defaults	0	0

sudo vi /etc/modules
vboxsf


shutdown -r now
