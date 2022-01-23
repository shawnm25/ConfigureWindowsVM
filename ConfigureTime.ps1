$regionalsettingsURL = "https://raw.githubusercontent.com/shawnm25/ConfigureWindowsVM/TimeSettings/AURegion.xml"
$RegionalSettings = "C:\AURegion.xml"
#downdload regional settings file
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($regionalsettingsURL,$RegionalSettings)
# Set Locale, language etc. 
& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"$RegionalSettings`""
# Set languages/culture. Not needed perse.
Set-WinSystemLocale en-AU
Set-WinUserLanguageList -LanguageList en-AU -Force
Set-Culture -CultureInfo en-AU
Set-WinHomeLocation -GeoId 12
Set-TimeZone -Name "AUS Eastern Standard Time"
# restart virtual machine to apply regional settings to current user. You could also do a logoff and login.
Start-sleep -Seconds 10
Restart-Computer
