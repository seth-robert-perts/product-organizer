# Grab the latest amazon linux image
FROM amazonlinux:latest

# Set work directory
WORKDIR /opt/app

# Copy in needed files
COPY requirements.txt .
COPY main.py .
COPY frontend .

# Install needed packages
RUN yum install -y python3 pip shadow-utils supervisor

# Copy supervisor config file
COPY supervisord.conf /etc/supervisord.conf

# Install python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Change directories for node install
WORKDIR /opt/app/frontend

# Install nodejs and frontend dependencies
RUN curl --silent --location https://rpm.nodesource.com/setup_16.x | bash && yum -y install nodejs
RUN npm install -g @vue/cli bootstrap vue-router serve
RUN npm install

# Build frontend
RUN npm run build

# Expose port for communication to outside of container
EXPOSE 3000/tcp

# Change back to original directory
WORKDIR /opt/app

# Start backend python/flask server and frontend VueJS server using supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]