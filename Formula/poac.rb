class Poac < Formula
  desc "Package manager for C++"
  homepage "https://github.com/poacpm"
  head "https://github.com/poacpm/poac.git"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "llvm" if MacOS.version <= :high_sierra
  depends_on :macos => :sierra
  depends_on "openssl"
  depends_on "libgit2"
  depends_on "fmt"
  depends_on "poacpm/tap/toml11"
  depends_on "poacpm/tap/clipp"
  depends_on "poacpm/tap/mitama-cpp-result"
  depends_on "poacpm/tap/plog"

  def install
    mkdir "bulid" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end

    man1.install Dir["src/etc/man/man1/*.1"]
    cp "src/etc/poac.bash", "src/etc/poac.zsh"
    bash_completion.install "src/etc/poac.bash" => "poac"
    zsh_completion.install "src/etc/poac.zsh" => "_poac"
  end

  test do
    assert_match /SYNOPSIS/, shell_output("#{bin}/poac --help")
  end
end
