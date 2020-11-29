class Clipp < Formula
  desc "easy to use, powerful & expressive command line argument parsing for modern C++ / single header / usage & doc generation"
  homepage "https://github.com/muellan/clipp"
  url "https://github.com/muellan/clipp.git", :tag => "v1.2.3"

  depends_on "cmake" => :build
  depends_on "python@3.x" => :test

  def install
    mkdir "bulid" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
