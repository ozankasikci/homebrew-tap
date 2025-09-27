class Rsworktree < Formula
  desc "CLI helper for managing Git worktrees under a dedicated .rsworktree directory"
  homepage "https://github.com/ozankasikci/rust-git-worktree"
  version "0.5.3"
  license "MIT"
  head "https://github.com/ozankasikci/rust-git-worktree.git", branch: "master"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.5.3/rsworktree-v0.5.3-macos-arm64.tar.gz"
      sha256 "e7b3d46e54beb2af79fca63abfac866aa6b73f03eaa96af171e72744eb89a6ff"
    else
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.5.3/rsworktree-v0.5.3-macos-x86_64.tar.gz"
      sha256 "417b0898ee7da2a488e71556d889ae15e5574c2cb5d685fc3b18a64b44ded8a8"
    end
  else
    url "https://github.com/ozankasikci/rust-git-worktree/archive/refs/tags/v0.5.3.tar.gz"
    sha256 "a955ab742beed31260072270f33f0f9dade5c3cea2cec335db36b1a1e6c18a20"
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
