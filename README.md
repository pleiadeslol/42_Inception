# Inception

A Docker infrastructure project that sets up a web application stack using NGINX, WordPress, MariaDB, and Redis cache.

## Overview

This project creates a containerized web infrastructure where each service runs in its own Docker container. All services communicate through a custom Docker network and use persistent volumes for data storage.

## Services

- **NGINX**: Web server with SSL/TLS encryption (port 443 only)
- **WordPress**: CMS with PHP-FPM 
- **MariaDB**: Database server
- **Redis**: Cache server for WordPress optimization (bonus)

## Project Structure

```
inception/
├── Makefile
├── secrets/                 # Password files (git-ignored)
└── srcs/
    ├── docker-compose.yml
    ├── .env
    └── requirements/
        ├── nginx/
        ├── wordpress/  
        ├── mariadb/
        └── bonus/redis/
```

## Setup

1. Configure your domain to point to localhost:
   ```bash
   echo "127.0.0.1 <your_login>.42.fr" >> /etc/hosts
   ```

2. Set up environment variables in `srcs/.env`

3. Create password files in `secrets/` directory

4. Build and start:
   ```bash
   make
   ```

## Key Features

- **Security**: TLS-only access, Docker secrets for passwords
- **Persistence**: Volumes for database and WordPress files  
- **Performance**: Redis cache reduces database load
- **Isolation**: Each service in dedicated container
- **Auto-restart**: Containers restart on crash

## Access

Visit `https://<your_login>.42.fr` to access your WordPress site.

## Requirements Met

**Mandatory**: ✅ NGINX, WordPress, MariaDB with proper Docker setup
**Bonus**: ✅ Redis cache for improved performance
