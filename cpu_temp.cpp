#include <cstdlib>
#include <iostream>
#include <fstream>

int main()
{
  std::ifstream cpu_temp_file("/sys/class/thermal/thermal_zone0/temp");
  double cpu_temp = 0;
  cpu_temp_file >> cpu_temp;
  std::cout << (cpu_temp / 1000) << '\'' << "C" << std::endl;
  return EXIT_SUCCESS;
}
