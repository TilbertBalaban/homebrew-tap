class ClaudeLimitsBar < Formula
  desc "Claude Code limits and reset times in the macOS menu bar"
  homepage "https://github.com/TilbertBalaban/claude-limits-bar"
  url "https://github.com/TilbertBalaban/claude-limits-bar/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "ecf147afd59632be7c330b0f2f8fb7834ec9845db44dc1a33c495edeed5a826e"
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
