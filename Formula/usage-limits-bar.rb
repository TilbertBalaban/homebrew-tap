class UsageLimitsBar < Formula
  desc "Claude and Codex usage limits in the macOS menu bar"
  homepage "https://github.com/TilbertBalaban/usage-limits-bar"
  url "https://github.com/TilbertBalaban/usage-limits-bar/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "17dbe2e6d6400a0fc713d176e87fbcd65391fc951e9383b1613fe7378ec612f6"
  license "MIT"

  depends_on :macos
  depends_on "python@3.12"

  def install
    venv = libexec
    system formula_opt_bin("python@3.12")/"python3.12", "-m", "venv", venv
    system venv/"bin/pip", "install", "--no-cache-dir", buildpath
    bin.install_symlink venv/"bin/usage-limits-bar"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/usage-limits-bar --version")
  end
end
