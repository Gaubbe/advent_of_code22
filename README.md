# advent_of_code22
Advent of Code 2022 but in assembly.

## Running the example
The standard library provides a simple clone of the `cat` command as an example of how to use the library.
A Dockerfile is provided to setup the environment to run this example in. To build the image, you
can use this command:

```bash
docker build -t advent_of_code .
```

You can then run the image with this command:

```bash
docker run --name advent_of_code -it advent_of_code 
```

Once in the container, navigate to the ./std/examples/cat and run the make command:

```bash
make
```

From there, you should be able to run the executable which is located at ./target/cat.out!

```bash
./target/cat.out cat.asm
```
