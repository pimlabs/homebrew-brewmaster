class Brewmaster < Formula
  desc "Selective Homebrew package upgrades by semver bump level"
  homepage "https://github.com/pimlabs/brewmaster"
  url "https://github.com/pimlabs/brewmaster/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "1cf7f7165e7b4c2e349380832b3f54bfdbb55020376a86e59bdd1adddb242f94"
  version "0.6.0"
  license "MIT"

  depends_on "jq"

  def install
    bin.install "bin/brewmaster"
    libexec.install Dir["lib/brewmaster"]
    # Rewrite LIB_DIR to point to the installed location
    inreplace bin/"brewmaster",
      'LIB_DIR="${BREWMASTER_LIB:-$SCRIPT_DIR/../lib/brewmaster}"',
      "LIB_DIR=\"${BREWMASTER_LIB:-#{libexec}/brewmaster}\""
  end

  test do
    assert_match "brewmaster 0.6.0", shell_output("#{bin}/brewmaster --version")
  end
end
