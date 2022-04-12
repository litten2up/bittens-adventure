/**
* this file toggles debugging and release flags for the game
*/
#include <string>
#include <stdio.h>
#ifndef bittendef
#define bittendef

// enables battle menu test disable this so then you can do other things than the test battle
//#define battleTest //outdated
int version = 1;
// used to toggle indivisal debug settings
class debugsettings{
    public:
        bool debugmode=true; // enable debugging
        bool instentwin=false; //win battles instently
        bool noclip=false; // tbh everything is noclip when adding this it is for the future
        bool battletest=false; // replases #define battleTest
        std::string codename = "iced bitten"; // used for eastereggs when i add them
        double version=0.1;
};
#endif