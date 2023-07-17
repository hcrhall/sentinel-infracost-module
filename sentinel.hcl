import "module" "infracost" {
  source = "./imports/modules/infracost.sentinel"
}

policy "monthly_project_cost_exceeded" {
  source = "./policies/monthly_project_cost_exceeded/monthly_project_cost_exceeded.sentinel"
  enforcement_level = "hard-mandatory"
}
