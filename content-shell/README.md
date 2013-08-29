# Chromium Content Shell

This project ontains code we need in the `org.chromium.content_shell.*` and merged `org.chromium.content_shell_apk.*` package namespace.

This is an Android application test wrapper that brings up a stock Chromium WebView that has an address bar and a back/forward button.  It is bare-bones simple, and it depends on all of the other library projects found in here.

To update the source code here, run `scripts/copy-content-shell.sh` after building Chromium for Android.

# Local Modifications

After updating the sources, you'll need to move the stuff in `org.chromium.content_shell_apk` under the package namespace `org.chromium.content_shell` so the `R.java` resources will be resolved correctly.

You also need to hand merge a couple of the resource files, so just copy-paste the contents from `$BUILD/content/shell/android/java/res/values/strings.xml` and `$BUILD/content/shell/android/shell_apk/res/values/strings.xml` into `./res/values/strings.xml`

