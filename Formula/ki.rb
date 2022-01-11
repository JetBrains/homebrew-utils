# Generated with JReleaser 0.10.0 at 2022-01-11T12:06:29.074575+03:00
class Ki < Formula
  desc "ki shell"
  homepage "https://github.com/Kotlin/kotlin-interactive-shell"
  url "https://github.com/Kotlin/kotlin-interactive-shell/releases/download/v0.4.0/ki-archive.zip"
  version "0.4.0"
  sha256 "290e02f9675a7ea5bbe8c5ca0d1041ebf2b89da20ea18bfe3e10d3661784603a"
  license "Apache-2"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/ki"
  end

  test do
    output = shell_output("#{bin}/ki --version")
    assert_match "0.4.0", output
  end
end
