class KotlinLsp < Formula
  desc "Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "271.2085.0"
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
      sha256 "68457ab1825331e3eac85191b7c32737cbd8993867f5a9c50dfe012c5509e8f7"
    end
    if Hardware::CPU.arm?
      url "https://download.jetbrains.com/language-server/kotlin-server/#{version}/kotlin-server-#{version}-aarch64.sit",
          using: :nounzip
      sha256 "2d22388f58be6f4dfa7a8f18c1e231871164dcacc16e407559029d7232816b4a"
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
