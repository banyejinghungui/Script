git clone https://github.com/banyejinghungui/ROOT.git
& C:\Tomcat8\bin\shutdown.bat
Remove-Item C:\Tomcat8\webapps\ROOT -Force -Recurse
Move-Item C:\tmp\ROOT C:\Tomcat8\webapps\
& C:\Tomcat8\bin\startup.bat
