# Cache Simulator

A trace-based cache simulator that models data and victim caches using parameters supplied via a configuration file. Designed for a 32-bit address space and 4-byte data sizes, this simulator is tailored for integer word operations as seen in SPECint2006 benchmarks.

---

## Features
- **Configurable cache size and associativity**
- **Support for direct-mapped, two-way, and fully associative caches**
- **Victim cache modeling**
- **Detailed statistics: hits, misses, miss rates, and memory traffic**

---

## File Structure
```
cache-simulator/
├── Makefile
├── config.ini         # Configuration file for cache parameters
├── mcf.trace          # Example trace file
├── output.txt         # Output file (generated after running)
├── include/           # Header files
├── src/               # Source files
├── build/             # Build artifacts (object files, executable)
└── README.md
```

---

## Trace File Format
Each line in the trace file should be:
```
<data load/store> <address> <data>
```

## Config File Format (`config.ini`)
- **Cache size:** Specify in bytes (e.g., `16384`)
- **Associativity:**
  - `1` for direct-mapped
  - `2` for two-way set associative
  - `Full` for fully associative

---

## Build Instructions
```sh
make all
```

## Run Instructions
```sh 
./build/sim config.ini mcf.trace output.txt
```

---

## Sample Output
```
Total Data Accesses:    727230
------------------L1 Cache------------------
-----L1 Reads:  5972
Hits:           5761
Misses:         211
-----L1 Writes: 721258
Hits:           2091
Misses:         719167
L1 Miss Rate:           0.989203
----------------Victim Cache---------------
Victim Reads:   211
Hits:           2
Misses:         209
Victim Writes:  719167
Hits:           16
Misses:         719151
Victim Miss Rate:       0.999975
--------------Memory Traffic--------------
(Memory->Cache):        13376 bytes
(Cache-> Memory):       46172864 bytes
```

---

## License
MIT License

---

## Author
P. B. Prasad
