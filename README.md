
<h1 align="center">terraform-aws-ecs-base.</h1>

## Tecnologias

* Terraform e Waypoint

## 🚨 Pré-requisitos

* Terraform Instalado
* Waypoint Instalado
* Access Key ID
* Secret Access Key

## 🔧 Instruções de Instalação
1. Configure AWS

```
aws configure
```
2.  Clonar este repositório:
```
git clone https://github.com/guilhermerodriguesti/terraform-aws-ecs-base.git
cd terraform-aws-ecs-base
sh deploy.sh
```

## Output
```
Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:


----------------------------------------
Done!
----------------------------------------
```

## 🔧 Instruções para Waypoint

* Configure as Subnet IDs

* Rodar os comandos:
```
waypoint init && waypoint up
```

## 🔧 Instruções Git
```
git init && git remote add origin https://github.com/guilhermerodriguesti/terraform-aws-ecs-base.git
git add --all && git commit -am "feat: add git" && git push
git push --set-upstream origin master 
```
## 🤝 Contribuições

Contribuições, problemas e solicitações são bem-vindos.<br />

## Author

👤 **Guilherme Rodrigues**

## 📝 Licença
