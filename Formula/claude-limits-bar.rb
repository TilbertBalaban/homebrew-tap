class ClaudeLimitsBar < Formula
  desc "Claude Code limits and reset times in the macOS menu bar"
  homepage "https://github.com/TilbertBalaban/claude-limits-bar"
  url "https://github.com/TilbertBalaban/claude-limits-bar/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "6d97939f2bd6df2b466e67b43a65c24f899e365a2f193b1ae82bc9ef7bb34075"
  license "MIT"

  depends_on :macos
  depends_on "python@3.12"

  def install
    venv = libexec
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", venv
    system venv/"bin/pip", "install", "--no-cache-dir", buildpath
    bin.install_symlink venv/"bin/claude-limits-bar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-limits-bar --version")
  end
end
