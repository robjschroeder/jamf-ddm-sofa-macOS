# jamf-ddm-sofa

`jamf-ddm-sofa` is a command-line utility that automates the creation of Declarative Device Management (DDM) Jamf Pro Managed Software Update Plans, based on the Simple Organized Feed for Apple Software Updates (SOFA) feed and National Vulnerability Database (NVD) CVE severity data.

## 📦 Features

- Evaluates macOS updates from the [SOFA](https://sofafeed.macadmins.io) feed
- Calculates deadlines based on [National Vulnerability Database](https://nvd.nist.gov/developers/request-an-api-key) CVE severity
- Creates [Jamf Managed Software Update](https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-11.17.0/page/Managed_Software_Updates.html) Plans per smart group
- Supports `--dry-run`, `--debug`, and manual overrides
- Designed to run interactively or in automation

## 🛠 Installation

```bash
git clone https://github.com/robjschroeder/jamf-ddm-sofa-macOS.git
cd jamf-ddm-sofa-macOS
sudo ./install.sh
```

## 🚀 Usage

```bash
jamf-ddm-sofa --jamf-client-id <id> --jamf-client-secret <secret> --jamf-uri <uri> --nvd-api-key <key> [options]
```

### Required Parameters

- `--jamf-client-id`        Jamf Pro API client ID
- `--jamf-client-secret`    Jamf Pro API client secret
- `--jamf-uri`              Jamf Pro base URI (e.g., https://yourcompany.jamfcloud.com)
- `--nvd-api-key`           NVD API Key for CVE severity lookups

### Optional Parameters

- `--macOS 15.5`            Manually specify the target macOS version
- `--deadline 2025-06-01`   Override the calculated deadline
- `--dry-run`               Do not create any update plans
- `--debug`                 Enable verbose debug output
- `--help`                  Show usage info
- `--version`               Show script version

## 👨‍💻 Author

Created by Robert Schroeder (@robjschroeder)

## 📄 License

MIT
