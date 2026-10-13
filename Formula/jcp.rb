class Jcp < Formula
  desc "JetBrains Cloud Platform CLI"
  homepage "https://github.com/JetBrains/jcp-cli"
  version "0.8.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.2/jcp-aarch64-apple-darwin.tar.xz"
      sha256 "f29d827f9cb7254a19f7afe28ddc746011937313973797000a350b970c54770c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.2/jcp-x86_64-apple-darwin.tar.xz"
      sha256 "1b30d36ee627d4e7668cbcdd2cafce59eec86c48ebfbaca924e5716b82a8a4b6"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.2/jcp-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f94075f7f9586184a1b2822e1bbb0752e481f7cd89b49a3736a07ec2cd46d1cf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.2/jcp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6fdb137f2c4ce1d8ee4dde8d09600c8e8ab3e1c8fb025ffa8551f331e06a9019"
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
