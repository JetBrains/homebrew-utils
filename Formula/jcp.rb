class Jcp < Formula
  desc "JetBrains Cloud Platform CLI"
  homepage "https://github.com/JetBrains/jcp-cli"
  version "0.8.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.1/jcp-aarch64-apple-darwin.tar.xz"
      sha256 "ee2cefa8d0cc8396e3f892e0b811f68a5cf2afbe8fc905471df1252e7d346f0c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.1/jcp-x86_64-apple-darwin.tar.xz"
      sha256 "b93c385e825c94814445d004672ee0b6d08018e1d533291f3d39b232f38246af"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.1/jcp-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d45e34e5939f8591f5055aac7b6a494e0d45a51c909be5f326b7722405c2c1cb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.8.1/jcp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "002d4a143d6d3b4c39b3982e71a81aa94b95d1019b84c66adc4cef90627ab76c"
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
