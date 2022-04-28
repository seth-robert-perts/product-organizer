# Grab the latest amazon linux image
FROM amazonlinux:latest

RUN ["yum", "install", "-y", "python3"]

CMD ["python3", "--version"]