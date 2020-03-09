# Build Android App in Docker

[![Build Status](https://img.shields.io/travis/com/alvisisme/docker-android?style=flat-square)](https://travis-ci.com/alvisisme/docker-android)
![Docker Pulls](https://img.shields.io/docker/pulls/alvisisme/android-sdk?style=flat-square)

Android应用的构建镜像，主要用于CI/CD自动化。

## 目录

- [背景](#背景)
- [用法](#用法)
- [维护人员](#维护人员)
- [贡献参与](#贡献参与)
- [许可](#许可)

## 背景

基于ubuntu18.04的安卓应用构建镜像。

版本号说明如下

alvisisme/android-sdk:[ANDROID_COMPILE_SDK]-[ANDROID_BUILD_TOOLS]-[GRADLE_VERSION]

版本主要对应cordova自动创建的默认工程配置，有特定版本需求可以按照用法一节自己构建。

## 用法

构建对应版本镜像

```bash
ANDROID_COMPILE_SDK=28
ANDROID_BUILD_TOOLS=28.0.3
GRADLE_VERSION=4.10.3
docker build --pull -t alvisisme/android-sdk:$ANDROID_COMPILE_SDK-$ANDROID_BUILD_TOOLS-$GRADLE_VERSION \
    --build-arg ANDROID_COMPILE_SDK=$ANDROID_COMPILE_SDK \
    --build-arg ANDROID_BUILD_TOOLS=$ANDROID_BUILD_TOOLS \
    --build-arg GRADLE_VERSION=$GRADLE_VERSION \
    .
```

拉取Docker Hub镜像

```bash
docker pull alvisisme/android-sdk:28-28.0.3-4.10.3
```

拉取阿里云容器镜像（国内推荐）

```bash
docker pull registry.cn-hangzhou.aliyuncs.com/alvisisme/android-sdk:28-28.0.3-4.10.3
```

## 维护人员

[@Alvis Zhao](https://github.com/alvisisme)

## 贡献参与

欢迎提交PR。

## 许可

© 2020 Alvis Zhao
