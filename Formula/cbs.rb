class Cbs < Formula
  desc "Circlet Build System"
  homepage "https://jetbrains.team"

  url "https://dl.bintray.com/serjic/cbs/cbs-1.0.3.zip"
  sha256 "8c3fc963dced92ed4983df523b10aba7188e43115765839a86d46ec1f2d8ded9"

  def install
    prefix.install "lib"
    bin.install "bin/cbs"
  end

  test do
    system "#{bin}/cbs"
  end
end
