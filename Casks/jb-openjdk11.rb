cask 'jb-openjdk11' do
  version '11.0.4,304.69'
  sha256 '419ca38acca99582eccfca71c88f262703c7207eea19358b532916684e8bf41d'

  url "https://bintray.com/jetbrains/intellij-jbr/download_file?file_path=jbrsdk-#{version.before_comma.dots_to_underscores}-osx-x64-b#{version.after_comma}.tar.gz"

  name 'JetBrains OpenJDK Java Development Kit'
  homepage 'https://github.com/JetBrains/JetBrainsRuntime'

  artifact "jbrsdk", target: "/Library/Java/JavaVirtualMachines/jb-openjdk-#{version.before_comma}.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end
