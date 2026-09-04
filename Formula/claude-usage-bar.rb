class ClaudeUsageBar < Formula
  desc "Claude Code limits and reset times in the macOS menu bar"
  homepage "https://github.com/TilbertBalaban/claude-usage-bar"
  url "https://github.com/TilbertBalaban/claude-usage-bar/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "05136c0d90f438f4c259d9e3cf759a24f0ea20f53b7bde63b61cb4f7e4bc46b3"
  license "MIT"

  depends_on :macos
  depends_on "python@3.12"

  def install
    venv = libexec
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", venv
    system venv/"bin/pip", "install", "--no-cache-dir", buildpath
    bin.install_symlink venv/"bin/claude-usage-bar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-usage-bar --version")
  end
end
