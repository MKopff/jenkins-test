# BASED ON THIS EXAMPLE:
# https://medium.com/@ahamedabdulrahman/dockerize-selenium-java-project-and-run-selenium-scripts-within-docker-container-c2603d1bac3f

# Step 0: the base
# https://hub.docker.com/layers/library/openjdk/8-jdk-alpine3.9/images/sha256-a3562aa0b991a80cfe8172847c8be6dbf6e46340b759c2b782f8b8be45342717?context=explore
# FROM openjdk:8-jdk-alpine3.9
FROM kshivaprasad/java:1.8

# Step 1: Install pre-requisites
RUN apt-get update
# In order to download something in Docker (which is based on Linux), we need to use either wget or curl.
RUN apt-get install -y curl
#
RUN apt-get install -y p7zip \
    p7zip-full \
    unace \
    zip \
    unzip \
    bzip2

#Version numbers
ARG CHROME_VERSION=105.0.5195.52
ARG CHROMDRIVER_VERSION=105.0.5195.52
# RUN curl http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_$CHROME_VERSION_amd64.deb
# RUN dpkg -i /google-chrome-stable_amd64.deb
# RUN rm /google-chrome-stable_105.0.5195.52-1_amd64.deb

# http://170.210.201.179/linux/chrome/deb/pool/main/g/google-chrome-stable/
# wget http://170.210.201.179/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_105.0.5195.52-1_amd64.deb

#Step 2: Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable

# RUN rm /google-chrome-stable_current_amd64.deb
#Step 3: Install chromedriver for Selenium
RUN mkdir -p /app/bin
RUN curl https://chromedriver.storage.googleapis.com/$CHROMDRIVER_VERSION/chromedriver_linux64.zip -o /tmp/chromedriver.zip \
    && unzip /tmp/chromedriver.zip -d /app/bin/ \
    && rm /tmp/chromedriver.zip
RUN chmod +x /app/bin/chromedriver

#Step 3: Install Maven
# 1- Define Maven version
# ARG MAVEN_VERSION=3.6.3
ARG MAVEN_VERSION=3.6.3
# 2- Define a constant with the working directory
ARG USER_HOME_DIR="/root"

# 3- Define the URL where maven can be downloaded from
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

  RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
   && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
   && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
   && rm -f /tmp/apache-maven.tar.gz \
   && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# 4- Define environmental variables required by Maven, like Maven_Home directory and where the maven repo is located
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

#Step 4: Copy our project
COPY . /app
#Making our working directory as /app
WORKDIR /app

# upload all the maven dependencies
RUN mvn package -X -DskipTests