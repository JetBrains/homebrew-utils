class Cbs < Formula
  desc "Circlet Build System"
  homepage "https://jetbrains.team"

  url "https://github.com/JetBrains/rd/files/2146826/cbs-1.0.zip"
  sha256 "e89ebc8edcc78686e429eebd7727e98b5d318280b1a2b66460942f68a9984c6e"

  # depends_on "cmake" => :build

 def install
    prefix.install "lib"
    bin.install "bin/cbs"
 end

 test do
     system "#{bin}/cbs"
 end
end
