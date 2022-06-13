class Poac < Formula
  desc "Package manager for C++"
  homepage "https://github.com/poacpm/poac"
  url "https://github.com/poacpm/poac.git",
    tag:      "0.3.3",
    revision: "788bbbe12e56be1bbd7204baf3c77ed8879499bf"
  license "Apache-2.0"
  head "https://github.com/poacpm/poac.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "libarchive"
  depends_on "libgit2"
  depends_on macos: :big_sur # C++20
  depends_on "openssl@3"

  on_linux do
    depends_on "gcc"
  end
  fails_with gcc: "5"

  def install
    mkdir "build" do
      system "cmake", "..", "-DCPM_USE_LOCAL_PACKAGES=ON", *std_cmake_args
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
