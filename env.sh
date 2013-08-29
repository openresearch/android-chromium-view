
# setup environment variables for building / copying chromium sources
#
# run this script before you run any of the project scripts/

# this defines the beginning path for scp operations
# from the build virtual machine.  user@host = crbuild@ubuntu.local
# the rest is the home path to the chromium build src directory
# e.g. /home/crbuild/chromium/src
#
# we use this to scp the files from a fresh chromium build over
# to our android library projects
export BUILD=crbuild@ubuntu.local:chromium/src

# this should point to the cwd - i.e. the path to this directory
# modify this to point wherever you checked this project out to
export ACV_HOME=~/git/android-chromium-view