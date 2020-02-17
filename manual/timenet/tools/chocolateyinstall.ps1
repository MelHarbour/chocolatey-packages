$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://alge-timing.com/alge/download/software/Setup_TimeNet2.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Time.NET' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = 'B230A9A4D77BE0841EDF1607A7F68EED56DF0C85A5BEF4D1C19B18A5378A223D'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs