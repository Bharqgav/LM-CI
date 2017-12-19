import boto3
import sys
import datetime
client = boto3.client('ec2')
ec2 = boto3.resource('ec2')

def lambda_handler(event, context):
    # TODO implement
    volumeIds = event['Key1'].split(",") 
    for v in volumeIds:
        snapshots = client.describe_snapshots(
        Filters=[
            {
                'Name': 'volume-id',
                'Values': [
                    v
                ]
            },
        ]
        ).get('Snapshots')
        snapshotIds = list()
        for snapshot in snapshots:
            #print snapshot['SnapshotId']
            snapshotIds.append(snapshot['SnapshotId'])
            #print snapshotIds
        for snapshotId in snapshotIds:
            snapshot = ec2.Snapshot(snapshotId)
            #print snapshot.start_time
            now = datetime.datetime.now()                                    #Storing the current time and date as a parameter
            start_time_aware = snapshot.start_time                           #Storing the start_time of a snapshot as a parameter
            start_time_unaware = start_time_aware.replace(tzinfo=None)       #Converting from offset aware to offset naive
            delta = now - start_time_unaware
            seconds = delta.seconds                                           #Calculating the number of seconds since the start time of the snapshot
            #print 'the value of delta is {}'.format(delta)
            #print 'the value of delta.seconds is {}'.format(seconds)
            if seconds > 259200:
                response = snapshot.delete()
    
    for v in volumeIds:
        volume = ec2.Volume(v)
        snapshot = volume.create_snapshot(
    	    Description='My snapshot description',
    	    VolumeId=v
    	)
        print "creating snapshot {} \n for the volume with volume id {} ...".format(snapshot,v)
        #print snapshot.split("'")
        x = snapshot.wait_until_completed(
            Filters=[
                {
                  'Name': 'volume-id',
                  'Values': [v]
                }
            ]
        )
       
    
        tags = client.describe_instances(
            InstanceIds=[
                    volume.attachments[0]['InstanceId']
                    ]
            ).get('Reservations')[0]['Instances'][0]['Tags']
        for tags in tags:
            if tags['Key'] == 'Name':
                snapshot_name = tags['Value']
            elif tags['Key'] == 'Project':
                project = tags['Value']
            elif tags['Key'] == 'Email':
                email = tags['Value']
            elif tags['Key'] == 'username':
                username = tags['Value']
        print "tagging the snapshot with \n Name:{} \n Project:{} \n Email:{} \n username:{} \n ...".format(snapshot_name,project,email,username)
    	
        tag = snapshot.create_tags(
    	Tags=[
    		{
    			'Key': 'Name',
    			'Value': snapshot_name
    		},
                    {
                            'Key': 'Project',
                            'Value': project
                    },
                    {
                            'Key': 'Email',
                            'Value': email
                    },
                    {
                            'Key': 'username',
                            'Value': username
                    }
    
    	]
        )
    
    return volumeIds