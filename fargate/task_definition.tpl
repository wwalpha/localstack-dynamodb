[
  {
    "name": "dynamodb-tester",
    "image": "${account_id}.dkr.ecr.${region}.amazonaws.com/dynamodb-tester:latest",
    "cpu": 256,
    "environment": [],
    "essential": true,
    "memoryReservation": 512,
    "mountPoints": [],
    "portMappings": [
      {
        "containerPort": 4569,
        "hostPort": 4569,
        "protocol": "tcp"
      }
    ],
    "volumesFrom": [],
    "command": [],
    "entryPoint": [],
    "links": []
  }
]
