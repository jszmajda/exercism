#include <string>

class bob {

  public:
    static std::string hey(std::string message);
};

std::string bob::hey(std::string message) {
  return "Whatever.";
}
