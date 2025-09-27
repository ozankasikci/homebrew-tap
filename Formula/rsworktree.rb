class Rsworktree < Formula
  desc "CLI helper for managing Git worktrees under a dedicated .rsworktree directory"
  homepage "https://github.com/ozankasikci/rust-git-worktree"
  version "0.4.2"
  license "MIT"
  head "https://github.com/ozankasikci/rust-git-worktree.git", branch: "master"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.4.2/rsworktree-v0.4.2-macos-arm64.tar.gz"
      sha256 "0c44bed0d043763464a93262315fae340b18f4bd5a7094484ff53d7a06f67bdd"
    else
      url "https://github.com/ozankasikci/rust-git-worktree/releases/download/v0.4.2/rsworktree-v0.4.2-macos-x86_64.tar.gz"
      sha256 "dad17b82f47a204a1291a50b4b648da7b5ff3a8ce674201f68a47b2db979194b"
    end
  else
    url "https://github.com/ozankasikci/rust-git-worktree/archive/refs/tags/v0.4.2.tar.gz"
    sha256 "0f11c5613665ffc492a989a91db3c1db5a7d6c6f6c17e2578caa4210197a5b61"
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
