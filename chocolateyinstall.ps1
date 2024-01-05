$ErrorActionPreference = 'Stop' # stop on all errors
$packageName = 'redis-insight-v2'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'RedisInsight-win-installer.exe'
$url        = '' # download url, HTTPS preferred
$url64      = '' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url


$packageArgs = @{
  #packageName   = $env:ChocolateyPackageName
  packagename = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' #only one of these: exe, msi, msu
  #url           = $url
  #url64bit      = $url64
  file         = $fileLocation


  softwareName  = 'redis-insight-v2*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  # MSI
  $silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
 
}

Install-ChocolateyPackage @packageArgs  $silentArgs # https://docs.chocolatey.org/en-us/create/functions/
