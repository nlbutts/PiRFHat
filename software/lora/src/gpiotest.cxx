#include <iostream>
#include <signal.h>
#include <stdio.h>
#include <string>
#include <chrono>
#include <thread>

#include "sx1276.hpp"

using namespace std;
using namespace std::chrono_literals;

int shouldRun = true;

void sig_handler(int signo)
{
    if (signo == SIGINT)
        shouldRun = false;
}

int main(int argc, char** argv)
{
    signal(SIGINT, sig_handler);
    //! [Interesting]

    Gpio reset(6);
    reset.write(1);
    std::this_thread::sleep_for(250ms);
    reset.write(0);
    std::this_thread::sleep_for(250ms);
    reset.dir(DIR_OUT);
    std::this_thread::sleep_for(250ms);
    reset.write(1);
    std::this_thread::sleep_for(250ms);
    reset.write(0);
    std::this_thread::sleep_for(250ms);
    return 0;
}
