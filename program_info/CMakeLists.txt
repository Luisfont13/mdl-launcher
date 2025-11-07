if(UNIX)
    find_package(PkgConfig)
    if(PkgConfig_FOUND)
        pkg_search_module(SCDOC scdoc)
        if(SCDOC_FOUND)
            pkg_get_variable(SCDOC_SCDOC scdoc scdoc)
        endif()
    endif()
endif()

set(Launcher_CommonName "MDL-Launcher")
set(Launcher_DisplayName "MDL Launcher")

set(Launcher_Name "${Launcher_CommonName}" PARENT_SCOPE)
set(Launcher_DisplayName "${Launcher_DisplayName}" PARENT_SCOPE)

set(Launcher_Copyright "Prism Launcher Contributors\\n© 2012-2021 MultiMC Contributors \\n MDL Contributors")
set(Launcher_Copyright "${Launcher_Copyright}" PARENT_SCOPE)
set(Launcher_Domain "mdl-united.web.app" PARENT_SCOPE)
set(Launcher_UserAgent "${Launcher_CommonName}/${Launcher_VERSION_NAME}" PARENT_SCOPE)
set(Launcher_ConfigFile "MDL-launcher.cfg" PARENT_SCOPE)
set(Launcher_Git "https://github.com/PrismLauncher/PrismLauncher" PARENT_SCOPE)
set(Launcher_DesktopFileName "com.mdl-launcher.mdl-launcher.desktop" PARENT_SCOPE)

set(Launcher_Desktop "program_info/com.mdl-launcher.mdl-launcher.desktop" PARENT_SCOPE)
set(Launcher_MetaInfo "program_info/com.mdl-launcher.mdl-launcher.metainfo.xml" PARENT_SCOPE)
set(Launcher_SVG "program_info/com.mdl-launcher.mdl-launcher.svg" PARENT_SCOPE)
set(Launcher_Branding_ICNS "program_info/mdllauncher.icns" PARENT_SCOPE)
set(Launcher_Branding_ICO "program_info/mdllauncher.ico")
set(Launcher_Branding_ICO "${Launcher_Branding_ICO}" PARENT_SCOPE)
set(Launcher_Branding_WindowsRC "program_info/mdllauncher.rc" PARENT_SCOPE)
set(Launcher_Branding_LogoQRC "program_info/mdllauncher.qrc" PARENT_SCOPE)

set(Launcher_Portable_File "program_info/portable.txt" PARENT_SCOPE)

configure_file(com.mdl-launcher.mdl-launcher.desktop.in com.mdl-launcher.mdl-launcher.desktop)
configure_file(com.mdl-launcher.mdl-launcher.metainfo.xml.in com.mdl-launcher.mdl-launcher.metainfo.xml)
configure_file(mdllauncher.rc.in mdllauncher.rc @ONLY)
configure_file(mdllauncher.manifest.in mdllauncher.manifest @ONLY)
configure_file(mdllauncher.ico mdllauncher.ico COPYONLY)
configure_file(win_install.nsi.in win_install.nsi @ONLY)

if(SCDOC_FOUND)
    set(in_scd "${CMAKE_CURRENT_SOURCE_DIR}/mdllauncher.6.scd")
    set(out_man "${CMAKE_CURRENT_BINARY_DIR}/mdllauncher.6")
    add_custom_command(
        DEPENDS "${in_scd}"
        OUTPUT "${out_man}"
        COMMAND ${SCDOC_SCDOC} < "${in_scd}" > "${out_man}"
    )
    add_custom_target(man ALL DEPENDS ${out_man})
    set(Launcher_ManPage "program_info/mdllauncher.6" PARENT_SCOPE)
endif()
