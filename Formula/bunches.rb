class Bunches < Formula
  desc "Set of utils for supporting patchsets branches"
  homepage "https://github.com/JetBrains/bunches"
  url "https://github.com/JetBrains/bunches/releases/download/v1.0.100/bunch-cli-1.0.100.zip"
  sha256 "6231528a23c1e82112b8399648ed89dacd518edbec79ec5bc8a690da2ca41b73"

  def install
    prefix.install "lib"
    bin.install "bin/bunch"
  end

  test do
    system "#{bin}/bunch"
  end
end
