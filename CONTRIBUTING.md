# Contributing to GitHub Project Manager

Thank you for your interest in contributing to GitHub Project Manager! This document provides guidelines and instructions to help you get started.

## Development Environment Setup

We provide a convenient script to set up your development environment. The script handles Python version management (via pyenv), creates a virtual environment, and installs all dependencies.

### Prerequisites

- Git
- Python 3.7+
- [pyenv](https://github.com/pyenv/pyenv) (recommended for Python version management)

### Setup Process

1. Fork and clone the repository:
   ```bash
   git clone https://github.com/your-username/github-project-manager.git
   cd github-project-manager
   ```

2. Run the setup script:
   ```bash
   ./dev-setup.sh
   ```

   This script will:
   - Check if you have the correct Python version (as specified in `.python-version`)
   - Install the required Python version using pyenv if needed
   - Create a virtual environment in `.venv/`
   - Install the package in development mode
   - Install development dependencies (pytest, black, etc.)

### Available Commands

The `dev-setup.sh` script offers several commands:

| Command | Description |
|---------|-------------|
| `./dev-setup.sh` | Set up the development environment |
| `./dev-setup.sh test` | Run the test suite |
| `./dev-setup.sh coverage` | Run tests with coverage report |
| `./dev-setup.sh lint` | Check code formatting with Black |
| `./dev-setup.sh format` | Format code with Black |
| `./dev-setup.sh all` | Run linting, tests, and coverage |

## Development Workflow

1. Create a new branch for your feature or bugfix:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes and write tests for new functionality.

3. Run tests to ensure everything works:
   ```bash
   ./dev-setup.sh all
   ```

4. Format your code:
   ```bash
   ./dev-setup.sh format
   ```

5. Commit your changes with a descriptive message:
   ```bash
   git commit -m "Add feature: your feature description"
   ```

6. Push your branch and create a pull request:
   ```bash
   git push origin feature/your-feature-name
   ```

## Pull Request Guidelines

- Ensure all tests pass and code is properly formatted
- Include tests for new functionality
- Update documentation as needed
- Follow the existing code style
- Keep pull requests focused on a single topic

## Testing

We use pytest for testing. All tests should be placed in the `tests/` directory and should follow the same structure as the main package.

- Run all tests: `./dev-setup.sh test`
- Run tests with coverage: `./dev-setup.sh coverage`

## Code Style

We use Black for code formatting. Run `./dev-setup.sh format` to automatically format your code.

## Documentation

- Update the README.md with details of changes to the interface
- Update docstrings for any changed or new functions/classes

## License

By contributing to GitHub Project Manager, you agree that your contributions will be licensed under the project's MIT license.

## Questions?

If you have any questions or need help, please open an issue or reach out to the maintainers.

Thank you for contributing to GitHub Project Manager!