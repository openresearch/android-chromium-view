# CHROMIUM NET LIB

# Make sure you setup and run ../../env.sh first

export PROJ=$ACV_HOME/net

# cleanup
rm -rf $PROJ/src/org/chromium/net/*

# copy net sources org.chromium.net
scp -r $BUILD/net/android/java/src/* $PROJ/src/

# .template files are compiled as part of the chromium build
scp -r $BUILD/out/Release/gen/templates/org/chromium/net/* $PROJ/src/org/chromium/net/
