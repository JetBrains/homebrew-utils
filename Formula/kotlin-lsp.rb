class KotlinLsp < Formula
  desc "Official Language Server Protocol for the Kotlin language"
  homepage "https://github.com/Kotlin/kotlin-lsp"
  version "263.4421.0"
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
      sha256 "af5955a0dd9ef170e3dbaed5462a48a49b9470044c07b3adb8331018b306c0a5"
    end
    if Hardware::CPU.arm?
      url "https://download-cdn.jetbrains.com/language-server/kotlin-server/#{version}/kotlin-server-#{version}-aarch64.sit",
          using: :nounzip
      sha256 "ee1465de41e4310998a414932d5b0131e2159a717b3189dfdb51ffaa32c0f268"
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
