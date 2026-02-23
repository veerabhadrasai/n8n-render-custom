# Use the official n8n image as the base
FROM n8nio/n8n:latest

# Switch to root to install system packages
USER root

# Install Python, FFmpeg, and build tools
RUN apk add --update --no-cache python3 py3-pip ffmpeg build-base

# Install edge-tts for free high-quality voiceovers
RUN pip3 install edge-tts --break-system-packages

# Switch back to the node user for security
USER node
