#!/usr/bin/env python
import git, os, shutil
import subprocess

DIR_NAME = "/tmp/ROOT"
REMOTE_URL = "https://github.com/banyejinghungui/ROOT.git"
TMP_PATH = "/tmp/ROOT"
TOMCAT_PATH = "/usr/local/tomcat8_8080/webapps/ROOT"
TOMCAT_STARTUP = "/usr/local/tomcat8_8080/bin/startup.sh"
TOMCAT_SHUTDOWN = "/usr/local/tomcat8_8080/bin/shutdown.sh"


# Check out source from Github Repo
if os.path.isdir(DIR_NAME):
		shutil.rmtree(DIR_NAME)

os.mkdir(DIR_NAME)

repo = git.Repo.init(DIR_NAME)
origin = repo.create_remote('origin',REMOTE_URL)
origin.fetch()
origin.pull(origin.refs[0].remote_head)

print "--- Git Clone DONE ---"


# STOP Tomcat
subprocess.call([TOMCAT_SHUTDOWN])
print "--- Stop Tomcat  ---"

# Replace Old Code with New Code
shutil.rmtree(TOMCAT_PATH)
print "--- Remove webapps/ROOT ---"
shutil.move(TMP_PATH,TOMCAT_PATH)
print "--- Deploy new version ---"


# START Tomcat
subprocess.call([TOMCAT_STARTUP])
print "--- Start Tomcat ---"
