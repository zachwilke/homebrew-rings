class Rings < Formula
  desc "DaisyDisk-style disk usage TUI"
  homepage "https://github.com/zachwilke/rings"
  version "0.3.3"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/zachwilke/rings/releases/download/v0.3.3/rings-aarch64-apple-darwin.xz"
      sha256 "2add131fcc484d89f0e883a2fdd0dcf565607026e77067235006e591151c109f"
    end
    on_intel do
      url "https://github.com/zachwilke/rings/releases/download/v0.3.3/rings-x86_64-apple-darwin.xz"
      sha256 "10ef785bdcf8da6846de99369ec04a2317100c24deff4872c4886ddf9415912c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zachwilke/rings/releases/download/v0.3.3/rings-x86_64-linux-musl.xz"
      sha256 "1987bb4948a61872a663b01506093587748d0eb4b5b4f86443b63ea2ed140490"
    end
    on_arm do
      url "https://github.com/zachwilke/rings/releases/download/v0.3.3/rings-aarch64-linux-musl.xz"
      sha256 "355a218d326dbe42a70d3fc7faf75d380df6d250c9c8f736c347fd2e9e03118e"
    end
  end

  def install
    binary = Dir["rings*"].reject { |f| f.end_with?(".xz", ".zip") }.first
    odie "rings binary missing from archive" if binary.nil?
    bin.install binary => "rings"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rings --version")
  end
end
