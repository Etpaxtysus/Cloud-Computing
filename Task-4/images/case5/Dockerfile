# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies for setting timezone
RUN apt-get update && apt-get install -y tzdata

# Set timezone to GMT+7
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Copy application code
COPY app.py requirements.txt ./
COPY templates ./templates

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
