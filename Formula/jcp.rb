class Jcp < Formula
  desc "JetBrains Cloud Platform CLI"
  homepage "https://github.com/bazhenov/jcp-cli"
  version "0.6.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bazhenov/jcp-cli/releases/download/v0.6.1/jcp-aarch64-apple-darwin.tar.xz"
      sha256 "b16a8c79e9856573d5e6ebcd2b728523b76a389c7cc8edba431d4a597a4a8826"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bazhenov/jcp-cli/releases/download/v0.6.1/jcp-x86_64-apple-darwin.tar.xz"
      sha256 "452d7420ebf87f01b309dcc0145d22c540a88e533f2d6c418a84f7403ade7bcd"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/bazhenov/jcp-cli/releases/download/v0.6.1/jcp-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "39557d1b47166464850b48cc3dc8bda2896e50d2661a52ec919b2e50ff945fe1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bazhenov/jcp-cli/releases/download/v0.6.1/jcp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f07e05b08fa89ae78baec36724a20be9bd3102e11cc8336b15694c54708fa46a"
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
