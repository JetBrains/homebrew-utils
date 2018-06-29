class Cbs < Formula
  desc "Circlet Build System"
  homepage "https://jetbrains.team"

  url "https://bintray.com/serjic/cbs/download_file?file_path=cbs-1.0.6.zip"
  sha256 "b3cf1f28c3a5ae94a0b41077acf106d92fb6db4dec9bd957cc42bb18a7845766"
  
  def install
    prefix.install "lib"
    bin.install "bin/cbs"
  end

  test do
    system "#{bin}/cbs"
  end
end
