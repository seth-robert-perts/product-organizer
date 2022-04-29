# Grab the latest amazon linux image
FROM amazonlinux:latest

# Set work directory
WORKDIR /opt/app

# Copy in needed files
COPY requirements.txt .
COPY main.py .

# Install needed packages
RUN yum install -y python3
RUN yum install pip -y
#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
#RUN . ~/.nvm/nvm.sh
#RUN nvm install --lts node
#RUN npm install -g @vue/cli
#RUN npm install bootstrap vue-router
#RUN npm run serve
# For prod build
#RUN npm run build
#RUN serve ./dist

# Install dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose port for communication to outside container
EXPOSE 5000/tcp

# Start server
CMD ["python3", "main.py"]