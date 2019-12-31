FROM microsoft/iis:latest

COPY wwwroot c:/inetpub/wwwroot

RUN powershell Remove-Item c:/inetpub/wwwroot/iisstart.htm -force
RUN powershell Remove-Item c:/inetpub/wwwroot/iisstart.png -force
RUN powershell Import-Module WebAdministration
RUN powershell New-WebAppPool -Name 'TestPool'

EXPOSE 80

ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]

