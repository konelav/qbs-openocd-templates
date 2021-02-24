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
        "../../libs/stm32f4xx/CMSIS/Include",
        "../../libs/stm32f4xx/CMSIS/Device/ST/STM32F4xx/Include",
        "../../libs/stm32f4xx/STM32F4xx_StdPeriph_Driver/inc",
    ]
    cpp.defines: [
        "STM32F4XX",
        "STM32F40_41xxx", // for stm32f407vg
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
        prefix: "../../libs/stm32f4xx/CMSIS/"
        files: [
            "Include/*.h",
            "Device/ST/STM32F4xx/Include/*.h",
            "Device/ST/STM32F4xx/Source/Templates/gcc_ride7/startup_stm32f40xx.s",
        ]
        cpp.cxxFlags: [ "-std=c++11" ]
        cpp.cFlags: [ "-std=gnu99" ]
            .concat((dump_asm ? [ "-save-temps=obj" ] : []))
        cpp.warningLevel: "all"
    }
    /*
    Group {
        name: "DSP"
        prefix: "../../libs/stm32f4xx/CMSIS/DSP_Lib/Source/"
        files: [
            "*.c",
            "*.cpp",
            "*.h",
        ]
        cpp.cxxFlags: [ "-std=c++11" ]
        cpp.cFlags: [ "-std=gnu99" ]
            .concat((dump_asm ? [ "-save-temps=obj" ] : []))
        cpp.warningLevel: "all"
    }
    */
    Group {
        name: "StdPeriph"
        prefix: "../../libs/stm32f4xx/STM32F4xx_StdPeriph_Driver/**/"
        files: [
            "*.c",
            "*.cpp",
            "*.h",
            "*.s"
        ]
        excludeFiles: [
            "stm32f4xx_fmc.c"
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
