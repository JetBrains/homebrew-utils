# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Qodana < Formula
  desc "🔧 Run Qodana as fast as possible, with minimum effort required"
  homepage "https://github.com/JetBrains/qodana-cli"
  version "2024.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2024.1.1/qodana_darwin_x86_64.tar.gz"
      sha256 "b17cf85aaaa4f548178bf33f6ff50e4175f59ff1474e43ed20927a7cb666ff54"

      def install
        bin.install "qodana"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2024.1.1/qodana_darwin_arm64.tar.gz"
      sha256 "c82db40dcc8464e8e34ce625f4460b9fea57a58c5d37f7fd827a1cf829d6470e"

      def install
        bin.install "qodana"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2024.1.1/qodana_linux_x86_64.tar.gz"
      sha256 "3670e2e46a5677370fa0feddc6096bb02a00fc2fccb84e707b7382c5a126a433"

      def install
        bin.install "qodana"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2024.1.1/qodana_linux_arm64.tar.gz"
      sha256 "7e5a5a0889146e218479e036230275c3a372ca63596ef3ddb02c46e8303b9ff8"

      def install
        bin.install "qodana"
      end
    end
  end
end
