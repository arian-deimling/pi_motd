all: $(patsubst %.cpp, %.out, $(wildcard *.cpp))

%.out: %.cpp
	g++ $< -o $@ --std=c++20

clean:
	rm *.out
