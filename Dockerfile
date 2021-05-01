FROM bitnami/mediawiki:1.35.1

## Change user to perform privileged actions
USER 0

RUN install_packages python3
RUN mkdir /docker-entrypoint-init.d
COPY SyntaxHighlight-setup.sh /docker-entrypoint-init.d/SyntaxHighlight-setup.sh
RUN chmod a+x /docker-entrypoint-init.d/SyntaxHighlight-setup.sh
## Revert to the original non-root user
USER 1001

