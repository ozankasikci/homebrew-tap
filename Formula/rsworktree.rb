class Rsworktree < Formula
  desc "CLI helper for managing Git worktrees under a dedicated .rsworktree directory"
  homepage "https://github.com/ozankasikci/rust-git-worktree"
  version "0.7.0"
  license "MIT"
  head "https://github.com/ozankasikci/rust-git-worktree.git", branch: "master"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.7.0/rsworktree-v0.7.0-macos-arm64.tar.gz"
      sha256 "a291014bd441496ec4d8da979e0cba6d73f53569d37e0ec843047efc3426eac8"
    else
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.7.0/rsworktree-v0.7.0-macos-x86_64.tar.gz"
      sha256 "587e33e7120799ae443212c44897949925f28ae2a89f08a8f3c8d8364d75255b"
    end
  else
    url "https://github.com/ozankasikci/rust-git-worktree/archive/refs/tags/v0.7.0.tar.gz"
    sha256 "ca1accf0f1e4cae7f03a8716579bbcf33fce6c4b4742f7f5b753de9ea7b200d5"
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
