import qbs

Product {
    Depends { name: "cpp" }
    
    targetName: "mdr32f9qx.fw"
    destinationDirectory: "../../"
    
    cpp.commonCompilerFlags: [
        "-mcpu=cortex-m3",
        "-mthumb",
    ]
    cpp.linkerFlags: [
        "-mcpu=cortex-m3",
        "-mthumb",
        "-specs=nosys.specs",
    ]
}
