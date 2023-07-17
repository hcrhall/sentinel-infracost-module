mock "tfplan/v2" {
    module {
        source = "../../testdata/fail.sentinel"
    }
}

import "module" "infracost" {
  source = "../../../../imports/modules/infracost.sentinel"
}

test {
  rules = {
    main = false
  }
}