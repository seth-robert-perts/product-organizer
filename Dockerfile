# Grab the latest amazon linux image
FROM amazonlinux:latest

# Set work directory
WORKDIR /opt/app

# Copy in needed files
COPY requirements.txt .
COPY main.py .
COPY frontend .

# Install needed packages
RUN yum install -y python3
RUN yum install pip -y

# Install python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Change directories for node install
WORKDIR /opt/app/frontend

# Install nvm, node, and frontend dependencies
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN source ~/.nvm/nvm.sh
RUN nvm install --lts node
RUN npm install -g @vue/cli bootstrap vue-router serve
RUN npm install

# Build VueJS Frontend
RUN npm run build

# Expose port for communication to outside of container
EXPOSE 3000/tcp

# Change back to original directory
WORKDIR /opt/app

# Start backend python/flask server and frontend VueJS server
CMD python3 main.py && serve ./frontend/dist