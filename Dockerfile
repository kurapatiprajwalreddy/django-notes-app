# Base image
FROM python:3.9

# Set the working directory
WORKDIR /app/backend

# Copy the dependencies file
COPY requirements.txt /app/backend

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . /app/backend

# Expose the port (runtime only)
EXPOSE 8000

# Set the command to run the Django application
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
