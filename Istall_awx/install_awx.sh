sudo snap install microk8s --classic
sudo usermod -aG microk8s vbitadmin
sudo chown -fR $USER ~/.kube
microk8s enable storage dns ingress
sudo snap alias microk8s.kubectl kubectl
sudo apt install make -y
git clone https://github.com/ansible/awx-operator
cd awx-operator/
git checkout 2.19.1
make deploy
kubectl config set-context --current --namespace=awx
kubectl apply -f awx-demo.yml