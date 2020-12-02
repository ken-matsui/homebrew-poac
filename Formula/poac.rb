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

  def install
    mkdir "bulid" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end

    man1.install Dir["docs/man/man1/*.1"]
    cp "docs/comp/poac.bash", "docs/comp/poac.zsh"
    bash_completion.install "docs/comp/poac.bash" => "poac"
    zsh_completion.install "docs/comp/poac.zsh" => "_poac"
  end

  test do
    assert_match /SYNOPSIS/, shell_output("#{bin}/poac --help")
  end
end
