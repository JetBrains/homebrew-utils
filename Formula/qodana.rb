# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Qodana < Formula
  desc "🔧 Run Qodana as fast as possible, with minimum effort required"
  homepage "https://github.com/JetBrains/qodana-cli"
  version "2022.3.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2022.3.2/qodana_darwin_x86_64.tar.gz"
      sha256 "a83ec03e6b60f0790d73b339fdcc867c9deae5463377b8592c48c8b237c30506"

      def install
        bin.install "qodana"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2022.3.2/qodana_darwin_arm64.tar.gz"
      sha256 "8fc1fe8ef419969cfcae5b90ca30f5604041676659c2cb2f89e161c4eff355f1"

      def install
        bin.install "qodana"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2022.3.2/qodana_linux_arm64.tar.gz"
      sha256 "74870ad073d0751a4b81e5e2050589cfc9ec2e425336aa3edbfeda81aa185a25"

      def install
        bin.install "qodana"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2022.3.2/qodana_linux_x86_64.tar.gz"
      sha256 "33c2819dae7762303d7a9087deabae1823de98d2bd2316271729aded8f4212ab"

      def install
        bin.install "qodana"
      end
    end
  end
end
