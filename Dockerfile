FROM microsoft/windowsservercore
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ARG CONFIGURATION
EXPOSE 80

