{
  config,
  pkgs,
  pkgs-stable,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./packages
  ];

  home = {
    username = "matyashorvath";
    homeDirectory = "/home/matyashorvath";

    sessionPath = [
      "$HOME/Scripts/global"
      "$HOME/Scripts/local"
      "/opt/st/stm32cubeclt_1.22.0_2"
      "/opt/st/stm32cubeclt_1.22.0_2/STM32CubeProgrammer/bin"
      "/opt/st/stm32cubeclt_1.22.0_2/STLink-gdb-server/bin"
      "/opt/st/stm32cubeclt_1.22.0_2/CMake/bin"
      "/opt/st/stm32cubeclt_1.22.0_2/Make/bin"
      "/opt/st/stm32cubeclt_1.22.0_2/Ninja/bin:/opt/st/stm32cubeclt_1.22.0_2/st-arm-clang/bin"
      "/opt/st/stm32cubeclt_1.22.0_2/GNU-tools-for-STM32/bin"
    ];

    sessionVariables = {
      NIXOS_OZONE_WL = lib.mkForce null;
      CLANG_GCC_CMSIS_COMPILER = "/opt/st/stm32cubeclt_1.22.0_2/st-arm-clang";
      GCC_TOOLCHAIN_ROOT = "/opt/st/stm32cubeclt_1.22.0_2/GNU-tools-for-STM32/bin";
    };

    stateVersion = "24.11";
  };
}
