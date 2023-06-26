#프라이빗 보안 그룹 생성
resource "aws_security_group" "prv_sg" {
    vpc_id = aws_vpc.lastvpc.id
    name = "sprint-prv-sg"
    description = "sprint-prv-sg"

    tags = {
        Name = "sprint-prv-sg"
    }
}

#프라이빗 보안 그룹 규칙
resource "aws_security_group_rule" "prv_sg_rds" {
    type = "ingress"
    from_port = 3306
    to_port= 3306
    protocol = "TCP"
    cidr_blocks=["0.0.0.0/0"]
    security_group_id = aws_security_group.prv_sg.id
    lifecycle{
        create_before_destroy = true
    }
}

resource "aws_security_group_rule" "prv_sg_rds2" {
    type = "egress"
    from_port = 0
    to_port= 0
    protocol = "-1"
    cidr_blocks=["0.0.0.0/0"]
    security_group_id = aws_security_group.prv_sg.id
    lifecycle{
        create_before_destroy = true
    }
}

