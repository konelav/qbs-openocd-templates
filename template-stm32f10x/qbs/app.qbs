import qbs
import ARMApplication
import qbs.FileInfo
import qbs.ModUtils

ARMApplication {
    name: "Application"

    property bool dump_asm: false

    cpp.includePaths: [
        "../config",
        "../../src",
        "../../libs/stm32f10x/CMSIS/CM3/CoreSupport",
        "../../libs/stm32f10x/CMSIS/CM3/DeviceSupport/ST/STM32F10x",
        "../../libs/stm32f10x/STM32F10x_StdPeriph_Driver/inc",
    ]
    cpp.defines: [
        "STM32F10X_MD", // stm32f103c8t6 is medium-density device
        "USE_STDPERIPH_DRIVER"
    ]
    Properties {
        condition: cpp.debugInformation
        cpp.defines: outer.concat("DEBUG")
    }

    cpp.linkerScripts: [
        "../ldscripts/libs.ld",
        "../ldscripts/mem.ld",
        "../ldscripts/sections.ld",
    ]

    Group {
        name: "CMSIS"
        prefix: "../../libs/stm32f10x/CMSIS/CM3/"
        files: [
            "CoreSupport/*.c",
            "CoreSupport/*.h",
            "DeviceSupport/ST/STM32F10x/*.h",
            "DeviceSupport/ST/STM32F10x/*.c",
            "DeviceSupport/ST/STM32F10x/startup/gcc_ride7/startup_stm32f10x_md.s",
        ]
        cpp.cxxFlags: [ "-std=c++11" ]
        cpp.cFlags: [ "-std=gnu99" ]
            .concat((dump_asm ? [ "-save-temps=obj" ] : []))
        cpp.warningLevel: "all"
    }

    Group {
        name: "StdPeriph"
        prefix: "../../libs/stm32f10x/STM32F10x_StdPeriph_Driver/**/"
        files: [
            "*.c",
            "*.cpp",
            "*.h",
            "*.s"
        ]
        cpp.cxxFlags: [ "-std=c++11" ]
        cpp.cFlags: [ "-std=gnu99" ]
            .concat((dump_asm ? [ "-save-temps=obj" ] : []))
        cpp.warningLevel: "all"
    }

    Group {
        name: "ldscripts"
        prefix: "../ldscripts/"
        files: [
            "*.ld"
        ]
        fileTags: "linkerscript"
    }

    Group {
        name: "config"
        prefix: "../config/"
        files: [
            "*.c",
            "*.cpp",
            "*.h",
            "*.hpp",
        ]
        cpp.cxxFlags: [ "-std=c++11" ]
        cpp.cFlags: [ "-std=gnu99" ]
            .concat((dump_asm ? [ "-save-temps=obj" ] : []))
        cpp.warningLevel: "all"
    }

    Group {
        name: "sources"
        prefix: "../../src/**/"
        files: [
            "*.c",
            "*.cpp",
            "*.h",
            "*.s"
        ]
        cpp.cxxFlags: [ "-std=c++11" ]
        cpp.cFlags: [ "-std=gnu99" ]
            .concat((dump_asm ? [ "-save-temps=obj" ] : []))
        cpp.warningLevel: "all"
    }
}
