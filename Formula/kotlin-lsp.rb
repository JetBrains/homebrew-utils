class KotlinLsp < Formula
  desc "Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "262.1668.0"
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
      sha256 "df5358441b048cf93e26cfa4a6c9a2042556b87f1a2917642b613235801298f0"

      def install
        chmod "+x", "kotlin-lsp.sh"
        libexec.install Dir["*"]
        bin.install_symlink "#{libexec}/kotlin-lsp.sh" => "kotlin-lsp"
      end
    end
    if Hardware::CPU.arm?
      url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-lsp-#{version}-mac-aarch64.zip"
      sha256 "75cdce1274ad9334ec2ac5355f3be8656712fa4f7c5ad9875a9c7e3652a5c9de"

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
