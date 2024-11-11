# Introduction

Hello! This is my first ever Hackintosh project. The machine is a bit odd, so I thought it would be nice to share the fruits of my research. This repository contains both the Hackintosh EFI files and some general information about the computer itself as it's not really well documented online. 

The EFI is cleaned of "personal" information such as serial numbers and MAC address so if you intend to use it as something more than a reference for your own build, the information needs to be provided. I don't really recommend using it as anything more than reference material as I'm very inexperienced with Hackintosh.

# Table of Contents

- [Hardware Specification](#hardware-specification)
- [Current Status](#current-status)
- [Installation Process](#installation-process)
- [Credits](#credits)

# Hardware Specification
|||
|-|-|
| Model | CTL Google Meet Compute System GQE10C, Chromebox Excelsior board |
| CPU | Intel Core i7-8550U |
| GPU | UHD 620 |
| RAM | 16GB (The machine originally came with only 2x2GB, so I upgraded it to 2x8GB) |
| SSD | M.2 SATA SSSTC CV8-8E128 128 GB |
| Audio Codec | Unknown |
| Ethernet NIC | Realtek RTL8111H |
| Wifi/BT Card | Intel AC7265 |
| BIOS revision | MrChromebox-2408.1 UEFI |

#### Known working memory modules
- Apacer 76.A305G.D330B 2GB PC4-2400T CL17 (original memory)
- Samsung M471A5244CB0-CRC 4GB 1Rx16 PC4-2400T
- Micron MTA8ATF1G64HZ-2G3B1 8GB 1Rx8 PC4-2400T

# Current Status

- **Ethernet** works when the RTL8111H.kext is supplied with *fallbackMAC*
- **WiFi** works really well for a AC7265 card, I get around 550 MBit/s download speed realatively close to the router. 
- **AirPlay** works
- **GPU acceleration** works
- **Bluetooth** works - tested with a keyboard and a mouse
- **iServices** untested, I don't even have any Apple products, so I don't really care

# Installation Process

I followed the Dortania guide section for Kaby Lake desktops and used that as the starting point. However, the MacOS installer wouldn't boot, so I had to dig deeper. After inspecting the ACPI tables dump, I realized the CPU cores were not defined as Processor objects so I had to create the CPU WRAP SSDT. I did so following [this guide](https://www.tonymacx86.com/threads/cpu-wrapping-ssdt-cpu-wrap-ssdt-cpur-acpi0007.316894/). Then the next step was adapting the PLUG SSDT to make use of the newly wrapped CPU. With the two SSDTs added, the installer finally booted. At this point, the only thing missing was Ethernet connection. The solution turned out to be pretty simple, since the NIC was showing up when using `ifconfig` from the terminal, but the MAC address was missing. Supplying the `fallbackMAC` value in `RealtekRTL8111.kext`'s `Info.plist` was all I needed to start MacOS Sonoma installation. The last issue was a bootloop on the second stage of the installation, the solution, again, turned out to be pretty simple, as all I had to do was set `SecureBootModel` to `Disabled`.

# Credits

Huge thanks to:
- **[Acidanthera](https://github.com/acidanthera)** for providing [AppleALC](https://github.com/acidanthera/AppleALC), [Lilu](https://github.com/acidanthera/Lilu), [OcBinaryData](https://github.com/acidanthera/OcBinaryData), [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg), [VirtualSMC](https://github.com/acidanthera/VirtualSMC), and [WhateverGreen](https://github.com/acidanthera/WhateverGreen).
- **[Corpnewt](https://github.com/corpnewt)** for providing [SSDTTime](https://github.com/corpnewt/SSDTTime)
- **[Dortania](https://github.com/dortania)** for providing the [guides](https://dortania.github.io/getting-started/)
- **[Etorix](https://www.tonymacx86.com/members/etorix.2114444/)** for providing the CPU wrapping [guide](https://www.tonymacx86.com/threads/cpu-wrapping-ssdt-cpu-wrap-ssdt-cpur-acpi0007.316894/)
- **[OpenIntelWireless](https://github.com/OpenIntelWireless)** for providing [AirportItlwm](https://github.com/OpenIntelWireless/itlwm) and [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware).
- **[USBToolBox](https://github.com/USBToolBox)** for providing [USBToolBox tool](https://github.com/USBToolBox/tool)

- and Discord users from [/r/Hackintosh](https://www.reddit.com/r/hackintosh/) server: **auq3l**, **craigfederighi_is_awesome**, **eazyblack**, **.krazykilla** and **milktoast56** for helping with troubleshooting and providing kind words of encouragement