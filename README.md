Android Chromium View
=====================

This project was inspired by [pwnall's chromeview](https://github.com/pwnall/chromeview), but it shares no common code.

The goal of this project is to provide the resources needed to build a replacement for the stock Android WebView with the latest [Chromium](http://www.chromium.org/Home) browser.  Here you'll find the tools you need to get going, and a handful of Android projects that will allow you to build an Android library or WebApp that uses Chromium.  If you're looking to do such a thing, I'd expect you'd fork and use it as a baseline -- the goal is to just save you some time on homework I already did.

Also, you'll find some rudimentary shell scripts to copy over the artifacts from the Chromium source to update this project with the latest binary artifacts and `.java` source needed to wrap Chromium.  Google has already done most of this work, they just haven't really packaged it up and polished it.  I haven't polished it up either.  This represents a starting point for someone interested in taking it further.

Nearly all of the source in here is copied from the Chromium project and thus subject to Chromium license(s) -- `LICENSE` files are found w/in each project.  This project also contains a snapshot in time binary build of Chromium for Android (ARM).  If you want to update it, [rebuild Chromium](https://github.com/davisford/chromeview/blob/master/crbuild/vm-build.md) and then run the `.sh` scripts found in here to update each individual project.  Beware that Google changes the Chromium source constantly, and is likely to break any of this at any time.  You'll have to keep up with it yourself.  

Pull requests welcome on the scripts, etc. -- I spent very little time on making them nice.  Don't send pull requests for the .java code -- it's Google's code.
