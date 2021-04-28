class Ki < Formula
  desc "ki shell"
  homepage "https://github.com/Kotlin/kotlin-interactive-shell"
  version "0.3.2"
  url "https://github.com/Kotlin/kotlin-interactive-shell/releases/download/v0.3.2/ki-archive.zip"
  sha256 "e8447c19738d0daf75aa7ffabe5f3b64875ecfe5b9daae3840778af1313eaf12"
  license "Apache-2"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    rm Dir["#{libexec}/bin/*.bat"]
    bin.install_symlink "#{libexec}/bin/ki.sh"
  end

  test do
    output = shell_output("#{bin}/bin/ki.sh <<< '' 2>&1 | grep ki-shell")
    assert_match "ki-shell 0.3/1.4.21", output
  end
end
