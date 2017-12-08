import sys
import os
with open('./private_ip.txt') as f:
    private_ip = f.readlines()
# you may also want to remove whitespace characters like `\n` at the end of each line
private_ip = [x.strip() for x in private_ip]
#ipv4 = ["ip-172-31-43-198.ec2.internal"]
for x in private_ip:
   os.system('./scp_ssh.sh' + ' ' + x)
    
