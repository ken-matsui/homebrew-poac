class Poac < Formula
  desc "Package manager for C++"
  homepage "https://github.com/poacpm/poac"
  url "https://github.com/poacpm/poac.git",
    tag:      "0.3.1",
    revision: "0afee72936c8c52ab2a477f0f14b45282bae83c1"
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on xcode: ["12.5", :build]
  depends_on "boost"
  depends_on :macos
  depends_on "openssl@3"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end

    man1.install Dir["src/etc/man/man1/*.1"]
    cp "src/etc/poac.bash", "src/etc/poac.zsh"
    bash_completion.install "src/etc/poac.bash" => "poac"
    zsh_completion.install "src/etc/poac.zsh" => "_poac"
  end

  test do
    system bin/"poac", "create", "hello_world"
    cd "hello_world" do
      assert_match "Hello, world!", shell_output("#{bin}/poac run")
    end
  end
end
