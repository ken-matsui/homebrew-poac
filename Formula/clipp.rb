class Clipp < Formula
  desc "easy to use, powerful & expressive command line argument parsing for modern C++ / single header / usage & doc generation"
  homepage "https://github.com/muellan/clipp"
  head "https://github.com/muellan/clipp.git"

  depends_on "cmake" => :build

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
