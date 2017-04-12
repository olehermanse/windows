# Adapted from:
#http://www.powershellmagazine.com/2013/06/25/pstip-how-to-start-an-elevated-powershell-from-windows-explorer/

$menu = 'PowerShell Here'
$command = "$PSHOME\powershell.exe -NoExit -Command ""Set-Location '%V'"""

'directory', 'directory\background', 'drive' | ForEach-Object {
    New-Item -Path "Registry::HKEY_CLASSES_ROOT\$_\shell" -Name psmenu\command -Force |
    Set-ItemProperty -Name '(default)' -Value $command -PassThru |
    Set-ItemProperty -Path {$_.PSParentPath} -Name '(default)' -Value $menu
}
