FROM i386/ubuntu:bionic

RUN apt-get update \
 && apt-get install --no-install-recommends -y wget git apt-utils \
      libcanberra-gtk-module libcanberra-gtk3-module libgtk-3-0 libcurl4 \
      libx11-6:i386 libxext6:i386 libxt6:i386 libxaw7:i386 libfreetype6:i386 \
 && wget http://www.rebol.com/downloads/v278/rebol-view-278-4-3.tar.gz \
 && tar xzvf rebol-view-278-4-3.tar.gz \
 && mv releases/rebol-view/rebol /bin/rebol-view \
 && wget http://www.rebol.com/downloads/v278/rebol-core-278-4-3.tar.gz \
 && tar xzvf rebol-core-278-4-3.tar.gz \
 && mv releases/rebol-core/rebol /bin/rebol \
 && chmod +x /bin/rebol /bin/rebol-view \
 && wget --no-check-certificate https://static.red-lang.org/dl/auto/linux/red-01aug23-40096dd12 -O /bin/red \
 && wget --no-check-certificate https://static.red-lang.org/dl/auto/linux/red-view-01aug23-40096dd12 -O /bin/red-view \
 && chmod +x /bin/red /bin/red-view

CMD ["sh","-c","cd /transfer && /bin/red"]