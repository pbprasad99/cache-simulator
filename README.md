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
Total Data Accesses:   481044

------------------L1 Cache------------------

-----L1 Reads:        320441
Hits:                161054
Misses:              159387

-----L1 Writes:       160603
Hits:                160495
Misses:              108

L1 Miss Rate:         0.33156

----------------Victim Cache---------------

Victim Reads:         159387
Hits:                 0
Misses:               159387

Victim Writes:        108
Hits:                 0
Misses:               108

Victim Miss Rate:     1

--------------Memory Traffic--------------

(Memory -> Cache):    10200768 bytes
(Cache -> Memory):    6912 bytes
```

---

## License
MIT License

---

## Author
P. B. Prasad
