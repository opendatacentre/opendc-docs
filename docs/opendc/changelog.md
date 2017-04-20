# Changelog
___

## 0.0.21

* Changed **k8sdc** to be **opendc** after renaming project to **Open Datacentre**.
* *Base:*
	* Upgraded Kubernetes to 1.6.0.
	* Upgraded Ansible to 2.2.1.0.
	* Upgraded Docker to 1.12.6.
	* Upgraded docker-py to 1.10.6.
	* Upgraded Etcd to 3.1.4.
	* Upgraded Flannel to 0.7.0.
	* Added `opendc_env.sh` script to simplify setting up the client environment.
	* Added *ir1_image_registry* solution.
	* Changed the way that keys and certs are stored and used.
	* Changed where the wait occurs in the Digital Ocean machine playbook.
	* Changed the service definition for the kubelet.
	* Changed the startup arguments for kube-apiserver to enable the batch/v2alpha1 API for CronJobs.
	* Fixed regression with Vagrant Provider.
* *cs1_cluster_services:*
	* Upgraded k8s-dns to 1.11.0.
* *cm1_cluster_management:*
	* Upgraded Kubernetes Dashboard to 1.6.0.
* *dbs1_distributed_block_storage:*
	* Added Systemd mount to manage Ceph device filesystem.
	* Added Ceph client files to all non OSD nodes in the cluster.
* *im1_identity_management:*
	* Upgraded Keycloak to 3.0.0.Final.
	* Added ability to login to Keycloak using HTTP in lieu of proper SSL setup (coming).
	* Changed OpenDJ image to be opendatacentre/opendj:latest.
	* Changed all LDAP directory component paths to use opendj.
* *hrp1_https_reverse_proxy:*
	* Upgraded Traefik to 1.2.1.
* *m1_metrics:*
	* Upgraded prom/node-exporter to 0.14.0.
	* Added kube-state-metrics.
	* Changed numerous aspects of the charts.
* *l1_logging:*
	* Upgraded Elasticsearch to 5.2.0.
	* Added Elasticsearch Curator.
	* Added Filebeat.
	* Added Logstash to aggregate and transform filebeat logs.
	* Changed numerous aspects of the charts.

* Numerous other changes and improvements.
	
	








___

## 0.0.20

* Upgraded CentOS Vagrant box to 1611.01.
* Upgraded Helm to 2.1.3.
* Bugfix to cs1_cluster_services Solution due to switch to k8s 1.5.1.

___


## 0.0.19

* Upgrade Kubernetes server and client to 1.5.1.
* Bugfix for labeling nodes in dbs1_distributed_block_storage solution.

___


## 0.0.18

* Implemented Digital Ocean Provider.
* Other minor updates and fixes.

___


## 0.0.17
___

* Implemented `k8sdc pull` command.
* Implemented `k8sdc hosts` command.
* Implemented Docker registry mirror.
* Implemented Namespace creation.
* Implemented timezone configuration and NTP clients on nodes.  *NTP Server not yet implemented*.
* Updated Docker install so that `yum` is used.
* Updated Docker so that it uses the Docker registry mirror.
* Updated `helm` to version 2.0.0.
* Fixed `helm` location bug.
* Refactored `group_vars` files.
* Updated the Centos Vagrant box for provider Virtualbox to be version 1610.01.
* Removed `utilities` directory.
* Updated the following image versions for *Solution* *cs1_cluster_services*.
	* kubedns-amd64 = 1.9
	* kube-dnsmasq-amd64 = 1.4
	* exechealthz-amd64 = v1.2.0
* Implemented assertion that version 7 of Redhat/CentOS is used for the base components.
* Updated Install document.
* Other minor updates and fixes.