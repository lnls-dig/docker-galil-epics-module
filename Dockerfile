FROM lnls/epics-dist:debian-9.2

ENV MODULE_OWNER motorapp
ENV MODULE_REPO Galil-3-0
ENV VERSION 3-6
ENV COMMIT V${VERSION}

RUN git clone https://github.com/${MODULE_OWNER}/${MODULE_REPO}.git /opt/epics/${MODULE_REPO} && \
    cd /opt/epics/${MODULE_REPO} && \
    git checkout ${COMMIT} && \
    cd ${VERSION} && \
    sed -i -e 's|^EPICS_BASE=.*$|EPICS_BASE=/opt/epics/base|' config/GALILRELEASE && \
    sed -i -e 's|^SUPPORT=.*$|SUPPORT=/opt/epics/synApps_5_8/support|' config/GALILRELEASE && \
    sed -i -e 's|^AUTOSAVE=.*$|AUTOSAVE=$(SUPPORT)/autosave-5-6-1|' config/GALILRELEASE && \
    sed -i -e 's|^SNCSEQ=.*$|SNCSEQ=$(SUPPORT)/seq-2-2-1|' config/GALILRELEASE && \
    sed -i -e 's|^SSCAN=.*$|SSCAN=$(SUPPORT)/sscan-2-10-1|' config/GALILRELEASE && \
    sed -i -e 's|^CALC=.*$|CALC=$(SUPPORT)/calc-3-4-2-1|' config/GALILRELEASE && \
    sed -i -e 's|^ASYN=.*$|ASYN=$(SUPPORT)/asyn-4-26|' config/GALILRELEASE && \
    sed -i -e 's|^BUSY=.*$|BUSY=$(SUPPORT)/busy-1-6-1|' config/GALILRELEASE && \
    sed -i -e 's|^MOTOR=.*$|MOTOR=$(SUPPORT)/motor-6-9|' config/GALILRELEASE && \
    sed -i -e 's|^IPAC=.*$|IPAC=$(SUPPORT)/ipac-2-13|' config/GALILRELEASE && \
    sed -i -e 's|^GALIL=.*$|#GALIL=|' config/GALILRELEASE && \
    cd GalilSup && \
    make
