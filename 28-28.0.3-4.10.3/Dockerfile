FROM ubuntu:18.04

RUN apt-get -q -y update \
    && DEBIAN_FRONTEND=noninteractive apt-get -q -y --no-install-recommends install \
      openjdk-8-jdk \
      git \
      wget \
      unzip \
      tar \
      gnupg \
      lib32stdc++6 \
      lib32z1 \
    && rm -rfv /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ENV GRADLE_VERSION=4.10.3
ENV GRADLE_HOME /gradle-${GRADLE_VERSION}
RUN wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip \
    && unzip -q gradle-${GRADLE_VERSION}-all.zip \
    && rm gradle-${GRADLE_VERSION}-all.zip
ENV PATH ${GRADLE_HOME}/bin:$PATH

ENV ANDROID_HOME /android-sdk-linux
ENV ANDROID_SDK_VERSION 4333796
ENV ANDROID_COMPILE_SDK=28
ENV ANDROID_BUILD_TOOLS=28.0.3

RUN wget -q -O /tmp/android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_VERSION}.zip && \
    unzip -q -d android-sdk-linux /tmp/android-sdk.zip && \
    rm /tmp/android-sdk.zip

ENV PATH ${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:$PATH

RUN mkdir ~/.android && echo '### User Sources for Android SDK Manager' > ~/.android/repositories.cfg
RUN yes | sdkmanager --licenses >/dev/null && yes | sdkmanager --update >/dev/null
RUN sdkmanager "tools" "platform-tools" >/dev/null

RUN sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}" >/dev/null
RUN sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}" >/dev/null
