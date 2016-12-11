#!/bin/bash
keytool -v -import -file server.crt -alias authz.lumeer.io -keystore cacerts.jks -storepass geheim
