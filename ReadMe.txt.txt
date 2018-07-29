General Information: 

Here are the preconditions to the test assignment:

1. VMs are generated using virtual box & vagrant tool
2. Assume that developer PC ip address is known and is able to be connected by ansible server
   e.g. developer ip: 192.168.1.80
3. Assume to use public bridge network with static ip addresses to create VMs 
   e.g. mysql1 ip: 192.168.1.85
   e.g. mysql2 ip: 192.168.1.86
   note: if VM use DHCP setting, then additional steps need to be executed to get VMs ip address
4. The following files are generated for this task assignment:
   hosts - ansible configuration file with global variables setting
   createVM.yml - Ansible code to create VM
   createDB.yml - Ansible code to create DB on VM
   createCron.yml - Ansible code to create cron jobs on mysql1
   destroyVM.yml -Ansible code to destroy VM
   Vagrantfile - Vangant code to create VM
   verifyBackupDB.sh - shell scripts to auto cleanup mysql2 databases and recover nightly backup db from mysql1 
	

Task1:
To create VMs, on ansible server side, run ansible-playbook createVM.yml, which will
     -create tmp folder on developer pc
     -copy Vagrantfile to developer PC
     -install virtualbox on developer pc
     -install vagrant on develop pc
     -create/configure VMs through vagrant up on develop pc
 
To destory the VM, on ansible sever side, run ansible-playbook  destroy.yml, which will
     -destroy VMs

Detailed informatin about VMs are included in Vagrantfile

Task2:
on ansible server side, run ansible-playbook createDB.yml, which will
     -install mysql on all VMs
     -start mysql service on all VMs
     -configure default mysql root password on VMs

Task3:
on ansible server side, run ansible-playbook createCron.yml, which will
     -setup cronjob (e.g. 19:00 daily) on mysql1 to backup mysql database to local
     -setup cronjob (e.g. 21:00 daily) on mysql1 to copy the backup sql file to remote mysql2
     -setup cronjob (e.g. 18:00 daily) on mysql1 to cleanup 10 days old local backup sql file

Note: some options can be done further if necessary:
     - zip the backup database file


Task4/Task5:

TestCase1: 
On mysql2, run ./verifyBackyp.sh [backup_db_filename] which will includes:
    - clean mysql2 all current databases
    - recover from selected [backup_db_filename] database backup file
    - Verify that recover is successful, and all the expected databases/tables will be shown 

Further more, user can also manually random check database contents

TestCase2:
create a simple test db with table/contents on mysql1, verify the test db table/content are same after being recovered on remote recover db on mysql2 







