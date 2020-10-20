FROM jmll/roya-server:0.0.1

ENV GLOW glow.qcr.public
ENV GLOW_BRANCH 0.0.1

## install r-packages
RUN  cd ~ \
  && wget --quiet https://git.nilu.no/rglow/${GLOW}/-/archive/${GLOW_BRANCH}/${GLOW}-${GLOW_BRANCH}.tar.gz \
  && tar xzf ${GLOW}-${GLOW_BRANCH}.tar.gz \
  && cd ${GLOW}-${GLOW_BRANCH} \
  && Rscript ./lib/buildpkgs.R \
  && cd .. \
  && rm -r ${GLOW}-${GLOW_BRANCH} \
  && rm ${GLOW}-${GLOW_BRANCH}.tar.gz
