class Bunches < Formula
  desc "Set of utils for supporting patchsets branches"
  homepage "https://github.com/JetBrains/bunches"
  url "https://github.com/JetBrains/bunches/releases/download/v0.9.0/bunch-0.9.0.zip"
  sha256 "df43a2a0a1fc4ad1f1bbe077a25c0c066790c21b7d6910954787da1d826f3b19"

  def install
   prefix.install "lib"
   bin.install "bin/bunch"
  end

  test do
    system "#{bin}/bunch"
  end
end
