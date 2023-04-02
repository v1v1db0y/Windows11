get-appxpackage microsoft.windowscommunicationsapps    | remove-appxpackage
get-appxpackage Microsoft.XboxSpeechToTextOverlay      | remove-appxpackage
get-appxpackage Microsoft.MicrosoftSolitaireCollection | remove-appxpackage
get-appxpackage MicrosoftTeams                         | remove-appxpackage                          
get-appxpackage SpotifyAB.SpotifyMusic                 | remove-appxpackage
get-appxpackage Microsoft.Xbox.TCUI                    | remove-appxpackage
get-appxpackage Microsoft.XboxGameOverlay              | remove-appxpackage
get-appxpackage Microsoft.XboxIdentityProvider         | remove-appxpackage
get-appxpackage Microsoft.MicrosoftOfficeHub           | remove-appxpackage
get-appxpackage Microsoft.XboxGamingOverlay            | remove-appxpackage
get-appxpackage MicrosoftCorporationII.QuickAssist     | remove-appxpackage
get-appxpackage Microsoft.WindowsMaps                  | remove-appxpackage
get-appxpackage Microsoft.BingNews                     | remove-appxpackage
get-appxpackage Microsoft.GamingApp                    | remove-appxpackage
get-appxpackage Microsoft.People                       | remove-appxpackage
get-appxpackage Microsoft.Getstarted                   | remove-appxpackage
get-appxpackage Clipchamp.Clipchamp                    | remove-appxpackage
get-appxpackage Microsoft.MicrosoftStickyNotes         | remove-appxpackage
get-appxpackage Microsoft.BingWeather                  | remove-appxpackage
get-appxpackage Microsoft.PowerAutomateDesktop         | remove-appxpackage
get-appxpackage Microsoft.WindowsFeedbackHub           | remove-appxpackage
get-appxpackage Microsoft.ScreenSketch                 | remove-appxpackage
get-appxpackage Microsoft.Todos                        | remove-appxpackage
get-appxpackage Microsoft.GetHelp                      | remove-appxpackage
get-appxpackage Microsoft.WindowsSoundRecorder         | remove-appxpackage
get-appxpackage Microsoft.WindowsNotepad               | remove-appxpackage
get-appxpackage Microsoft.WindowsAlarms                | remove-appxpackage
get-appxpackage Microsoft.YourPhone                    | remove-appxpackage
get-appxpackage Microsoft.MicrosoftEdge                | remove-appxpackage

#タスクバーを上にする
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3" /v Settings /t REG_BINARY /d 30000000feffffff0200000001000000300000002000000000000000c203000080070000e20300006000000001000000 /f

#ダークモードを適用
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f

#エクスプローラーのリボンをWIN10デザインにする
reg add "HKCU\Software\Classes\CLSID\{d93ed569-3b3e-4bff-8355-3c44f6a52bb5}\InprocServer32" /f /ve
taskkill /F /IM explorer.exe
start explorer.exe

#コンテキストをWIN10のデザインにする
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
taskkill /F /IM explorer.exe
start explorer.exe

Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux" -All
Enable-WindowsOptionalFeature -Online -FeatureName "VirtualMachinePlatform" -All
Enable-WindowsOptionalFeature -Online -FeatureName "Windows-Defender-Default-Definitions" -All


#WSLを有効化
wsl --install

#WSL2に昇華
wsl --set-default-version 2


#Install Windows Terminal Preview for Winget
winget install Microsoft.WindowsTerminal.Preview

#Install Git
winget install Git.Git

#Uninstall Taskbar wigget
winget uninstall "windows web experience pack"
