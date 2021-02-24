import qbs

Product {
    Depends { name: "cpp" }
    
    targetName: "stm32f10x.fw"
    destinationDirectory: "../../"
    
    cpp.commonCompilerFlags: [
        "-mcpu=cortex-m3",
        "-mthumb",
    ]
    cpp.linkerFlags: [
        "-mcpu=cortex-m3",
        "-mthumb",
    ]
}
