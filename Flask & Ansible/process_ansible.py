import os
from subprocess import Popen, PIPE
import time

def validate(fileName):
        result="False"
        cmd = "ls -a /home/ec2-user/ansible/shellFiles/ | grep -w  '"+fileName+"'"
        result=os.popen(cmd).read()
        if(result == ""):
                return "False"
        else:
                return "True"


def setupAnsible(ipList):
        f= open("hosts","w+")
        f.write("[Test] \n")
        for ip in ipList:
                f.write("%s\n" % ip)
        f.close()
        os.system("sudo mv /etc/ansible/hosts /etc/ansible/hosts.old")
        os.system("sudo mv hosts /etc/ansible/")


def runAnsible(fileName):
        cmd='ansible-playbook --extra-vars '+'"'+'shellFile=/home/ec2-user/ansible/shellFiles/'+fileName+'"'+' '+'/home/ec2-user/ansible/playbooks/shell_playbook.yml'
        result=os.popen(cmd).read()
        return result
       

def getLog():
        cmd='cat /var/log/ansible.log'
        logFile= os.popen(cmd).read()
        return logFile

def getServerLog():
        cmd= ('sudo cat /home/ec2-user/flask/nohup.out')
        serverLog = os.popen(cmd).read()
        return serverLog

