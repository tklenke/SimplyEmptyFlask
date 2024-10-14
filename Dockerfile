# Use an official Python runtime as a parent image
FROM python:3.11-slim

#update pip
RUN python -m pip install --upgrade pip

# Set the working directory in the container
WORKDIR /app

# Copy requirements file
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app code
COPY fwww /app/fwww

# Expose the port that Gunicorn will run on
EXPOSE 8000

# Set environment variables for Flask
ENV FLASK_ENV=production

# Set the working directory in the container to fwww
WORKDIR /app/fwww

# Command to run the application with Gunicorn
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "wsgi:app"]
