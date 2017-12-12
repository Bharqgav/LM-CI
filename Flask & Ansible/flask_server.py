from flask import Flask, redirect, url_for, request
import process_ansible
import json
app = Flask(__name__)

@app.route('/playBook/<fileName>')
def playBook(fileName):
   return setup.runAnsible(fileName)

''' This method gives th Ansible Logs
    for all ran Ansible command ''' 
@app.route('/ansible/getAnsibleLogs', methods = ['GET'])
def getAnsibleLogs():
    return setup.getLog()

''' To get get the details of Event happend on Flask Server '''
@app.route('/server/getServerLogs', methods = ['GET'])
def getServerLogsLogs():
    return setup.getServerLog()


''' This method is validating the shell file name and running
    Ansible command on specified Server '''
@app.route('/ansible',methods = ['POST'])
def ansible():
   if request.method == 'POST':
      '''ip = request.form['hostName']
      shellFile = request.form['fileName'] '''
      input_data=request.get_data()
      data= json.loads(input_data)
      json.dumps(data, indent=2)
      ip = data.get("hostName")
      shellFile = str(data.get("fileName"))
      valid=setup.validate(shellFile)
      if valid == "True":
        setup.setupAnsible(ip)
        return redirect(url_for('playBook',fileName = shellFile))
      else:
        return "Wrong File"
    else:
      return 'Wrong Method'
      
     
if __name__ == '__main__':
   app.run(port=8080,host='0.0.0.0',debug = True)

