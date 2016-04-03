Zhichao Cao

---------------------------------------------------------------------
The included files are:

runQueens.bash - a bash script to automate running the experiment for boards
from size 1 to 100. If a larger range is required, the number 100 can be
replaced with any other upper bound.

EightQueensSAT.java - generates input#.cnf, where # is the number passed in
as a command line argument. input#.cnf encodes the n-queens problem into
dimacs format

inputFiles/ - this directory contains a large number of input#.cnf files

outputFiles/ - this directory contains the satisfying assignments for all
the input#.cnf files. The files in this directory are named output#

statistics/ - this contains the command line output for each file in
inputFiles. The files are named statistics#. It is possible to write a small
tool to scrape these files and gather more rigorous trends than the ones
provided in the presentation.

---------------------------------------------------------------------
To run this project:

type ./runQueens.bash in a unix terminal where MiniSat_v1.14_linux is
present. On any other installation, compile EightQueensSAT.java as:
javac EightQueensSAT.java

Then, run it with the desired board size (i.e. for size 37):
java EightQueensSAT 37

Finally, run minisat where the input file is:
input37.cnf

---------------------------------------------------------------------
Java Code Functionality:

EightQueensSAT.java builds a dimacs file to represent the n-queens problem.

Each square of the board is given a unique number that identifies which
space it is. In the final solution, each space can have a value of true
(meaning that a queen is placed there) or false (meaning that no queen is
present).

The method names are fairly self explanatory. HorizontalRows adds all
clauses to represent horizontal rows in the problem. VerticalCols does the
same, but for columns. AllDiaginalLines adds clauses for diaginal lines by
calling DiagonalLine.

After all clauses are generated, they are printed to a file in dimacs
format.

---------------------------------------------------------------------
Actions taken and difficulties encountered:

It was challenging to try to get a runtime approximation for this problem,
as generating an input file for a 400 by 400 board caused Java to throw a
heap error. There are ways to increase the Java heap size, but as it stands,
an input of size 300 took ~15 seconds to calculate. Based on the guessed
rate of increase (always more then 4 times when doubling the input,
sometimes 8 or more), it would have only been possible to get a few more
datapoints without spending hours running the program. We know that the time
complexity is more than linear, but have no real estimate for the actual
value. It shouldn't be exponential, as there are many ways to solve the
n-queens problem, which are distributed about the problem space.

