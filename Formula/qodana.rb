# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Qodana < Formula
  desc "🔧 Run Qodana as fast as possible, with minimum effort required"
  homepage "https://github.com/JetBrains/qodana-cli"
  version "2022.3.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2022.3.5/qodana_darwin_x86_64.tar.gz"
      sha256 "a342f2205a25ead8052543ba164739954974c6b7185db82d543c60bf448e672a"

      def install
        bin.install "qodana"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2022.3.5/qodana_darwin_arm64.tar.gz"
      sha256 "b63fbc37340fa58318f61566cbaab528432d0a4733a365a4cda4dff78553997e"

      def install
        bin.install "qodana"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2022.3.5/qodana_linux_arm64.tar.gz"
      sha256 "bcd735351400acedb648849df6ce58fa22960f7227fb01a0518675d00f0c7e13"

      def install
        bin.install "qodana"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/JetBrains/qodana-cli/releases/download/v2022.3.5/qodana_linux_x86_64.tar.gz"
      sha256 "db6c4ae055afa5f564d9f1527fa5d3e8e6fb0add28fd50b0d50c379130745687"

      def install
        bin.install "qodana"
      end
    end
  end
end
