FROM microsoft/windowsservercore                #SPECIFY THE CONTAINER IMAGE
ADD ./setup c:/jenkins                          #COPY THE JENKINS INSTALLATION FILES INTO THE CONTAINER
RUN Powershell.exe -Command Install-WindowsFeature Web-Server           #INSTALLING IIS                  
RUN ["msiexec.exe", "/i", "C:\\jenkins\\jenkins.msi", "/qn"]            #INSTALLING JENKINS
RUN Powershell.exe -Command remove-item c:/jenkins –Recurse             #REMOVING SETUP FILES FROM CONTAINER
