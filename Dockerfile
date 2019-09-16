FROM babim/alpinebase:3.9

ENV SOFT=duplicacy \
    ARCHITECTURE=linux_x64 \
    VERSION_DUPLICACY=2.2.3  \
    VERSION_DUPLICACY_WEB=1.0.0

# download option
RUN apk add --no-cache wget bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh

# install
RUN wget --no-check-certificate -O - https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20Duplicacy%20install/${SOFT}_install.sh | bash

EXPOSE 3875
CMD ["/docker-entrypoint.sh"]

VOLUME ["/var/cache/duplicacy", "/etc/duplicacy"]
