class Bunches < Formula
  desc "Set of utils for supporting patchsets branches"
  homepage "https://github.com/JetBrains/bunches"
  url "https://github.com/JetBrains/bunches/releases/download/v1.0.73/bunch-cli-1.0.73.zip"
  sha256 "43ba811a016441734753ec4dde7cb57bc0933d28b2f2d8f8f78cf61daa5d8f77"

  def install
    prefix.install "lib"
    bin.install "bin/bunch"
  end

  test do
    system "#{bin}/bunch"
  end
end
