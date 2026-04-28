{ pkgs, ... }:

let
  java =
    if pkgs ? jdk26_headless then
      pkgs.jdk26_headless
    else if pkgs ? jdk26 then
      pkgs.jdk26
    else
      pkgs.jdk25_headless;
in
{
  home.packages = with pkgs; [
    java

    # Build tools
    maven
    gradle

    # Java development tools
    jdt-language-server
    lombok
    checkstyle
    google-java-format
    spring-boot-cli
  ];

  home.sessionVariables = {
    JAVA_HOME = "${java.home}";
  };
}
