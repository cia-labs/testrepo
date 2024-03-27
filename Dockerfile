# Use an official Python runtime as a parent image
FROM python:3.10-slim
# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /server

# Install dependencies
COPY requirements.txt /server/
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy project
COPY . /server/

# Command to run the uvicorn server
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]