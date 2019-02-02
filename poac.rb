class Poac < Formula
  desc "Package manager for C++"
  homepage "https://github.com/poacpm"
  url "https://github.com/poacpm/poac.git",
      :tag      => "0.1.1",
      :revision => "0bb4ff3393e503f963b19d294d6c7975e7034734"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "llvm" if MacOS.version <= :high_sierra
  depends_on :macos => :sierra
  depends_on "openssl"
  depends_on "yaml-cpp"

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
    assert_match /Usage/, shell_output("#{bin}/poac --help")
  end
end
