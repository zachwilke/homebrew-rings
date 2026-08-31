class Rings < Formula
  desc "DaisyDisk-style disk usage TUI"
  homepage "https://github.com/zachwilke/rings"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/zachwilke/rings/releases/download/v0.2.0/rings-aarch64-apple-darwin.xz"
      sha256 "744b88cca44b8e6ef405aca6c52e4e848c353551a609734fcb289554b4e156a4"
    end
    on_intel do
      url "https://github.com/zachwilke/rings/releases/download/v0.2.0/rings-x86_64-apple-darwin.xz"
      sha256 "7f721ac1a8f7f1fd6998fdf165c927fc358cbccba70973856f5581bfad5a75b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zachwilke/rings/releases/download/v0.2.0/rings-x86_64-linux-musl.xz"
      sha256 "b64c07fd6f3c3827646e016476d119e68188319cd939a3796f8605cf821ef4e1"
    end
    on_arm do
      url "https://github.com/zachwilke/rings/releases/download/v0.2.0/rings-aarch64-linux-musl.xz"
      sha256 "95647a952c37ce97e481cea5d76fedcd02a1f63b7ff62da6199691f66b25ed9e"
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
