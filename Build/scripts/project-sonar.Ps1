function ComplieSonarQube() {
    Write-Host "Enter the function ComplieSonarQube:"
    Try {
        $sourcePaths = "D:\GIT\Workspace\LM-Tech\src"
		Set-Location "" -ErrorAction Stop
        & cmd /c "C:\sonar\sonar-scanner-cli-3.3.0.1492-windows\sonar-scanner-3.3.0.1492-windows\bin\sonar-scanner.bat" scan -e "-Dsonar.projectName=Project-Master-Branch" "-Dsonar.projectKey=Project-Master-Branch" "-Dsonar.projectVersion=1.0" "-Dsonar.host.url=http://localhost:9000" "-Dsonar.sourceEncoding=UTF-8" "-Dsonar.sources=$sourcePaths" "-Dsonar.exclusions=**/*.png,**/*.jpg,**/*.gif,**/*.config,**/*.xsl,**/*.css,**/pdf.js/**/*.*"
        if ($LastExitCode -ne 0) {
        throw "Failure occured on sonar-scanner.bat execution" 
        }               
    }
    Catch [Exception] {
        Write-Host "Exception occured in ComplieSonarQube:$_"
        Exit(1)
    }
    Write-Host "Leaving the function ComplieSonarQube:"       
}
ComplieSonarQube