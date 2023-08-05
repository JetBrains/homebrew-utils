# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Qodana < Formula
  desc "🔧 Run Qodana as fast as possible, with minimum effort required"
  homepage "https://github.com/JetBrains/qodana-cli"
  version "2023.2.6"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/JetBrains/qodana-cli/releases/download/v2023.2.6/qodana_darwin_all.tar.gz"
    sha256 "87c7ccc831467ccf0824acf409a87f5bf6c13bdcf3947efecad94b729cd0ed3d"

    def install
      bin.install "qodana"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2023.2.6/qodana_linux_arm64.tar.gz"
      sha256 "8d35a69d54ba70da3c4ed1fc68579e367ad7c9fc822ae606116474a80a7027e5"

      def install
        bin.install "qodana"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2023.2.6/qodana_linux_x86_64.tar.gz"
      sha256 "7370e7c0158102c0778c5dfe34a3f507abddafeccc0171597f8222784defe370"

      def install
        bin.install "qodana"
      end
    end
  end
end
