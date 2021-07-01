# Interesting Makefile links:
# https://stackoverflow.com/questions/26422122/building-interconnected-classes-in-multiple-files-c-using-makefile
# https://www.softwaretestinghelp.com/cpp-makefile-tutorial/

# Name of the final binary
APP_NAME=app

# Libraries to add at linking step. May contain -L instrauctions for adding lib directory search path
LIBS="" # -lz -ldl -lm -L/someDir -lsomelib

# Extra include folders, where the external haeders are
INCLUDE_DIRS="" # -I/usr/local/include -I/.../...

# folder where the source files are
SRC_FOLDER=./src/

# temporary folder (to put the *.o files)
TMP=./tmp

# Output folder for the executable in debug mode
DEBUG_BUILD_FOLDER=./builds/debug

# Compilation flags for debug mode
DEBUG_CFLAGS=-g -Wall -O0 -pthread -std=c++0x

# Output folder for the executable in release mode
RELEASE_BUILD_FOLDER=./builds/release

# Compilation flags for release mode
RELEASE_CFLAGS=-Wall -O3 -pthread -std=c++0x


# ---------------- BUILD ALL CONFIG -------------------------------------------

all: debug release


# ---------------- BUILD DEBUG ------------------------------------------------

# linking
debug: main-debug vector3d-debug
	g++ $(TMP)/main.o $(TMP)/Vector3D.o -o $(DEBUG_BUILD_FOLDER)/$(APP_NAME) $(LIBS)

# compile
main-debug:
	g++ $(DEBUG_CFLAGS) $(INCLUDE_DIRS) -c $(SRC_FOLDER)/main.cpp -o $(TMP)/main.o

# compile
vector3d-debug:
	g++ $(DEBUG_CFLAGS) $(INCLUDE_DIRS) -c $(SRC_FOLDER)/Vector3D.cpp -o $(TMP)/Vector3D.o

# ---------------- BUILD RELEASE-----------------------------------------------

# linking
release: main-release vector3d-release
	g++  $(TMP)/main.o $(TMP)/Vector3D.o -o $(RELEASE_BUILD_FOLDER)/$(APP_NAME) $(LIBS)

# compile
main-release:
	g++ $(RELEASE_CFLAGS) -c $(SRC_FOLDER)/main.cpp -o $(TMP)/main.o

# compile
vector3d-release:
	g++ $(RELEASE_CFLAGS) -c $(SRC_FOLDER)/Vector3D.cpp -o $(TMP)/Vector3D.o


# ---------------- CLEAN ------------------------------------------------------

clean:
	rm -rf $(TMP)/* $(DEBUG_BUILD_FOLDER)/* $(RELEASE_BUILD_FOLDER)/*