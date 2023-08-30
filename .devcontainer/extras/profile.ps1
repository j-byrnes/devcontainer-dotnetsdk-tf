$softwareVersions = [ordered]@{
  "azure-cli" = $(((az --version | Select-String "azure-cli") -split " ")[-1])
  dotnetSDK = $(& dotnet --version)
  pwsh = $PSVersionTable.PSVersion.ToString()
  terraform = $((((& terraform version) -split "`n")[0].trim()) -split " ")[-1]
}

$softwareVersions
