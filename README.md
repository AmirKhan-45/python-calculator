# python-calculator
To set up a Python calculator in a Jupyter Notebook within a Dev Container using Docker, you'll need to create a Dockerfile and a `devcontainer.json` file. Here’s a step-by-step guide:

### 1. **Create a Dockerfile**

The Dockerfile will set up the environment for your Jupyter Notebook with Python installed.

```Dockerfile
# Use the official Python image as a base
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /workspace

# Install Jupyter
RUN pip install jupyter

# Expose the port for Jupyter Notebook
EXPOSE 8888

# Command to start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
```

### 2. **Create a `devcontainer.json` file**

This file configures the Dev Container settings.

```json
{
    "name": "Python Calculator Dev Container",
    "dockerFile": "Dockerfile",
    "appPort": 8888,
    "extensions": [
        "ms-python.python"
    ],
    "settings": {
        "python.pythonPath": "/usr/local/bin/python",
        "python.defaultInterpreterPath": "/usr/local/bin/python"
    },
    "forwardPorts": [8888],
    "postCreateCommand": "pip install -r requirements.txt"
}
```

### 3. **Optional: Create a `requirements.txt` file**

If you want to install additional Python packages, create a `requirements.txt` file in the same directory.

```plaintext
# Example additional packages
numpy
pandas
```

### 4. **Build and Run the Dev Container**

1. Open your project in Visual Studio Code.
2. Ensure you have the Remote - Containers extension installed.
3. When prompted, reopen the project in the Dev Container. VS Code will use the `Dockerfile` and `devcontainer.json` to set up the environment.
4. Once the container is running, the Jupyter Notebook server will be available. You can access it in your browser at `http://localhost:8888`.

### 5. **Create and Use the Jupyter Notebook**

- Inside the Dev Container, create a new Jupyter Notebook (e.g., `calculator.ipynb`).
- You can now write Python code in the cells to perform calculations.

Here’s a simple example of a Python calculator:

```python
# Simple calculator functions

def add(x, y):
    return x + y

def subtract(x, y):
    return x - y

def multiply(x, y):
    return x * y

def divide(x, y):
    if y == 0:
        return "Cannot divide by zero!"
    return x / y

# Example usage
add(10, 5), subtract(10, 5), multiply(10, 5), divide(10, 5)
```

Running the above code in a Jupyter Notebook cell will allow you to perform basic calculations.

---

This setup gives you a portable Python development environment with Jupyter Notebook running inside a Docker container, making it easy to share and reproduce environments.
