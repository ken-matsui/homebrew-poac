class Poac < Formula
  desc "Package manager for C++"
  homepage "https://github.com/poacpm/poac"
  url "https://github.com/poacpm/poac.git",
    tag:      "0.3.4",
    revision: "f905a175ccd1b9ad94041e1e0a29d12d92e8308d"
  license "Apache-2.0"
  head "https://github.com/poacpm/poac.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on macos: :big_sur # C++20
  depends_on "openssl@3"

  on_linux do
    depends_on "gcc"
  end
  fails_with gcc: "5"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end

    man1.install Dir["src/etc/man/man1/*.1"]
    bash_completion.install_symlink "src/etc/poac.bash" => "poac"
    zsh_completion.install_symlink "src/etc/poac.bash" => "_poac"
  end

  test do
    system bin/"poac", "create", "hello_world"
    cd "hello_world" do
      assert_match "Hello, world!", shell_output("#{bin}/poac run")
    end
  end
end
