
DEBUG_APP_NAME='app_debug'
RELEASE_APP_NAME='app'

# Debug compilation that uses threads
g++ -g -Wall -O0 -pthread -std=c++0x main.cpp -o $DEBUG_APP_NAME


# Release compilation that uses threads
g++ -O3 -pthread -std=c++0x main.cpp -o $RELEASE_APP_NAME