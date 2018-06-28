class Cbs < Formula
  desc "Circlet Build System"
  homepage "https://jetbrains.team"
  url "https://github.com/JetBrains/homebrew-utils/files/2146787/cbs-1.0.zip"
  sha256 "38ac0fbb4ef002195c735c5822d1c1413c233b263dbc8411d0c1d61d611ae78f"
  # depends_on "cmake" => :build

 def install
    prefix.install "lib"
    bin.install "bin/bunch"
 end

 test do
     system "#{bin}/bunch"
 end
end
