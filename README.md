# 🚀 Kubernetes The Ansible Way

Deploy a Kubernetes cluster from scratch using Vagrant and Ansible. This project is based on the [kubernetes-the-hard-way](https://github.com/mmumshad/kubernetes-the-hard-way) repository and uses Ansible to perform all the tasks required, from creating and signing certificates for different components, setting up nodes by adding proper kernel modules, downloading Kubernetes components binaries and adding DNS entries for each node, generating kubeconfigs, installing container runtime containerd, and configuring cluster networking and internal DNS.

<details>
  <summary>📋 Table of Contents</summary>
  <ul>
    <li><a href="#demo-video">🎥 Demo Video</a></li>
    <li><a href="#introduction">📖 Introduction</a></li>
    <li><a href="#architecture">🏗️ Architecture</a></li>
    <li><a href="#get-started">🚀 Get Started</a></li>
    <li><a href="#technologies-used">🛠️ Technologies Used</a></li>
    <li><a href="#acknowledgements">🌟 Acknowledgements</a></li>
    <li><a href="#license">📜 License</a></li>
</ul>
</details>

<a name="demo-video"></a>

## 🎥 Demo Video

[![Watch the video](https://img.youtube.com/vi/nikDHKM5pcA/maxresdefault.jpg)](https://youtu.be/nikDHKM5pcA)

<a name="introduction"></a>

## 📖 Introduction

**Kubernetes the Ansible way** is a project designed to simplify the process of deploying a Kubernetes cluster using Ansible and Vagrant. It automates the steps outlined in the **Kubernetes the hard way** guide, making it easier for you to set up a Kubernetes cluster from scratch.

<a name="architecture"></a>

## 🏗️ Architecture

| Component        | IP Address    | Description          |
| ---------------- | ------------- | -------------------- |
| `controlplane01` | 192.168.56.11 | Control Plane Node 1 |
| `controlplane02` | 192.168.56.12 | Control Plane Node 2 |
| `loadbalancer`   | 192.168.56.30 | Load Balancer        |
| `node01`         | 192.168.56.21 | Worker Node 1        |
| `node02`         | 192.168.56.22 | Worker Node 2        |

<a name="get-started"></a>

## 🚀 Get Started

### Prerequisites

Ensure you have the following tools installed on your system:

- [Vagrant](https://www.vagrantup.com/downloads)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

### Usage

Clone the repository and navigate into the directory:

```bash
git clone https://github.com/0xzer0x/kubernetes-the-ansible-way
cd kubernetes-the-ansible-way
vagrant up
```

This will deploy the entire Kubernetes cluster, including:

- 🖥️ Setting up nodes with proper kernel modules
- 🔒 Creating and signing certificates for different components
- 📦 Downloading Kubernetes components binaries
- 🌐 Adding DNS entries for each node
- 🗂️ Generating kubeconfigs
- 🐳 Installing the container runtime `containerd`
- 📡 Configuring cluster networking with Flannel
- 🌐 Setting up internal DNS with CoreDNS

<a name="technologies-used"></a>

## 🛠️ Technologies Used

- **Vagrant**: Tool for managing virtual machine environments.
- **Ansible**: Automation tool for configuration management and application deployment.
- **HAProxy**: High availability load balancer for efficient traffic distribution.
- **Containerd**: Core container runtime used in container orchestration.
- **Flannel**: Lightweight network fabric designed for Kubernetes.
- **CoreDNS**: DNS server for Kubernetes internal DNS resolution.

<a name="acknowledgements"></a>

## 🌟 Acknowledgements

Special thanks to [kubernetes-the-hard-way](https://github.com/mmumshad/kubernetes-the-hard-way/) for providing the foundational steps and guidance used in creating this project.

<a name="license"></a>

## 📜 License

This project is licensed under the GPL v3 License. See the [LICENSE](LICENSE) file for details.
