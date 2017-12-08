for ID in $(aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names test-asg --query AutoScalingGroups[].Instances[].InstanceId --output text);
do 
aws ec2 describe-instances --instance-ids $ID --query Reservations[].Instances[].PrivateIpAddress --output text >> private_ip.txt
done
python exec_shell.py
