# CHROMIUM EYES FREE BRAILLE LIB

# Make sure you setup and run ../../env.sh first

export PROJ=$ACV_HOME/eyes-free

# clean up
rm -rf $PROJ/src/com/googlecode/*

# copy third-party sources com.googlecode.eyesfree.braille
scp -r $BUILD/third_party/eyesfree/src/android/java/src/* $PROJ/src/
# remove the .git subdir on this
rm -rf $PROJ/src/com/googlecode/eyesfree/braille/.git/
