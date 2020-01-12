FROM microsoft/windows 7
ADD ./setup d:/jenkins
RUN Powershell.exe -Command Install-WindowsFeature Web-Server                 
RUN ["msiexec.exe", "/i", "D:\\jenkins\\jenkins.msi", "/qn"]
RUN Powershell.exe -Command remove-item c:/jenkins –Recurse
