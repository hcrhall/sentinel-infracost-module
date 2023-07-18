test:
	sentinel test -verbose $(shell find . -name "$(name)" -type f ! -path "*/testdata/*" ! -path "*/modules/*" ! -path "*/example/*")

tests:
	sentinel test -verbose $(shell find . -name "*.sentinel" -type f ! -path "*/testdata/*" ! -path "*/modules/*" ! -path "*/example/*")

format:
	sentinel fmt -write=true $(shell find . -name "*.sentinel" -type f)

.PHONY: format tests