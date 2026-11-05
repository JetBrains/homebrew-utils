class Jcp < Formula
  desc "JetBrains Cloud Platform CLI"
  homepage "https://github.com/JetBrains/jcp-cli"
  version "0.8.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.4/jcp-aarch64-apple-darwin.tar.xz"
      sha256 "5fb7a1c7c1e3aed4877dfa8d68ef11e0bddeddbd0755bd88880fe4fa3185795d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.4/jcp-x86_64-apple-darwin.tar.xz"
      sha256 "6a8f9c2fae240acd5e4a686c51b307697cb195844f061f1cbd522a9c3e81ff20"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.4/jcp-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "97df6de697290f064d63cdd42d44b1430f93d3b7887ebafbb793e50322c01c87"
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.4/jcp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "cf52df282bb29b92bb65cad4970e612bfb29bb389d248c4a8bd0f14ab50afc9c"
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
