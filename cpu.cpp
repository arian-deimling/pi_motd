#include <cstdlib>
#include <iostream>
#include <fstream>

int main()
{
  std::ifstream cpu_info_file("/proc/cpuinfo");

  std::string cpu_name;
  size_t cpu_count = 0;
  
  std::string line;
  while (std::getline(cpu_info_file, line))
  {
    if (line.starts_with("model name"))
      {
	cpu_count++;

	if (cpu_name.empty())
	  {
	    cpu_name = line.substr(line.find(':') + 2);
	    cpu_name = cpu_name.replace(cpu_name.find("Processor "), 10, "");
	  }
      }	
  }

  std::ifstream cpu_freq_info_file("/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq");

  std::string cpu_freq_units = "KHz";
  float cpu_freq = 0;
  cpu_freq_info_file >> cpu_freq;

  if (cpu_freq >= 1000)
    {
      cpu_freq_units = "MHz";
      cpu_freq /= 1000;
    }

  if (cpu_freq >= 1000)
    {
      cpu_freq_units = "GHz";
      cpu_freq /= 1000;
    }

  std::cout << cpu_name << " @ ";
  if (cpu_count > 1)
    {
      std::cout << cpu_count << "x ";
    }
  std::cout << cpu_freq << cpu_freq_units << std::endl;

  return EXIT_SUCCESS;
}
