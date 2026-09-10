class Jcp < Formula
  desc "JetBrains Cloud Platform CLI"
  homepage "https://github.com/JetBrains/jcp-cli"
  version "0.8.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.0/jcp-aarch64-apple-darwin.tar.xz"
      sha256 "699a52c440c3d41d37b09d7a1702e04c5079ab20598d1f9404385924c738dec7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.0/jcp-x86_64-apple-darwin.tar.xz"
      sha256 "e8efc5b012c33ed8b873b43c8f5d8af354d58f65a162f47925c1b1afb3d31d73"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.0/jcp-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a7cde7b310c4657bc033c0279a3f9f79723ffca33dbf3e8b093f5245d8413459"
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.0/jcp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "32fed6c5b8804b50d1782bfa27d2fbae02bf62906680b4c29dcfac750082fe1a"
    end
  end

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "jcp"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "jcp"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "jcp"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "jcp"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
