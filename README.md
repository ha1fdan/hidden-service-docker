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
```

### Configuration

1. Modify the `tor-config/torrc` file to customize your hidden service settings.
2. Prepare your HTML content and place it in the `html` directory.

#### Upload Custom Vanity Address (Optional)

If you have your own vanity address files that you want to use for your Tor hidden service, follow these steps:

1. Generate or obtain your custom vanity address files, including the `hs_ed25519_public_key`, `hs_ed25519_secret_key` and `hostname`. You can use tools like [mkp224o](https://github.com/cathugger/mkp224o) to generate vanity addresses.

2. Replace the existing files in the `hidden_service` directory with your custom vanity address files. Make sure the `hostname` file contains your desired vanity address.


### Launch the Hidden Service

1. Navigate to the cloned repository's directory:

```bash
cd hidden-service-docker
```

2. Run the following command to start the containers and launch your hidden service:

```bash
docker-compose up -d
```

3. Access your hidden service through the generated .onion address. You can find the address in the Tor logs by running:

```bash
docker-compose logs tor
```

## Note

This project is for educational and demonstrative purposes. When deploying hidden services in production environments, additional security measures and configurations are recommended.

## Contributions

Contributions and improvements are welcome! Feel free to open issues or pull requests if you have suggestions or enhancements.

## Video Showcase
http://www.youtube.com/watch?v=SuDlJTV11n8
