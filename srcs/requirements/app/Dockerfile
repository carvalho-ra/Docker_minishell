# Use the official Debian base image
FROM debian:latest

# Ensure the package list is updated, install necessary packages, and clean up
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y bash libreadline-dev libreadline8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the minishell script to the root directory of the container
COPY ./requirements/app/minishell /minishell

# Make sure the minishell script is executable
RUN chmod -R +x /minishell

# Set the command to execute the minishell script
CMD ["bash", "-c", "/minishell"]

