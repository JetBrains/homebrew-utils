class KotlinLsp < Formula
  desc "Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "262.9593.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  # We don't want to support brew packages on Linux (On Linux, people should be using their native package managers)
  depends_on :macos

  on_macos do
    if Hardware::CPU.intel?
      url "https://download-cdn.jetbrains.com/language-server/kotlin-server/#{version}/kotlin-server-#{version}.sit",
          using: :nounzip
      sha256 "17369fda97c85418ac24ab38a9df56b21522a3468dfe193832fe455c13920745"
    end
    if Hardware::CPU.arm?
      url "https://download-cdn.jetbrains.com/language-server/kotlin-server/#{version}/kotlin-server-#{version}-aarch64.sit",
          using: :nounzip
      sha256 "6ba6021a706b21e64cef33f7e2b79f187c0910320722bb2d3ed05ad1115ec43f"
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
