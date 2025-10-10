class Rsworktree < Formula
  desc "CLI helper for managing Git worktrees under a dedicated .rsworktree directory"
  homepage "https://github.com/ozankasikci/rust-git-worktree"
  version "0.6.4"
  license "MIT"
  head "https://github.com/ozankasikci/rust-git-worktree.git", branch: "master"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.6.4/rsworktree-v0.6.4-macos-arm64.tar.gz"
      sha256 "b1aaaf2dd52dc4882671561b417a5e4bb36b8a0ee99211269418a865170bc4c7"
    else
      url "https://github.com/ozankasikci/rust-git-worktree/archive/refs/tags/v0.6.4.tar.gz"
      sha256 "6ce3d66cd65202cc75a6e8f4cf06e20f2b9c9b81ac14a9f8506dc96601c6c130"
    end
  else
    url "https://github.com/ozankasikci/rust-git-worktree/archive/refs/tags/v0.6.4.tar.gz"
    sha256 "6ce3d66cd65202cc75a6e8f4cf06e20f2b9c9b81ac14a9f8506dc96601c6c130"
  end

  unless OS.mac?
    depends_on "cmake" => :build
    depends_on "pkg-config" => :build
    depends_on "libgit2"
    depends_on "openssl@3"
    depends_on "rust" => :build
  end

  def install
    if OS.mac?
      bin.install "rsworktree"
    else
      system "cargo", "install", *std_cargo_args(path: ".")
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rsworktree --version")
  end
end
