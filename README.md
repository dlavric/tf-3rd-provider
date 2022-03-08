# tf-3rd-provider

This repository has been created for learning the automatic installation of third-party providers for Terraform OSS.

## Instructions

### Prerequisites

- [X] [Terraform](https://www.terraform.io/downloads)

## How to Use this Repo

- Clone this repository:
```shell
git clone git@github.com:dlavric/tf-3rd-provider.git
```

- Go to the directory where the repo is stored and make sure the `main.tf` file is there too:
```shell
cd tf-3rd-provider
```

- Run `terraform init`, to download any external dependency
```shell
terraform init
```

This is the output of initializing the Terraform code:
```shell
Initializing the backend...

Initializing provider plugins...
- Finding nats-io/jetstream versions matching "0.0.5"...
- Finding latest version of hashicorp/random...
- Installing nats-io/jetstream v0.0.5...
- Installed nats-io/jetstream v0.0.5 (self-signed, key ID 02E5780DF1BC6F01)
- Installing hashicorp/random v3.1.0...
- Installed hashicorp/random v3.1.0 (self-signed, key ID 34365D9472D7468F)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary
```

- Apply the changes with Terraform
```shell
terraform apply
```

This is the output for applying the changes:
```shell
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # random_pet.server will be created
  + resource "random_pet" "server" {
      + id        = (known after apply)
      + length    = 3
      + separator = "-"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + server = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_pet.server: Creating...
random_pet.server: Creation complete after 0s [id=previously-relaxed-bonefish]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

server = "previously-relaxed-bonefish"
```

- Destroy the instance
```shell
terraform destroy
```

This is how it is supposed to look after destroying the changes:
```shell
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # random_pet.server will be destroyed
  - resource "random_pet" "server" {
      - id        = "previously-relaxed-bonefish" -> null
      - length    = 3 -> null
      - separator = "-" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  - server = "previously-relaxed-bonefish" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

random_pet.server: Destroying... [id=previously-relaxed-bonefish]
random_pet.server: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.
```

## Reference Documentation
- [Automatic installation of third-party providers](https://github.com/hashicorp/terraform/tree/guide-v0.13-beta/provider-sources)

- [Random provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs)

- [Resources for the random_pet provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet)