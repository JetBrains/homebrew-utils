# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Qodana < Formula
  desc "🔧 Run Qodana as fast as possible, with minimum effort required"
  homepage "https://github.com/JetBrains/qodana-cli"
  version "0.7.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v0.7.2/qodana_0.7.2_Darwin_x86_64.tar.gz"
      sha256 "ebd9d23eb2c6f3ffa2b656ed6b3f1748dd447a5c36a0c8ce96d348b768021b33"

      def install
        bin.install "qodana"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v0.7.2/qodana_0.7.2_Darwin_arm64.tar.gz"
      sha256 "97112fd1644dede82a283e6958937cc9201201b14a58e17ab1ac866fe5bbeac4"

      def install
        bin.install "qodana"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v0.7.2/qodana_0.7.2_Linux_arm64.tar.gz"
      sha256 "d4182801480c793f01dd2a73362e6d998825bdd9346b294153619b8402d30fe8"

      def install
        bin.install "qodana"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v0.7.2/qodana_0.7.2_Linux_x86_64.tar.gz"
      sha256 "a35cbd6878042350f4e5d4ecade135343a1d9586ffcc8aaa9d981fb74a1d0168"

      def install
        bin.install "qodana"
      end
    end
  end
end
