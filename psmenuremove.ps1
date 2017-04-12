function testremove($a){
  If (Test-Path "$a"){
    Remove-Item -Path "$a" -Recurse -Force
  }
}

testremove "Registry::HKEY_CLASSES_ROOT\directory\shell\psmenu"
testremove "Registry::HKEY_CLASSES_ROOT\directory\background\shell\psmenu"
testremove "Registry::HKEY_CLASSES_ROOT\drive\shell\psmenu"

testremove "Registry::HKEY_CLASSES_ROOT\directory\shell\runas"
testremove "Registry::HKEY_CLASSES_ROOT\directory\background\shell\runas"
testremove "Registry::HKEY_CLASSES_ROOT\drive\shell\runas"
