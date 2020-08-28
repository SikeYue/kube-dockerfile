#!/bin/bash
KUBE_VERSION=v1.18.8
KUBE_PAUSE_VERSION=3.2
ETCD_VERSION=3.4.3-0
DNS_VERSION=1.6.7
username=registry.cn-hangzhou.aliyuncs.com/k8s_sike

images=(kube-proxy:${KUBE_VERSION}
kube-scheduler:${KUBE_VERSION}
kube-controller-manager:${KUBE_VERSION}
kube-apiserver:${KUBE_VERSION}
pause:${KUBE_PAUSE_VERSION}
etcd:${ETCD_VERSION}
coredns:${DNS_VERSION})

for image in ${images[@]}
do
    docker pull ${username}/${image}
    docker tag ${username}/${image} k8s.gcr.io/${image}
    docker rmi ${username}/${image}
done
