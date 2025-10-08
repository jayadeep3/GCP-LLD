# GCP-LLD

**GCP Landing Zone Implementation**

This repository provides an opinionated, modular, and scalable Landing Zone architecture for Google Cloud Platform (GCP), implemented using Terraform (HCL). It helps organizations bootstrap and manage secure, production-ready cloud environments, including networking, IAM, security, billing, and monitoring.

---

## 🚀 Features

- **Modular Terraform design** for reusable infrastructure components
- **Environment isolation** for Dev, Pre-Prod, Prod, and more
- **Centralized networking, IAM, and security policies**
- **Automated logging, monitoring, and billing exports**
- **Support for organization policies and folder/project hierarchy**

---

## 📁 Directory Structure (Summary)

```
GCP/
├── env/            # Environment-specific configs (per project)
│   ├── billing-prj/
│   ├── network-prj/
│   ├── infraservices-prj/
│   ├── prod-prj/
│   ├── dev-prj/
│   ├── preprod-prj/
│   ├── security-prj/
│   ├── logging-prj/
│   ├── sbx-prj/
│   ├── iac-prj/
│   ├── org_policies/
├── stack/          # Execution entrypoints (grouping modules)
│   ├── org-foundation/
│   ├── org-bootstrap/
├── modules/        # Reusable building blocks
│   ├── networking/
│   ├── folders/
│   ├── projects/
│   ├── billing/
│   ├── logging/
│   ├── monitoring/
│   ├── iam/
│   ├── security/
│   ├── org_policies/
```

See code for full details.

---

## 🛠️ Prerequisites

- [Terraform](https://www.terraform.io/) v1.0+
- Access to a GCP Organization
- Service account with permissions to create projects, folders, networks, IAM, etc.
- [gcloud CLI](https://cloud.google.com/sdk/docs/install) (optional for local development)

---

## ⚡ Getting Started

1. **Clone this repository**

    ```bash
    git clone https://github.com/jayadeep3/GCP-LLD.git
    cd GCP-LLD/GCP
    ```

2. **Initialize Terraform**

    ```bash
    terraform init
    ```

3. **Customize variables**

    Edit `terraform.tfvars`/`*.tfvars` in the relevant `env/` subdirectory (e.g. `dev-prj`, `prod-prj`)  
    Set organization ID, billing account, folder/project names, etc.

4. **Apply the configuration**

    ```bash
    terraform plan -var-file="env/dev-prj/terraform.tfvars"
    terraform apply -var-file="env/dev-prj/terraform.tfvars"
    ```

---

## 🧩 Customization

- Create additional modules or environments by copying and editing the relevant subfolders.
- Adjust organization policies in `env/org_policies/`.
- Add or modify networking, security, or IAM resources as needed.

---

## 🤝 Contributing

Contributions, feature requests, and bug reports are welcome!  
Please open an [Issue](https://github.com/jayadeep3/GCP-LLD/issues) or submit a Pull Request.

---

## 📄 License

This project is licensed under the MIT License. See [LICENSE](./LICENSE) for details.

---

## 📬 Contact

Maintainer: [jayadeep3](https://github.com/jayadeep3)  
For questions or support, open an issue or reach out via GitHub.
