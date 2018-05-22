FROM linuxserver/sonarr:develop

RUN \
  apt-get update && \
  apt-get install -y \
  ffmpeg \
  git \
  python-pip \
  openssl \
  python-dev \
  libffi-dev \
  libssl-dev \
  libxml2-dev \
  libxslt1-dev \
  zlib1g-dev

RUN \
  pip2 install -U pip &&
  pip2 install requests && \
  pip2 install requests[security] && \
  pip2 install requests-cache && \
  pip2 install babelfish && \
  pip2 install 'guessit<2' && \
  pip2 install 'subliminal<2' && \
  pip2 install stevedore==1.19.1 && \
  pip2 install python-dateutil && \
  pip2 install qtfaststart && \
  git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /sickbeard_mp4_automator/ && \
  touch /sickbeard_mp4_automator/info.log && \
  chmod a+rwx -R /sickbeard_mp4_automator && \
  ln -s /downloads /data && \
  ln -s /config_mp4_automator/autoProcess.ini /sickbeard_mp4_automator/autoProcess.ini && \
  rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

VOLUME config_mp4_automator
