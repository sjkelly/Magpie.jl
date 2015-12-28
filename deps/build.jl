#! /usr/bin/env julia

#version
include("version.jl")

# check for Hardware-Dimensions
!isdir("Hardware-Dimensions") && mkdir("Hardware-Dimensions")

# check for latest tag folder
!isdir("Hardware-Dimensions/v$ver") &&
download("https://github.com/FactoryOS/Hardware-Dimensions/archive/v$ver.zip",
         "Hardware-Dimensions/v$ver.zip")

@unix_only begin
    run(`unzip Hardware-Dimensions/v$ver.zip -d Hardware-Dimensions`)
    # extracted as Hardware-dimensions-x.x.x
    mv("Hardware-Dimensions/Hardware-Dimensions-$ver",
       "Hardware-Dimensions/v$ver")
end
