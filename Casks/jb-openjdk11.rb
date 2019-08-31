cask 'jb-openjdk11' do
  version '11.0.2,164'
  sha256 '5de2b44d0222ee22831ba6aff8f6e02a192b21f2720af60189b7e30085eeacfc'

  url "https://bintray.com/jetbrains/intellij-jdk/download_file?file_path=jbr-#{version.before_comma.dots_to_underscores}-osx-x64-b#{version.after_comma}.tar.gz"
  name 'JetBrains OpenJDK Java Development Kit'
  homepage 'https://github.com/JetBrains/JetBrainsRuntime'

  artifact "jdk", target: "/Library/Java/JavaVirtualMachines/jb-openjdk-#{version.before_comma}.jdk"

  uninstall rmdir: '/Library/Java/JavaVirtualMachines'
end
