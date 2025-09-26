class Rsworktree < Formula
  desc "CLI helper for managing Git worktrees under a dedicated .rsworktree directory"
  homepage "https://github.com/ozankasikci/rust-git-worktree"
  version "0.2.0"
  license "MIT"
  head "https://github.com/ozankasikci/rust-git-worktree.git", branch: "master"

  if Hardware::CPU.arm?
    url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.2.0/rsworktree-v0.2.0-macos-arm64.tar.gz"
    sha256 "a98c9f9b3bd9f6a77dd81b5b5f5674cdef04f331a3f21c66e5be8e9c7fce1e12"
  else
    url "https://github.com/ozankasikci/rust-git-worktree/archive/refs/tags/v0.2.0.tar.gz"
    sha256 "b85e1d87de6caf92d0b4a5965f60e55ff28da5b42cf8288852ff2aece8209756"
  end

  depends_on "cmake" => :build unless Hardware::CPU.arm?
  depends_on "pkg-config" => :build unless Hardware::CPU.arm?
  depends_on "rust" => :build unless Hardware::CPU.arm?

  def install
    if Hardware::CPU.arm?
      bin.install "rsworktree"
    else
      system "cargo", "install", *std_cargo_args(path: ".")
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rsworktree --version")
  end
end
