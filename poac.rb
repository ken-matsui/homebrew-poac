class Poac < Formula
  desc "Package manager for C++"
  homepage "https://github.com/poacpm"
  url "https://github.com/poacpm/poac.git",
      :tag => "0.0.1-beta",
      :revision => "16d42cf3529995689fda12b2f16f1fae20ea23d5"


  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "curl"
  depends_on "openssl"
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
