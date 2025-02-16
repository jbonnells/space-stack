FROM node:23-alpine

# Install dependencies
RUN apk add --no-cache \
    g++ \
    bash \
    cmake \
    git \
    boost-dev \
    linux-headers \
    make \
    python3 \
    py3-pip

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt --break-system-packages

# Copy application code 
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# Expose ports (React: 3000, WebSocket Server: 8000)
EXPOSE 4000 8000

# Build the C++ project
RUN mkdir build && cd build && cmake .. -DCMAKE_CXX_STANDARD=23 && make -j$(nproc)

# # Start the React app
# CMD ["npm", "start"]

# Start both the C++ WebSocket server and the React app
# CMD ["sh", "-c", "./build/server & npm start"]

CMD ["/bin/bash"]
