# Use the official Python image as the base
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app/backend

# Update and install system dependencies required for mysqlclient
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt /app/backend

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/backend

# Expose the application port (Django default is 8000)
EXPOSE 8000

# Default command to run Django's development server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
