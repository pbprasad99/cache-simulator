# Cache Simulator
Trace based cache simulator models data and victim caches given a set of parameters which are supplied through the config.txt file. The model works for 32 bit address space and data sizes of 4 bytes. The cache has been designed for accepting integer words in accordance with SPECint2006 benchmarks. 

Format of the trace file : \<data load/store\> \<address\> \<data\>

For Config.txt : cache size must be specified n bytes. Asscociativity can be specified as 1(for direct mapped), 2(for Two way) and Full(for Fully associative)
                        
###To compile: 

make all

###To run:

./sim config.txt mcf.trace output.txt


###Sample Output:

Total Data Accesses:	481044  

------------------L1 Cache------------------  

-----L1 Reads:	320441  

Hits:		161054  

Misses:		159387  

-----L1 Writes:	160603  

Hits:		160495  

Misses:		108  

L1 Miss Rate:		0.33156  

----------------Victim Cache---------------  

Victim Reads:	159387  

Hits:		0  

Misses:		159387  

Victim Writes:	108  

Hits:		0  

Misses:		108  

Victim Miss Rate:  1  

--------------Memory Traffic--------------  

(Memory->Cache):	10200768 bytes  

(Cache-> Memory):	6912 bytes  

