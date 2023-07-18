import "module" "infracost" {
  source = "./imports/modules/infracost.sentinel"
}

policy "monthly_project_cost_violation" {
  source = "./policies/monthly_project_cost_violation/monthly_project_cost_violation.sentinel"
  enforcement_level = "hard-mandatory"
}
