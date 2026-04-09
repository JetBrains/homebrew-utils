class KotlinLsp < Formula
  desc "Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "262.2310.0"
  license "Apache-2.0"

  livecheck do
    url "https://raw.githubusercontent.com/Kotlin/kotlin-lsp/refs/heads/main/RELEASES.md"
    regex(/^(?:#)+\s*v(.*)$/i)
  end

  # We don't want to support brew packages on Linux (On Linux, people should be using their native package managers)
  depends_on :macos

  on_macos do
    if Hardware::CPU.intel?
      url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-lsp-#{version}-mac-x64.zip"
      sha256 "a4ccf591664cfef6a12f21a690d23bad26b92de62ed34674491b915f25f95bf5"

      def install
        chmod "+x", "kotlin-lsp.sh"
        libexec.install Dir["*"]
        bin.install_symlink "#{libexec}/kotlin-lsp.sh" => "kotlin-lsp"
      end
    end
    if Hardware::CPU.arm?
      url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-lsp-#{version}-mac-aarch64.zip"
      sha256 "11560eb4ecd766204363848cc5ee84b51c0fd03fbfd4bbedaba0f00af74309c7"

      def install
        chmod "+x", "kotlin-lsp.sh"
        libexec.install Dir["*"]
        bin.install_symlink "#{libexec}/kotlin-lsp.sh" => "kotlin-lsp"
      end
    end
  end

  test do
    # kotlin-lsp doesn't have --version flag
    assert_equal "Usage: kotlin-lsp [OPTIONS]", shell_output("#{bin}/kotlin-lsp -h").split("\n").first
  end
end
