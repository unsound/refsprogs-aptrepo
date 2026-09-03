#!/bin/sh

echo "Refreshing buster packages..." && \
    ./refreshrepo_full_buster.sh && \
    echo "Refreshing trixie packages..." && \
    ./refreshrepo_full_trixie.sh && \
    echo "Refreshing trixie ports packages..." && \
    ./refreshrepo_full_trixie_ports.sh && \
    echo "Synchronizing legacy 'main' dist..." && \
    rm -r dists/main && \
    cp -rpv dists/buster dists/main && \
    echo "Done!"
