# Módulo `alb`

Provisiona um Application Load Balancer (ALB) público e associa uma instância EC2 ao target group.

## Recursos criados

- Application Load Balancer
- Target Group
- Listener HTTP
- Target Group Attachment

## Variáveis

| Nome               | Tipo           | Descrição                              |
|--------------------|----------------|----------------------------------------|
| `project`          | string         | Nome do projeto                        |
| `vpc_id`           | string         | ID da VPC                              |
| `public_subnets`   | list(string)   | Subnets públicas                       |
| `alb_security_group` | string       | ID do Security Group para o ALB        |
| `instance_id`      | string         | ID da EC2 a ser registrada no Target   |

## Outputs

| Nome         | Descrição                        |
|--------------|----------------------------------|
| `alb_dns_name` | DNS público do Load Balancer  |
