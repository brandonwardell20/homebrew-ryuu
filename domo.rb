require 'formula'

class Domo < Formula
  desc "CLI for creating custom apps on Domo's App Platform"
  homepage "https://developer.domo.com/docs/dev-studio/dev-studio-overview"
  url "https://github.com/DomoApps/homebrew-ryuu/releases/download/v4.1.2/domo.zip"
  sha256 "a766ab67bc83ccae13ea1e969e2c636afe5e7f5b5bd457e22c39b5aa16b010a9"

  def install 
    bin.install "domo"
  end

  test do
    rm "~/.nvm/versions/node/v12.16.1/bin/domo"
    version_out = shell_output("#{bin}/domo -v")
    assert_match version.to_s, version_out
    help_out = shell_output("#{bin}/domo -h")
    assert_match "Usage: domo [options] [command]", help_out
    assert_match "", help_out
    assert_match "Options:", help_out
  end
end
