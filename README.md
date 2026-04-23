# edgerouter-binaries

This repository provides **prebuilt binaries for Ubiquiti EdgeRouter / EdgeOS systems**, 

Comming soon: **reproducible build instructions** for each package.

All binaries are built using a controlled, musl‑based cross‑compilation environment to ensure
compatibility with EdgeOS’s older kernel and userspace. Source code is not vendored here; instead,
each package documents where upstream sources are obtained and how the binaries are built.


## Available binaries

| Package  | Version | Architecture | Notes |
|---------|---------|--------------|-------|
| unbound | 1.19.2  | mips64       | DNS resolver |
| xz      | 5.6.1   | mips64       | Compression tools |
