- reference links
	- https://learn.hashicorp.com/tutorials/terraform/associate-study?in=terraform/certification
	- https://learn.hashicorp.com/tutorials/terraform/associate-review
- certification study notes
	- Learn about [[infrastructure as code]]
		- intro video notes https://www.hashicorp.com/resources/what-is-infrastructure-as-code
		  collapsed:: true
			- highlights the advantages of defining infra as code
			- how do we take the process and capture that in a codified way that can be automated
			- how can we make a script that does the traditional tasks that would have been tickets that had humans spinning up and down servers
			- **having infra as code allows for re usability and automation**
			- infra as code allows for version control and minimizes the knowled lost when people leave
			- transparency of documentation that I lack in a traditional point-and-click environment
		- https://www.hashicorp.com/blog/infrastructure-as-code-in-a-private-or-public-cloud
			- What is IaC? It is infrastructure (CPUs, memory, disk, firewalls, etc.) defined as code within definition files.
			- Virtual compute enabled us to build and apply configuration changes to 
			  infrastructure via software commands.
				- They simplified code testing
				- could apply and track the changes between iterations
				- most importantly they enabled teams to reuse components (e.g. modules) of code across different projects
			- where does iac fit in the infrastructure life cycle
				- can be from incecption day 0
					- iac used to define the infrastructure before it was made
				- or later day 1
					- refers to os and application configurations you apply after having initially built the infrastructure
				- iac makes it easy to understand the intent of infrastructure changes
					- allows humans to organize code based on intent
				- iac makes it easy to provision and apply infrastructure configurations, saving time and standardizing workflows across different providers
				- terraform includes libraries of providers and modules to make it east to write code to provision and apply configurations
			- **IaC makes infrastructure more reliable**
				- makes changes
					- idempotent
					- consistant
					- repeatable
					- predictable
				- eliminates human error from mistyping a command on one host in a cluster
					- could have a complicated roll back or go undetected causing large issues
					- inconsistencies in servers compound over time
				- allows for review of changes before they happen
				- allows for testing changes before applying to production
				- allows for review of infrastructure over time to see how it has changed
			- **IaC makes infrastruct more manageable**
				- terraform provides benefits that enable mutations when necessary via code
					- example you need to spin up more servers behind a load balancer, you can spin up additional servers using iac with minimal changes
				- terraform examines the state of the currently running infrastructre, determines the differences between current and desired state, and inidcates the necessary changes, when approved to proceed only the needed changes are made leaving existing valid infrastructure untouched
			- **IaC makes sense**
				- managing the lifecycle of infra is hard
				- mistakes can cost
					- finantially
					- socailly / reputation
					- in some cases life
				- IaC and proper processes, and workflows help mitigate risks
			-
		- https://www.terraform.io/intro#infrastructure-as-code
		  collapsed:: true
			- what is terraform
				- terraform is an iac tool that lets you define both on prem and cloud resources in a human readable configuration file
				- allows for versioning, sharing, and reuse
				- allows for a consistant workflow to provision and manage all infrastructure throughout the life cycle
				- can manage low level components like compute and storage as well as high level like dns and saas
			- how does terraform work
				- uses providers to interface with target envrionment apis
				- there are over 1700 providers currently on the terraform registry
				- workflow consists of 3 stages
					- write
						- you define resources
						- can be across many providers or services
					- plan
						- terraform creates an execution plan
						- describes the infrastructure it will create, update or destroy based on the existing infrastructure and the configurations provided
					- apply
						- on approval terraform preforms the proposed operations in the correct order , respecting any resource dependencies
			- why terraform
				- tool for provisioning
					- two problems
						- how do we go from running nothing to running something
						- how do we update the infrastructure after it is made
				- solve the problems by using IaC
					- define what your overall topology looks like
					- use a light weight abstraction
					- provides a workflow
						- terraform refresh
							- makes terraform get an up to date view of what infrastructure exists in the real world
						- terraform plan
							- makes a plan of what needs to change from the existing state to the target configuration
						- terraform apply
							- executes the api commands needed to fufill the plan
							- respects dependencies
						- terraform destroy
							- undo all the things
							- makes a special destroy plan
					- terraform has 2 major components
						- core
							- takes in the config and the tf state and figures how they differ, handles all essential life cycle management
						- providers
							- how terraform connects to the world
							- anything that has an api and a life cycle can be made in to a provider for terraform
							- can be cloud provders
								- aws
								- gcp
								- azure
							- services
								- docker
								- openstack
								- splunk
							- saas
								- github
								- fastly
								- datadog
				- how does terraform work in a team
					- like git and github terraform has terraform enterprise
					- you keep your terraform configurations in source control
					- you keep the terraform state management in a central location
					- you ensure that the runs happen sequentially, preventing team members stepping over eachothers changes
					- you enable a central security store for secrets, keeping sensitive information out of  local varables or other plain text areas
				- modules
					- allow for code reuse
					- allow abstraction so that a broader audience can easily follow best practices
					- hosted on the terraform registry
					- you can host a private registry in your organization to only share to your company and not have on the public registry, available using terraform enterprise
					- terrafrom enterprise allows a wisiwyg configuration of private modules to enable devs to launch infra without having to learn terraform
				-
		- https://www.terraform.io/intro/use-cases#multi-cloud-deployment
		  collapsed:: true
			- multicould deployment
				- provisioning across cloud providers increases fault tolerance
				- add complexity because each provider has different workflows, terraform standardizes the workflow
			- self service clusters
				- lets you build a self service model that lets your ops team handle when things go wrong instead of normal spin up spin down
				- lets product teams manage infra independently
				- can use modules to codify company standards and streamlines compliance
				- terraform cloud can integrate with service now to automatically generate now infrastructure requests
			- policy and compliance management
				- with all infrastructure being code in a central location you can easily audit the types of resources teams provision
				- you can use sentinel, an policy as code framework to automatically enforce compliance and governance policies before terraform makes infrastructure changes
			- PaaS
				- can use terraform to codify the setup of heroku applications that arn't automatic on the platform like sent up a cname and set up a cdn
			- Software defined networking
				- terraform can interact with SDNs to configure the network according to the needs of an applicaiton
				- for example a service registers with consul, and consul makes terraform configure the network to allocate and expose ports needed for the application to be reached
			- kubernetes
				- terraform lets you both deploy a k8s cluster and manage its resources
					- pods
					- deployments
					- services
				- can use the k8s operater for terraform to manage infrastructure thru a k8s custom resource defninition CRD
			- parallel environments
				- you can create disposable envs using the same code as prod, no need to maintain and pay for multiple instances when not using them
			- software demos
				- provide a tf file for customers to try out software
	- Manage Infrastructure
	  collapsed:: true
		- https://learn.hashicorp.com/collections/terraform/aws-get-started
		  collapsed:: true
			- terraform can manage infrastructure on multiple cloud platforms
			- the human readable configuration language helps you write code quickly
			- terraforms state allows you to track resource changes throught your deployments
			- you can commit your configurations to vcs to collaborate on infrastructure
			- to deploy you should
				- scope - identify the infrastructure for your project
				- author - write the configurations for your infrastructure
				- initialize - install the plugins terraform needs to manage the infrastructure
				- plan - preview the changes terraform will make to match your configuration
				- apply - make the planned changes
			- demo
			  collapsed:: true
				- terraform config file
					- ```
					  terraform {
					    required_providers {
					      docker = {
					        source  = "kreuzwerker/docker"
					        version = "~> 2.15.0"
					      }
					    }
					  }
					  
					  provider "docker" {}
					  
					  resource "docker_image" "nginx" {
					    name         = "nginx:latest"
					    keep_locally = false
					  }
					  
					  resource "docker_container" "nginx" {
					    image = docker_image.nginx.latest
					    name  = "tutorial"
					    ports {
					      internal = 80
					      external = 8000
					    }
					  }
					  ```
				- commands
					- ```bash
					  terraform init
					  terraform apply
					  docker ps
					  terraform destroy
					  ```
				- lesson
					- you can use terraform to provision docker
					- terraform init is needed to start a new project
					- by applying you can update state
					- you can destroy to have terraform cleanly remove all resources
		- https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started
		  collapsed:: true
			- ran in to docker issue, probably from upgrading system and not having rebooted, modules folder shows newer kernel version, rebooting now
			- followed the examples for
				- aws
				- azure
				- gcp
				- oci
				- docker
			-
		- [Provider documenation](https://www.terraform.io/language/providers/configuration)
		  collapsed:: true
			- providers allow terraform to interact with cloud / saas / other apis
			- provider configurations belong to the root of a terraform module
			- configuration is done in a provder block
			- some providers can use shell envrionment variables this is useful to keep secrets out of source control
			- the alias meta argument is useful for using the same provider with different configurations for different resources
				- ```terraform
				  # The default provider configuration; resources that begin with `aws_` will use
				  # it as the default, and it can be referenced as `aws`.
				  provider "aws" {
				    region = "us-east-1"
				  }
				  
				  # Additional provider configuration for west coast region; resources can
				  # reference this as `aws.west`.
				  provider "aws" {
				    alias  = "west"
				    region = "us-west-2"
				  }
				  
				  resource "aws_instance" "foo" {
				    provider = aws.west
				  
				    # ...
				  }
				  
				  module "aws_vpc" {
				    source = "./aws_vpc"
				    providers = {
				      aws = aws.west
				    }
				  }
				  
				  ```
			-
		- [terraform state](https://www.terraform.io/language/state/purpose)
		  collapsed:: true
			- state is needed for terraform to function
			- mapping to the real world
				- terrafform needs some sort of db to map the config to the real world
				- terraform expects that each remote object is bound to only one resource instance in the configuration
				- terraform ensures a one to one mapping with state, recording the object ids
				- when importing objects from outside of terraform you must ensure it is only imported once
			- metatdata
				- terraform also tracks metadata such as resource dependencies
				- terraform reatains a copy of the most recent set of dependencies within the state for knowing how to delete something
				- terraform stores a pointer to the provider most reacently used swhen multiple aliased provdiders are present
			- performance
				- state stores a chche of the attribuet values for all resources, it is mainly for performance increases
				- when infrastructure becomes large querying every source it too slow. large users of terraform make use of the -refresh=false flage and the -target flag to work around query slowdowns
			- syncing
				- using a remote state backend is recommended when multiple people are working on one terraform project
		- [settings](https://www.terraform.io/language/settings)
		  collapsed:: true
			- in a `terraform {}` block you can set the backend, required versions, if it uses terraform cloud, provider required versions, and experimental language features
		- provisioning infra tutorials
		  collapsed:: true
			- you can use terraform cloud and packer to identify vulnerabilites in your images
			- scanning the images can happen on an schedule
			- leaving off at https://learn.hashicorp.com/tutorials/terraform/packer?in=terraform/provision
		- [provisoners](https://www.terraform.io/language/resources/provisioners/syntax#provisioners-are-a-last-resort)
		  collapsed:: true
			- provisoners are a last resort
				- knowing that there are always ccertain behaviors can not be represented by terraforms declaritive model
				- add complexity and uncertanty to terraform usage, outputs are not able to be modled in the tf plan
				- alternatives to provisioners
					- passing data into virtual machines and other compute resources
						- various provisoners can interact with machines via ssh, but using solutions like packer or cloud init to get the data on the machine is better
					- running configuration managment software
						- packer can run common steps before uploading an image
				- Provisioners should only be used as a last resort. For most
				  common situations there are better alternatives.
				- local-exec requiires a connection block so terrafrom knows how to get to the host
				- can use the self obejct to refer to the parent block, like oop
				- can specify stuff to run on destroy `when = destroy`
				- destroy time provisioners will not run if they are deleted as part of the destroy, must update the count of reource to 0
		- manage resources in terraform state tutorials
		  collapsed:: true
			- https://learn.hashicorp.com/tutorials/terraform/state-cli
		- crud operations with providers was a fun lab
	- Master the workflow
	  collapsed:: true
		- core workflow
		  collapsed:: true
			- three steps of the core workflow
				- write
					- writing code in your editor
				- plan
					- terraform apply shows the plan before making the changes
				- apply
					- common to push code to the repo at this stage
			- these steps become more interesting when working in a team
				- people will use branches to not interfear with others changes
				- its common for teams to move to a central cicd system to reduce the number of sensitive input variables team members need to have access to
				- posting a tf plan with the pr request is a good idea but if other changes are merged first the plan becomes invalid
				- speculative plans can highlight if a change would cause a service disruption and schedule appropriately
				- once a change request is approved it is important to make sure it is run against the latest shared state and the plan reviewed
			- how terraform cloud makes this easier
				- provides central secure location for storing input vars
				- makes the feedback loop faster
				- the plan output is always run against the latest state
				- terraform cloud includes plan output allowing for easy team review
				- terraform cloud shows the change progress live for all team members
		- initialize a working directory
		  collapsed:: true
			- gerneral option
				- `-input=true` will ask for input, if false will error if input is needed
				- `-lock=false` disable locking of state flies
				- `-lock-timeout` overide the time terrafor will wait to acquire state lock, defaults to 0 seconds
				- `-no-color` disables color codes in output
				- `-upgrade` opt to upgrade modules and plugins
			- copy a source module
				- terraform init assumes that the working dir has a config, you can provide `-form-module=` to sepecify a module to copy in to the source directory
					- it can be a short hand to chedk out a confiugration from src control
					- it can reference an example configuration copied to a local directory to be used as the basis for a new configuraiton
			- backend initialization
				- re-running init with an already provisoned backed will update the working dir to use the new backend settings. `-reconfigure` or `-migrate-state` must be supplied to update the backend config
				- `-migrate-state` will copy existing state to a new backend
					- `-force-copy` skips confirmation
				- `-reconfigure` disreguards existing configuration, preventing the migration of state
				- `-backend-config=` can be used for partial configuriation for dyncamic options or items too sensitive to be kept in version control
			- child module installation
			- plugin installation
				- providers are published seperatly as plugins
				- you can customize where terraform pulls these from but it will default to the public terraform registry
				- after install terrafor writes information to a lock file
				- this lock should be kept in version control to ensure that everyone uses the same provider versions
				- `-upgrade` will upgrade all previously-selected plugings to the newest versions
				- `-get-plugins=false` will skip installation
			- running in automation
				- important to make plugins available locally to avoid reinstall
				- env var managment
			- passing a different config dir
				- would use the provided directory as the root dir of a module
				- deprecated as of terraform 0.14
				-
				-
		- validate
		  collapsed:: true
			- syntactically validates config files in the working directory and ensures internal consistency reguardless of providers or existing state
			- useful for the verification of
				- reusable modules
				- attribute names
				- value types
			- requires an initialized working dir
			- can output json format for integration with editors and tooling
			- output contains
				- valid
				- error_count
				- warning_count
				- diagnostics
					- nested objects
					- includes details of errors and warnings
					- what lines the warning is about
					- snippet of code that is error / warning prone
					-
				-
		- plan
		  collapsed:: true
			- creates an execution plan
				- reads remote state to ensure it is up to date
				- compairs current configuration to prior state
				- proposes change actions that if applied make remote state match current configuration
			- running terraform apply also plans, primarily for single user interactive
			- terraform plan with the `-out=file` option allows for a set plan to be reviewed, useful for centralized running with multiple people like in cicd
			- planning modes
				- destroy mode
					- destroys all remote objects that currently exist
					- useful for transiant environments
				- refresh only mode
					- update the state and any root module output to match values made to remote objects outside of terraform, useful for when something has changed outside normal workflow
				- normal mode
					- the normal terraform behavior
				- planning modes are mutually exclusive
			- planning options
				- can turn off refreshing state, reducing the number of api calls made but can cause terraform to ignore external changes which could cause an incomplete or incorrect plan
				- `replace=ADDRESS` replaces resources at a given address, helpful when one or more remote objects have become degraded, this can be specified multiple times to replace many objects
				- `target=address` focus planning on only the target and any of its dependancies only for use in exceptional cases
				- `var Name=Value` used for specifying vars in command line
				- `var-file=filename` used to specify multiple vars
			- input vars on the command line
				- use unix style vars, terraform will error if there is space after equals `name=value`
				- powershell doesn't correctly pass literal quotes, dont use it to run terraform if you use the command line vars
				- ```
				  # Unix-style shell
				  terraform plan -var 'name=["a", "b", "c"]'
				  
				  # Windows Command Prompt (do not use PowerShell on Windows)
				  terraform plan -var "name=[\"a\", \"b\", \"c\"]"
				  ```
			- resource targeting
				- for single resources with a `count` or `for_each` the index of the resource must be part of the address
				- if an address identifies a resource as a whole terraform will select all of the instances
				- if the address specifies a module it will select all instances of the resources belonging to the module and all child modules
			- other options
				- various warning flags for compact or detailed
				- blocking out input
				- not needing state lock
				- outputing plans to files
				- changing concurrent operations for walking the state graph, defaults to 10, `-parallelism=n`
				-
				-
		- apply
		  collapsed:: true
			- `terraform apply [options] [plan file]`
			- running without passing in a plan file will run plan then apply for you
			- `-auto-approve` will not prompt you to approve changes, this is dangerous if done individually but useful for a ci/cd system passing in an approved plan file that has been peer reviewed
			- can have a machine readable json output
			-
		- destroy
			- alias for `terraform apply -destroy`
	- subcommands
	  collapsed:: true
		- fmt
		  collapsed:: true
			- rewrites your tf files to the cononical format and style
			- no style options so all code bases will look the same
			- default rewrites, can only check or diff if wanted
			- `-recursive` to format all subdirs
		- taint
		  collapsed:: true
			- deprecated, for later we recommend using the `-replace` option with `terraform apply`
			- marks a resource as tainted so the apply will replace it
		- state
		  collapsed:: true
			- used for state management
			- works with remote state
			- can backup state with `-backup`
			- for advanced filtering and modification pipe the state to other command line tools
		- workspaces
		  collapsed:: true
			- using workspaces
			  collapsed:: true
				- persistant data stored in the backend belong to a workspace
				- certain backends support multiple named workspaces allowing muliple states to be associated with a single configuration
				- backends that support this include
					- azure rm
					- consul
					- cos
					- gcs
					- k8s
					- local
					- oss
					- postres
					- remote
					- s3
				- terraform starts with a default workspace
				- `terraform workspace` command manages these
					- the `new` subcommand makes a new workspace
					- the `select` subcommand lets you change your workspace
			- you can get the name of the current workspace in your config using `"${terraform.workspace == "default" ? 5 : 1}"` syntax to do a conditional based on the workspace name
			- when to use multiple workspaces
			  collapsed:: true
				- named workspaces allow switching between multiple instances of a single configuration
				- creating a new workspace may be useful to experiment with new features while isolating changes from the default group
				- workspaces can be related to feature branches
				- namespaces are not suitable for strong seperation between multiple deployments of the same infra, eg stage vs prod
				- where multiple configurations are representing distinct components rather than deployments data can be passed from one component to another using paired resourcce tyoups and data sources like
					- consol
						- key prefix
						- keys
					- user defined labels and tags
						- aws_vpc resource and data type
					- dns provider
			- workspace internals
				- technically equivalent to renaming your state file
				- stores in a directory for local `terraform.tfstate.d`
				- for remote state in consol you append the workspace name to the state path
				- workspaces are meant to be a shared resource
			-
		- import
		  collapsed:: true
			- imports existing resources in to terraform
			- find the recource from id and import it to tf state at the given address
			- each remote object must only be bound once to only one resource address
			- ```
			  terraform import aws_instance.foo i-abcd1234
			  ```
			- Terraform import can only know the current state of infrastructure as
			  reported by the Terraform provider. It does not know:
				- whether the infrastructure is working correctly
				- the intent of the infrastructure
				- changes you've made to the infrastructure that aren't controlled by
				  Terraform — for example, the state of a Docker container's filesystem.
			- Importing involves manual steps which can be error prone, especially if the
			  person importing resources lacks the context of how and why those resources were
			  created in the first place.
			- Importing manipulates the Terraform state file, you may want
			  to create a backup before importing new infrastructure.
			- Terraform import doesn't detect or generate relationships between
			  infrastructure.
			- Terraform doesn't detect default attributes that don't need to be set in your
			  configuration.
			- Not all providers and resources support Terraform import.
			- Just because infrastructure has been imported into Terraform does not mean that
			  it can be destroyed and recreated by Terraform. For example, the imported
			  infrastructure could rely on other unmanaged infrastructure or configuration.
			- import always runs locally, so you may need to make local vars as placeholders for remote backend data
		-
		-
	- Modules
		- recommended patterns
			- scope requirements into modules
			  collapsed:: true
				- encapsulation
					- group infra that is always deployed togeather
					- putting multiple things an a module can make it easier for users but harder for code reuse and add unneeded dependancies
				- privileges
					- restrict modules to privilege boundaries
					- if a module is responsible for multiple things it running it could have unintended side effects
				- volatility
					- separate longlived from short lived infra
					- dont want to have to redeploy the db every time a front end is rebuilt
			- create the mvp
			  collapsed:: true
				- aim to satisfy 80% of use cases
				- never code for edge cases
				- avoid conditional expressions
				- only expose the most commonly modified arguments
			- maximize ouptus
			  collapsed:: true
				- output as much as possible, as users will find uses for it as input to other modules
		- module creation tips
			- nesting
			  collapsed:: true
				- can speed development but lead to unclear outcomes and behavior. clearly document inputs, behaviour, and outputs
				- do not nest primary modules more than 2 deep
				- nested modules should contain the variables needed to make an output
				- consistant naming convetions for input and output vars are highly recommended
				- nesting modules can lead to redundancy when vars need to be specified in parent modules
			- naming
			  collapsed:: true
				- module naming
					- `terraform` - `cloud provider` - `function`
					- terraform-azure-compute
				- vars
					- needs consistant naming understandable to humans
			- documentation
			  collapsed:: true
				- required inputs
				- optional inputs
				- outputs
			- define a consistent structure
			  collapsed:: true
				- list of `tf` flies that need to be in it
				- use standard dirs even if including empty ones
				- always have a `README`
				- include example vars `terraform.tfvars.example`
			- development
			  collapsed:: true
				- create a roadmap for each module
				- gather reqs and prioritize on popularity of issue/
					- dont bother with edge cases
				- document every decision
				- adopt open source principbles
					- make a community
					- clear and defined contribution guide
					- allow trusted members to own parts
		- finding and using modules
			- The syntax for
			  specifying a registry module is  `<NAMESPACE>/<NAME>/<PROVIDER>`
			- You can also use modules from a private registry, like the one provided by
			  Terraform Cloud. Private registry modules have source strings of the form
			   `<HOSTNAME>/<NAMESPACE>/<NAME>/<PROVIDER>`
			- modules can be versioned for repeatable builds
		- input variables
			- The name of a variable can be any valid [identifier](https://www.terraform.io/language/syntax/configuration#identifiers)
			  *except* the following:  `source` ,  `version` ,  `providers` ,  `count` ,  `for_each` ,  `lifecycle` ,  `depends_on` ,  `locals` .
			- arguments for variables
				- `default` the default value
				- `type` what value types are acceptable
					- type constraints `string` `number` `bool` `any`
					- type constructors `list()` `set()` `map()` `object({attr = type})` `tuple([])`
						- **List:** A sequence of values of the same type.
						- **Map:** A lookup table, matching keys to values, all of the same type.
						- **Set:** An unordered collection of unique values, all of the same type.
					- If both the  `type`  and  `default`  arguments are specified, the given default value must be convertible to the specified type.
				- `description` the description of the variable
				- `validation` defines the validation rules in addition to type constraints
					- ```
					  validation {
					      condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
					      error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
					    }
					  ```
				- `sensitive` limits the ui output when the var is used
					- Setting a variable as  `sensitive`  prevents Terraform from showing its value in
					  the  `plan`  or  `apply`  output, when you use that variable elsewhere in your
					  configuration.
					- If you use a sensitive value as part of an
					  [output value](https://www.terraform.io/language/values/outputs) then Terraform will require
					  you to also mark the output value itself as sensitive, to confirm that you
					  intended to export it.
				- `nullable` specified if null van be used
		- output values
			- The  `value`  argument takes an [expression](https://www.terraform.io/language/expressions)
			  whose result is to be returned to the user
			- In a parent module, outputs of child modules are available in expressions as
			   `module.<MODULE NAME>.<OUTPUT NAME>`
			- ```
			  output "api_base_url" {
			    value = "https://${aws_instance.example.private_dns}:8433/"
			  
			    # The EC2 instance must have an encrypted root volume.
			    precondition {
			      condition     = data.aws_ebs_volume.example.encrypted
			      error_message = "The server's root volume is not encrypted."
			    }
			  }
			  	
			  ```
			- can use a custom condition check
			- outputs can be sensitive
			- can specify a `depends_on` to make an explicit dependency
			-
		- calling a child module
			-
			-
	- terraform configuration and inner workings
		- resource blocks
		  collapsed:: true
			- the most important element in terraform
			- describes one or more infrastructure objects
			- each resource is associated with a single type which determines the infrastructure object it manages
			- each resource type is implemented by a provider
				- providers manage a single on prem or cloud infra platform
				- each provider has its own documentation
			- meta-arguments
				- `depends-on` for specifying hidden dependencies
				- `count` for creating multiple resource instances by a number
				- `for_each` to create multiple resource instances by a map or string
				- `provider`  for selecting a non default provider
				- `lifecycle` for lifecycle customizations
				- `provisioner` for taking extra actions after creation
			- custom checks
				- precondition and post condition blocks to specify assumptions and guarantees about how resources operate
				- helps future maintainers understand intent
				- helps users get information about errors
			- timeouts
				- some resources provide special timeouts allowing cusomization of how long certain operations are allowed to take before being failed
				- example timeouts
					- `60m`
					- `2h`
					- `30s`
				-
				-
			-
		- [data sources](https://developer.hashicorp.com/terraform/language/data-sources)
		  collapsed:: true
			- providers may offer data sources
			- data source arguments
				- each resource is associated with a single source
				- can make use of expressions and other dynamic features
			- data resource behavior
				- reading the data resources normally happens during the plan phase, but can be differed in the following situations
					- at least one argument is a managed resource attribute or other value that can not be predicted until apply
					- the data resource depends directly on a managed resource that has planned changes
					- the data resource has custom conditions and depends on a resource that will be changed
			- local only data sources
				- template rendering
				- reading local files
				- rendering AWS IAM policies
				- data unly exists temp during an operation, recalculated each time
			- data resource dependencies
				- setting the `depends_on` meta arg in the block defers reading of the data source until all changes to the dependencies have been applied
				- arguments directly referencing managed resource are treated the same as if the resource was listed in a `depends_on`
					- this can be circumvented by referencing the manged resource values in a local value
			- custom condition checks
				- `precondition` and `postcondition`
				- like in modules this helps future maintainers understand intent, and users get better error messages
			- multiple resource instances
				- support for `count` and `for_each`
			- no `lifecycle` meta arg support
		- resource addressing
		  collapsed:: true
			- address is in `[module path][resource spec]` form
			- module paths
				- a module path can be `module.module_name[module_index]`
				- modules can be nested `module.foo.module.bar` `module.foo[0].module.bar["b"]`
			- resource spec
				- common form `resource_type.resource_name[instance_index]`
				- index values can be numbers from a count or strings from the for_each meta args
		- references to values
		  collapsed:: true
			- Resources
			- Input variables
				- if you define a variable as being of an object type
				  with particular attributes then only *those specific attributes* will be
				  available in expressions elsewhere in the module, even if the caller actually
				  passed in a value with additional attributes. You must define in the type
				  constraint all of the attributes you intend to use elsewhere in your module.
			- Local values
				- Local values can refer to other local values, even within the same  `locals` 
				  block, as long as you don't introduce circular dependencies.
			- Child module outputs
			- Data sources
			- Filesystem and workspace info
				- Use the values in this section carefully, because they include information
				  about the context in which a configuration is being applied and so may
				  inadvertently hurt the portability or composability of a module.
			- Block-local values
				- [ `count.index` ](https://developer.hashicorp.com/terraform/language/expressions/references#count-index), in resources that use [the  `count`  meta-argument](https://developer.hashicorp.com/terraform/language/meta-arguments/count).
				- [](https://developer.hashicorp.com/terraform/language/expressions/references#)[ `each.key` ](https://developer.hashicorp.com/terraform/language/expressions/references#each-key) /  `each.value` , in resources that use [the  `for_each`  meta-argument](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each).
				- [](https://developer.hashicorp.com/terraform/language/expressions/references#)[ `self` ](https://developer.hashicorp.com/terraform/language/expressions/references#self), in [provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax) and [connection](https://developer.hashicorp.com/terraform/language/resources/provisioners/connection) blocks.
			- The arguments of the  `ebs_block_device`  nested blocks can be accessed using
			  a [splat expression](https://developer.hashicorp.com/terraform/language/expressions/splat). For example, to obtain a list of all of the  `device_name`  values, use `aws_instance.example.ebs_block_device[*].device_name`
			-
		- the dependency graph
		  collapsed:: true
			- node types
				- resource nodes
					- a single resource
				- provider config nodes
					- the time to fully configure and authenticate to a provider
				- resource meta nodes
					- represents a group of resources but does not have anyt action on its own
			- building the graph
				- done in a series of squential steps
				- 1. resource nodes are added from config, if state exists meta data is attached to each node
				  2. resources are mapped to provisioners, this must be done after all resource nodes are created so they share common provisioners
				  3. explicit dependencies from depeneds_on are used to create edges
				  4. if state is present any orphan resources are added to the graph
				  5. resources are mapped to providers, provider config nodes are created for these providers and edges are created such that a resource depends on ther respective provider being configured
				  6. interpolations are parsed in configurations to determind dependencies, referencs to resource attributes are turned in to dependencies
				  7. create the root node, root node points to all resources, while traversing the root node is ignored
				  8. if a diff is present, traverse all resource nodes and find resources that are being destoryed. these resource nodes are split in two, one node that destroys the resource and another that creates the resource if it is being recreated. it is split because the destroy order is often different than the create order 
				  9. validate the graph has no cycles and a single root
			- walking the graph
				- depth first traversal, done in parallel, a node is awlked as sooon as all of its dependencies are walked
				- parallelism is limited by a semaphore to prevent too many concurrent operations from overwhelming the resources of the machine running terraform.
				-
		- complex types
		  collapsed:: true
			- collection types
				- allow multiple values of one other type
				- type in a collection is called the element type, all elements must be of this type
				- `list(string)` all must be string `list(number)` all must be number
				- list - sequential values starting at 0
				- map - multiple elements of same type with string indexes
				- set - collection of values with no order or identification
			- structural types
				- allow multiple values of distinct types
				- object
					- collection of named attributes that each have their own type
				- tuple
					- sequence of elements identified by consecutive whole numbers starting with 0 each having their own type
			- conversion of complex types
				- when piossible terraform converts values between similar kinds of comple types if the provided value is not the exace type
				- objects and maps are simmilar
				- tuples and lists are simmilar if the list has the right number of elements
				-
			-
		- functions
		  collapsed:: true
			- only builtins no user defined functions
		- dynamic blocks
		  collapsed:: true
			- ```hcl
			  resource "aws_elastic_beanstalk_environment" "tfenvtest" {
			    name                = "tf-test-name"
			    application         = "${aws_elastic_beanstalk_application.tftest.name}"
			    solution_stack_name = "64bit Amazon Linux 2018.03 v2.11.4 running Go 1.12.6"
			  
			    dynamic "setting" {
			      for_each = var.settings
			      content {
			        namespace = setting.value["namespace"]
			        name = setting.value["name"]
			        value = setting.value["value"]
			      }
			    }
			  }
			  ```
			- dynamic blocks act like a for expression
			- produces nexted blocks
			- When using nested  `dynamic`  blocks it's particularly important to pay attention
			  to the iterator symbol for each block. In the above example,
			   `origin_group.value`  refers to the current element of the outer block, while
			   `origin.value`  refers to the current element of the inner block.
			- Overuse of  `dynamic`  blocks can make configuration hard to read and maintain, so
			  we recommend using them only when you need to hide details in order to build a
			  clean user interface for a re-usable module.
	- terraform state
	  collapsed:: true
		- state management
		  collapsed:: true
			- state locking
				- if supported by the backend terraform will lock state for all operations that could write to the state, preventing other owners from corrupting state with multiple writes
				- happens automatically
				- can disable with `-lock` flag but is a bad idea
				- locking can time out and fail the command
				- force unlock command can be used to recover if something went wrong and a lock was never cleaned, requries the lock id, only output if locking fails, acts as a nonce
			- sensitive data in state
				- can contain resource ids
				- initial password for dbs can be in state
				- if any sensitive data is managed in tf treat the state itself as sensitive
				- terraform cloud always encrypts state at rest, protects in transit with tls
				- s3 backends support encryption at rest, requests go over tls, iam policies and logging can identify any invalid access
			- refreshing state
				- terraform `refresh` deprecated as its default behavior is unsafe if you have misconfigured credientails for any providers
				- doesn't modify remote objects, just terraform state
				- automatically preforemed when plan and apply are ran
				- doesn't let you preview the effects
		- backend management
			- backends determine where state is stored
			- local stores state as json on disk
			- when using a non local backend state is only persisted to disk in a non recoverable error
			- manual state push pull
			  collapsed:: true
				- `terraform state push` and `terraform state pull`
				- dangerous commands and should be avoided if possible
				- when pushing terraform will attempt to protect you from some dangerous situations
					- differing lineage, a nuqiue id assigned when state is created
					- higher serial, every state has an increasing serial number if the destination state has a higher serial terraform will not allow a push since changes have occured since attempting to write
				-
			- backend config
				- the backend block
					- if a config includes a cloud block it cant include a backend block
				- when changing the backend config you need to run terraform init
				- terraform lets you migrate state if you change your backend config
				- partial configuration
					- because backend configs often store secrets needed to connect to the backend you can specify these values in a file not tracked by source control in a `.tfbackend` file
					-
		- the local backend
			- stores state on the local fs, supports locking
			- can be referenced as remote state data source
				- ```
				  data "terraform_remote_state" "foo" {
				    backend = "local"
				  
				    config = {
				      path = "${path.module}/../../terraform.tfstate"
				    }
				  }
				  ```
			- vars
				- path - path to tfstate file
				- workspace_dir - path to non-default workspaces
			- command line args
				- -state for reading prior snapshots
				- -state-out for writing new snapshots
				- -backup for specifying a state backup filename
				-
	- debugging
	  collapsed:: true
		- see logs by setting the `TF_LOG` env var to any value, will log to stderr
			- `trace`
			- `debug`
			- `info`
			- `warn`
			- `error`
			- `json`
				- outptus trace level and uses a parsable json as the output
		- logging can be enabeled by provider plugins
		- to persist logs set `TF_LOG_PATH`
	- terraform cloud
		- manges terraform in a consistent and reliable environement
		- easy access to shared state and secret data
		- access controls for appoving infra changes
		- detailed policy controls for governing configs
		- workspaces
			- manges infra collections with workspaces
			- contains everything terraform needs to manage a given collection of infrastructure
			- like working directorys for local terraform
			- workspaces are required in terraform cloud
			- permissons for users can be granted per workspace
			- it is recommended to break up large terraform configs in to smaller ones then assign each one its own workspace and delegate permissions and responsibilities for them
			-
		- ui and vcs diven workflow
			- associated with a specific branch
			- webhooks will queue a terraform run on new commits are merged
			- speculative plans are run when a pr is opened, terraform cloud posts the output of this in the pr comments, this is rerun when the pr is updated
			- autostarting runs
				- a workspace is associated with one branch and ignores others
				- you can specify what file changes will trigger a run
				- git tags can also trigger runs
			- manual runs
				- there is an action menu, hit the start new plan button
				- manually starting a run requires permissions to queue plans for the workspace
				- if another plan is still running you can wait for it to complete or choose to terminate the current running plan and run the new one
			- confirming and discarding plans
				- plans require approval before applying
				- can choose to approve or discard plans
			- auto apply can be enabled for some plans as long as they support it and dont have errors
			- speculate plans on pr
				- dont appear in ta workspace list of runs, link are in the pr itself
				- single pr can have multiple runs
				- only members of the workspace can click thru and see the run
				- only prs that originate in the same repo trigger runs
				- only triggers runs if the setting is enabled
				- only trigger runs in the workspaces connected to the destination branch
				- if a workspace only checks specific dirs, plans are only made if those dirs are changed
				- use the contents of the head branche and compare against workspaces current state at time of plan, if dest branch changes significantly after head branch is made plan may be come stale. to fix this rebase the head branch on the more recent dest branch
			- you can use a speculative plan to test upgradeing terraform versions
			-
		- sentinel
			- embedded policy as code framework intergrated with hashicorp enterprise products
			- enables fine grained logic based policy decisions and can be extended
			- policies are written using the sentinel language
				- guardrails that prevent terraform runs from performing dangerous actions
				- policy sets are groups oc policies that can be enforced on a workspace
					- can be enforced on one or many workspaces
			- enforcement levels
				- hard-mandatory requreis the  policy passes
				- soft-mandatory allows any user with the manage policy overrides permission to override the policy failures on a case by case basis
				- advisory will never interrupt the run and will only surface policy failures as information
			- constructing a policy set
				- defines each policy
				- defines the enforcement level of each policy
				- any moducles which need to be available for the policy set
				- ```
				  policy "terraform-maintenance-windows" {
				    source            = "./terraform-maintenance-windows.sentinel"
				    enforcement_level = "hard-mandatory"
				  }
				  ```
				- each sentinel policy is a single file
			- managing policy sets
				- in your organization settings page you can manage the policy sets
				- you can manage the scope, if it applys to one or all workspaces
				- manage paramiters for the policy
				-