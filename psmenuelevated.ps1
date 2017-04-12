# Adapted from: 
#http://www.powershellmagazine.com/2013/06/25/pstip-how-to-start-an-elevated-powershell-from-windows-explorer/

$menu = 'Elevated Powershell Here'
$command = "$PSHOME\powershell.exe -NoExit -NoProfile -Command ""Set-Location '%V'"""

'directory', 'directory\background', 'drive' | ForEach-Object {
    New-Item -Path "Registry::HKEY_CLASSES_ROOT\$_\shell" -Name runas\command -Force |
    Set-ItemProperty -Name '(default)' -Value $command -PassThru |
    Set-ItemProperty -Path {$_.PSParentPath} -Name '(default)' -Value $menu -PassThru |
    Set-ItemProperty -Name HasLUAShield -Value ''
}
