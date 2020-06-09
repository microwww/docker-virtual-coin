FROM etclabscore/core-geth:version-1.11.5

ADD entrypoint.sh /

RUN chmod +x /entrypoint.sh

EXPOSE 8545 30303

ENTRYPOINT ["/entrypoint.sh", "--classic"]

CMD []

