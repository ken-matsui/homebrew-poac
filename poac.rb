class Poac < Formula
  desc "Package manager for C++"
  homepage "https://github.com/poacpm"
  url "https://github.com/poacpm/poac.git",
      :tag      => "0.2.1",
      :revision => "353368f90544bb160b258a9cc1ecba8d467c4020"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "llvm@7" if MacOS.version <= :high_sierra
  depends_on :macos => :sierra
  depends_on "openssl" if MacOS.version >= :mojave
  depends_on "yaml-cpp"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end

    man1.install Dir["etc/man/man1/*.1"]
    cp "etc/poac.bash", "etc/poac.zsh"
    bash_completion.install "etc/poac.bash" => "poac"
    zsh_completion.install "etc/poac.zsh" => "_poac"
  end

  test do
    assert_match /Usage/, shell_output("#{bin}/poac --help")
  end
end
