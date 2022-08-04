FROM openjdk:11

#Step 1 : Install the pre-requisite
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y p7zip \
    p7zip-full \
    unace \
    zip \
    unzip \
    bzip2

#     https://www.google.com/chrome/thank-you.html?statcb=1&installdataindex=empty&defaultbrowser=0#