RunOrActivate(app)
{
    local  root_path := "C:\Users\pduszynski\customization\ahk_app_shortcuts\"
    local exe := app ".exe"
    if WinExist("ahk_exe " exe) {
        app_instances := RegExReplace(exe, "(-|\.)", "") "_group"
        GroupAdd app_instances, "ahk_exe" exe
        GroupActivate app_instances, "r"
    } else {
        Run(root_path app ".lnk")
    }
}


; Rebindings
CapsLock::Esc
#PgDn::WinMinimize "A"
#PgUp::WinMaximize "A"
#Ins::Winrestore "A"
PrintScreen::LWin


!#f::RunOrActivate("Spotify")
!#d::RunOrActivate("dbeaver")
!#s::RunOrActivate("slack")
!#a::RunOrActivate("wezterm-gui")
!#w::RunOrActivate("Nuclino")
!#b::RunOrActivate("OUTLOOK")
!#v::RunOrActivate("vivaldi")
!#t::RunOrActivate("WindowsTerminal")
!#c::RunOrActivate("Code")
!#e::RunOrActivate("OneCommander")
!#o::RunOrActivate("Obsidian")
!#r::RunOrActivate("rstudio")

^+c::^c
^+v::^v

#HotIf WinActive("ahk_exe wezterm-gui.exe")
^+c::^+c
^+v::^+v
#HotIf
