class CoverageBadge < Formula
  desc "Generate shields.io-style SVG badges for test coverage percentages"
  homepage "https://github.com/ozankasikci/rust-test-coverage-badge"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ozankasikci/rust-test-coverage-badge/releases/download/v0.1.0/coverage-badge-aarch64-apple-darwin.tar.gz"
      sha256 "08cd3f87674e08543843d05f76a1df5963e288ee58b09977bc07e8c33a25634f"
    end
    on_intel do
      url "https://github.com/ozankasikci/rust-test-coverage-badge/releases/download/v0.1.0/coverage-badge-x86_64-apple-darwin.tar.gz"
      sha256 "4eb25e7b7f2863c7a44d19a51bb54b2b56dcb244575a74eef2904a669f409cd7"
    end
  end

  def install
    bin.install "coverage-badge"
  end

  test do
    system "#{bin}/coverage-badge", "--help"
  end
end
