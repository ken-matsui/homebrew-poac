class Poac < Formula
  desc "Package manager for C++."
  homepage "https://poac.pm"
  url "https://github.com/poacpm/poac.git",
      :tag => "v0.0.1"
      :revision => ""
  head "https://github.com/poacpm/poac.git"

  depends_on "cmake" => :build
  depends_on "boost"

  def install
    mkdir "bulid" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end

    bash_completion.install "completions/poac.bash" => "poac"
    zsh_completion.install "completions/poac.zsh" => "_poac"

    man1.install Dir["docs/man/man1/*.1"]
  end

  test do
    assert_match /Usage/, shell_output("#{bin}/poac --help")
  end
end
