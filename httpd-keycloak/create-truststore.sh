#!/bin/bash
keytool -v -import -file server.crt -alias auth.lumeer.io -keystore cacerts.jks -storepass geheim
