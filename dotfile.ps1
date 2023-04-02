$Uninstall_Lists = @(
          'microsoft.windowscommunicationsapps';
          'Microsoft.XboxSpeechToTextOverlay';
          'Microsoft.MicrosoftSolitaireCollect';
          'MicrosoftTeams';                          
          'SpotifyAB.SpotifyMusic';
          'Microsoft.Xbox.TCUI';
          'Microsoft.XboxGameOverlay';
          'Microsoft.XboxIdentityProvider';
          'Microsoft.MicrosoftOfficeHub';
          'Microsoft.XboxGamingOverlay';
          'MicrosoftCorporationII.QuickAssist';
          'Microsoft.WindowsMaps';
          'Microsoft.BingNews';
          'Microsoft.GamingApp';
          'Microsoft.People';
          'Microsoft.Getstarted';
          'Clipchamp.Clipchamp';
          'Microsoft.MicrosoftStickyNotes';
          'Microsoft.BingWeather';
          'Microsoft.PowerAutomateDesktop';
          'Microsoft.WindowsFeedbackHub';
          'Microsoft.ScreenSketch';
          'Microsoft.Todos';
          'Microsoft.GetHelp';
          'Microsoft.WindowsSoundRecorder';
          'Microsoft.WindowsNotepad';
          'Microsoft.WindowsAlarms';
          'Microsoft.YourPhone';
          'Microsoft.MicrosoftEdge';
);
 
# 不要なアプリケーションを削除
for ($i=0; $i -lt $Uninstall_Lists.Count; $i++){
  get-appxpackage $Uninstall_Lists[$i] | remove-appxpackage
} 

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

#Uninstall Taskbar wigget
winget uninstall "windows web experience pack"
