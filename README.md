Android Chromium View
=====================

# Introduction

This project was inspired by [pwnall's chromeview](https://github.com/pwnall/chromeview), but it shares no common code.

The goal of this project is to provide the resources needed to build a replacement for the stock Android WebView with the latest [Chromium](http://www.chromium.org/Home) browser.  Here you'll find the tools you need to get going, and a handful of Android projects that will allow you to build an Android library or WebApp that uses Chromium.  If you're looking to do such a thing, I'd expect you'd fork this and use it as a baseline -- the goal is to just save you some time on homework I already did.

Nearly all of the source in here is copied from the Chromium project and thus subject to Chromium license(s) -- `LICENSE` files are found w/in each project.  This project also contains a snapshot in time binary build of Chromium for Android (ARM target only).  Instructions below if you want to update Chromium.

# Pre-requisites for Building Chromium

I recommend you build on a virtual machine, preferably Ubuntu 12.04.  At the time of writing, this was the supported distribution and version that Google uses.  If you deviate from that, you may need to fight with tools / scripts / environment to get it to build.

I have made slight modifications to @pwnall's build instructions  [here](https://github.com/davisford/chromeview/blob/master/crbuild/vm-build.md) -- use that to get started setting up a VM.  I use VMWare Fusion instead of Virtual Box, so adjust for your virtual container of choice.  Make sure you give it enough disk -- I recommend ~60GB.  You will also need some legitimate hardware to build Chromium.  I give my VM 4 cores, and 4GB RAM, and that will talk nearly a whole day to compile.  If you're trying to build on a single core, forget it.

# Tips

## Setting up for GDB debugging
You may decide you'll want to debug the C++ Chromium source.  My setup is as follows:

* Mac Book Pro (host) with ADT installed on it - I use this to build the Android apps / libraries and use `adb` between it and the USB Android hardware I'm developing on
* Ubuntu 12.04 running inside VMWare Fusion on MBP - I use this to build Chromium

Since I run ADT on the Mac, I want to also run gdb client on the Mac.  In order to step through source, my Mac needs access to it.  The instructions in @pwnall's docs had you check out the source in Linux to `/mnt/chromium`.  I modified that.  Instead, I setup a mirrored folder in VMWare (i.e. a folder that both the Guest and Host OS can see).  It happens to be `/mnt/hgfs/crbuild/chromium` and this is where I've checked out the Chromium sources.  That folder maps to `/Users/<myname>/crbuild` on my Mac, so that I can point gdb to the sources there while debugging.

## avahi

I whole-heartedly recommend setting up `avahi` software on the Guest OS (as per the instructions linked above) -- it makes things a lot easier to copy files between them, etc.

# Getting Started

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

# Updating Chromium

Build the latest Chromium for Android (see instructions above).  Each project contained herein has a `scripts/` directory.  There is also and `env.sh` script in the root dir -- modify that first to set it to your environment.  Now, you can run each subdir's sh script as necessary to copy the latest artifacts over from the Chromium build tree.

Google updates this code constantly, so if you git pull on Chromium repo and rebuild, then copy the stuff over here, there's no guarantee that all of this won't break.

# Pull Requests

Pull requests welcome to help improve the environment / shell scripts -- or even re-factor the projects.  In Android, the project's namespace is important, and if you have multiple package namespaces with resources, then it becomes a PITA to resolve the `R.java` files.  This is why I broke it out (one project per namespace) -- to avoid this problem.  Some of the projects don't contain any resources, however, and they could really be merged into a single library, but I left them separate, as you never know if Google decides to add resources to a project, then this structure already works and requires no re-factoring.

Don't send pull requests for Google authored code b/c it will just be re-written on the next update.  Don't send pull requests for updates to Chromium, I'd prefer you just fork the repo and update those yourself.