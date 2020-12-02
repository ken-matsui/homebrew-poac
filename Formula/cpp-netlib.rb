class CppNetlib < Formula
  desc "The C++ Network Library Project -- cross-platform, standards compliant networking library."
  homepage "http://cpp-netlib.org"
  head "https://github.com/cpp-netlib/cpp-netlib.git"

  depends_on "cmake" => :build
  depends_on "boost"
  
  def install
    mkdir "bulid" do
      system "cmake", "..", "-DCPP-NETLIB_BUILD_TESTS=OFF", "-DCPP-NETLIB_BUILD_EXAMPLES=OFF", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    assert_predicate "/usr/local/lib/libcppnetlib-server-parsers.a", :exist?
  end
end
