# BASED ON THIS EXAMPLE:
# https://medium.com/@ahamedabdulrahman/dockerize-selenium-java-project-and-run-selenium-scripts-within-docker-container-c2603d1bac3f

# Step 0: the base
FROM kshivaprasad/java:1.8

# Step 1: Install pre-requisites
RUN apt-get update
# In order to download something in Docker (which is based on Linux), we need to use either wget or curl.
RUN apt-get install -y curl

#Step 3: Install Maven
# 1- Define Maven version
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

#Step 5: Install chrome from the source tree
RUN apt-get update
RUN apt-get -y install /app/chrome-linux/google-chrome-stable_105.0.5195.52-1_amd64.deb

#Step 6: Making our working directory as /app
WORKDIR /app

# EXPOSE 4444

#Step 7: Upload all the maven dependencies
# RUN mvn package -X -DskipTests

# Enable SSH access to the container:
# took from here https://www.techrepublic.com/article/deploy-docker-container-ssh-access/
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:PASSWORD' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
