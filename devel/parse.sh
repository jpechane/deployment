#!/bin/bash

java -jar saxon.jar -s:standalone.xml -xsl:proxyForward.xsl -o:standalone-out.xml
