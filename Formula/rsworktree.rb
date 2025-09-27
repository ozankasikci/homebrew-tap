class Rsworktree < Formula
  desc "CLI helper for managing Git worktrees under a dedicated .rsworktree directory"
  homepage "https://github.com/ozankasikci/rust-git-worktree"
  version "0.5.1"
  license "MIT"
  head "https://github.com/ozankasikci/rust-git-worktree.git", branch: "master"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.5.1/rsworktree-v0.5.1-macos-arm64.tar.gz"
      sha256 "38c2179cce6f1df93d1b75cf9b0cbb018c35de3fd381aa129a36ea198d7a0dfa"
    else
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.5.1/rsworktree-v0.5.1-macos-x86_64.tar.gz"
      sha256 "599ce7e44c100435a7ea84e497ca12a2340441b166187743b8b43e14169a6c1e"
    end
  else
    url "https://github.com/ozankasikci/rust-git-worktree/archive/refs/tags/v0.5.1.tar.gz"
    sha256 "8c178ccfa8240889191199a846b0009fc906c9498c23d0c38976e8cdd510863c"
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
