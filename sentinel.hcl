module "tfplan/v2" {
  source = "./mocks/mock-tfplan-v2.sentinel"
}

module "infracost" {
  source = "./modules/infracost.sentinel"
}

policy "policy" {
  source = "./policy.sentinel"
  enforcement_level = "hard-mandatory"
}

param "foo" {
  value = false
}