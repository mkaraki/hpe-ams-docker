FROM registry.suse.com/suse/sles12sp3:latest

COPY hp-ams-2.10.5-888.1.sles12.x86_64.rpm /hp-ams-2.10.5-888.1.sles12.x86_64.rpm

RUN zypper --non-interactive --no-gpg-checks addrepo -f http://download.opensuse.org/distribution/12.3/repo/oss/ oss && \
    zypper --non-interactive --no-gpg-checks install /hp-ams-2.10.5-888.1.sles12.x86_64.rpm && \
    rm /hp-ams-2.10.5-888.1.sles12.x86_64.rpm && \
    zypper clean -a

ENTRYPOINT ["/sbin/amsHelper"]
CMD ["-f"]