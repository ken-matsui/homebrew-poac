class MitamaCppResult < Formula
  desc "A Library that provides `result<T, E>` and `maybe<T>` and monadic functions for them."
  homepage "https://loligothick.github.io/mitama-cpp-result"
  head "https://github.com/LoliGothick/mitama-cpp-result.git", :branch => "master"

  depends_on "cmake" => :build

  def install
    mkdir "bulid" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <mitama/result/result.hpp>
      #include <iostream>
      int main()
      {
          mitama::result<std::uint32_t, std::string> x = mitama::success(-3);
          assert(x.is_ok() == true);
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++17", "-o", "test"
    system "./test"
  end
end
