```text
____ ___  ____ ____ ____    ____ ___ ____ ____ _  _ 
[__  |__] |__| |    |___    [__   |  |__| |    |_/  
___] |    |  | |___ |___    ___]  |  |  | |___ | \_ 
```
#  
This personal side project explores aerospace technology by designing flight software, ground station systems, emulated serial devices, post-processing GUI tools, etc. in multiple programming languages. It focuses on developing integrated systems that simulate real-world aerospace operations.

## Submodules
* [flight-software](https://github.com/jbonnells/flight-software.git)  
* [ground-control](https://github.com/jbonnells/ground-control.git)
* [serial-device](https://github.com/jbonnells/serial-device.git)

## Build Instructions
Build and run the docker container with the provided build script:
```bash
$ ./build_run_docker.sh
```
This will also compile the project files which are subsequently located in `/app/build/`  
To recompile the project from within the container shell, execute the following script:
```bash
$ ./compile.sh
```

## Operating Instructions
See the individual modules for specific operating instructions.

## Helpful Tips

### Git Submodules
Update all modules at once with:
```bash
$ git submodule update --remote --merge
```
If your submodules are out of sync after switching branches:
```bash
$ git submodule update --init --recursive
```

### Docker
Get the image running as a container in the background: 
```bash
$ docker run -d -it <image_id>
```
*`docker ps` will show the container_id that you just fired up from said image.*

To launch several sessions connected to the same container:
```bash
$ docker exec -it <container> bash
```