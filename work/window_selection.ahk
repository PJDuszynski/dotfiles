

RunOrActivate(app)
{
    local  root_path := "C:\Users\pduszynski\customization\ahk_app_shortcuts\"
    local exe := app ".exe"
    if WinExist("ahk_exe " exe) {
        app_instances := app "_group"
        GroupAdd app_instances, "ahk_exe" exe
        GroupActivate app_instances, "r"
    } else {
        Run(root_path app ".lnk")
    }
}


!#f::RunOrActivate("Spotify")
!#d::RunOrActivate("dbeaver")
!#s::RunOrActivate("slack")
!#a::RunOrActivate("alacritty")
!#n::RunOrActivate("Nuclino")
!#b::RunOrActivate("betterbird")
!#v::RunOrActivate("vivaldi")
!#t::RunOrActivate("WindowsTerminal")
!#c::RunOrActivate("Code")
!#e::RunOrActivate("OneCommander")
