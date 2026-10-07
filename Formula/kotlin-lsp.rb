class KotlinLsp < Formula
  desc "Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "263.6379.0"
  license "Apache-2.0"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  # We don't want to support brew packages on Linux (On Linux, people should be using their native package managers)
  depends_on :macos

  on_macos do
    if Hardware::CPU.intel?
      url "https://download.jetbrains.com/language-server/kotlin-server/#{version}/kotlin-server-#{version}.sit",
          using: :nounzip
      sha256 "e69e0c9d27b915b2db9ee692ec08d097df1a394d9f21190457ef199f2905f77e"
    end
    if Hardware::CPU.arm?
      url "https://download.jetbrains.com/language-server/kotlin-server/#{version}/kotlin-server-#{version}-aarch64.sit",
          using: :nounzip
      sha256 "ebef2e13cd4adc4ec9e04084b848000a3ec7a9d2917c64f269574ce2efe9ecad"
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
    assert_match version.to_s, shell_output("#{bin}/kotlin-lsp --version")
  end
end
