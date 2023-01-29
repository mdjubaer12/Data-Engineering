FROM python:3.10.1

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the model and dataset to the working directory
COPY resnet.py .
COPY Dogs/ .
COPY Dogs.txt .

# Expose the port for the application
EXPOSE 8000

# Start the application
CMD ["python", "resnet.py", "--data_dir=Dogs", "--labels_file=Dogs.txt"]