**This is an example hot to create deb-packahe with cpack - module**

***Motivation***

I'm inrerested in how to build a simple deb-package using cpack module from cmake.
And I desided to figure this out.

I defined all the necessary fields for the control file ( https://www.debian.org/doc/debian-policy/ch-controlfields.html )

in the separate module. It's called Packing.cmake. You can see this file in: ./cmake/Packing.cmake

After linting I realized that that's not enough. I add one more necessary files for deb-package.
It's about changelog and copyright.

Please, remember, these files must be have a strict structure ( https://www.debian.org/doc/manuals/maint-guide/dreq.en.html )

***Instruction***

First of all you need to create build directory:

*$mkdir build*

And then you need to generate all the necessary files for cpack.
For it you need to type in the build directory:

*$ cmake ..*

After that all the necessary files will be generate.
And now, when you have all these files you have to type:

*$ cpack -G "DEB"* or *$ cpack*

After that you can see the directory "result_package".

This directory contains the finished package.



