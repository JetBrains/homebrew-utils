class Cbs < Formula
  desc "Circlet Build System"
  homepage "https://jetbrains.team"

  url "https://bintray.com/serjic/cbs/download_file?file_path=cbs-1.0.5.zip"
  sha256 "49e4fd6e8676f5545fe049cccdef71c1e70a646953c7a1e96dd766aecbf89ec1"
  
  def install
    prefix.install "lib"
    bin.install "bin/cbs"
  end

  test do
    system "#{bin}/cbs"
  end
end
