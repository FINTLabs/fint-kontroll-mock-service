FROM node:14-alpine

RUN npm install -g @mockoon/cli@2.4.0
COPY /data/* ./data/

RUN adduser --shell /bin/sh --disabled-password --gecos "" mockoon
RUN chown -R mockoon ./data/FINT.json
USER mockoon

EXPOSE 3000

ENTRYPOINT ["mockoon-cli", "start", "--daemon-off", "--data", "./data/FINT.json", "--container"]