# edgerouter-binaries

This repository provides **prebuilt binaries for Ubiquiti EdgeRouter devices running EdgeOS**.

It is intended to make commonly used software available in a form that is **known to work on
EdgeOS**, which uses an aging kernel and userspace that is often incompatible with modern
distribution binaries.

**Coming soon:** reproducible, documented build instructions for each package.

All binaries are built using a **controlled, musl‑based cross‑compilation environment** to ensure
runtime compatibility across supported EdgeRouter models. Upstream source code is **not vendored**
in this repository; instead, each package documents where its source is obtained and how the binary
was produced.

---

## Available Binaries

| Package | Version | Architecture        | Notes             |
|--------|---------|---------------------|-------------------|
| unbound | 1.19.2 | mips32, mips64      | DNS resolver      |
| xz      | 5.6.1  | mips32, mips64      | Compression tools |

Prebuilt binaries are published via GitHub releases.

---

## Supported Architectures

| Tag    | Meaning                | Typical Devices            |
|--------|------------------------|----------------------------|
| mips32 | 32‑bit MIPS EdgeRouter | ER‑Lite, ER‑PoE, ER‑X     |
| mips64 | 64‑bit MIPS EdgeRouter | ER‑4, ER‑6P, ER‑8         |

All binaries are built specifically for **Ubiquiti EdgeRouter hardware running EdgeOS** and are not
intended for generic Linux distributions.

---

## Project Goals

- ✅ Provide binaries that run reliably on EdgeOS
- ✅ Avoid glibc compatibility issues via static musl builds
- ✅ Keep builds reproducible and auditable
- ✅ Avoid redistributing upstream source code
