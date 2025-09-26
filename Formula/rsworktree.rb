class Rsworktree < Formula
  desc "CLI helper for managing Git worktrees under a dedicated .rsworktree directory"
  homepage "https://github.com/ozankasikci/rust-git-worktree"
  url "https://github.com/ozankasikci/rust-git-worktree/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b85e1d87de6caf92d0b4a5965f60e55ff28da5b42cf8288852ff2aece8209756"
  license "MIT"
  head "https://github.com/ozankasikci/rust-git-worktree.git", branch: "master"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build
  depends_on "cmake" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rsworktree --version")
  end
end
