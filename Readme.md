This project contains bits and pieces of kubernetes related stuff

Some random note floolow below


#access dashboard

    kubectl config view

#Create perstistent disks

    gcloud compute disks create --size=20GB --zone=europe-west1-b postgre-disk

    gcloud compute forwarding-rules list

    aws ec2 create-volume --availability-zone eu-west-1c --size 40 --volume-type gp2


#Useful commands

kubectl config set-cluster test-doc --server=http://192.168.99.100:8080

kubectl run -i --tty --image=ubuntu:14.04 ubuntu --generator=run-pod/v1
kubectl attach ubuntu -c ubuntu -i -t
kubectl exec ubuntu -c ubuntu -i --tty sh

#Running locally with docker

##shutdown

sudo docker rm -f $(sudo docker ps -aq)
sudo umount `cat /proc/mounts | grep /var/lib/kubelet | awk '{print $2}'`
sudo rm -rf /var/lib/kubelet

#Install 

## Digital Ocean

kubeadm init --apiserver-advertise-address 174.138.97.107 --pod-network-cidr=192.168.0.0/16
kubectl apply -f https://docs.projectcalico.org/v2.6/getting-started/kubernetes/installation/hosted/kubeadm/1.6/calico.yaml

