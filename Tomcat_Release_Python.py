#!/usr/bin/env python
import git, os, shutil, logging, subprocess

logging.basicConfig(filename='/usr/local/logs/tomcat_release.log',level=logging.INFO)
logger = logging.getLogger(__name__)

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


logger.info('Git Cloning')



# STOP Tomcat
subprocess.call([TOMCAT_SHUTDOWN])

logger.info('Stop Tomcat')

# Replace Old Code with New Code
shutil.rmtree(TOMCAT_PATH)

logger.info('Remove webapps/ROOT')
shutil.move(TMP_PATH,TOMCAT_PATH)

logger.info('Deploy new version')


# START Tomcat
subprocess.call([TOMCAT_STARTUP])

logger.info('START Tomcat')
