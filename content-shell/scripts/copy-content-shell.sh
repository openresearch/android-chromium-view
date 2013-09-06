# CHROMIUM CONTENT SHELL - this will build a basic Chromium browser on Android

# Make sure you setup and run ../../env.sh first

export PROJ=$ACV_HOME/content-shell

# clean up
rm -rf $PROJ/src/org/chromium/content_shell/*
rm -rf $PROJ/res/*

# copy content shell source org.chromium.content_shell
scp -r $BUILD/content/shell/android/java/src/* $PROJ/src/

# copy content shell resources
scp -r $BUILD/content/shell/android/java/res/* $PROJ/res/

# copy content shell apk sources
scp -r $BUILD/content/shell/android/shell_apk/src/* $PROJ/src/

# copy content shell apk resources
scp -r $BUILD/content/shell/android/shell_apk/res/* $PROJ/res/

echo "FIXME: you need to hand merge the following files: "
echo "  $BUILD/content/shell/android/java/res/values/strings.xml "
echo "  $BUILD/content/shell/android/shell_apk/res/values/strings.xml "

# copy the arm shared object
mkdir -p $PROJ/libs/armeabi-v7a/
scp $BUILD/out/Release/content_shell_apk/libs/armeabi-v7a/libcontent_shell_content_view.so $PROJ/libs/armeabi-v7a/

# copy the x86 shared object (if you built it)
mkdir -p $PROJ/libs/x86/
scp $BUILD/out/Release/content_shell_apk/libs/x86/libcontent_shell_content_view.so $PROJ/libs/x86/

# copy .pak file
scp $BUILD/out/Release/content_shell/assets/content_shell.pak $PROJ/assets/
