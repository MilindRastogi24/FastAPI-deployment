# Use an official Python runtime as a base image
FROM public.ecr.aws/lambda/python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt


# Run the application
CMD ["main.handler"]
