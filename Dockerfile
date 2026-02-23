# Use the official n8n image as the base
FROM n8nio/n8n:latest

# Switch to root to install system packages
USER root

# Update the package list and install Python, FFmpeg, and Pip
# Since this is Debian-based, we use 'apt-get' instead of 'apk'
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install edge-tts for free high-quality voiceovers
# Note: Debian requires the --break-system-packages flag for global pip installs in newer versions
RUN pip3 install edge-tts --break-system-packages

# Switch back to the node user for security
USER node