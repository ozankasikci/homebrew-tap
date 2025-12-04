class Unport < Formula
  desc "Local development port manager with automatic domain routing"
  homepage "https://github.com/ozankasikci/unport"
  version "0.4.0"
  license "MIT"

  url "https://github.com/ozankasikci/unport/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "6c4415cecaf1055e4cd8d9abc8bbed1769b5c94365664bb30f05bb716ce8947f"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unport --version")
  end
end
