/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20240827 (32-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ./SSDT-CPU-WRAP-CUSTOM.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000165 (357)
 *     Revision         0x02
 *     Checksum         0x47
 *     OEM ID           "ETRX"
 *     OEM Table ID     "CPUWRAP"
 *     OEM Revision     0x00006210 (25104)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20240827 (539232295)
 */
DefinitionBlock ("", "SSDT", 2, "ETRX", "CPUWRAP", 0x00006210)
{
    External (_SB_.CP00, DeviceObj)
    External (_SB_.CP01, DeviceObj)
    External (_SB_.CP02, DeviceObj)
    External (_SB_.CP03, DeviceObj)
    External (_SB_.CP04, DeviceObj)
    External (_SB_.CP05, DeviceObj)
    External (_SB_.CP06, DeviceObj)
    External (_SB_.CP07, DeviceObj)
    External (_SB_.SCK0, DeviceObj)

    Scope (\_SB)
    {
        Processor (PR00, 0x00, 0x00001810, 0x06)
        {
            Return (\_SB.CP00) /* External reference */
        }

        Processor (PR01, 0x01, 0x00001810, 0x06)
        {
            Return (\_SB.CP01) /* External reference */
        }

        Processor (PR02, 0x02, 0x00001810, 0x06)
        {
            Return (\_SB.CP02) /* External reference */
        }

        Processor (PR03, 0x03, 0x00001810, 0x06)
        {
            Return (\_SB.CP03) /* External reference */
        }

        Processor (PR04, 0x04, 0x00001810, 0x06)
        {
            Return (\_SB.CP04) /* External reference */
        }

        Processor (PR05, 0x05, 0x00001810, 0x06)
        {
            Return (\_SB.CP05) /* External reference */
        }

        Processor (PR06, 0x06, 0x00001810, 0x06)
        {
            Return (\_SB.CP06) /* External reference */
        }

        Processor (PR07, 0x07, 0x00001810, 0x06)
        {
            Return (\_SB.CP07) /* External reference */
        }
    }
}

