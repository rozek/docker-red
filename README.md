# docker-red #

runs RED (and Rebol) scripts in a Docker Container (not only) on a modern Mac

[RED](https://www.red-lang.org/p/about.html) (and [Rebol](http://www.rebol.com/)) scripts do not run under macOS Catalina and newer since 32-bit applications are no longer supported.

If you still want to experiment with Rebol and/or RED, you will have to start a [Docker](https://www.docker.com/) container and either use a shell to run CLI scripts or use "X11 forwarding" for GUI scripts.

This repository basically contains a Dockerfile to build a Docker image for CLI and GUI scripts plus instructions for setting up a Mac in order to display RED/Rebol GUIs. The Dockerfile is based on a [similar project](https://codeberg.org/vazub/red-docker), but has been modified to run all kinds of RED and Rebol scripts - additionally, the instructions to configure macOS have been modernized and simplified.

## Build a Docker Image ##

In order to build and run Docker images you must have Docker installed - for most people, installing the [Docker Desktop](https://www.docker.com/products/docker-desktop/) is the best way to do so.

Then follow the steps shown below:

1. clone this repository: either use<br>&nbsp;<br>`git clone https://github.com/rozek/docker-red`<br>&nbsp;<br>or [download a ZIP archive](https://github.com/rozek/docker-red/archive/refs/heads/main.zip) with this repository and unpack it
2. navigate to the root folder of this repository:<br>&nbsp;<br>`cd docker-red`<br>&nbsp;<br>
3. build the Docker image using<br>&nbsp;<br>`docker build -t docker-red .`<br>&nbsp;<br>

## Run RED/Rebol CLI Scripts ##

You are now ready to run CLI scripts. Simply start the container built before using

```
docker run --rm --platform=linux/386 -v .:/transfer -it docker-red
```

from the macOS Terminal and you will get a RED prompt.

If you prefer Rebol itself, just run

```
docker run --rm --platform=linux/386 -v .:/transfer -it docker-red /bin/rebol
```

instead.

## Prepare a Mac for X11 Display Forwarding ##

MacOS cannot natively display GUIs created inside a Docker container - you need to install XQuartz for that purpose. Simply follow steps 1...7 from [another guide](https://gist.github.com/sorny/969fe55d85c9b0035b0109a31cbcb088) **but do not forget to restart your Mac!**

## Run RED/Rebol GUI Scripts ##

You are now ready to run GUI scripts as well:

```
open -a XQuartz \
&& xhost +localhost \
&& docker run --rm --platform=linux/386 -v .:/transfer -e DISPLAY=host.docker.internal:0 \
   -it docker-red /bin/red-view
```

starts `red-view` and

```
open -a XQuartz \
&& xhost +localhost \
&& docker run --rm --platform=linux/386 -v .:/transfer -e DISPLAY=host.docker.internal:0 \
   -it docker-red /bin/rebol-view
```

does the same for Rebol and open the famous Rebol Viewtop.

## License ##

[MIT License](LICENSE.md)
