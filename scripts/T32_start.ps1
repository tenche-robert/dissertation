$rootPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("$PSScriptRoot\..")

$t32_bin_path="C:\Tools\T32\T32_R_2020_09_000128638\bin\windows64"
$t32_exe="$t32_bin_path\t32marm64.exe"

Start-Process $t32_exe -ArgumentList "-c $rootPath\config\T32_config.t32 -s $rootPath\scripts\T32_startup.cmm"
