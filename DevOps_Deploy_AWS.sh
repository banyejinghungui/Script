#++++++++++++++++++++++ Script Start ++++++++++++++++++++++++
#！/bin/bash
# ======================= Instruction ================================
#            FILE:                      DevOps_Deploy.sh
#            USAGE:                    /usr/local/bin

#            DESCRIPTION:             Releasing Script
#            OPTIONS:--                   
#            REQUIREMENTS:
#            BUGS:
#            NOTES:
#            AUTHOR:                  Chen    
#            CREATE:                  2017.11.28
#            REVISION:                V1.1
#            HISTORY：                V1.1---added a feature to display the state of the website right after the releasing
#                                            
#                                     V2.0---added a feature to backup and rollback
#                                            added more echo message for each execution sentence
#            Test:
#            PROCESURE：
# ========================================================


# Impose the JAVA_HOME environment variable
source /etc/profile

# Rollback
if [ "$1" == "--rollback" ];then
	# Stop Tomcat
	echo "Stopping Tomcat ... "
	sh /usr/local/tomcat8_8080/bin/shutdown.sh
	# Start to rollback
    rm -rf /usr/local/tomcat8_8080/webapps/ROOT
    mv /usr/local/backup/ROOT /usr/local/tomcat8_8080/webapps 
    if [ $? = 0 ];then
        echo "Rolled back successfully！"
    else
        echo "Failed to rollback ... "
		exit 0
    fi
	# Start Tomcat
	echo "Starting Tomcat ... "
	sh /usr/local/tomcat8_8080/bin/startup.sh	
	echo "Done!"
    exit 0 
         
fi


# remove the previous download
echo "remove the previous download packages"
rm -rf /tmp/DevOps_Code_Temp_Git_Download/*

# Download the code into the App server
echo "Syncing with Github code... "
cd /tmp/DevOps_Code_Temp_Git_Download/
git clone https://github.com/banyejinghungui/ROOT.git

# Stop Tomcat
echo "Stopping Tomcat ... "
sh /usr/local/tomcat8_8080/bin/shutdown.sh

# Back up the old code and remove the old code
echo "Backing up the old code ... "

## Back up the latest versions

if [ -d /usr/local/backup/ROOT ];then
	rm -rf /usr/local/backup/ROOT
	echo "Removed the previous ROOT!"
fi

echo "Start to backup the old code..."
mv  /usr/local/tomcat8_8080/webapps/ROOT  /usr/local/backup/
if [ $? = 0 ];then
    echo "Backed up Successfully!"    
else  
    echo "Failed to backup..."
fi

# Copy the lastest code to the webapps
cp -rf /tmp/DevOps_Code_Temp_Git_Download/ROOT /usr/local/tomcat8_8080/webapps/

# Start Tomcat
sh /usr/local/tomcat8_8080/bin/startup.sh

# Display the website state
sleep 3s
curl http://ec2-18-221-253-132.us-east-2.compute.amazonaws.com:8080/


#++++++++++++++++++++++ Script End  ++++++++++++++++++++++++++
