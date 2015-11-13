@echo off
rem cmd started from MSYS has problems running subsequent commands after bootstrap so all commands are concatenated with "and"
@echo on

bootstrap mingw && ^
b2 -a toolset=gcc cxxflags="-Og -std=gnu++0x -static -static-libgcc -static-libstdc++ -Wno-deprecated-declarations -Wno-unused-variable -Wno-unknown-pragmas" ^
--with-chrono --with-filesystem --with-regex --with-program_options --with-system --with-thread --with-date_time ^
--link=static --runtime-link=static linkflags="-static -static-libgcc -static-libstdc++" threading=multi variant=debug stage && ^
exit
