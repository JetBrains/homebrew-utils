class KotlinLsp < Formula
  desc "Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "0.253.10629"
  url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-#{version}.zip"
  sha256 "afa071874081f644ea6a85b4a864576effb6afa8ee30ee7511199cdccdac379c"
  license "Apache-2.0"

  livecheck do
    url "https://raw.githubusercontent.com/Kotlin/kotlin-lsp/refs/heads/main/RELEASES.md"
    regex(/^(?:#)+\s*v(.*)$/i)
  end

  depends_on "openjdk"

  def install
    chmod "+x", "kotlin-lsp.sh"
    libexec.install Dir["*"]

    # write_env_script is private API https://rubydoc.brew.sh/Pathname#write_env_script-instance_method
    # Alternative:
    #   bin.install_symlink "#{libexec}/kotlin-lsp.sh" => "kotlin-lsp"
    (bin/"kotlin-lsp").write_env_script "#{libexec}/kotlin-lsp.sh", Language::Java.overridable_java_home_env
  end

  test do
    # kotlin-lsp doesn't have --version flag
    assert_equal "Usage: kotlin-lsp [OPTIONS]", shell_output("#{bin}/kotlin-lsp -h").split("\n").first
  end
end
