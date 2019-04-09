class Bunches < Formula
  desc "Set of utils for supporting patchsets branches"
  homepage "https://github.com/JetBrains/bunches"
  url "https://github.com/JetBrains/bunches/releases/download/v0.9.1/bunch-cli-0.9.1.zip"
  sha256 "204c03179eff071e3eadcfa681868f3303026f301427ffcdd9d75956650c663a"

  def install
    prefix.install "lib"
    bin.install "bin/bunch"
  end

  test do
    system "#{bin}/bunch"
  end
end
