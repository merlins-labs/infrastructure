init:
	terraform init 

check:
	terraform fmt && terraform validate

docs:
	terraform-docs markdown table --output-file README.md --output-mode inject .

clean:
	rm -rf .terraform .terraform.lock.hcl

all: init check docs clean