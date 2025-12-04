class Rsworktree < Formula
  desc "CLI helper for managing Git worktrees under a dedicated .rsworktree directory"
  homepage "https://github.com/ozankasikci/rust-git-worktree"
  version "0.7.1"
  license "MIT"
  head "https://github.com/ozankasikci/rust-git-worktree.git", branch: "master"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.7.1/rsworktree-v0.7.1-macos-arm64.tar.gz"
      sha256 "3e588311d545f8dea9e98298079b89e345b0e14343cb6dd4f5bcab324a9610ce"
    else
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.7.1/rsworktree-v0.7.1-macos-x86_64.tar.gz"
      sha256 "219aaaf8d62662969c4fce1de67ba214f481a8f18385988479e117a5a08fd35b"
    end
  else
    url "https://github.com/ozankasikci/rust-git-worktree/archive/refs/tags/v0.7.1.tar.gz"
    sha256 "0a6209685613254d7ede586194f1282634ecc168355934b3b9eab61c13e79591"
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
