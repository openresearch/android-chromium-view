Android Chromium View
=====================

# Introduction

This project was inspired by [pwnall's chromeview](https://github.com/pwnall/chromeview), but it shares no common code.  The goal of this project is similar to that project -- which is to allow you to embed a replacement for the stock [Android WebView](https://developer.android.com/reference/android/webkit/WebView.html), using the latest [Chromium](http://www.chromium.org/Home).

## Why

* Android WebView does not have the same performance characteristics as Chromium (the latter is faster)
* Android WebView lacks feature parity with Chromium.  The Chromium team moves fast, it is usually one of the first browsers to receive new W3C features, etc.
* Android WebView is embedded and tied to the platform -- updating it therefore becomes problematic since you have to update the whole platform to update the browser

## What Is The Difference Between This & ChromeView
The [chromeview](https://github.com/pwnall/chromeview) project was an awesome start to solving this problem, and I started there, but henceforth, the author has stated that he lacks the time to dedicate to it.  So, I originally [forked](http://github.com/davisford/chromeview) it, and updated Chromium to a newer build.  Then I looked into the [scrolling issues](https://github.com/pwnall/chromeview/pull/6) and after some digging, decided that there was a separate build artifact out of Chromium that would provide a better base than the one chromeview was currently using.  The code was different enough that I felt it just warranted a separate repo -- so that's what you have here.  Scrolling does work great here.  There are some quirks, so check the [issues](https://github.com/davisford/android-chromium-view/issues?state=open) to figure out what isn't quite working (yet).

## What Do I Do With This
You should be able to import all of these projects into ADT and they should compile without error.  Each project may have dependencies on the other projects.  `content-shell` is the only application project.  It needs to include all the library projects in its deployable apk.  Make sure that the `project.properties` file for that project contains:

```
android.library.reference.3=../eyes-free
android.library.reference.4=../media
android.library.reference.1=../base
android.library.reference.2=../content
android.library.reference.6=../ui
android.library.reference.5=../net
```

Next, connect some Android ARM hardware, or use an emulator (slow), and run `content-shell` as an Android Application.  It should bring up a browser with a simple address bar and back/forward buttons.  The underlying browser is Chromium (obviously).  You're on your own if you want to modify / tweak the sources from here, but this is a good starting place.

From here, you can decide to use that as a stock browser wrapper, or obviously modify / add / edit / delete all the Java, C++, or JavaScript to your heart's content to build it into whatever you want.

## Artifacts: Assets & Libraries
The main Chromium artifact is a native shared library `.so`.  It also depends on a `.pak` file in the `/assets` folder (you'll find these in the `content-shell` app).  As built, these need to be included in your `/libs` and `/assets` folder of your project, and they *will* add a good 30-40MB of binary goodness to the size of your app.  However, if you're savvy, you could figure out a way to load those from a central location on the platform, so they don't have to be included in `.apk` file.  This will require code modifications.

The rest of the projects include java source and Android assets that were authored by Google to get Chromium to show up in a standard Android view and interact with it.

## Gradle Support
Asuming you have the Android build environment up and running (and the environment variable ANDROID_HOME is defined), you should be able to build the project from the command line by running `./gradlew build`.

If you have an Android device connected to your development machine, you can build and install the application on your device by running `./gradlew installDebug`.

You can also import the project into Android Studio and run it from there. Android Studio (as of version 0.2.6) might think there are some dependencies unresolved, but it should still build fine.

# Updating Chromium

Build the latest Chromium for Android (see instructions below).  Each project contained herein has a `scripts/` directory.  There is also and `env.sh` script in the root dir -- modify that first to set it to your environment.  Now, you can run each subdir's sh script as necessary to copy the latest artifacts over from the Chromium build tree.

Google updates this code constantly, so if you git pull on Chromium repo and rebuild, then copy the stuff over here, there's no guarantee that all of this won't break.

## License
Nearly all of the source in here is copied from the Chromium project and thus subject to Chromium license(s) -- `LICENSE` files are found w/in each project.  This project also contains a snapshot in time binary build of Chromium for Android (ARM target only).  Instructions below if you want to update Chromium.

## What Version of Chromium Is It?

TODO: I aim to add git tags to the repo to identify various Chromium builds.  Currently, the one in here was build in mid-August 2013 (more details coming).

# Pre-requisites for Building Chromium
@pwnall has some [nice instructions](https://github.com/pwnall/chromeview/blob/master/crbuild/vm-build.md) for how to setup a Chromium build machine on a VM.  I have made a [couple of tweaks to it on my own fork](https://github.com/davisford/chromeview/blob/master/crbuild/vm-build.md) -- namely stick with Ubuntu 12.04 for the least amount of headache.

I build on a MBP using an Ubuntu 12.04 image I created in VMWare Fusion.  You will need some decent hardware to build Chromium.  On 4 cores with 4GB RAM it can take several hours to complete the build.  If you have a single core, forget it.

If you have a spare machine to setup a build machine, I suppose that would be even nicer.

# Tips

## Setting up for GDB debugging
Something you may want to consider is to make the Chromium source available to your dev machine where you execute Android, so that you can attach gdb, and step through the native sources.  I still have to [document this setup](https://github.com/davisford/android-chromium-view/issues/8) 

# Pull Requests

Pull requests welcome to help improve the environment / shell scripts -- or even re-factor the projects.  In Android, the project's namespace is important, and if you have multiple package namespaces with resources, then it becomes a PITA to resolve the `R.java` files.  This is why I broke it out (one project per namespace) -- to avoid this problem.  Some of the projects don't contain any resources, however, and they could really be merged into a single library, but I left them separate, as you never know if Google decides to add resources to a project, then this structure already works and requires no re-factoring.

Don't send pull requests for Google authored code b/c it will just be re-written on the next update.  Don't send pull requests for updates to Chromium, I'd prefer you just fork the repo and update those yourself.
