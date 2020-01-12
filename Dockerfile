FROM microsoft/windowsservercore
ADD ./setup d:/jenkins
RUN Powershell.exe -Command Install-WindowsFeature Web-Server              
RUN ["msiexec.exe", "/i", "C:\\jenkins\\jenkins.msi", "/qn"]
RUN Powershell.exe -Command remove-item c:/jenkins –Recurse
