class Toml11 < Formula
  desc "TOML for Modern C++"
  homepage "https://github.com/ToruNiina/toml11"
  url "https://github.com/ToruNiina/toml11.git", :tag => "v3.6.0"

  depends_on "cmake" => :build
  depends_on "boost"

  def install
    mkdir "bulid" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    (testpath/"example.toml").write <<~EOS
      title = "an example toml file"
      nums = [1, 2, 3, 4, 5]
    EOS
    (testpath/"test.cpp").write <<~EOS
      #include <toml.hpp>
      #include <iostream>
      int main()
      {
          const auto data = toml::parse("example.toml");
          // title = "an example toml file"
          std::string title = toml::find<std::string>(data, "title");
          std::cout << "the title is " << title << std::endl;
          // nums = [1, 2, 3, 4, 5]
          std::vector<int> nums  = toml::find<std::vector<int>>(data, "nums");
          std::cout << "the length of `nums` is" << nums.size() << std::endl;
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test"
    system "./test"
  end
end

