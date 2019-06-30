$ErrorActionPreference = 'SilentlyContinue';
Import-Module WebAdministration
$arguments = @{}
$packageName= 'project'
$toolsDir   = "$(Split-Path $MyInvocation.MyCommand.Definition -Parent)"
$package = "$(Split-Path -Path $toolsDir -Parent)"
$packageParameters = $env:chocolateyPackageParameters

if ($packageParameters) {
  $match_pattern = "\/(?<option>([a-zA-Z]+)):(?<value>([`"'])?([a-zA-Z0-9- _\\:\.]+)([`"'])?)|\/(?<option>([a-zA-Z]+))"
  $option_name = 'option'
  $value_name = 'value'

  if ($packageParameters -match $match_pattern ){
      $results = $packageParameters | Select-String $match_pattern -AllMatches
      $results.matches | % {
        $arguments.Add(
            $_.Groups[$option_name].Value.Trim(),
            $_.Groups[$value_name].Value.Trim())
    }
  }
}
# folders Cleanup
     if (Test-Path -path "C:\Project") {
    
    Remove-Item "C:\Project" -Force -Recurse
   }
#folder copy
$destination = "C:\project"
try {
    Copy-Item "${package}\source\Project\" "${destination}" -Recurse -Force
    if(-not $?) {
        throw "Failure occured on Project Copy-Item:$_" 
      }  
    }

catch [Exception]{
    Write-Host "Exception occured on copy : $_"

    Exit(1)  
}