FROM ubuntu:22.04

USER root
ENV BUILDKIT_PROGRESS=plain
RUN mkdir -p /home/software-install
WORKDIR /home/software-install

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Contains gpg, curl, git, unzip, nano, openjdk19, wget, python3, docker(dnd), ansible, awscli, helm, kubectl, yq, argocdcli, kubectx, kubens
RUN apt-get update && \
    apt-get -y install sudo && \
	sudo apt update -y && \
	sudo apt upgrade -y && \
	sudo apt-get install -y ca-certificates gnupg curl git unzip nano openjdk-19-jdk wget python3-pip && \
	sudo install -m 0755 -d /etc/apt/keyrings && \
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
	sudo chmod a+r /etc/apt/keyrings/docker.gpg && \
	sudo apt -y install ansible && \
	echo \
	"deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
	"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
	sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip  && \
	sudo ./aws/install && \
	curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
	chmod 700 get_helm.sh && \
	./get_helm.sh && \
	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
	sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
	kubectl version --client && \
	wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 &&\
	chmod a+x /usr/local/bin/yq &&\
	curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 &&\
	sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd &&\
	rm argocd-linux-amd64 &&\
	sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx &&\
	sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx &&\
	sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens &&\
:


ENTRYPOINT ["/bin/bash"]


