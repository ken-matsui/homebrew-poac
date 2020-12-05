class Plog < Formula
  desc "Portable, simple and extensible C++ logging library"
  homepage "https://github.com/SergiusTheBest/plog"
  url "https://github.com/SergiusTheBest/plog.git", :tag => "1.1.5"
  
  depends_on "cmake" => :build
  
  def install
    mkdir "bulid" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "cat /usr/local/include/plog/Log.h"
  do
end
