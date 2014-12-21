# basebox #

Stop building vagrant base boxes the hard way.

## Usage ##

1. Download your favorite distribution and setup the VM. Be sure to include a NAT interface.
2. Login to the box, and run 'yum update -y all && yum install -y git'
3. Reboot
4. git clone https://github.com/josiahp/basebox.git
5. puppet apply -e 'include basebox'

