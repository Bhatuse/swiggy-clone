output "cluster_id" {
  value = aws_ecs_cluster.swiggy_cluster.id
}

output "cluster_name" {
  value = aws_ecs_cluster.swiggy_cluster.name
}

output "service_name" {
  value = aws_ecs_service.swiggy_service.name
}

output "service_arn" {
  value = aws_ecs_service.swiggy_service.id
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.swiggy_task.arn
}