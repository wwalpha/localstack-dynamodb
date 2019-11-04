[
  {
    "command": [],
    "cpu": ${cpu},
    "entryPoint": [],
    "environment": [],
    "memoryReservation": ${memory},
    "essential": true,
    "image": "${image}",
    "name": "${name}",
    "portMappings": [
      {
        "hostPort": 80,
        "protocol": "tcp",
        "containerPort": 80
      }
    ],
    "logConfiguration": {
      "logDriver": "${log_driver}",
      "options": {
        "awslogs-group": "${log_group}",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "ecs"
      }
    },
    "tags": {}
  }
]