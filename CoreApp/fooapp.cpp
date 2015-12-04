#include <iostream>

#include "fooapp.h"

FooApp::FooApp(int argc, char *argv[])
      : QApplication(argc, argv)
{
}

FooApp::~FooApp()
{
    std::cout << "DESTROYER FOOAPP!";
}

