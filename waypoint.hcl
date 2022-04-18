project = "gco-lp"

app "gco-lp" {
  labels = {
    "service" = "webapp-front-dev",
    "env"     = "dev"
  }

  build {
    use "docker" {
      context = "."
    }
    registry {
      use "aws-ecr" {
        region     = "us-east-1"
        repository = "webapp-front-base"
        tag        = "build-v1.0.0"
      }
    }
  }

  deploy {
    use "aws-ecs" {
      region = "us-east-1"
      cluster = "webapp-cluster-dev"
      subnets = [
        "subnet-0ce6f219f42425a81",
        "subnet-0506f3a3491163ca1",
        "subnet-06a14a019fff3bb4e",
      ]
      memory = "512"
    }
  }
}