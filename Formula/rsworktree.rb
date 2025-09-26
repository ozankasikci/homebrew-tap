class Rsworktree < Formula
  desc "CLI helper for managing Git worktrees under a dedicated .rsworktree directory"
  homepage "https://github.com/ozankasikci/rust-git-worktree"
  version "0.2.0"
  license "MIT"
  head "https://github.com/ozankasikci/rust-git-worktree.git", branch: "master"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.2.0/rsworktree-v0.2.0-macos-arm64.tar.gz"
      sha256 "3b8659e4506e0ab0fd21b77528b2b7c26dfb40027220bdc80b467e745de85f2f"
    else
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.2.0/rsworktree-v0.2.0-macos-x86_64.tar.gz"
      sha256 "1643a62296e2cf91cf8ff7d8f854518912b19f3a7393169417ff536fdc6c437f"
    end
  else
    url "https://github.com/ozankasikci/rust-git-worktree/archive/refs/tags/v0.2.0.tar.gz"
    sha256 "b85e1d87de6caf92d0b4a5965f60e55ff28da5b42cf8288852ff2aece8209756"
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
