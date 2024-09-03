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
