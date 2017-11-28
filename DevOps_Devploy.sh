#++++++++++++++++++++++ Script Start ++++++++++++++++++++++++
#！/bin/bash
# ======================= Instruction ================================
#            FILE:                    DevOps_Deploy.sh
#            USAGE:                   /usr/local/bin

#            DESCRIPTION:             Releasing Script
#            OPTIONS:--                   
#            REQUIREMENTS:
#            BUGS:
#            NOTES:
#            AUTHOR:                  Chen    
#            CREATE:                  2017.11.28
#            REVISION:                V1.0
#            HISTORY：
#                                               
#            Test:
#            PROCESURE：
# ========================================================

# Impose the JAVA_HOME environment variable
source /etc/profile


# Download the code into the App server
git clone https://github.com/banyejinghungui/ROOT.git

# Stop Tomcat
sh /usr/local/tomcat8_8080/bin/shutdown.sh

# Remove the old code
rm -rf /usr/local/tomcat8_8080/webapps/ROOT

# Copy the lastest code to the webapps
cp -rf /tmp/DevOps_Code_Temp_Git_Download/ROOT /usr/local/tomcat8_8080/webapps/

# Start Tomcat
sh /usr/local/tomcat8_8080/bin/startup.sh



#++++++++++++++++++++++ Script End  ++++++++++++++++++++++++++
