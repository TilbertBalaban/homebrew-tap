class ClaudeLimitsBar < Formula
  desc "Claude Code limits and reset times in the macOS menu bar"
  homepage "https://github.com/TilbertBalaban/claude-limits-bar"
  url "https://github.com/TilbertBalaban/claude-limits-bar/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "9bc7a38a33e6d22c2d42249cf3f84ab65846831bb55624180765b9320bee443a"
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
