mock "tfplan/v2" {
    module {
        source = "../../testdata/pass.sentinel"
    }
}

import "module" "infracost" {
  source = "../../../../imports/modules/infracost.sentinel"
}

test {
  rules = {
    main = true
  }
}