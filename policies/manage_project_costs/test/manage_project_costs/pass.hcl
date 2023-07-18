param "x_api_key" {
  value = "my-infracost-key"
}

param "budget" {
  value = 1000.00
}

mock "infracost" {
    module {
        source = "../../testdata/pass.sentinel"
    }
}

test {
  rules = {
    main = true
  }
}