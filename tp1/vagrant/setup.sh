# init script for Vagrant VMs

# update OS
dnf update -y

# install ansible
dnf install -y ansible

dnf install -y python

useradd -m -s /bin/bash ansible_user
passwd -d ansible_user
echo "ansible_user ALL=(ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/ansible_user

mkdir -p /home/ansible_user/.ssh
chmod 700 /home/ansible_user/.ssh
touch /home/ansible_user/.ssh/authorized_keys
touch /home/ansible_user/.ssh/id_rsa.pub
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDioTsNhBnA363aIPYbaWAMDRSZa7QNOLWSpfMEGw7c4iGXBd31INoKF/NXgotKIZq0dbPBsI7opWgm4cD20xKmH8G36wys485TeXziZ9P6zp6ERlIq8dF1YadKPdMZXszlf8Y2DSFUmtrG5+SlS/C/LPDuTAw7oGH2jbmTOPd/l3QMYJui8MV2NbeVBtYjWHnpLmcmd0CQ715w9OtbyeLOX98Sp7lVIIVXCxKKlugdUL3WAqvNUxJuaSQ0sma3o4I6MRrEsw3JfpZW1tc6FevMGaB2vL461PHna+mAIFgbKhq7PMdA7qSq3WPFBTuNh8U3vSPfgPiEIIkI/eAKT3Arll6jOKpuBc5qkJsRWC0ctC1zUzX02NU31RN7IlqTU2AZk/P3SG9b1VeLjfPynbNXjgPzmSbKe7gvgdkwhnUHV/wKl9h28LcwvVxDpdW70iIpr44b6Q7b+ddSWblUyJudyZ4rbKu61OAMfQsNspZeRykY/Nk99khuJjzRIMX1/tc=" |  tee /home/ansible_user/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDioTsNhBnA363aIPYbaWAMDRSZa7QNOLWSpfMEGw7c4iGXBd31INoKF/NXgotKIZq0dbPBsI7opWgm4cD20xKmH8G36wys485TeXziZ9P6zp6ERlIq8dF1YadKPdMZXszlf8Y2DSFUmtrG5+SlS/C/LPDuTAw7oGH2jbmTOPd/l3QMYJui8MV2NbeVBtYjWHnpLmcmd0CQ715w9OtbyeLOX98Sp7lVIIVXCxKKlugdUL3WAqvNUxJuaSQ0sma3o4I6MRrEsw3JfpZW1tc6FevMGaB2vL461PHna+mAIFgbKhq7PMdA7qSq3WPFBTuNh8U3vSPfgPiEIIkI/eAKT3Arll6jOKpuBc5qkJsRWC0ctC1zUzX02NU31RN7IlqTU2AZk/P3SG9b1VeLjfPynbNXjgPzmSbKe7gvgdkwhnUHV/wKl9h28LcwvVxDpdW70iIpr44b6Q7b+ddSWblUyJudyZ4rbKu61OAMfQsNspZeRykY/Nk99khuJjzRIMX1/tc=" |  tee /home/ansible_user/.ssh/id_rsa.pub
chmod 600 /home/ansible_user/.ssh/authorized_keys
chmod 600 /home/ansible_user/.ssh/id_rsa.pub
chown -R ansible_user:ansible_user /home/ansible_user/.ssh


# désactive SELinux
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
