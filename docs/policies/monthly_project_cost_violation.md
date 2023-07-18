# Policy Documentation

The `monthly_project_cost_violation` policy utilizes the `infracost` module to authenticate and estimate pricing values for infrastructure projects. The policy ensures that the total monthly cost of the infrastructure project does not exceed a specified budget.

## Import Statement

The policy imports the following module:

- `infracost`: This module provides functions for authentication and estimating pricing values based on the JSON output format of the Terraform Plan.

## Parameters

The policy accepts the following parameters:

- `x_api_key`: This parameter represents the authentication token for accessing the `infracost` module.
- `budget`: This parameter specifies the maximum budget for the infrastructure project, expressed as a numerical value.

## Function: infracost.auth(x_api_key)

This function takes the `x_api_key` parameter and authenticates with the `infracost` module to retrieve pricing estimates for the infrastructure projects.

### Parameters

- `x_api_key`: A string representing the authentication token for accessing the `infracost` module.

### Returns

- An object `estimates` that contains the following properties:
  - `data`: The pricing estimates for the infrastructure projects in JSON format.
  - `summary`: A summary of the pricing estimates.

## Policy Rule: main

This rule ensures that the total monthly cost of each infrastructure project does not exceed the specified budget.

### Conditions

- `print(estimates.summary)`: Prints the summary of the pricing estimates to the console.
- `all estimates.data.projects as _, project`: Iterates over each infrastructure project in the pricing estimates.
  - `infracost.estimate(project.breakdown.totalMonthlyCost).less_than_or_equal_to(budget)`: Checks if the total monthly cost is less than or equal to the specified budget.

### Returns

- The result of the `print(estimates.summary)` statement, which is typically displayed in the console as well as the trace result from the Sentinel runtime

#### Example
```Sentinel
logs:
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
    trace:
      monthly_project_cost_violation.sentinel:9:1 - Rule "main"
        Description:
          The cost of your infrastructure project should not exceed
          $1000.00 a month

        Value:
          true
```

