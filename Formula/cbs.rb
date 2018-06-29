class Cbs < Formula
  desc "Circlet Build System"
  homepage "https://jetbrains.team"

  url "https://dl.bintray.com/serjic/cbs/cbs-1.0.4.zip"
  sha256 "66b90c5618f8321f63368ed8fc538285be8bdb84157465ea07df89d79998db2d"
  
  def install
    prefix.install "lib"
    bin.install "bin/cbs"
  end

  test do
    system "#{bin}/cbs"
  end
end
