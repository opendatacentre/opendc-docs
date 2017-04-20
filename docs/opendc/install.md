# Install
___

The **opendc** platform can be installed using a number of different [*Providers*](../providers/README.md).  The [`opendc`](../commands/opendc.md) command allows for all *Providers* to have a similar method of installation.

**Opendc** is a new project and as such is still considered **experimental**.  Testing has been conducted using the Vagrant, Digital Ocean and Bare *Providers* using only a limited set of environments.  

The following software versions are known to work.

* macOS 10.12, CentOS 7.  For the client / host node.
* Python 2.7.11, 2.7.12.
* Ansible 2.2.1.0.
* Vagrant 1.8.7.
* Virtualbox 5.1.8.
* dopy 0.3.7.  For interacting with Digital Ocean.

___

**Notes**

* The following install instructions relate to using the Vagrant *Provider*.
* The master node will be assigned 2GB RAM.
* Three worker nodes will be created with 3GB RAM each.

___


## Install the opendc command


The `opendc` command is implemented using Python.  It can be installed using `pip`.  

**Note**

It is probably best to use a seperate [Virtualenv](https://virtualenv.pypa.io/en/stable/) or [Pyenv](https://github.com/yyuu/pyenv) environment.

```
$ pip install opendc
```

The following dependancies will also be installed along with `opendc`.

```
ansible==2.2.1.0
docopt>=0.6.2
Jinja2>=2.8
pprintpp>=0.2.3
```

**Note**

Ansible will install a number of its own dependancies.
___


## Getting help for the opendc command


The `opendc` command provides help information at the top level and for each subcommand.

```
$ opendc -h
Interact with opendc.

usage:
  opendc [--help | -h] [--version] [--debug] <command> [<args>...]

options:
  -h, --help  show this help.
  --version   show the version.
  --debug     show debug output.

commands:
  init       initialize a new opendc installation in the current directory.
  up         run template, machine, provision, client, config, pull, and helm commands.
  template   create provider specific files from templates.
  machine    create a new set of machines for opendc to be provisioned to.
  provision  provision opendc components on to the machines.
  client     install kubectl and helm clients locally.
  config     generate a local kubeconfig file.
  pull       pull opendc solution images to the Docker repository cache.
  helm       deploy Helm to the k8s cluster.
  sol        deploy opendc solutions to the k8s cluster.
  hosts      update the local /etc/hosts with opendc hosts and services.
  security   manage opendc security, i.e. ssh config, certificates, tokens, etc. [NOT IMPLEMENTED]
  upgrade    upgrade playbooks. [NOT IMPLEMENTED]
  start      start opendc machines. [NOT IMPLEMENTED]
  status     check status of services. [NOT IMPLEMENTED]
  stop       stop opendc machines. [NOT IMPLEMENTED]
  destroy    remove opendc machines. [NOT IMPLEMENTED]

environment variables:
  opendc_SHOW_STACK=False  show full stack of any caught exceptions. [NOT IMPLEMENTED]

examples:
  opendc init --provider vagrant
  opendc up
  opendc status
```


```
$ opendc sol -h
Deploy opendc solutions to the k8s cluster.

usage:
  opendc [--debug] sol [<solution>] [--help | -h]

options:
  <solution>    is a specific solution to deploy.
  -h, --help    show this help.
  --debug       show debug output.

example:
  opendc sol
  opendc sol cs1_cluster_services
```

___


## Initialise opendc

Before installing **opendc**, a directory needs to be initialised with the files for a particular *Provider*.  The following example uses the [Vagrant](https://www.vagrantup.com) *Provider*.

```
$ mkdir ~/opendc
$ cd ~/opendc
$ opendc init -p vagrant
```

**Note**

To use the Vagrant *Provider* the following software versions must be installed.

* Vagrant 1.8.7
* Virtualbox 5.1.8 and above

___


## Edit the provider.yaml file

If you wish to change the install defaults then you can review and edit the `provider.yaml` file that has been created in the install root directory.

___


## Generate public / private key pair for admin user

You can generate your own public / private key pair for the admin user or make use of the sample ones provided.  The key pair can be found in the `keys/` directory of the install root.

*TODO*
___


## Install the base components

The simplest way to install the **opendc** base components is by using [`opendc up`](../commands/opendc_up.md).

```
$ opendc up
```

The `opendc up` subcommand will chain together the `template`, `machine`, `provision`, `client`, `config`, `pull` and `helm` subcommands into a single run.  Each of these subcommands can be run individually if desired.

**Notes**

* The default installation directory for the `kubectl` and `helm` commands is in the `bin/` directory of the install root.
* The initial install will take some time as the *Solution* images are also pulled so that the *Solutions* can be installed much faster.

___


## Validate the install

Once `opendc up` has completed you should have a working installation of the **opendc** base components.  To test this use the following commands.

```
$ source bin/opendc_env.sh
$ kubectl get nodes
```

You should see a set of Kubernetes nodes, i.e.

```
NAME                STATUS    AGE
node1.vb.opendc.io   Ready     5m
node2.vb.opendc.io   Ready     5m
node3.vb.opendc.io   Ready     5m
```
___


## Install the Solutions

Once the **opendc** base components are installed the [*Solutions*](../reference/solution.md) can be installed.

```
$ opendc sol
```

Currently the following *Solutions* will be installed.

* [(cs1) Cluster Services](../reference/solutions/cs1_cluster_services.md)
* [(cm1) Cluster Management](../reference/solutions/cm1_cluster_management.md)
* [(dbs1) Distributed Block Storage](../reference/solutions/dbs1_distributed_block_storage.md)
* [(im1) Identity Management](../reference/solutions/im1_identity_management.md)
* [(hrp1) HTTP/S Reverse Proxy](../reference/solutions/hrp1_https_reverse_proxy.md)
* [(m1) Metrics](../reference/solutions/m1_metrics.md)
* [(l1) Logging](../reference/solutions/l1_logging.md)
* [(ir1) Image Registry](../reference/solutions/ir1_image_registry.md)
* [(jm1) Job Management](../reference/solutions/jm1_job_management.md)

___


## Modify the local hosts file

Once the **opendc** *Solutions* are installed the local `hosts` file can be updated so that the *Solution* web UIs are accessible on the installation machine.

```
$ sudo opendc hosts
```

**Note**

It is important to run the `opendc` command as `root`.
___


## Access the Solutions

Now you can access the web UIs of the *Solutions*  that provide one.


#### (cm1) Cluster Management

http://dashboard.vb.opendc.io

#### (im1) Identity Management

http://keycloak.vb.opendc.io

#### (m1) Metrics

http://grafana.vb.opendc.io

http://prometheus.vb.opendc.io

#### (l1) Logging

http://kibana.vb.opendc.io 

#### (jm1) Job Management

http://jenkins.vb.opendc.io





