cask 'jb-openjdk11' do
  version '11.0.6,765.1'
  sha256 '4f4005135ae5159d5a7e349c528e6038deba37a7099dd0d61c6025d6cc582186'

  url "https://bintray.com/jetbrains/intellij-jbr/download_file?file_path=jbrsdk-#{version.before_comma.dots_to_underscores}-osx-x64-b#{version.after_comma}.tar.gz"

  name 'JetBrains OpenJDK Java Development Kit'
  homepage 'https://github.com/JetBrains/JetBrainsRuntime'

  artifact "jbrsdk", target: "/Library/Java/JavaVirtualMachines/jb-openjdk-#{version.before_comma}.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end
