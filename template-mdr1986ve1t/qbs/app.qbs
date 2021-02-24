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
        "../../libs/mdr32f9qx/CMSIS/CM1/CoreSupport",
        "../../libs/mdr32f9qx/CMSIS/CM1/DeviceSupport/MDR1986VE1T/inc",
        "../../libs/mdr32f9qx/CMSIS/CM1/DeviceSupport/MDR1986VE1T/startup",
        "../../libs/mdr32f9qx/MDR32F9Qx_StdPeriph_Driver/inc",
        "../../libs/mdr32f9qx/MDR32F9Qx_StdPeriph_Driver/inc/USB_Library",
    ]
    cpp.defines: [
        "USE_MDR1986VE1T",
        "USE_STDPERIPH_DRIVER"
    ]
    Properties {
        condition: cpp.debugInformation
        cpp.defines: outer.concat("DEBUG")
    }

    cpp.linkerScripts: [
        "../ldscripts/MDR32F9Qx.ld",
    ]

    Group {
        name: "CMSIS"
        prefix: "../../libs/mdr32f9qx/CMSIS/CM1/"
        files: [
            "CoreSupport/*.h",
            "DeviceSupport/MDR1986VE1T/inc/*.h",
            "DeviceSupport/MDR1986VE1T/startup/*.h",
            "DeviceSupport/MDR1986VE1T/startup/*.c",
            "DeviceSupport/MDR1986VE1T/startup/gcc/startup_MDR1986VE1T.S",
        ]
        cpp.cxxFlags: [ "-std=c++11" ]
        cpp.cFlags: [ "-std=gnu99" ]
            .concat((dump_asm ? [ "-save-temps=obj" ] : []))
        cpp.warningLevel: "all"
    }

    Group {
        name: "StdPeriph"
        prefix: "../../libs/mdr32f9qx/MDR32F9Qx_StdPeriph_Driver/*/"
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
