class Unport < Formula
  desc "Local development port manager with automatic domain routing and HTTPS support"
  homepage "https://github.com/ozankasikci/unport"
  version "0.5.0"
  license "MIT"

  url "https://github.com/ozankasikci/unport/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "768c61589fb559c03bf3267ae2e60be6ccf3ddae02448509563bd62df5d6fd4a"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unport --version")
  end
end
