FROM nikolaik/python-nodejs:python3.10-nodejs20

RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app/

# Upgrade pip to the latest version
RUN pip3 install --no-cache-dir --upgrade pip

# Install dependencies
COPY requirements.txt /app/
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

# Copy the rest of the application code
COPY . /app/

CMD ["bash", "start"]
