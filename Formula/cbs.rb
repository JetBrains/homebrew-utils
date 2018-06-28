class Cbs < Formula
  desc "Circlet Build System"
  homepage "https://jetbrains.team"

  url "https://github.com/JetBrains/rd/files/2147089/cbs-1.0.2.zip"
  sha256 "0dc359124dcf25bb8f977675652992b87f0adff9eb0b301053b1752ff62b1da3"

  def install
    prefix.install "lib"
    bin.install "bin/cbs"
  end

  test do
    system "#{bin}/cbs"
  end
end
