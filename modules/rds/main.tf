resource "aws_db_instance" "this" {
  identifier              = var.rds_identifier
  engine                  = "mysql"
  engine_version          = var.engine_version
  instance_class          = var.db_instance_class
  allocated_storage       = var.allocated_storage
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  publicly_accessible     = true
  skip_final_snapshot     = true

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name    = aws_db_subnet_group.this.name

  tags = {
    Name = var.rds_identifier
  }
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.rds_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.rds_identifier}-subnet-group"
  }
}
