#!/bin/bash -x

distname="trixie"
archs="amd64 arm64 armel armhf i386 ppc64el riscv64 s390x"

gpg2 --version 2>/dev/null >/dev/null
if [ $? -eq 0 ]; then
    GPG=gpg2
else
    GPG=gpg
fi

packages_db=""
for i in ${archs}; do
    packages_db="$packages_db packages-$i.db"
    mkdir -p dists/${distname}/main/binary-$i
done

rm -rfv dists.old $packages_db && \
	cp -Rvp dists dists.old && \
	find dists/${distname} -type f -exec rm -v '{}' \; && \
	apt-ftparchive generate -c=aptftp_${distname}.conf aptgenerate_${distname}.conf && \
	apt-ftparchive release -c=aptftp_${distname}.conf dists/${distname} >dists/${distname}/Release && \
	read -p "Press enter to sign package repository..." && \
	rm -fv dists/${distname}/Release.gpg && $GPG --default-key "Erik Larsson" -abs -o dists/${distname}/Release.gpg dists/${distname}/Release && \
	rm -fv dists/${distname}/InRelease && $GPG --default-key "Erik Larsson" --clearsign -o dists/${distname}/InRelease dists/${distname}/Release
