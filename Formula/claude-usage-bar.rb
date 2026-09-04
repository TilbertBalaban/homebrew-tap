class ClaudeUsageBar < Formula
  desc "Claude Code limits and reset times in the macOS menu bar"
  homepage "https://github.com/TilbertBalaban/claude-usage-bar"
  url "https://github.com/TilbertBalaban/claude-usage-bar/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "9a4b22d14178c33bf8c3a005cde822db401297cbc7b91f2a4c5e8958f95e0086"
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
