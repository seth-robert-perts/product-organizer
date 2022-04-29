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

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
            
# Install nvm with node and npm
ENV NVM_DIR ~/.nvm
ENV NODE_VERSION 16.15.0
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash \
    && . ~/.nvm/nvm.sh \
    && nvm install 16.15.0 \
    && nvm alias default 16.15.0 \
    && nvm use default; echo "${PIPESTATUS[@]}"

RUN echo \$PATH
    
ENV NODE_PATH ~/.nvm/v16.15.0/lib/node_modules
ENV PATH      ~/.nvm/v16.15.0/bin:$PATH

# Install frontend dependencies
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