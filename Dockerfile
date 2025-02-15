# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3-slim

# Install dependencies for C++23 and CMake
RUN apt-get update && apt-get install -y \
    g++ \
    cmake \
    && rm -rf /var/lib/apt/lists/*

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

# Copy application code 
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# Expose port that app runs on 
EXPOSE 8000

# Build the C++ project
RUN mkdir build && cd build && cmake .. && make -j$(nproc)

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["/bin/bash"]
