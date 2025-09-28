class Rsworktree < Formula
  desc "CLI helper for managing Git worktrees under a dedicated .rsworktree directory"
  homepage "https://github.com/ozankasikci/rust-git-worktree"
  version "0.6.0"
  license "MIT"
  head "https://github.com/ozankasikci/rust-git-worktree.git", branch: "master"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.6.0/rsworktree-v0.6.0-macos-arm64.tar.gz"
      sha256 "a2bdb09a27825228c5f52bb603841cf9ad43f37e940114b787d1f691401384ae"
    else
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.6.0/rsworktree-v0.6.0-macos-x86_64.tar.gz"
      sha256 "fec9bfa8dbeead69a8c421e1542e25810a34777274f49d4bdd9e54dc29f76611"
    end
  else
    url "https://github.com/ozankasikci/rust-git-worktree/archive/refs/tags/v0.6.0.tar.gz"
    sha256 "78a31bf16d461c40668b07a0040532452881869ff46095a6941f4b19176d9ac3"
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
