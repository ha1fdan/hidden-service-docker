# Tor Hidden Service with Docker Compose

Create and deploy a Tor hidden service using Docker Compose. This project provides a simple setup to host a static HTML webpage as a Tor hidden service using Nginx within Docker containers. The hidden service's hostname is customizable, allowing you to create your own secure and private .onion address on the Tor network.

## Getting Started

These instructions will help you clone and set up the project on your local machine.

### Prerequisites

- Git
- Docker
- Docker Compose

### Clone the Repository

Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/ha1fdan/hidden-service-docker.git
cd hidden-service-docker
```

### Configuration

Prepare your HTML content and place it in the `html` directory.

The Tor hidden service keys are **not** baked into the Docker image. Instead, the container reads them from the `data` directory at runtime. Mounting the directory keeps your private keys out of the image and avoids accidentally publishing them to a registry.

- If you already have a hidden service you would like to reuse, copy its `hostname`, `hs_ed25519_public_key`, and `hs_ed25519_secret_key` files into the `data` directory before starting the containers.
- If the directory is empty, Tor will generate a new hidden service and place the keys in `data` the first time it starts.

#### Upload Custom Vanity Address (Optional)

If you have your own vanity address files that you want to use for your Tor hidden service, follow these steps:

1. Generate or obtain your custom vanity address files, including the `hs_ed25519_public_key`, `hs_ed25519_secret_key` and `hostname`. You can use tools like [mkp224o](https://github.com/cathugger/mkp224o) to generate vanity addresses.
2. Place your vanity address files in the `data` directory. Make sure the `hostname` file contains your desired vanity address.

### Launch the Hidden Service

1. Run the following command to start the containers and launch your hidden service:

```bash
docker compose up -d
```

2. Access your hidden service through the generated .onion address. The address is printed when the Tor container starts, or you can find it in the Tor logs by running:

```bash
docker compose logs tor
```

## Note

This project is for educational and demonstrative purposes. When deploying hidden services in production environments, additional security measures and configurations are recommended.

## Contributions

Contributions and improvements are welcome! Feel free to open issues or pull requests if you have suggestions or enhancements.

## Video Showcase
http://www.youtube.com/watch?v=SuDlJTV11n8
