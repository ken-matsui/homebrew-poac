class Clipp < Formula
  desc "easy to use, powerful & expressive command line argument parsing for modern C++ / single header / usage & doc generation"
  homepage "https://github.com/muellan/clipp"
  head "https://github.com/muellan/clipp.git"

  depends_on "cmake" => :build
  depends_on :python3 => :test

  def install
    mkdir "bulid" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    Dir.chdir('test')
    system Formula["python@3.x"].opt_bin/"python3", "run_tests.py", "-c", ENV.cxx, "--clean"
  end
end
