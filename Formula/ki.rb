class Ki < Formula
  desc "Extendable Kotlin interactive shell with code completion, and other features"
  homepage "https://github.com/Kotlin/kotlin-interactive-shell"
  url "https://github.com/Kotlin/kotlin-interactive-shell/releases/download/v0.3.3/ki-archive.zip"
  version "0.3.3"
  sha256 "7d4c4356390e69387fd0eae8c4607b1f0111aac236df880c081bf40f903119e7"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install "bin", "lib"
    rm Dir["#{libexec}/bin/*.bat"]
    bin.install Dir["#{libexec}/bin/*"]
    bin.env_script_all_files libexec/"bin", Language::Java.overridable_java_home_env
  end

  test do
    output = shell_output("#{bin}/ki.sh <<< '' 2>&1 | grep ki-shell")
    assert_match "ki-shell 0.3/1.4.32", output
  end
end
