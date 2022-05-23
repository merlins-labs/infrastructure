init:
	terraform init

plan:
	terraform fmt && terraform plan -out tf.plan

apply:
	terraform apply tf.plan

refresh:
	terraform apply -refresh-only

output:
	terraform output