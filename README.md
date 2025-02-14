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
4. Run Terraform to setup the infrastructure:
    ```sh
    terraform init
    terraform apply
    ```