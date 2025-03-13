# OPNsense Configuration

## Overview
This project contains configuration files and scripts for setting up and managing an OPNsense firewall. OPNsense is an open-source, easy-to-use, and easy-to-build FreeBSD-based firewall and routing platform.

## Installation
1. Clone the repository:
    ```sh
    git clone https://github.com/guyzsarun-lab/opnsense-configuration.git
    ```
2. Navigate to the project directory:
    ```sh
    cd opnsense-configuration
    ```
3. Update the `terraform.tfvars` file with the required values. See [example](terraform.tfvars.example).

    To generate api key and secret, follow the steps below:
    - Go to `System` > `Access` > `Users`.
    - Click on the `API keys` tab.
4. Update the `dns_override.json` file for the DNS override configuration. See [dns_override](dns_override.json).

- Example dns override for k8s.example.com to 192.168.1.1
    ```json
    [
        {
            "hostname": ["k8s"],
            "domain": "example.com",
            "server": "192.168.1.1"
        }
    ]
    ```
5. Run Terraform to setup the infrastructure:
    ```sh
    terraform init
    terraform apply
    ```