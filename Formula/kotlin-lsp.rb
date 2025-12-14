class KotlinLsp < Formula
  desc "Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "261.13587.0"
  license "Apache-2.0"

  livecheck do
    url "https://raw.githubusercontent.com/Kotlin/kotlin-lsp/refs/heads/main/RELEASES.md"
    regex(/^(?:#)+\s*v(.*)$/i)
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-lsp-#{version}-mac-x64.zip"
      sha256 "a3972f27229eba2c226060e54baea1c958c82c326dfc971bf53f72a74d0564a3"

      def install
        chmod "+x", "kotlin-lsp.sh"
        libexec.install Dir["*"]
        bin.install_symlink "#{libexec}/kotlin-lsp.sh" => "kotlin-lsp"
      end
    end
    if Hardware::CPU.arm?
      url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-lsp-#{version}-mac-aarch64.zip"
      sha256 "d4ea28b22b29cf906fe16d23698a8468f11646a6a66dcb15584f306aaefbee6c"

      def install
        chmod "+x", "kotlin-lsp.sh"
        libexec.install Dir["*"]
        bin.install_symlink "#{libexec}/kotlin-lsp.sh" => "kotlin-lsp"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-lsp-#{version}-linux-x64.zip"
        sha256 "dc0ed2e70cb0d61fdabb26aefce8299b7a75c0dcfffb9413715e92caec6e83ec"

        def install
          chmod "+x", "kotlin-lsp.sh"
          libexec.install Dir["*"]
          bin.install_symlink "#{libexec}/kotlin-lsp.sh" => "kotlin-lsp"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-lsp-#{version}-linux-aarch64.zip"
        sha256 "d1dceb000fe06c5e2c30b95e7f4ab01d05101bd03ed448167feeb544a9f1d651"

        def install
          chmod "+x", "kotlin-lsp.sh"
          libexec.install Dir["*"]
          bin.install_symlink "#{libexec}/kotlin-lsp.sh" => "kotlin-lsp"
        end
      end
    end
  end

  test do
    # kotlin-lsp doesn't have --version flag
    assert_equal "Usage: kotlin-lsp [OPTIONS]", shell_output("#{bin}/kotlin-lsp -h").split("\n").first
  end
end
