# Inception

## Overview
Inception is a Docker-based web service infrastructure project that sets up a small-scale web hosting environment. It includes a web server (NGINX), a content management system (WordPress), and a database (MariaDB), all running in separate Docker containers.

## Features
- NGINX web server with TLSv1.2/TLSv1.3 support
- WordPress + php-fpm
- MariaDB database
- Docker volumes for data persistence
- Docker network for inter-container communication
- Automatic container restart on crash

## Prerequisites
- Docker
- Docker Compose
- Make

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/lkabuci/inception.git
   cd inception
   ```

2. Set up your environment variables:
   - Copy the `.env.example` file to `.env`
   - Edit the `.env` file with your desired settings

3. Build and start the containers:
   ```
   make
   ```

## Usage

After successful installation, you can access:
- WordPress site: https://yourdomain.42.fr
- Database: Only accessible internally by WordPress

To stop the services:
```
make stop
```

To restart the services:
```
make restart
```

To clean up all containers and volumes:
```
make fclean
```

## Project Structure
```
inception/
├── Makefile
├── srcs/
│   ├── docker-compose.yml
│   ├── .env
│   └── requirements/
│       ├── nginx/
│       ├── wordpress/
│       └── mariadb/
```

## Customization
- NGINX configuration: `srcs/requirements/nginx/conf/`
- WordPress configuration: `srcs/requirements/wordpress/conf/`
- MariaDB configuration: `srcs/requirements/mariadb/conf/`

## Troubleshooting
If you encounter any issues, please check the Docker logs:
```
docker logs <container_name>
```

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
