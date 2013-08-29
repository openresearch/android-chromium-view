# Chromium Content Source

This project ontains code we need in the `org.chromium.content.*` package namespace.

This is a library project other projects depend on.

To update the source code here, run `scripts/copy-content.sh` after building Chromium for Android.

# Local Modifications

After updating the sources, you need to edit `org.chromium.content.app.NativeLibraries.java` to contain the following (this makes it load the native shared library):

```java
package org.chromium.content.app;

public class NativeLibraries {

  // THIS WAS HAND EDITED
    public static String[] libraries = { "content_shell_content_view" };

}
```