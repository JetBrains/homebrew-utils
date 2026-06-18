class Jcp < Formula
  desc "JetBrains Cloud Platform CLI"
  homepage "https://github.com/JetBrains/jcp-cli"
  version "0.7.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.7.0/jcp-aarch64-apple-darwin.tar.xz"
      sha256 "723ab6b034f4a5042f157aa4c3674c3d96adf02f0bc56f269ab88925c4f71339"
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.7.0/jcp-x86_64-apple-darwin.tar.xz"
      sha256 "11fd773b5c1fbc4265b2971dcda14bd736fa21147d9cfea88e2a86d2b38e3272"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.7.0/jcp-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3aa2e3c0fe6a0a522ce5b39120a46bd28ce34f30beae1b84dbe61727fce59411"
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/jcp-cli/releases/download/v0.7.0/jcp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "de43fb8b8e9cb472d6bf085f70499cc091cc91c4f1ac96f8d919ad7a166596c5"
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
    bin.install "jcp" if OS.mac? && Hardware::CPU.arm?
    bin.install "jcp" if OS.mac? && Hardware::CPU.intel?
    bin.install "jcp" if OS.linux? && Hardware::CPU.arm?
    bin.install "jcp" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
