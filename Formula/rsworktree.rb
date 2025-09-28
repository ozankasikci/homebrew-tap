class Rsworktree < Formula
  desc "CLI helper for managing Git worktrees under a dedicated .rsworktree directory"
  homepage "https://github.com/ozankasikci/rust-git-worktree"
  version "0.6.1"
  license "MIT"
  head "https://github.com/ozankasikci/rust-git-worktree.git", branch: "master"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.6.1/rsworktree-v0.6.1-macos-arm64.tar.gz"
      sha256 "bcba6d7c393c9260e9f053420b5ce4c5f18b629bc7cb3dd1f7f3feccdcd70864"
    else
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.6.1/rsworktree-v0.6.1-macos-x86_64.tar.gz"
      sha256 "a09d65c5f4ecbdfe27ca40357bb7ed412aac327deedf482cbdf5740eb43b7807"
    end
  else
    url "https://github.com/ozankasikci/rust-git-worktree/archive/refs/tags/v0.6.1.tar.gz"
    sha256 "4796db6fe148e4809f3f739d697198af8b573573c91dff2c836f483e3e54cbfb"
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
