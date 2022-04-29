# Grab the latest amazon linux image
FROM amazonlinux:latest

# Set work directory
WORKDIR /opt/app

# Copy in needed files
COPY requirements.txt .
COPY main.py .
COPY frontend .

# Install needed packages
RUN yum install -y python3 pip shadow-utils tar gzip ncurses

# Install python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Create user for nvm script to work
#RUN useradd -ms /bin/bash myapp
#USER myapp

# Change directories for node install
WORKDIR /opt/app/frontend

# Install nvm, node, and frontend dependencies
#RUN sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
#    && source ~/.nvm/nvm.sh \
#    && echo $PATH \
#    && nvm install --lts node \
#    && npm install -g @vue/cli bootstrap vue-router serve \
#    && npm install \
#    && npm run build

RUN curl --silent --location https://rpm.nodesource.com/setup_14.x | bash && yum -y install nodejs

RUN npm install -g @vue/cli bootstrap vue-router serve

RUN npm install

RUN npm run build

# Expose port for communication to outside of container
EXPOSE 3000/tcp

# Change back to original directory
WORKDIR /opt/app

# Start backend python/flask server and frontend VueJS server
CMD python3 main.py && serve ./frontend/dist