FROM python:alpine
RUN apk add vim
RUN apk --no-cache add ca-certificates
RUN apk add curl
RUN apk add jq
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin
COPY requirements.txt ./
RUN apk add --update alpine-sdk libffi libffi-dev openssl openssl-dev 
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
CMD ["sh"]
