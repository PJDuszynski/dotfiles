RunOrActivate(exe, path)
{
    if WinExist("ahk_exe " exe) {
        local app_instances
        GroupAdd "app_instances", "ahk_exe" exe
        GroupActivate "app_instances", "r"
    } else {
        Run(EnvGet("AppData") path)
    }
}

!#f::RunOrActivate("Spotify.exe", "\Spotify\Spotify.exe")
!#d::RunOrActivate("dbeaver.exe", "\..\Local\DBeaver\dbeaver.exe")
!#s::RunOrActivate("slack.exe", "\..\Local\slack\slack.exe")
!#a::RunOrActivate("alacritty.exe", "\..\Local\alacritty\alacritty.exe")
!#n::RunOrActivate("Nuclino.exe", "\..\Local\Programs\nuclino-desktop\Nuclino.exe")
!#b::RunOrActivate("betterbird.exe", "\betterbird\betterbird.exe.lnk")
!#v::RunOrActivate("vivaldi.exe", "\..\Local\Vivaldi\Application\vivaldi.exe")
!#t::RunOrActivate("WindowsTerminal.exe", "\..\Local\Microsoft\WindowsApps\wt.exe" )
!#c::RunOrActivate("Code.exe", "\..\Local\Programs\Microsoft VS Code\Code.exe")
!#e::RunOrActivate("OneCommander.exe", "\..\..\scoop\apps\onecommander\current\OneCommander.exe")
