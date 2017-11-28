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
#                                            added a feature to backup the old code before removing it
#            Test:
#            PROCESURE：
# ========================================================

# Impose the JAVA_HOME environment variable
source /etc/profile

# remove the previous download
rm -rf /tmp/DevOps_Code_Temp_Git_Download/*

# Download the code into the App server
cd /tmp/DevOps_Code_Temp_Git_Download/
git clone https://github.com/banyejinghungui/ROOT.git

# Stop Tomcat
sh /usr/local/tomcat8_8080/bin/shutdown.sh

# Back up the old code and remove the old code
cp -rf /usr/local/tomcat8_8080/webapps/ROOT /usr/local/backup/$nowdate
rm -rf /usr/local/tomcat8_8080/webapps/ROOT

# Copy the lastest code to the webapps
cp -rf /tmp/DevOps_Code_Temp_Git_Download/ROOT /usr/local/tomcat8_8080/webapps/

# Start Tomcat
sh /usr/local/tomcat8_8080/bin/startup.sh

# Display the website state
sleep 3s
curl http://ec2-18-221-253-132.us-east-2.compute.amazonaws.com:8080/


#++++++++++++++++++++++ Script End  ++++++++++++++++++++++++++
