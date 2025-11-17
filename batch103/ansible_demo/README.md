# Ansilbe handons

1. Create inventory file (hosts.ini) and add ips of the hosts in the file


 19  ansible -m ping -i hosts.ini 34.203.199.176 
   20  ansible -m ping -i hosts.ini 34.203.199.176  -e ansible_user=ansible
   21  ansible -m ping -i hosts.ini 34.203.199.176  -e ansible_user=ansible -e ansible_password=ansible
   22  ansible -m ping -i hosts.ini all  -e ansible_user=ansible -e ansible_password=ansible
   23  ansible -m ping -i hosts.ini frontend  -e ansible_user=ansible -e ansible_password=ansible
   24  ansible -m ping -i hosts.ini frontend  
   25  ansible -m ping -i hosts.ini all  
   26  uptime
   27  ansible -m shell -a "uptime"  -i hosts.ini all  
   28  ansible -m shell -a "df -h"  -i hosts.ini all  
   29  ansible -m shell -a "cat /etc/os-release"  -i hosts.ini all  