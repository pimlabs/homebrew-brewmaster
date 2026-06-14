class Brewmaster < Formula
  desc "Selective Homebrew package upgrades by semver bump level"
  homepage "https://github.com/pimlabs/brewmaster"
  url "https://github.com/pimlabs/brewmaster/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "4eb68cbed6ccb43465e5ee50c7e2b1db995ea0dcb634a1417003d878342be73e"
  version "0.8.0"
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
    assert_match "brewmaster 0.8.0", shell_output("#{bin}/brewmaster --version")
  end
end
