# Infracost Sentinel Module

This repository contains a Sentinel module that can be used within Terraform Cloud/Enterprise to demonstrate how the Sentinel policy as code language can be used to enforce cost management controls. 

To learn more about the Sentinel language and framework, please review the Sentinel [documentation](https://docs.hashicorp.com/sentinel/).

---

## Table of Contents
- [Prerequisites](#Prerequisites)
- [Documentation](#documentation)
- [Useful Resources](#useful-resources)

---

## Prerequisites

↥ [back to top](#table-of-contents)

Before you start using this module, it is recommended that you do the following:

1. [Install](https://docs.hashicorp.com/sentinel/intro/getting-started/install/) the Sentinel CLI. The CLI is an excellent tool for familiarizing yourself with the internals of Sentinel and allows you to `apply` and `test` policies outside of the Terraform platform. You can find more information related to the Sentinel CLI in the [Enforce Policy with Sentinel](https://learn.hashicorp.com/tutorials/terraform/policy-quickstart?in=terraform/cloud-get-started) learning track.

2. Create a `parameters.json` and place it in the root directory.

    Example:
    ```
    {
        "token": "AycXca3yd8DXNWX7K3gWOl9iEpy1EHUp"
    }
    ```

    > **NOTE:** The `token` value should be the token that was generated when the `infracost register` command was executed.

    The working directory should now appear as follows:

    ```
    .
    ├── mocks
    │   └── mock-tfplan-v2.sentinel
    ├── modules
    │   └── infracost.sentinel
    ├── parameters.json
    ├── policy.sentinel
    ├── readme.md
    └── sentinel.hcl
    ```

---

## Documentation

↥ [back to top](#table-of-contents)

The [policy.sentinel](./policy.sentinel) file shows an example of how you can use the [infracost.sentinel](./modules/infracost.sentinel) module in a Sentinel policy.

The `infracost` module uses the Sentinel [HTTP](https://docs.hashicorp.com/sentinel/imports/http) import to POST the raw output of the Terraform Plan JSON to the https://pricing.api.infracost.io/breakdown API. The `breakdown` module function then returns the Sentinel representation of the `Infracost` response. This response data is then used to enforce a control that limits the monthly cost for a project.

You can demonstrate the policy behaviour by running the following command:

```
sentinel apply -trace -param token=$(cat ./parameters.json | jq .token)
```

Which will produce the following result:

```
Installing modules...
  - Module tfplan/v2 marked for installation
  - Module infracost marked for installation
Module installation complete

Installing policies...
  - Policy policy marked for installation
Policy installation complete

Execution trace. The information below will show the values of all
the rules evaluated. Note that some rules may be missing if
short-circuit logic was taken.

Note that for collection types and long strings, output may be
truncated; re-run "sentinel apply" with the -json flag to see the
full contents of these values.

Pass - policy.sentinel

policy.sentinel:9:1 - Rule "main"
  Value:
    true
```

## Useful Resources

↥ [back to top](#table-of-contents)
- [Infracost Getting Started](https://www.infracost.io/docs/)
- [Infracost Plan JSON API](https://www.infracost.io/docs/integrations/infracost_api/)
- [Sentinel Documentation](https://docs.hashicorp.com/sentinel/)
- [Sentinel Language](https://docs.hashicorp.com/sentinel/language/)
- [Sentinel Language Specification](https://docs.hashicorp.com/sentinel/language/spec/)
