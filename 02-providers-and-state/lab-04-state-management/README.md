# Advanced Terraform State Management & Local Backend Operations

## Objectives
- Configure and manage custom local backend state storage paths (`backend "local"`).
- Execute complete state lifecycles including initialization, incremental resource scaling, and state backups.
- Perform advanced state surgery using native Terraform CLI commands (`state list`, `state show`, `state mv`, `state rm`, `state pull`, and `import`).
- Implement safe refactoring workflows and disaster recovery backup strategies.

## Tools Used
- **Terraform (v1.6.6)**: Infrastructure as Code orchestration engine.
- **Local & Random Providers**: State tracking automation without cloud dependencies.
- **Bash / Python3**: JSON state parsing and automated verification.

## Key Skills Demonstrated
- **Backend Customization**: Decoupling state files from default working roots into dedicated encrypted storage folders.
- **State Refactoring (`state mv`)**: Safely renaming resource addresses in state without triggering destructive recreation.
- **Decoupling Management (`state rm` & `import`)**: Unbinding existing files from state and successfully re-importing them with zero drift.

## Troubleshooting Log
- **State File Corruption Recovery**: Established automated state snapshot backups (`backups/`) to enable instant point-in-time rollbacks during failed refactoring attempts.
- **Provider Plugin Versioning**: Pinned `hashicorp/local` and `hashicorp/random` version constraints to ensure reproducible local test execution.
