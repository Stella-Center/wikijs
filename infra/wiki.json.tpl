[
  {
    "name": "wiki",
    "image": "ghcr.io/requarks/wiki",
    "cpu": 0,
    "memory": 256,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 0
      }
    ],
    "environment": [
        {
            "name": "DB_TYPE",
            "value": "${db_type}"
        },
        {
            "name": "DB_HOST",
            "value": "${wiki_db_host}"
        },
        {
            "name": "DB_PORT",
            "value": "5432"
        },
        {
            "name": "DB_USER",
            "value": "${wiki_db_user}"
        },
        {
            "name": "DB_PASS",
            "value": "${wiki_db_password}"
        },
        {
            "name": "DB_NAME",
            "value": "${wiki_db_name}"
        },
        {
            "name": "DB_SSL",
            "value": "true"
        },
        {
            "name": "DB_SSL_CA",
            "value": "${wiki_db_ssl_ca}"
        },
        {
            "name": "PGSSLMODE",
            "value": "no-verify"
        }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${awslogs_group}",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "ecs",
        "awslogs-create-group": "true"
      }
    }
  }
]