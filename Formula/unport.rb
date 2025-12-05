class Unport < Formula
  desc "Local development port manager with automatic domain routing"
  homepage "https://github.com/ozankasikci/unport"
  version "0.4.1"
  license "MIT"

  url "https://github.com/ozankasikci/unport/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "4b7f708ed27876bea06f1a08ca3dcfe3bc1bddbdbcbafb5c01300054b211f2ad"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unport --version")
  end
end
