import qbs

Product {
    Depends { name: "cpp" }

    targetName: "mdr1986ve1t.fw"
    destinationDirectory: "../../"

    cpp.commonCompilerFlags: [
        "-mcpu=cortex-m1",
        "-mthumb",
        "-mtune=cortex-m1",
    ]
    cpp.linkerFlags: [
        "-mcpu=cortex-m1",
        "-mthumb",
        "-specs=nosys.specs",
    ]
}
