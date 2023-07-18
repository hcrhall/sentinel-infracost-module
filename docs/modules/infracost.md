# Infracost Sentinel Module

This [Infracost](https://www.infracost.io) Sentinel module provides functions for authentication and estimating pricing values based on the [JSON Output Format](https://developer.hashicorp.com/terraform/internals/json-format) of the Terraform Plan.

## Import Statements

The module imports the following standard libraries:

- "http": This library is used for making HTTP requests.
- "json": This library is used for JSON serialization and deserialization.
- "decimal": This library is used for decimal arithmetic.

It also imports a third-party library:

- "tfplan/v2" as tfplan: This library is used to access the Terraform Plan.

## Function: auth(token)

This function takes a `token` parameter and returns an object containing the data and summary of the token.

### Parameters

- `token`: A string representing the authentication token.

### Returns

- An object with the following properties:
  - `data`: The `token` parameter converted to JSON format.
  - `summary`: The `token` parameter converted to a table format.

#### Example
```json
{
    "data": {
        "currency": "USD",
        "diffTotalHourlyCost": "1.017315068493150679",
        "diffTotalMonthlyCost": "742.64",
        "metadata": {
            "infracostCommand": "breakdown",
            "vcsBranch": "",
            "vcsCommitAuthorEmail": "",
            "vcsCommitAuthorName": "",
            "vcsCommitMessage": "",
            "vcsCommitSha": "",
            "vcsCommitTimestamp": "0001-01-01T00:00:00Z"
        },
        "pastTotalHourlyCost": "0",
        "pastTotalMonthlyCost": "0",
        "projects": [
            {
                "breakdown": {
                    "resources": [
                        {
                            "costComponents": [
                                {
                                    "hourlyCost": "0.768",
                                    "hourlyQuantity": "1",
                                    "monthlyCost": "560.64",
                                    "monthlyQuantity": "730",
                                    "name": "Instance usage (Linux/UNIX, on-demand, m5.4xlarge)",
                                    "price": "0.768",
                                    "unit": "hours"
                                }
                            ],
                            "hourlyCost": "1.017315068493150679",
                            "metadata": {},
                            "monthlyCost": "742.64",
                            "name": "aws_instance.web_app",
                            "resourceType": "aws_instance",
                            "subresources": [
                                {
                                    "costComponents": [
                                        {
                                            "hourlyCost": "0.00684931506849315",
                                            "hourlyQuantity": "0.0684931506849315",
                                            "monthlyCost": "5",
                                            "monthlyQuantity": "50",
                                            "name": "Storage (general purpose SSD, gp2)",
                                            "price": "0.1",
                                            "unit": "GB"
                                        }
                                    ],
                                    "hourlyCost": "0.00684931506849315",
                                    "metadata": {},
                                    "monthlyCost": "5",
                                    "name": "root_block_device"
                                } {
                                    "costComponents": [
                                        {
                                            "hourlyCost": "0.1712328767123287625",
                                            "hourlyQuantity": "1.3698630136986301",
                                            "monthlyCost": "125",
                                            "monthlyQuantity": "1000",
                                            "name": "Storage (provisioned IOPS SSD, io1)",
                                            "price": "0.125",
                                            "unit": "GB"
                                        } {
                                            "hourlyCost": "0.0712328767123287665",
                                            "hourlyQuantity": "1.0958904109589041",
                                            "monthlyCost": "52",
                                            "monthlyQuantity": "800",
                                            "name": "Provisioned IOPS",
                                            "price": "0.065",
                                            "unit": "IOPS"
                                        }
                                    ],
                                    "hourlyCost": "0.242465753424657529",
                                    "metadata": {},
                                    "monthlyCost": "177",
                                    "name": "ebs_block_device[0]"
                                }
                            ]
                        } {
                            "costComponents": [
                                {
                                    "hourlyCost": null,
                                    "hourlyQuantity": null,
                                    "monthlyCost": null,
                                    "monthlyQuantity": null,
                                    "name": "Requests",
                                    "price": "0.2",
                                    "unit": "1M requests"
                                } {
                                    "hourlyCost": null,
                                    "hourlyQuantity": null,
                                    "monthlyCost": null,
                                    "monthlyQuantity": null,
                                    "name": "Ephemeral storage",
                                    "price": "0.0000000309",
                                    "unit": "GB-seconds"
                                } {
                                    "hourlyCost": null,
                                    "hourlyQuantity": null,
                                    "monthlyCost": null,
                                    "monthlyQuantity": null,
                                    "name": "Duration (first 6B)",
                                    "price": "0.0000166667",
                                    "unit": "GB-seconds"
                                }
                            ],
                            "hourlyCost": null,
                            "metadata": {},
                            "monthlyCost": null,
                            "name": "aws_lambda_function.hello_world",
                            "resourceType": "aws_lambda_function"
                        }
                    ],
                    "totalHourlyCost": "1.017315068493150679",
                    "totalMonthlyCost": "742.64"
                },
                "diff": {
                    "resources": [
                        {
                            "costComponents": [
                                {
                                    "hourlyCost": "0.768",
                                    "hourlyQuantity": "1",
                                    "monthlyCost": "560.64",
                                    "monthlyQuantity": "730",
                                    "name": "Instance usage (Linux/UNIX, on-demand, m5.4xlarge)",
                                    "price": "0.768",
                                    "unit": "hours"
                                }
                            ],
                            "hourlyCost": "1.017315068493150679",
                            "metadata": {},
                            "monthlyCost": "742.64",
                            "name": "aws_instance.web_app",
                            "resourceType": "aws_instance",
                            "subresources": [
                                {
                                    "costComponents": [
                                        {
                                            "hourlyCost": "0.00684931506849315",
                                            "hourlyQuantity": "0.0684931506849315",
                                            "monthlyCost": "5",
                                            "monthlyQuantity": "50",
                                            "name": "Storage (general purpose SSD, gp2)",
                                            "price": "0.1",
                                            "unit": "GB"
                                        }
                                    ],
                                    "hourlyCost": "0.00684931506849315",
                                    "metadata": {},
                                    "monthlyCost": "5",
                                    "name": "root_block_device"
                                },
                                {
                                    "costComponents": [
                                        {
                                            "hourlyCost": "0.1712328767123287625",
                                            "hourlyQuantity": "1.3698630136986301",
                                            "monthlyCost": "125",
                                            "monthlyQuantity": "1000",
                                            "name": "Storage (provisioned IOPS SSD, io1)",
                                            "price": "0.125",
                                            "unit": "GB"
                                        } {
                                            "hourlyCost": "0.0712328767123287665",
                                            "hourlyQuantity": "1.0958904109589041",
                                            "monthlyCost": "52",
                                            "monthlyQuantity": "800",
                                            "name": "Provisioned IOPS",
                                            "price": "0.065",
                                            "unit": "IOPS"
                                        }
                                    ],
                                    "hourlyCost": "0.242465753424657529",
                                    "metadata": {},
                                    "monthlyCost": "177",
                                    "name": "ebs_block_device[0]"
                                }
                            ]
                        },
                        {
                            "costComponents": [
                                {
                                    "hourlyCost": "0",
                                    "hourlyQuantity": "0",
                                    "monthlyCost": "0",
                                    "monthlyQuantity": "0",
                                    "name": "Requests",
                                    "price": "0.2",
                                    "unit": "1M requests"
                                } {
                                    "hourlyCost": "0",
                                    "hourlyQuantity": "0",
                                    "monthlyCost": "0",
                                    "monthlyQuantity": "0",
                                    "name": "Ephemeral storage",
                                    "price": "0.0000000309",
                                    "unit": "GB-seconds"
                                } {
                                    "hourlyCost": "0",
                                    "hourlyQuantity": "0",
                                    "monthlyCost": "0",
                                    "monthlyQuantity": "0",
                                    "name": "Duration (first 6B)",
                                    "price": "0.0000166667",
                                    "unit": "GB-seconds"
                                }
                            ],
                            "hourlyCost": "0",
                            "metadata": {},
                            "monthlyCost": "0",
                            "name": "aws_lambda_function.hello_world",
                            "resourceType": "aws_lambda_function"
                        }
                    ],
                    "totalHourlyCost": "1.017315068493150679",
                    "totalMonthlyCost": "742.64"
                },
                "metadata": {
                    "path": "/tmp/upload_e6baa7067d24e14dd86727d41d105040",
                    "type": "terraform_plan_json"
                },
                "name": "/tmp/upload_e6baa7067d24e14dd86727d41d105040",
                "pastBreakdown": {
                    "resources": [],
                    "totalHourlyCost": "0",
                    "totalMonthlyCost": "0"
                },
                "summary": {
                    "noPriceResourceCounts": {},
                    "totalDetectedResources": 2.000000,
                    "totalNoPriceResources": 0.000000,
                    "totalSupportedResources": 2.000000,
                    "totalUnsupportedResources": 0.000000,
                    "totalUsageBasedResources": 2.000000,
                    "unsupportedResourceCounts": {}
                }
            }
        ],
        "summary": {
            "noPriceResourceCounts": {},
            "totalDetectedResources": 2.000000,
            "totalNoPriceResources": 0.000000,
            "totalSupportedResources": 2.000000,
            "totalUnsupportedResources": 0.000000,
            "totalUsageBasedResources": 2.000000,
            "unsupportedResourceCounts": {}
        },
        "timeGenerated": "2023-07-17T21:52:48.416306317Z",
        "totalHourlyCost": "1.017315068493150679",
        "totalMonthlyCost": "742.64",
        "version": "0.2"
    },
    "summary": "..."
}
``````

## Function: estimate(input)

This function takes an `input` parameter and returns an object with comparison functions.

### Parameters

- `input`: The input value for comparison.

### Returns

- An object with the following comparison functions:
  - `less_than(i)`: Returns `true` if the `input` is less than the provided value `i`.
  - `less_than_or_equal_to(i)`: Returns `true` if the `input` is less than or equal to the provided value `i`.
  - `greater_than(i)`: Returns `true` if the `input` is greater than the provided value `i`.
  - `greater_than_or_equal_to(i)`: Returns `true` if the `input` is greater than or equal to the provided value `i`.

## Function: as_json(token)

This function takes a `token` parameter and converts the Terraform Plan to JSON format.

### Parameters

- `token`: A string representing the authentication token.

### Returns

- The Terraform Plan converted to JSON format.

#### Example
```json
{
        "currency": "USD",
        "diffTotalHourlyCost": "1.017315068493150679",
        "diffTotalMonthlyCost": "742.64",
        "metadata": {
            "infracostCommand": "breakdown",
            "vcsBranch": "",
            "vcsCommitAuthorEmail": "",
            "vcsCommitAuthorName": "",
            "vcsCommitMessage": "",
            "vcsCommitSha": "",
            "vcsCommitTimestamp": "0001-01-01T00:00:00Z"
        },
        "pastTotalHourlyCost": "0",
        "pastTotalMonthlyCost": "0",
        "projects": [
            {
                "breakdown": {
                    "resources": [
                        {
                            "costComponents": [
                                {
                                    "hourlyCost": "0.768",
                                    "hourlyQuantity": "1",
                                    "monthlyCost": "560.64",
                                    "monthlyQuantity": "730",
                                    "name": "Instance usage (Linux/UNIX, on-demand, m5.4xlarge)",
                                    "price": "0.768",
                                    "unit": "hours"
                                }
                            ],
                            "hourlyCost": "1.017315068493150679",
                            "metadata": {},
                            "monthlyCost": "742.64",
                            "name": "aws_instance.web_app",
                            "resourceType": "aws_instance",
                            "subresources": [
                                {
                                    "costComponents": [
                                        {
                                            "hourlyCost": "0.00684931506849315",
                                            "hourlyQuantity": "0.0684931506849315",
                                            "monthlyCost": "5",
                                            "monthlyQuantity": "50",
                                            "name": "Storage (general purpose SSD, gp2)",
                                            "price": "0.1",
                                            "unit": "GB"
                                        }
                                    ],
                                    "hourlyCost": "0.00684931506849315",
                                    "metadata": {},
                                    "monthlyCost": "5",
                                    "name": "root_block_device"
                                } {
                                    "costComponents": [
                                        {
                                            "hourlyCost": "0.1712328767123287625",
                                            "hourlyQuantity": "1.3698630136986301",
                                            "monthlyCost": "125",
                                            "monthlyQuantity": "1000",
                                            "name": "Storage (provisioned IOPS SSD, io1)",
                                            "price": "0.125",
                                            "unit": "GB"
                                        } {
                                            "hourlyCost": "0.0712328767123287665",
                                            "hourlyQuantity": "1.0958904109589041",
                                            "monthlyCost": "52",
                                            "monthlyQuantity": "800",
                                            "name": "Provisioned IOPS",
                                            "price": "0.065",
                                            "unit": "IOPS"
                                        }
                                    ],
                                    "hourlyCost": "0.242465753424657529",
                                    "metadata": {},
                                    "monthlyCost": "177",
                                    "name": "ebs_block_device[0]"
                                }
                            ]
                        } {
                            "costComponents": [
                                {
                                    "hourlyCost": null,
                                    "hourlyQuantity": null,
                                    "monthlyCost": null,
                                    "monthlyQuantity": null,
                                    "name": "Requests",
                                    "price": "0.2",
                                    "unit": "1M requests"
                                } {
                                    "hourlyCost": null,
                                    "hourlyQuantity": null,
                                    "monthlyCost": null,
                                    "monthlyQuantity": null,
                                    "name": "Ephemeral storage",
                                    "price": "0.0000000309",
                                    "unit": "GB-seconds"
                                } {
                                    "hourlyCost": null,
                                    "hourlyQuantity": null,
                                    "monthlyCost": null,
                                    "monthlyQuantity": null,
                                    "name": "Duration (first 6B)",
                                    "price": "0.0000166667",
                                    "unit": "GB-seconds"
                                }
                            ],
                            "hourlyCost": null,
                            "metadata": {},
                            "monthlyCost": null,
                            "name": "aws_lambda_function.hello_world",
                            "resourceType": "aws_lambda_function"
                        }
                    ],
                    "totalHourlyCost": "1.017315068493150679",
                    "totalMonthlyCost": "742.64"
                },
                "diff": {
                    "resources": [
                        {
                            "costComponents": [
                                {
                                    "hourlyCost": "0.768",
                                    "hourlyQuantity": "1",
                                    "monthlyCost": "560.64",
                                    "monthlyQuantity": "730",
                                    "name": "Instance usage (Linux/UNIX, on-demand, m5.4xlarge)",
                                    "price": "0.768",
                                    "unit": "hours"
                                }
                            ],
                            "hourlyCost": "1.017315068493150679",
                            "metadata": {},
                            "monthlyCost": "742.64",
                            "name": "aws_instance.web_app",
                            "resourceType": "aws_instance",
                            "subresources": [
                                {
                                    "costComponents": [
                                        {
                                            "hourlyCost": "0.00684931506849315",
                                            "hourlyQuantity": "0.0684931506849315",
                                            "monthlyCost": "5",
                                            "monthlyQuantity": "50",
                                            "name": "Storage (general purpose SSD, gp2)",
                                            "price": "0.1",
                                            "unit": "GB"
                                        }
                                    ],
                                    "hourlyCost": "0.00684931506849315",
                                    "metadata": {},
                                    "monthlyCost": "5",
                                    "name": "root_block_device"
                                },
                                {
                                    "costComponents": [
                                        {
                                            "hourlyCost": "0.1712328767123287625",
                                            "hourlyQuantity": "1.3698630136986301",
                                            "monthlyCost": "125",
                                            "monthlyQuantity": "1000",
                                            "name": "Storage (provisioned IOPS SSD, io1)",
                                            "price": "0.125",
                                            "unit": "GB"
                                        } {
                                            "hourlyCost": "0.0712328767123287665",
                                            "hourlyQuantity": "1.0958904109589041",
                                            "monthlyCost": "52",
                                            "monthlyQuantity": "800",
                                            "name": "Provisioned IOPS",
                                            "price": "0.065",
                                            "unit": "IOPS"
                                        }
                                    ],
                                    "hourlyCost": "0.242465753424657529",
                                    "metadata": {},
                                    "monthlyCost": "177",
                                    "name": "ebs_block_device[0]"
                                }
                            ]
                        },
                        {
                            "costComponents": [
                                {
                                    "hourlyCost": "0",
                                    "hourlyQuantity": "0",
                                    "monthlyCost": "0",
                                    "monthlyQuantity": "0",
                                    "name": "Requests",
                                    "price": "0.2",
                                    "unit": "1M requests"
                                } {
                                    "hourlyCost": "0",
                                    "hourlyQuantity": "0",
                                    "monthlyCost": "0",
                                    "monthlyQuantity": "0",
                                    "name": "Ephemeral storage",
                                    "price": "0.0000000309",
                                    "unit": "GB-seconds"
                                } {
                                    "hourlyCost": "0",
                                    "hourlyQuantity": "0",
                                    "monthlyCost": "0",
                                    "monthlyQuantity": "0",
                                    "name": "Duration (first 6B)",
                                    "price": "0.0000166667",
                                    "unit": "GB-seconds"
                                }
                            ],
                            "hourlyCost": "0",
                            "metadata": {},
                            "monthlyCost": "0",
                            "name": "aws_lambda_function.hello_world",
                            "resourceType": "aws_lambda_function"
                        }
                    ],
                    "totalHourlyCost": "1.017315068493150679",
                    "totalMonthlyCost": "742.64"
                },
                "metadata": {
                    "path": "/tmp/upload_e6baa7067d24e14dd86727d41d105040",
                    "type": "terraform_plan_json"
                },
                "name": "/tmp/upload_e6baa7067d24e14dd86727d41d105040",
                "pastBreakdown": {
                    "resources": [],
                    "totalHourlyCost": "0",
                    "totalMonthlyCost": "0"
                },
                "summary": {
                    "noPriceResourceCounts": {},
                    "totalDetectedResources": 2.000000,
                    "totalNoPriceResources": 0.000000,
                    "totalSupportedResources": 2.000000,
                    "totalUnsupportedResources": 0.000000,
                    "totalUsageBasedResources": 2.000000,
                    "unsupportedResourceCounts": {}
                }
            }
        ],
        "summary": {
            "noPriceResourceCounts": {},
            "totalDetectedResources": 2.000000,
            "totalNoPriceResources": 0.000000,
            "totalSupportedResources": 2.000000,
            "totalUnsupportedResources": 0.000000,
            "totalUsageBasedResources": 2.000000,
            "unsupportedResourceCounts": {}
        },
        "timeGenerated": "2023-07-17T21:52:48.416306317Z",
        "totalHourlyCost": "1.017315068493150679",
        "totalMonthlyCost": "742.64",
        "version": "0.2"
    }
``````

## Function: as_table(token)

This function takes a `token` parameter and converts the Terraform Plan to a table format.

### Parameters

- `token`: A string representing the authentication token.

### Returns

- The Terraform Plan converted to a table format.

#### Example
```bash
Project: /tmp/upload_90651c90e9fd46163fb45aefd06bd789

       Name                                                           Monthly Qty  Unit                        Monthly Cost

       aws_instance.web_app
       ├─ Instance usage (Linux/UNIX, on-demand, m5.4xlarge)                  730  hours                            $560.64
       ├─ root_block_device
       │  └─ Storage (general purpose SSD, gp2)                                50  GB                                 $5.00
       └─ ebs_block_device[0]
          ├─ Storage (provisioned IOPS SSD, io1)                            1,000  GB                               $125.00
          └─ Provisioned IOPS                                                 800  IOPS                              $52.00

       aws_lambda_function.hello_world
       ├─ Requests                                            Monthly cost depends on usage: $0.20 per 1M requests
       ├─ Ephemeral storage                                   Monthly cost depends on usage: $0.0000000309 per GB-seconds
       └─ Duration (first 6B)                                 Monthly cost depends on usage: $0.0000166667 per GB-seconds

       OVERALL TOTAL                                                                                                $742.64
      ──────────────────────────────────
      2 cloud resources were detected:
      ∙ 2 were estimated, all of which include usage-based costs, see https://infracost.io/usage-file

      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┓
      ┃ Project                                            ┃ Monthly cost ┃
      ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫
      ┃ /tmp/upload_90651c90e9fd46163fb45aefd06bd789       ┃ $743         ┃
      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┛
``````

## Function: to_float(s)

This function takes a string `s` and converts it to a floating-point number.

### Parameters

- `s`: A string representing a numerical value.

### Returns

- The floating-point representation of the input string `s`.
