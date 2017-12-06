#++++++++++++++++++++++ Script Start ++++++++++++++++++++++++
# ======================= Instruction ================================
#            FILE:                      Tomcat_Release.ps1
#            USAGE:

#            DESCRIPTION:             Releasing Tomcat
#            OPTIONS:--
#            REQUIREMENTS:
#            BUGS:
#            NOTES:
#            AUTHOR:                  Chen
#            CREATE:                  2017.12.06
#            REVISION:                V1.0
#            HISTORY：                
#
#
#            Test:
#            PROCESURE：
# ========================================================

cd C:\tmp
git clone https://github.com/banyejinghungui/ROOT.git
& C:\Tomcat8\bin\shutdown.bat
Remove-Item C:\Tomcat8\webapps\ROOT -Force -Recurse
Move-Item C:\tmp\ROOT C:\Tomcat8\webapps\
& C:\Tomcat8\bin\startup.bat

#++++++++++++++++++++++ Script End ++++++++++++++++++++++++
