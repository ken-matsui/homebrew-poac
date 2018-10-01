class Poac < Formula
  desc "Package manager for C/C++"
  homepage "https://github.com/poacpm"
  url "https://github.com/poacpm/poac.git",
      :tag => "0.3.0-beta",
      :revision => "7a589e31a1e72b55ebf82ec487e7c8ba5886d7cc"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "libressl"
  depends_on "yaml-cpp"

  def install
    mkdir "bulid" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end

    man1.install Dir["docs/man/man1/*.1"]
    bash_completion.install "docs/comp/poac.bash" => "poac"
  end

  test do
    assert_match /Usage/, shell_output("#{bin}/poac --help")
  end
end
