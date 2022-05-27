class Poac < Formula
  desc "Package manager for C++"
  homepage "https://github.com/poacpm/poac"
  license "Apache-2.0"
  head "https://github.com/poacpm/poac.git", :branch => "main"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "boost"
  depends_on "openssl"

  def install
    mkdir "bulid" do
      system "cmake", "..", *std_cmake_args
      system "ninja", "install"
    end

    man1.install Dir["src/etc/man/man1/*.1"]
    cp "src/etc/poac.bash", "src/etc/poac.zsh"
    bash_completion.install "src/etc/poac.bash" => "poac"
    zsh_completion.install "src/etc/poac.zsh" => "_poac"
  end

  test do
    assert_match /USAGE/, shell_output("#{bin}/poac --help")
  end
end
