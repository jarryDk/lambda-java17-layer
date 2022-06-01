#!/bin/sh

# -4 IPv4 only
# -L follow redirect if the server responds with a redirect

rm -v java17layer.zip

# 
#curl -4 \
#    -L https://repo.maven.apache.org/maven2/com/amazonaws/aws-lambda-java-runtime-interface-client/1.1.0/aws-lambda-java-runtime-interface-client-1.1.0.jar \
#    -o layer/aws-lambda-java-runtime-interface-client-1.1.0.jar

if [ ! -f "layer/aws-lambda-java-runtime-interface-client-2.1.1.jar" ]; then
curl -4 \
    -L https://repo.maven.apache.org/maven2/com/amazonaws/aws-lambda-java-runtime-interface-client/2.1.1/aws-lambda-java-runtime-interface-client-2.1.1.jar \
    -o layer/aws-lambda-java-runtime-interface-client-2.1.1.jar
else
    echo "Already downloaded : layer/aws-lambda-java-runtime-interface-client-2.1.1.jar"
fi

if [ ! -f "layer/aws-lambda-java-core-1.2.1.jar" ]; then
curl -4 \
    -L https://repo.maven.apache.org/maven2/com/amazonaws/aws-lambda-java-core/1.2.1/aws-lambda-java-core-1.2.1.jar \
    -o layer/aws-lambda-java-core-1.2.1.jar
else
    echo "Already downloaded : layer/aws-lambda-java-core-1.2.1.jar"
fi

if [ ! -f "layer/aws-lambda-java-serialization-1.0.0.jar" ]; then
curl -4 \
    -L https://repo.maven.apache.org/maven2/com/amazonaws/aws-lambda-java-serialization/1.0.0/aws-lambda-java-serialization-1.0.0.jar \
    -o layer/aws-lambda-java-serialization-1.0.0.jar
else
    echo "Already downloaded : layer/aws-lambda-java-serialization-1.0.0.jar"
fi

chmod 755 bootstrap && zip -r java17layer.zip layer/jre-17-slim.zip bootstrap layer/aws-lambda-java-runtime-interface-client-2.1.1.jar layer/aws-lambda-java-core-1.2.1.jar layer/aws-lambda-java-serialization-1.0.0.jar