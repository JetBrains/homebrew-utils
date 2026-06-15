class KotlinLsp < Formula
  desc "Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "262.7569.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  # We don't want to support brew packages on Linux (On Linux, people should be using their native package managers)
  depends_on :macos

  on_macos do
    if Hardware::CPU.intel?
      url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}.sit",
          using: :nounzip
      sha256 "0fdc0f0d345a759e6ac1522217679d8c175f8182eab51705bb267ca926ae24e5"
    end
    if Hardware::CPU.arm?
      url "https://download-cdn.jetbrains.com/kotlin-lsp/#{version}/kotlin-server-#{version}-aarch64.sit",
          using: :nounzip
      sha256 "e3076b6500db8f1d40e087a80223ecbb3a14cf4fd2221e031c424a94c6094620"
    end
  end

  def install
    archive_name = "kotlin-server-#{version}"
    archive_name += "-aarch64" if Hardware::CPU.arm?

    system "unzip", "-q", "#{archive_name}.sit"
    libexec.install Dir["kotlin-server-#{version}/*"]
    bin.install_symlink "#{libexec}/bin/intellij-server" => "kotlin-lsp"
  end

  test do
    assert_match "LS-#{version}", shell_output("#{bin}/kotlin-lsp --version")
  end
end
