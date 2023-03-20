FROM node:14-alpine

RUN npm install -g @mockoon/cli@2.4.0
COPY mockoon-fint.json ./mockoon-fint.json

# Do not run as root.
RUN adduser --shell /bin/sh --disabled-password --gecos "" mockoon
RUN chown -R mockoon ./mockoon-fint.json
USER mockoon

EXPOSE 3000

ENTRYPOINT ["mockoon-cli", "start", "--daemon-off", "--data", "mockoon-fint.json", "--container"]

# Usage: docker run -p <host_port>:<container_port> mockoon-test