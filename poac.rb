class Poac < Formula
  desc "Package manager for C/C++"
  homepage "https://github.com/poacpm"
  url "https://github.com/poacpm/poac.git",
      :tag => "0.3.0-beta",
      :revision => "688e505f9302779e5f218ee4fd3c7cf6a7e734df"

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
