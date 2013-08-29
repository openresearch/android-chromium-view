Android Chromium View
=====================

# Introduction

This project was inspired by [pwnall's chromeview](https://github.com/pwnall/chromeview), but it shares no common code.

The goal of this project is to provide the resources needed to build a replacement for the stock Android WebView with the latest [Chromium](http://www.chromium.org/Home) browser.  Here you'll find the tools you need to get going, and a handful of Android projects that will allow you to build an Android library or WebApp that uses Chromium.  If you're looking to do such a thing, I'd expect you'd fork this and use it as a baseline -- the goal is to just save you some time on homework I already did.

Nearly all of the source in here is copied from the Chromium project and thus subject to Chromium license(s) -- `LICENSE` files are found w/in each project.  This project also contains a snapshot in time binary build of Chromium for Android (ARM target only).  Instructions below if you want to update Chromium.

If you want to update it, [rebuild Chromium](https://github.com/davisford/chromeview/blob/master/crbuild/vm-build.md) and then run the `.sh` scripts found in here to update each individual project.  Beware that Google changes the Chromium source constantly, and is likely to break any of this at any time.  You'll have to keep up with it yourself.  

Pull requests welcome on the scripts, etc. -- I spent very little time on making them nice.  Don't send pull requests for the .java code -- it's Google's code.

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

I whole-heartedly recommend setting up `avahi` software on the Guest OS -- it makes things a lot easier to copy files between them, etc.
