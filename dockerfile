# Use the official Python image as the base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt and main.py files into the container
COPY requirements.txt main.py /app/

# Create a 'templates' folder and copy the crossword.html template
RUN mkdir templates
COPY templates/crossword.html /app/templates/

# Install required packages
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that FastAPI will run on
EXPOSE 8000

# Command to start the FastAPI application using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
