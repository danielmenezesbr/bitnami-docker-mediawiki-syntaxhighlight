FROM bitnami/mediawiki:1.35.1

## Change user to perform privileged actions
USER 0

RUN mkdir /bitnami/mediawiki/extensions/
RUN curl -o SyntaxHighlight_GeSHi-REL1_35-0e4cce6.tar.gz https://extdist.wmflabs.org/dist/extensions/SyntaxHighlight_GeSHi-REL1_35-0e4cce6.tar.gz
RUN tar -xzf SyntaxHighlight_GeSHi-REL1_35-0e4cce6.tar.gz -C /bitnami/mediawiki/extensions/
RUN rm SyntaxHighlight_GeSHi-REL1_35-0e4cce6.tar.gz
RUN cd /bitnami/mediawiki/extensions/SyntaxHighlight_GeSHi && composer install --no-dev
RUN chmod a+x /bitnami/mediawiki/extensions/SyntaxHighlight_GeSHi/pygments/pygmentize
RUN mkdir /docker-entrypoint-init.d
COPY SyntaxHighlight-setup.sh /docker-entrypoint-init.d/SyntaxHighlight-setup.sh
RUN chmod a+x /docker-entrypoint-init.d/SyntaxHighlight-setup.sh
## Revert to the original non-root user
USER 1001

