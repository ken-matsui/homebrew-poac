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
    (testpath/"test.cpp").write <<~EOS
      #include <plog/Log.h> // Step1: include the headers
      #include <plog/Initializers/RollingFileInitializer.h>

      int main()
      {
          plog::init(plog::debug, "Hello.txt"); // Step2: initialize the logger

          // Step3: write log messages using a special macro
          // There are several log macros, use the macro you liked the most

          PLOGD << "Hello log!"; // short macro
          PLOG_DEBUG << "Hello log!"; // long macro
          PLOG(plog::debug) << "Hello log!"; // function-style macro
    
          // Also you can use LOG_XXX macro but it may clash with other logging libraries
          LOGD << "Hello log!"; // short macro
          LOG_DEBUG << "Hello log!"; // long macro
          LOG(plog::debug) << "Hello log!"; // function-style macro

          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test"
    system "./test"
  do
end
