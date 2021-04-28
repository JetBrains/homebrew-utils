class Ki < Formula
  desc "ki shell"
  homepage "https://github.com/Kotlin/kotlin-interactive-shell"
  version "0.3.3"
  url "https://github.com/Kotlin/kotlin-interactive-shell/releases/download/v0.3.3/ki-archive.zip"
  sha256 "7d4c4356390e69387fd0eae8c4607b1f0111aac236df880c081bf40f903119e7"
  license "Apache-2"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    rm Dir["#{libexec}/bin/*.bat"]
    bin.install_symlink "#{libexec}/bin/*"
  end

  test do
    output = shell_output("#{bin}/bin/ki.sh <<< '' 2>&1 | grep ki-shell")
    assert_match "ki-shell 0.3/1.4.32", output
  end
end