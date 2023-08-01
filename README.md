# docker-red #

run RED scripts in a Docker Container (not only) on a modern Mac

[RED](https://www.red-lang.org/p/about.html) (and [Rebol](http://www.rebol.com/)) scripts do no longer run under macOS since 32-bit applications are no longer supported.

If you still want to experiment with Rebol and/or RED, you will have to start a [Docker](https://www.docker.com/) container and either use a shell to run CLI scripts or use X11 for GUI scripts.

This repository basically contains a Dockerfile to build a Docker image for CLI and GUI scripts plus instructions for setting up a Mac in order to display RED/Rebol GUIs.

## Build a Docker Image ##

In order to build and run Docker images you must have Docker installed - for most people, installing the [Docker Desktop](https://www.docker.com/products/docker-desktop/) is the simplest way to do so.

Then follow the steps shown below:

1. clone this repository<br>either use<br>&nbsp;<br>`git clone https://github.com/rozek/docker-red`<br>&nbsp;<br>or [download a ZIP archive](https://github.com/rozek/docker-red/archive/refs/heads/main.zip) with this repository and unpack it
2. navigate to the root folder of this repository<br>&nbsp;<br>`cd docker-red`
3. build the Docker image using<br>&nbsp;<br>`docker build -t docker-red .`

## Run RED/Rebol CLI Scripts ##

## Prepare a Mac for X11 Display Forwarding ##

## Run RED/Rebol GUI Scripts ##


## License ##

[MIT License](LICENSE.md)
