# 20210325_workshop
## Infrastructure as Code vs Infrastructure as Software

este folder contiene las declaraciones de recursos para crear el ambiente de ejercicio, cada folder contiene una version mas elaborada de la misma infrastructura

## recursos:
- VPC
- 2 Subnets
- 2 network interfaces
- security group
- 2 instancias ec2

## Terraform AWS resources
https://registry.terraform.io/providers/hashicorp/aws/latest/docs


## Versiones

### v1
- declaracion minima
- main.tf contiene todos los recursos en singlefile
- nombes estan harcodeadados
- la version de los providers no esta pineada

### v2
- uso de variables

### v3
- declaracion por modulos

## Infraestructura
![Infraestructura](/terraform/images/diagrama-arquirectura.png)