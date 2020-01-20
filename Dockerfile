FROM ubuntu:18.04git

RUN apt-get -q -y update &&\
    apt-get -q -y --no-install-recommends install \
      openjdk-8-jdk \
      git \
      wget \
      unzip \
      tar \
      gnupg \
      lib32stdc++6 \
      lib32z1 && \
    rm -rfv /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV CLASSPATH .:/usr/lib/jvm/java-8-openjdk-amd64/lib

ARG GRADLE_VERSION
ENV GRADLE_HOME /gradle-${GRADLE_VERSION}
RUN wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip -q gradle-${GRADLE_VERSION}-bin.zip &&\
    rm gradle-${GRADLE_VERSION}-bin.zip
ENV PATH ${GRADLE_HOME}/bin:$PATH

ENV ANDROID_HOME /android-sdk-linux
ENV ANDROID_SDK_TOOLS 4333796
ARG ANDROID_COMPILE_SDK
ARG ANDROID_BUILD_TOOLS
RUN wget -q -O android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS}.zip && \
    unzip -q -d android-sdk-linux android-sdk.zip && \
    echo y | android-sdk-linux/tools/bin/sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}" >/dev/null && \
    echo y | android-sdk-linux/tools/bin/sdkmanager "platform-tools" >/dev/null && \
    echo y | android-sdk-linux/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}" >/dev/null && \
    yes | android-sdk-linux/tools/bin/sdkmanager --licenses && \
    rm android-sdk.zip
ENV PATH ${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:$PATH
