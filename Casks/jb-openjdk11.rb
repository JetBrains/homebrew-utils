cask 'jb-openjdk11' do
  version '11.0.5,646.7'
  sha256 '4cc5c0131538ec3e236a4561f9001ef2037b3fedf9f1393895d8b8b48d7122af'

  url "https://bintray.com/jetbrains/intellij-jbr/download_file?file_path=jbrsdk-#{version.before_comma.dots_to_underscores}-osx-x64-b#{version.after_comma}.tar.gz"

  name 'JetBrains OpenJDK Java Development Kit'
  homepage 'https://github.com/JetBrains/JetBrainsRuntime'

  artifact "jbrsdk", target: "/Library/Java/JavaVirtualMachines/jb-openjdk-#{version.before_comma}.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end
