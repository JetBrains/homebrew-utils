class KotlinLsp < Formula
  desc "Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "263.7084.0"
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
      sha256 "b29c393a5e541153d03d626e7946268437e358a667a5f914a126dbb4007664b1"
    end
    if Hardware::CPU.arm?
      url "https://download.jetbrains.com/language-server/kotlin-server/#{version}/kotlin-server-#{version}-aarch64.sit",
          using: :nounzip
      sha256 "b403bf8a54bd458e3ba6731cf8abb3340be08b439c03576dfc02b13faf3694b8"
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
