class Cbs < Formula
  desc "Circlet Build System"
  homepage "https://jetbrains.team"

  url "https://github.com/JetBrains/rd/files/2146916/cbs-1.0.1.zip"
  sha256 "97bdec1842abd1904867c0656fb23b2d4632298147b3f2ecf769619d9e75f98f"

  # depends_on "cmake" => :build

 def install
    prefix.install "lib"
    bin.install "bin/cbs"
 end

 test do
     system "#{bin}/cbs"
 end
end
