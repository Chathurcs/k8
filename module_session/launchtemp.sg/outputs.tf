output "sgid" {
    value = aws_security_group.tfsg.id
}

output "ltid" {
    value = aws_launch_template.cluster_lt.id
}

output "ltv1" {
    value = aws_launch_template.cluster_lt.latest_version
}