scp -i /path/to/key ./final_shell.sh ec2-user@$1:/home/ec2-user/
ssh -i /path/to/key ec2-user@$1 -yes /home/ec2-user/final_shell.sh
