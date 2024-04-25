# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Qodana < Formula
  desc "🔧 Run Qodana as fast as possible, with minimum effort required"
  homepage "https://github.com/JetBrains/qodana-cli"
  version "2024.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2024.1.2/qodana_darwin_x86_64.tar.gz"
      sha256 "dcd8ff47168e5536ac6bc2923280df408f024f3066c9cbcd1c7787e7124b695f"

      def install
        bin.install "qodana"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2024.1.2/qodana_darwin_arm64.tar.gz"
      sha256 "bd19406b2368c4db96ffc69edb475a92b4432d2cb90b51431c19921b192ce21f"

      def install
        bin.install "qodana"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2024.1.2/qodana_linux_x86_64.tar.gz"
      sha256 "85dfee4e9840ec34193f0944809fc388c69c7d2a5aed8e0fc94e49dc019a8db2"

      def install
        bin.install "qodana"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2024.1.2/qodana_linux_arm64.tar.gz"
      sha256 "8e1787f802ba7d35381467e66edd5a330017111011b03e7f3549d5f51641b9d2"

      def install
        bin.install "qodana"
      end
    end
  end
end
