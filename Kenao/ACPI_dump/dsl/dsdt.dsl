/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20201113 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of dsdt.dat, Sat Nov 21 00:07:52 2020
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000853E (34110)
 *     Revision         0x02
 *     Checksum         0x0D
 *     OEM ID           "ALASKA"
 *     OEM Table ID     "A M I"
 *     OEM Revision     0x00000020 (32)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20051117 (537202967)
 */
DefinitionBlock ("", "DSDT", 2, "ALASKA", "A M I", 0x00000020)
{
    Name (SP1O, 0x2E)
    Name (IO1B, 0x0A00)
    Name (IO1L, 0x20)
    Name (IO2B, 0x0A20)
    Name (IO2L, 0x10)
    Name (IO3B, 0x0A30)
    Name (IO3L, 0x10)
    Name (TCBR, Zero)
    Name (TCLT, 0x1000)
    Name (SRCB, 0xFED1C000)
    Name (SRCL, 0x4000)
    Name (SUSW, 0xFF)
    Name (PMBS, 0x0400)
    Name (PMLN, 0x80)
    Name (SMIP, 0xB2)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x00100000)
    Name (PM30, 0x0430)
    Name (SMBS, 0x1180)
    Name (SMBL, 0x20)
    Name (HPTB, 0xFED00000)
    Name (HPTC, 0xFED1F404)
    Name (GPBS, 0x0500)
    Name (GPLN, 0x80)
    Name (PEBS, 0xD0000000)
    Name (LAPB, 0xFEE00000)
    Name (LAPL, 0x00100000)
    Name (VTD0, 0xFBFFC000)
    Name (ACPH, 0xDE)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (HIDK, 0x0303D041)
    Name (HIDM, 0x030FD041)
    Name (CIDK, 0x0B03D041)
    Name (CIDM, 0x130FD041)
    Name (PEHP, One)
    Name (SHPC, Zero)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (MBEC, 0xFFFF)
    Name (SRSI, 0xB2)
    Name (CSMI, 0x61)
    Name (DSSP, Zero)
    Name (FHPP, Zero)
    Name (WHEA, One)
    Name (PEER, Zero)
    Name (PEPM, Zero)
    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        If (Arg0)
        {
            DBG8 = 0xAA
        }
        Else
        {
            DBG8 = 0xAC
        }

        PICM = Arg0
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If ((OSVR != Ones))
        {
            Return (OSVR) /* \OSVR */
        }

        If ((PICM == Zero))
        {
            DBG8 = 0xAC
        }

        OSVR = 0x03
        If (CondRefOf (_OSI, Local0))
        {
            If (_OSI ("Windows 2001"))
            {
                OSVR = 0x04
            }

            If (_OSI ("Windows 2001.1"))
            {
                OSVR = 0x05
            }

            If (_OSI ("FreeBSD"))
            {
                OSVR = 0x06
            }

            If (_OSI ("HP-UX"))
            {
                OSVR = 0x07
            }

            If (_OSI ("OpenVMS"))
            {
                OSVR = 0x08
            }

            If (_OSI ("Windows 2001 SP1"))
            {
                OSVR = 0x09
            }

            If (_OSI ("Windows 2001 SP2"))
            {
                OSVR = 0x0A
            }

            If (_OSI ("Windows 2001 SP3"))
            {
                OSVR = 0x0B
            }

            If (_OSI ("Windows 2006"))
            {
                OSVR = 0x0C
            }

            If (_OSI ("Windows 2006 SP1"))
            {
                OSVR = 0x0D
            }

            If (_OSI ("Windows 2009"))
            {
                OSVR = 0x0E
            }

            If (_OSI ("Windows 2012"))
            {
                OSVR = 0x0F
            }

            If (_OSI ("Windows 2013"))
            {
                OSVR = 0x10
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                OSVR = Zero
            }

            If (MCTH (_OS, "Microsoft Windows"))
            {
                OSVR = One
            }

            If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
            {
                OSVR = 0x02
            }

            If (MCTH (_OS, "Linux"))
            {
                OSVR = 0x03
            }

            If (MCTH (_OS, "FreeBSD"))
            {
                OSVR = 0x06
            }

            If (MCTH (_OS, "HP-UX"))
            {
                OSVR = 0x07
            }

            If (MCTH (_OS, "OpenVMS"))
            {
                OSVR = 0x08
            }
        }

        Return (OSVR) /* \OSVR */
    }

    Method (MCTH, 2, NotSerialized)
    {
        If ((SizeOf (Arg0) < SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Local0 = (SizeOf (Arg0) + One)
        Name (BUF0, Buffer (Local0){})
        Name (BUF1, Buffer (Local0){})
        BUF0 = Arg0
        BUF1 = Arg1
        While (Local0)
        {
            Local0--
            If ((DerefOf (BUF0 [Local0]) != DerefOf (BUF1 [Local0]
                )))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        PRWP [Zero] = Arg0
        Local0 = (SS1 << One)
        Local0 |= (SS2 << 0x02)
        Local0 |= (SS3 << 0x03)
        Local0 |= (SS4 << 0x04)
        If (((One << Arg1) & Local0))
        {
            PRWP [One] = Arg1
        }
        Else
        {
            Local0 >>= One
            If (((OSFL () == One) || (OSFL () == 0x02)))
            {
                FindSetLeftBit (Local0, PRWP [One])
            }
            Else
            {
                FindSetRightBit (Local0, PRWP [One])
            }
        }

        Return (PRWP) /* \PRWP */
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, 0x80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, 0x90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Name (SS1, One)
    Name (SS2, Zero)
    Name (SS3, Zero)
    Name (SS4, One)
    Name (IOST, 0x4401)
    Name (TOPM, 0x00000000)
    Name (ROMS, 0xFFE00000)
    Name (VGAF, One)
    Scope (_SB)
    {
        Name (PR00, Package (0x26)
        {
            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR00, Package (0x26)
        {
            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0011FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x18
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x19
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x19
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x19
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x1A
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x1C
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x1D
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x1E
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x20
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                0x24
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                Zero, 
                0x25
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                Zero, 
                0x26
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x28
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                Zero, 
                0x2C
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                Zero, 
                0x2D
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                Zero, 
                0x2E
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x1F
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                Zero, 
                0x27
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                Zero, 
                0x1F
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                Zero, 
                0x27
            }
        })
        Name (PR01, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR01, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR20, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR20, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR22, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR22, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x1B
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x1E
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x1C
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x1D
            }
        })
        Name (PR23, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR23, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x20
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x24
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x25
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x26
            }
        })
        Name (PR27, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR27, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x28
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x2C
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x2D
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x2E
            }
        })
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,7,10,11,12,14,15}
        })
        Alias (PRSA, PRSB)
        Name (PRSC, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,10,11,12,14,15}
        })
        Alias (PRSC, PRSD)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00) /* \_SB_.AR00 */
                }

                Return (PR00) /* \_SB_.PR00 */
            }

            Name (CPRB, One)
            Name (LVGA, 0x01)
            Name (STAV, 0x0F)
            Name (BRB, 0x0000)
            Name (BRL, 0x00FF)
            Name (IOB, 0x1000)
            Name (IOL, 0xF000)
            Name (MBB, 0xCC000000)
            Name (MBL, 0x34000000)
            Name (MABL, 0x00000000)
            Name (MABH, 0x00000000)
            Name (MALL, 0x00000000)
            Name (MALH, 0x00000000)
            Name (MAML, 0x00000000)
            Name (MAMH, 0x00000000)
            Name (CRS1, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x007F,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y00)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x03AF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x03B0,             // Length
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x03E0,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0918,             // Length
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y02, TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0x0FFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0300,             // Length
                    ,, _Y01, TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x02000000,         // Range Minimum
                    0xFFDFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFDFC0000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
            })
            Name (CRS2, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0080,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0080,             // Length
                    ,, _Y06)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y08, TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0000,             // Length
                    ,, _Y07, TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x80000000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (STAV) /* \_SB_.PCI0.STAV */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                If (CPRB)
                {
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MIN, MIN0)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._MAX, MAX0)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y00._LEN, LEN0)  // _LEN: Length
                    MIN0 = BRB /* \_SB_.PCI0.BRB_ */
                    LEN0 = BRL /* \_SB_.PCI0.BRL_ */
                    Local0 = LEN0 /* \_SB_.PCI0._CRS.LEN0 */
                    MAX0 = (MIN0 + Local0--)
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MIN, MIN1)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._MAX, MAX1)  // _MAX: Maximum Base Address
                    CreateWordField (CRS1, \_SB.PCI0._Y01._LEN, LEN1)  // _LEN: Length
                    If ((IOB == 0x1000))
                    {
                        Local0 = IOL /* \_SB_.PCI0.IOL_ */
                        MAX1 = (IOB + Local0--)
                        Local0 = (MAX1 - MIN1) /* \_SB_.PCI0._CRS.MIN1 */
                        LEN1 = (Local0 + One)
                    }
                    Else
                    {
                        MIN1 = IOB /* \_SB_.PCI0.IOB_ */
                        LEN1 = IOL /* \_SB_.PCI0.IOL_ */
                        Local0 = LEN1 /* \_SB_.PCI0._CRS.LEN1 */
                        MAX1 = (MIN1 + Local0--)
                    }

                    If (((LVGA == One) || (LVGA == 0x55)))
                    {
                        If (VGAF)
                        {
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MIN, IMN1)  // _MIN: Minimum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._MAX, IMX1)  // _MAX: Maximum Base Address
                            CreateWordField (CRS1, \_SB.PCI0._Y02._LEN, ILN1)  // _LEN: Length
                            IMN1 = 0x03B0
                            IMX1 = 0x03DF
                            ILN1 = 0x30
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MIN, VMN1)  // _MIN: Minimum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._MAX, VMX1)  // _MAX: Maximum Base Address
                            CreateDWordField (CRS1, \_SB.PCI0._Y03._LEN, VLN1)  // _LEN: Length
                            VMN1 = 0x000A0000
                            VMX1 = 0x000BFFFF
                            VLN1 = 0x00020000
                            VGAF = Zero
                        }
                    }

                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MIN, MIN3)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._MAX, MAX3)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS1, \_SB.PCI0._Y04._LEN, LEN3)  // _LEN: Length
                    MIN3 = MBB /* \_SB_.PCI0.MBB_ */
                    LEN3 = MBL /* \_SB_.PCI0.MBL_ */
                    Local0 = LEN3 /* \_SB_.PCI0._CRS.LEN3 */
                    MAX3 = (MIN3 + Local0--)
                    If ((MALH || MALL))
                    {
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._MIN, MN8L)  // _MIN: Minimum Base Address
                        Local0 = (0xB4 + 0x04)
                        CreateDWordField (CRS1, Local0, MN8H)
                        MN8L = MABL /* \_SB_.PCI0.MABL */
                        MN8H = MABH /* \_SB_.PCI0.MABH */
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._MAX, MX8L)  // _MAX: Maximum Base Address
                        Local1 = (0xBC + 0x04)
                        CreateDWordField (CRS1, Local1, MX8H)
                        CreateDWordField (CRS1, \_SB.PCI0._Y05._LEN, LN8L)  // _LEN: Length
                        Local2 = (0xCC + 0x04)
                        CreateDWordField (CRS1, Local2, LN8H)
                        MN8L = MABL /* \_SB_.PCI0.MABL */
                        MN8H = MABH /* \_SB_.PCI0.MABH */
                        LN8L = MALL /* \_SB_.PCI0.MALL */
                        LN8H = MALH /* \_SB_.PCI0.MALH */
                        MX8L = MAML /* \_SB_.PCI0.MAML */
                        MX8H = MAMH /* \_SB_.PCI0.MAMH */
                    }

                    Return (CRS1) /* \_SB_.PCI0.CRS1 */
                }
                Else
                {
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MIN, MIN2)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._MAX, MAX2)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y06._LEN, LEN2)  // _LEN: Length
                    MIN2 = BRB /* \_SB_.PCI0.BRB_ */
                    LEN2 = BRL /* \_SB_.PCI0.BRL_ */
                    Local1 = LEN2 /* \_SB_.PCI0._CRS.LEN2 */
                    MAX2 = (MIN2 + Local1--)
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MIN, MIN4)  // _MIN: Minimum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._MAX, MAX4)  // _MAX: Maximum Base Address
                    CreateWordField (CRS2, \_SB.PCI0._Y07._LEN, LEN4)  // _LEN: Length
                    MIN4 = IOB /* \_SB_.PCI0.IOB_ */
                    LEN4 = IOL /* \_SB_.PCI0.IOL_ */
                    Local1 = LEN4 /* \_SB_.PCI0._CRS.LEN4 */
                    MAX4 = (MIN4 + Local1--)
                    If (LVGA)
                    {
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MIN, IMN2)  // _MIN: Minimum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._MAX, IMX2)  // _MAX: Maximum Base Address
                        CreateWordField (CRS2, \_SB.PCI0._Y08._LEN, ILN2)  // _LEN: Length
                        IMN2 = 0x03B0
                        IMX2 = 0x03DF
                        ILN2 = 0x30
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MIN, VMN2)  // _MIN: Minimum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._MAX, VMX2)  // _MAX: Maximum Base Address
                        CreateDWordField (CRS2, \_SB.PCI0._Y09._LEN, VLN2)  // _LEN: Length
                        VMN2 = 0x000A0000
                        VMX2 = 0x000BFFFF
                        VLN2 = 0x00020000
                    }

                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MIN, MIN5)  // _MIN: Minimum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._MAX, MAX5)  // _MAX: Maximum Base Address
                    CreateDWordField (CRS2, \_SB.PCI0._Y0A._LEN, LEN5)  // _LEN: Length
                    MIN5 = MBB /* \_SB_.PCI0.MBB_ */
                    LEN5 = MBL /* \_SB_.PCI0.MBL_ */
                    Local1 = LEN5 /* \_SB_.PCI0._CRS.LEN5 */
                    MAX5 = (MIN5 + Local1--)
                    If ((MALH || MALL))
                    {
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._MIN, MN9L)  // _MIN: Minimum Base Address
                        Local0 = (0x72 + 0x04)
                        CreateDWordField (CRS2, Local0, MN9H)
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._MAX, MX9L)  // _MAX: Maximum Base Address
                        Local1 = (0x7A + 0x04)
                        CreateDWordField (CRS2, Local1, MX9H)
                        CreateDWordField (CRS2, \_SB.PCI0._Y0B._LEN, LN9L)  // _LEN: Length
                        Local2 = (0x8A + 0x04)
                        CreateDWordField (CRS2, Local2, LN9H)
                        MN9L = MABL /* \_SB_.PCI0.MABL */
                        MN9H = MABH /* \_SB_.PCI0.MABH */
                        LN9L = MALL /* \_SB_.PCI0.MALL */
                        LN9H = MALH /* \_SB_.PCI0.MALH */
                        MX9L = MAML /* \_SB_.PCI0.MAML */
                        MX9H = MAMH /* \_SB_.PCI0.MAMH */
                    }

                    Return (CRS2) /* \_SB_.PCI0.CRS2 */
                }
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                Name (SUPP, Zero)
                Name (CTRL, Zero)
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    If (!PEHP)
                    {
                        CTRL &= 0x1E
                    }

                    If (!SHPC)
                    {
                        CTRL &= 0x1D
                    }

                    If (!PEPM)
                    {
                        CTRL &= 0x1B
                    }

                    If (!PEER)
                    {
                        CTRL &= 0x15
                    }

                    If (!PECS)
                    {
                        CTRL &= 0x0F
                    }

                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0._OSC.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Device (IOH)
            {
                Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
                Name (IOHM, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFC000000,         // Address Base
                        0x01000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFD000000,         // Address Base
                        0x01000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFE000000,         // Address Base
                        0x00B00000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEB00000,         // Address Base
                        0x00100000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED00400,         // Address Base
                        0x0003FC00,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED45000,         // Address Base
                        0x000BB000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y0C)
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    If (LAPB)
                    {
                        CreateDWordField (IOHM, \_SB.PCI0.IOH._Y0C._BAS, APB)  // _BAS: Base Address
                        CreateDWordField (IOHM, \_SB.PCI0.IOH._Y0C._LEN, APL)  // _LEN: Length
                        APB = LAPB /* \LAPB */
                        APL = LAPL /* \LAPL */
                    }

                    Return (IOHM) /* \_SB_.PCI0.IOH_.IOHM */
                }
            }

            Method (NPTS, 1, NotSerialized)
            {
            }

            Method (NWAK, 1, NotSerialized)
            {
            }

            Device (^UNC0)
            {
                Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID: Hardware ID
                Name (UBN0, 0xFF)
                Method (_UID, 0, NotSerialized)  // _UID: Unique ID
                {
                    Return (UBN0) /* \_SB_.UNC0.UBN0 */
                }

                Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
                {
                    Return (UBN0) /* \_SB_.UNC0.UBN0 */
                }

                Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
                {
                    Return (Arg3)
                }

                Name (_ADR, Zero)  // _ADR: Address
                Name (CRS1, ResourceTemplate ()
                {
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x00FF,             // Range Minimum
                        0x00FF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0001,             // Length
                        ,, _Y0D)
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (CRS1, \_SB.UNC0._Y0D._MIN, UMIN)  // _MIN: Minimum Base Address
                    UMIN = UBN0 /* \_SB_.UNC0.UBN0 */
                    CreateDWordField (CRS1, \_SB.UNC0._Y0D._MAX, UMAX)  // _MAX: Maximum Base Address
                    UMAX = UBN0 /* \_SB_.UNC0.UBN0 */
                    Return (CRS1) /* \_SB_.UNC0.CRS1 */
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (^^PCI0.STAV) /* \_SB_.PCI0.STAV */
                }
            }

            Device (VTDR)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadOnly,
                        0x00000000,         // Address Base
                        0x00002000,         // Address Length
                        _Y0E)
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((VTD0 == 0xFFFFFFFF))
                    {
                        Return (Zero)
                    }

                    Return (0x0F)
                }

                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (BUF0, \_SB.PCI0.VTDR._Y0E._BAS, VBR0)  // _BAS: Base Address
                    CreateDWordField (BUF0, \_SB.PCI0.VTDR._Y0E._LEN, VLT0)  // _LEN: Length
                    VBR0 = VTD0 /* \VTD0 */
                    If ((VTD0 == 0xFFFFFFFF))
                    {
                        VLT0 = Zero
                    }

                    Return (BUF0) /* \_SB_.PCI0.VTDR.BUF0 */
                }
            }

            Device (SBRG)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Method (SPTS, 1, NotSerialized)
                {
                    PS1S = One
                    PS1E = One
                    SLPS = One
                }

                Method (SWAK, 1, NotSerialized)
                {
                    SLPS = Zero
                    PS1E = Zero
                    If (RTCS){}
                    Else
                    {
                        Notify (PWRB, 0x02) // Device Wake
                    }
                }

                OperationRegion (SMIE, SystemIO, PM30, 0x08)
                Field (SMIE, ByteAcc, NoLock, Preserve)
                {
                        ,   4, 
                    PS1E,   1, 
                        ,   31, 
                    PS1S,   1, 
                    Offset (0x08)
                }

                Scope (\_SB)
                {
                    Name (SLPS, Zero)
                    OperationRegion (PMS0, SystemIO, PMBS, 0x04)
                    Field (PMS0, ByteAcc, NoLock, Preserve)
                    {
                            ,   10, 
                        RTCS,   1, 
                            ,   3, 
                        PEXS,   1, 
                        WAKS,   1, 
                        Offset (0x03), 
                        PWBT,   1, 
                        Offset (0x04)
                    }

                    Device (SLPB)
                    {
                        Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If ((SUSW != 0xFF))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                        {
                            If ((SUSW != 0xFF))
                            {
                                Return (Package (0x02)
                                {
                                    SUSW, 
                                    0x04
                                })
                            }
                            Else
                            {
                                Return (Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                })
                            }
                        }
                    }
                }

                Scope (\_SB)
                {
                    Scope (PCI0)
                    {
                        Device (PCH)
                        {
                            Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                            Name (_UID, 0x01C7)  // _UID: Unique ID
                            Name (_STA, 0x0F)  // _STA: Status
                            Name (ICHR, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y0F)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y10)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y11)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y12)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y14)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y13)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y15)
                                Memory32Fixed (ReadWrite,
                                    0xFF000000,         // Address Base
                                    0x01000000,         // Address Length
                                    )
                            })
                            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                            {
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0F._MIN, PBB)  // _MIN: Minimum Base Address
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y0F._MAX, PBH)  // _MAX: Maximum Base Address
                                CreateByteField (ICHR, \_SB.PCI0.PCH._Y0F._LEN, PML)  // _LEN: Length
                                PBB = PMBS /* \PMBS */
                                PBH = PMBS /* \PMBS */
                                PML = 0x54
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y10._MIN, P2B)  // _MIN: Minimum Base Address
                                CreateWordField (ICHR, \_SB.PCI0.PCH._Y10._MAX, P2H)  // _MAX: Maximum Base Address
                                CreateByteField (ICHR, \_SB.PCI0.PCH._Y10._LEN, P2L)  // _LEN: Length
                                P2B = (PMBS + 0x58)
                                P2H = (PMBS + 0x58)
                                P2L = 0x28
                                If (SMBS)
                                {
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y11._MIN, SMB)  // _MIN: Minimum Base Address
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y11._MAX, SMH)  // _MAX: Maximum Base Address
                                    CreateByteField (ICHR, \_SB.PCI0.PCH._Y11._LEN, SML)  // _LEN: Length
                                    SMB = SMBS /* \SMBS */
                                    SMH = SMBS /* \SMBS */
                                    SML = SMBL /* \SMBL */
                                }

                                If (GPBS)
                                {
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y12._MIN, IGB)  // _MIN: Minimum Base Address
                                    CreateWordField (ICHR, \_SB.PCI0.PCH._Y12._MAX, IGH)  // _MAX: Maximum Base Address
                                    CreateByteField (ICHR, \_SB.PCI0.PCH._Y12._LEN, IGL)  // _LEN: Length
                                    IGB = GPBS /* \GPBS */
                                    IGH = GPBS /* \GPBS */
                                    IGL = GPLN /* \GPLN */
                                }

                                If (APCB)
                                {
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y13._BAS, APB)  // _BAS: Base Address
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y13._LEN, APL)  // _LEN: Length
                                    APB = APCB /* \APCB */
                                    APL = APCL /* \APCL */
                                }

                                CreateDWordField (ICHR, \_SB.PCI0.PCH._Y14._BAS, RCB)  // _BAS: Base Address
                                CreateDWordField (ICHR, \_SB.PCI0.PCH._Y14._LEN, RCL)  // _LEN: Length
                                RCB = SRCB /* \SRCB */
                                RCL = SRCL /* \SRCL */
                                If (TCBR)
                                {
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y15._BAS, TCB)  // _BAS: Base Address
                                    CreateDWordField (ICHR, \_SB.PCI0.PCH._Y15._LEN, TCL)  // _LEN: Length
                                    TCB = TCBR /* \TCBR */
                                    TCL = TCLT /* \TCLT */
                                }

                                Return (ICHR) /* \_SB_.PCI0.PCH_.ICHR */
                            }
                        }

                        Device (CWDT)
                        {
                            Name (_HID, EisaId ("INT3F0D") /* ACPI Motherboard Resources */)  // _HID: Hardware ID
                            Name (_CID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _CID: Compatible ID
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0454,             // Range Minimum
                                    0x0454,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    _Y16)
                            })
                            Method (_STA, 0, Serialized)  // _STA: Status
                            {
                                Return (0x0F)
                            }

                            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                            {
                                CreateWordField (BUF0, \_SB.PCI0.CWDT._Y16._MIN, WDB)  // _MIN: Minimum Base Address
                                CreateWordField (BUF0, \_SB.PCI0.CWDT._Y16._MAX, WDH)  // _MAX: Maximum Base Address
                                WDB = (PMBS + 0x54)
                                WDH = (PMBS + 0x54)
                                Return (BUF0) /* \_SB_.PCI0.CWDT.BUF0 */
                            }
                        }
                    }
                }

                Device (SIO1)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x0111)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y17)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y18)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y19)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y1A)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (((SP1O < 0x03F0) && (SP1O > 0xF0)))
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._MIN, GPI0)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._MAX, GPI1)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y17._LEN, GPIL)  // _LEN: Length
                            GPI0 = SP1O /* \SP1O */
                            GPI1 = SP1O /* \SP1O */
                            GPIL = 0x02
                        }

                        If (IO1B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y18._MIN, GP10)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y18._MAX, GP11)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y18._LEN, GPL1)  // _LEN: Length
                            GP10 = IO1B /* \IO1B */
                            GP11 = IO1B /* \IO1B */
                            GPL1 = IO1L /* \IO1L */
                        }

                        If (IO2B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y19._MIN, GP20)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y19._MAX, GP21)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y19._LEN, GPL2)  // _LEN: Length
                            GP20 = IO2B /* \IO2B */
                            GP21 = IO2B /* \IO2B */
                            GPL2 = IO2L /* \IO2L */
                        }

                        If (IO3B)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y1A._MIN, GP30)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y1A._MAX, GP31)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y1A._LEN, GPL3)  // _LEN: Length
                            GP30 = IO3B /* \IO3B */
                            GP31 = IO3B /* \IO3B */
                            GPL3 = IO3L /* \IO3L */
                        }

                        Return (CRS) /* \_SB_.PCI0.SBRG.SIO1.CRS_ */
                    }

                    Name (DCAT, Package (0x11)
                    {
                        One, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x05, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        0x0A
                    })
                    Mutex (MUT0, 0x00)
                    Method (ENFG, 1, NotSerialized)
                    {
                        Acquire (MUT0, 0x0FFF)
                        INDX = 0x87
                        INDX = One
                        INDX = 0x55
                        If ((SP1O == 0x2E))
                        {
                            INDX = 0x55
                        }
                        Else
                        {
                            INDX = 0xAA
                        }

                        LDN = Arg0
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        INDX = 0x02
                        DATA = 0x02
                        Release (MUT0)
                    }

                    Method (UHID, 1, NotSerialized)
                    {
                        Return (0x0105D041)
                    }

                    OperationRegion (IOID, SystemIO, SP1O, 0x02)
                    Field (IOID, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x07), 
                        LDN,    8, 
                        Offset (0x21), 
                        SCF1,   8, 
                        SCF2,   8, 
                        SCF3,   8, 
                        SCF4,   8, 
                        SCF5,   8, 
                        SCF6,   8, 
                        SCF7,   8, 
                        SCF8,   8, 
                        CKCF,   8, 
                        Offset (0x30), 
                        ACTR,   8, 
                        Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                        IOH2,   8, 
                        IOL2,   8, 
                        Offset (0x70), 
                        INTR,   4, 
                        REV,    4, 
                        Offset (0x74), 
                        DMCH,   8, 
                        Offset (0xE0), 
                        RGE0,   8, 
                        RGE1,   8, 
                        RGE2,   8, 
                        RGE3,   8, 
                        RGE4,   8, 
                        RGE5,   8, 
                        RGE6,   8, 
                        RGE7,   8, 
                        RGE8,   8, 
                        RGE9,   8, 
                        Offset (0xF0), 
                        OPT0,   8, 
                        OPT1,   8, 
                        OPT2,   8, 
                        OPT3,   8, 
                        OPT4,   8, 
                        OPT5,   8, 
                        OPT6,   8, 
                        OPT7,   8, 
                        OPT8,   8, 
                        OPT9,   8, 
                        OPTA,   8, 
                        OPTB,   8
                    }

                    Method (CGLD, 1, NotSerialized)
                    {
                        Return (DerefOf (DCAT [Arg0]))
                    }

                    Method (DSTA, 1, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        Local0 = ACTR /* \_SB_.PCI0.SBRG.SIO1.ACTR */
                        If ((Local0 == 0xFF))
                        {
                            Return (Zero)
                        }

                        Local0 &= One
                        If ((Arg0 < 0x10))
                        {
                            IOST |= (Local0 << Arg0)
                        }

                        If (Local0)
                        {
                            Return (0x0F)
                        }
                        ElseIf ((Arg0 < 0x10))
                        {
                            If (((One << Arg0) & IOST))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Else
                        {
                            Local0 = ((IOAH << 0x08) | IOAL) /* \_SB_.PCI0.SBRG.SIO1.IOAL */
                            If (Local0)
                            {
                                Return (0x0D)
                            }

                            Local0 = ((IOH2 << 0x08) | IOL2) /* \_SB_.PCI0.SBRG.SIO1.IOL2 */
                            If (Local0)
                            {
                                Return (0x0D)
                            }

                            Return (Zero)
                        }

                        EXFG ()
                    }

                    Method (DCNT, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        If (((DMCH < 0x04) && ((Local1 = (DMCH & 0x03)) != Zero)))
                        {
                            RDMA (Arg0, Arg1, Local1++)
                        }

                        ACTR = Arg1
                        Local1 = (IOAH << 0x08)
                        Local1 |= IOAL
                        RRIO (Arg0, Arg1, Local1, 0x08)
                        EXFG ()
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x00,               // Length
                            _Y1D)
                        IRQNoFlags (_Y1B)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y1C)
                            {}
                    })
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1B._INT, IRQM)  // _INT: Interrupts
                    CreateByteField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1C._DMA, DMAM)  // _DMA: Direct Memory Access
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1D._MIN, IO11)  // _MIN: Minimum Base Address
                    CreateWordField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1D._MAX, IO12)  // _MAX: Maximum Base Address
                    CreateByteField (CRS1, \_SB.PCI0.SBRG.SIO1._Y1D._LEN, LEN1)  // _LEN: Length
                    Method (DCRS, 2, NotSerialized)
                    {
                        ENFG (CGLD (Arg0))
                        IO11 = (IOAH << 0x08)
                        IO11 |= IOAL /* \_SB_.PCI0.SBRG.SIO1.IO11 */
                        IO12 = IO11 /* \_SB_.PCI0.SBRG.SIO1.IO11 */
                        LEN1 = 0x08
                        If (INTR)
                        {
                            IRQM = (One << INTR) /* \_SB_.PCI0.SBRG.SIO1.INTR */
                        }
                        Else
                        {
                            IRQM = Zero
                        }

                        If (((DMCH > 0x03) || (Arg1 == Zero)))
                        {
                            DMAM = Zero
                        }
                        Else
                        {
                            Local1 = (DMCH & 0x03)
                            DMAM = (One << Local1)
                        }

                        EXFG ()
                        Return (CRS1) /* \_SB_.PCI0.SBRG.SIO1.CRS1 */
                    }

                    Method (DSRS, 2, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x09, IRQM)
                        CreateByteField (Arg0, 0x0C, DMAM)
                        CreateWordField (Arg0, 0x02, IO11)
                        ENFG (CGLD (Arg1))
                        IOAL = (IO11 & 0xFF)
                        IOAH = (IO11 >> 0x08)
                        If (IRQM)
                        {
                            FindSetRightBit (IRQM, Local0)
                            INTR = (Local0 - One)
                        }
                        Else
                        {
                            INTR = Zero
                        }

                        If (DMAM)
                        {
                            FindSetRightBit (DMAM, Local0)
                            DMCH = (Local0 - One)
                        }
                        Else
                        {
                            DMCH = 0x04
                        }

                        EXFG ()
                        DCNT (Arg1, One)
                        Local2 = Arg1
                        If ((Local2 > Zero))
                        {
                            Local2 -= One
                        }
                    }
                }

                Name (PMFG, Zero)
                Method (SIOS, 1, NotSerialized)
                {
                    Debug = "SIOS"
                    If ((0x05 != Arg0))
                    {
                        ^SIO1.ENFG (0x04)
                        If (KBFG)
                        {
                            ^SIO1.OPT0 |= 0x08
                        }
                        Else
                        {
                            ^SIO1.OPT0 &= 0xF7
                        }

                        If (MSFG)
                        {
                            ^SIO1.OPT0 |= 0x10
                        }
                        Else
                        {
                            ^SIO1.OPT0 &= 0xEF
                        }

                        ^SIO1.OPT1 = 0xFF
                        Local0 = (0xBF & ^SIO1.OPT2) /* \_SB_.PCI0.SBRG.SIO1.OPT2 */
                        ^SIO1.OPT2 = Local0
                        ^SIO1.EXFG ()
                    }
                }

                Method (SIOW, 1, NotSerialized)
                {
                    Debug = "SIOW"
                    ^SIO1.ENFG (0x04)
                    PMFG = ^SIO1.OPT1 /* \_SB_.PCI0.SBRG.SIO1.OPT1 */
                    ^SIO1.OPT1 = 0xFF
                    ^SIO1.OPT0 &= 0xE7
                    Local0 = (0x40 | ^SIO1.OPT2) /* \_SB_.PCI0.SBRG.SIO1.OPT2 */
                    ^SIO1.OPT2 = Local0
                    ^SIO1.EXFG ()
                }

                Method (SIOH, 0, NotSerialized)
                {
                    If ((PMFG & 0x08))
                    {
                        Notify (PS2K, 0x02) // Device Wake
                    }

                    If ((PMFG & 0x10))
                    {
                        Notify (PS2M, 0x02) // Device Wake
                    }
                }

                Device (PS2K)
                {
                    Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                    {
                        Return (HIDK) /* \HIDK */
                    }

                    Method (_CID, 0, NotSerialized)  // _CID: Compatible ID
                    {
                        Return (CIDK) /* \CIDK */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((IOST & 0x0400))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x0060,             // Range Minimum
                                0x0060,             // Range Maximum
                                0x00,               // Alignment
                                0x01,               // Length
                                )
                            IO (Decode16,
                                0x0064,             // Range Minimum
                                0x0064,             // Range Maximum
                                0x00,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {1}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        KBFG = Arg0
                    }
                }

                Scope (\)
                {
                    Name (KBFG, One)
                }

                Device (PS2M)
                {
                    Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                    {
                        Return (HIDM) /* \HIDM */
                    }

                    Method (_CID, 0, NotSerialized)  // _CID: Compatible ID
                    {
                        Return (CIDM) /* \CIDM */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((IOST & 0x4000))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (CRS1, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((IOST & 0x0400))
                        {
                            Return (CRS1) /* \_SB_.PCI0.SBRG.PS2M.CRS1 */
                        }
                        Else
                        {
                            Return (CRS2) /* \_SB_.PCI0.SBRG.PS2M.CRS2 */
                        }
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IRQNoFlags ()
                                {12}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        MSFG = Arg0
                    }
                }

                Scope (\)
                {
                    Name (MSFG, One)
                }

                Device (UAR1)
                {
                    Name (_UID, One)  // _UID: Unique ID
                    Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                    {
                        Return (^^SIO1.UHID (Zero))
                    }

                    Method (_STA, 0, Serialized)  // _STA: Status
                    {
                        If ((IOST & One))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        ^^SIO1.DCNT (Zero, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (^^SIO1.DCRS (Zero, Zero))
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        ^^SIO1.DSRS (Arg0, Zero)
                    }

                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        EndDependentFn ()
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMAD)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, 0x10)  // _UID: Unique ID
                    Name (CRS1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x00,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If ((MBEC & 0xFFFF))
                        {
                            Return (CRS1) /* \_SB_.PCI0.SBRG.RMSC.CRS1 */
                        }
                        Else
                        {
                            Return (CRS2) /* \_SB_.PCI0.SBRG.RMSC.CRS2 */
                        }
                    }
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }
            }

            Device (P0P9)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x03))
                }
            }

            Device (SAT0)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                Name (^NATA, Package (0x01)
                {
                    0x001F0002
                })
                Name (\FZTF, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF5         // .......
                })
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If ((Arg0 == 0x02))
                    {
                        REGF = Arg1
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x78, 
                        0x5A, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14){})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                    Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                    Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                    Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                    Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                    Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                    Offset (0x0C), 
                    Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (CHN0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (PSCR << One)
                        Local0 = (PMCR | Local1)
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local1 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local2 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local0 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local1 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local1 |= Local3
                        GMPT = PMRI /* \_SB_.PCI0.SAT0.PMRI */
                        GMUE = Local0
                        GMUT = PMUT /* \_SB_.PCI0.SAT0.PMUT */
                        GMCR = PMCR /* \_SB_.PCI0.SAT0.PMCR */
                        GSPT = PSRI /* \_SB_.PCI0.SAT0.PSRI */
                        GSUE = Local1
                        GSUT = PSUT /* \_SB_.PCI0.SAT0.PSUT */
                        GSCR = PSCR /* \_SB_.PCI0.SAT0.PSCR */
                        STM ()
                        PMRI = GMPT /* \_SB_.PCI0.SAT0.GMPT */
                        Local0 = GMUE /* \_SB_.PCI0.SAT0.GMUE */
                        PMUT = GMUT /* \_SB_.PCI0.SAT0.GMUT */
                        PMCR = GMCR /* \_SB_.PCI0.SAT0.GMCR */
                        Local1 = GSUE /* \_SB_.PCI0.SAT0.GSUE */
                        PSUT = GSUT /* \_SB_.PCI0.SAT0.GSUT */
                        PSCR = GSCR /* \_SB_.PCI0.SAT0.GSCR */
                        If ((Local0 & One))
                        {
                            PM3E = One
                        }
                        Else
                        {
                            PM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            PM6E = One
                        }
                        Else
                        {
                            PM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            PMAE = One
                        }
                        Else
                        {
                            PMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            PS3E = One
                        }
                        Else
                        {
                            PS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            PS6E = One
                        }
                        Else
                        {
                            PS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            PSAE = One
                        }
                        Else
                        {
                            PSAE = Zero
                        }

                        ATA0 = GTF (Zero, Arg1)
                        ATA1 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (CHN1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (SSCR << One)
                        Local0 = (SMCR | Local1)
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local1 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local2 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local0 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local1 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local1 |= Local3
                        GMPT = SMRI /* \_SB_.PCI0.SAT0.SMRI */
                        GMUE = Local0
                        GMUT = SMUT /* \_SB_.PCI0.SAT0.SMUT */
                        GMCR = SMCR /* \_SB_.PCI0.SAT0.SMCR */
                        GSPT = SSRI /* \_SB_.PCI0.SAT0.SSRI */
                        GSUE = Local1
                        GSUT = SSUT /* \_SB_.PCI0.SAT0.SSUT */
                        GSCR = SSCR /* \_SB_.PCI0.SAT0.SSCR */
                        STM ()
                        SMRI = GMPT /* \_SB_.PCI0.SAT0.GMPT */
                        Local0 = GMUE /* \_SB_.PCI0.SAT0.GMUE */
                        SMUT = GMUT /* \_SB_.PCI0.SAT0.GMUT */
                        SMCR = GMCR /* \_SB_.PCI0.SAT0.GMCR */
                        Local1 = GSUE /* \_SB_.PCI0.SAT0.GSUE */
                        SSUT = GSUT /* \_SB_.PCI0.SAT0.GSUT */
                        SSCR = GSCR /* \_SB_.PCI0.SAT0.GSCR */
                        If ((Local0 & One))
                        {
                            SM3E = One
                        }
                        Else
                        {
                            SM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            SM6E = One
                        }
                        Else
                        {
                            SM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            SMAE = One
                        }
                        Else
                        {
                            SMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            SS3E = One
                        }
                        Else
                        {
                            SS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            SS6E = One
                        }
                        Else
                        {
                            SS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            SSAE = One
                        }
                        Else
                        {
                            SSAE = Zero
                        }

                        ATA2 = GTF (Zero, Arg1)
                        ATA3 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    PIO0 = Ones
                    PIO1 = Ones
                    DMA0 = Ones
                    DMA1 = Ones
                    CHNF = 0x10
                    If (REGF){}
                    Else
                    {
                        Return (TMD0) /* \_SB_.PCI0.SAT0.TMD0 */
                    }

                    If ((Arg1 & 0x20))
                    {
                        CHNF |= 0x02
                    }

                    Local6 = Match (DerefOf (TIM0 [One]), MEQ, Arg0, MTR, Zero, 
                        Zero)
                    Local7 = DerefOf (DerefOf (TIM0 [Zero]) [Local6])
                    DMA0 = Local7
                    PIO0 = Local7
                    If ((Arg4 & 0x20))
                    {
                        CHNF |= 0x08
                    }

                    Local6 = Match (DerefOf (TIM0 [0x02]), MEQ, Arg3, MTR, Zero, 
                        Zero)
                    Local7 = DerefOf (DerefOf (TIM0 [Zero]) [Local6])
                    DMA1 = Local7
                    PIO1 = Local7
                    If ((Arg1 & 0x07))
                    {
                        Local5 = Arg2
                        If ((Arg1 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg1 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA0 = DerefOf (DerefOf (TIM0 [0x03]) [Local5])
                        CHNF |= One
                    }

                    If ((Arg4 & 0x07))
                    {
                        Local5 = Arg5
                        If ((Arg4 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg4 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA1 = DerefOf (DerefOf (TIM0 [0x03]) [Local5])
                        CHNF |= 0x04
                    }

                    Debug = TMD0 /* \_SB_.PCI0.SAT0.TMD0 */
                    Return (TMD0) /* \_SB_.PCI0.SAT0.TMD0 */
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF)
                    {
                        GMUE = Zero
                        GMUT = Zero
                        GSUE = Zero
                        GSUT = Zero
                        If ((CHNF & One))
                        {
                            Local0 = Match (DerefOf (TIM0 [0x03]), MLE, DMA0, MTR, Zero, 
                                Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GMUT = DerefOf (DerefOf (TIM0 [0x04]) [Local0])
                            GMUE |= One
                            If ((Local0 > 0x02))
                            {
                                GMUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GMUE &= 0xFD
                                GMUE |= 0x04
                            }
                        }
                        ElseIf (((PIO0 == Ones) | (PIO0 == Zero)))
                        {
                            If (((DMA0 < Ones) & (DMA0 > Zero)))
                            {
                                PIO0 = DMA0 /* \_SB_.PCI0.SAT0.DMA0 */
                                GMUE |= 0x80
                            }
                        }

                        If ((CHNF & 0x04))
                        {
                            Local0 = Match (DerefOf (TIM0 [0x03]), MLE, DMA1, MTR, Zero, 
                                Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GSUT = DerefOf (DerefOf (TIM0 [0x04]) [Local0])
                            GSUE |= One
                            If ((Local0 > 0x02))
                            {
                                GSUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GSUE &= 0xFD
                                GSUE |= 0x04
                            }
                        }
                        ElseIf (((PIO1 == Ones) | (PIO1 == Zero)))
                        {
                            If (((DMA1 < Ones) & (DMA1 > Zero)))
                            {
                                PIO1 = DMA1 /* \_SB_.PCI0.SAT0.DMA1 */
                                GSUE |= 0x80
                            }
                        }

                        If ((CHNF & 0x02))
                        {
                            GMUE |= 0x20
                        }

                        If ((CHNF & 0x08))
                        {
                            GSUE |= 0x20
                        }

                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIO0, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = DerefOf (DerefOf (TIM0 [One]) [Local0])
                        GMPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GMUE |= 0x50
                        }

                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIO1, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = DerefOf (DerefOf (TIM0 [0x02]) [Local0])
                        GSPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GSUE |= 0x50
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF         // .......
                })
                Name (AT02, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90         // .......
                })
                Name (AT03, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6         // .......
                })
                Name (AT04, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91         // .......
                })
                Name (ATA0, Buffer (0x1D){})
                Name (ATA1, Buffer (0x1D){})
                Name (ATA2, Buffer (0x1D){})
                Name (ATA3, Buffer (0x1D){})
                Name (ATAB, Buffer (0x1D){})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Local0 = (CMDC * 0x38)
                    Local1 = (Local0 + 0x08)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Local0 = (CMDC * 0x07)
                    CreateByteField (ATAB, (Local0 + 0x02), A001)
                    CreateByteField (ATAB, (Local0 + 0x06), A005)
                    CMDX = Arg0
                    A001 = Arg1
                    A005 = Arg2
                    CMDC++
                }

                Method (GTF, 2, Serialized)
                {
                    Debug = Arg1
                    CMDC = Zero
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If ((SizeOf (Arg1) == 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        ID49 = IW49 /* \_SB_.PCI0.SAT0.GTF_.IW49 */
                        CreateWordField (Arg1, 0x6A, IW53)
                        ID53 = IW53 /* \_SB_.PCI0.SAT0.GTF_.IW53 */
                        CreateWordField (Arg1, 0x7E, IW63)
                        ID63 = IW63 /* \_SB_.PCI0.SAT0.GTF_.IW63 */
                        CreateWordField (Arg1, 0x76, IW59)
                        ID59 = IW59 /* \_SB_.PCI0.SAT0.GTF_.IW59 */
                        CreateWordField (Arg1, 0xB0, IW88)
                        ID88 = IW88 /* \_SB_.PCI0.SAT0.GTF_.IW88 */
                    }

                    Local7 = 0xA0
                    If (Arg0)
                    {
                        Local7 = 0xB0
                        IRDY = (CHNF & 0x08)
                        If ((CHNF & 0x10))
                        {
                            PIOT = PIO1 /* \_SB_.PCI0.SAT0.PIO1 */
                        }
                        Else
                        {
                            PIOT = PIO0 /* \_SB_.PCI0.SAT0.PIO0 */
                        }

                        If ((CHNF & 0x04))
                        {
                            If ((CHNF & 0x10))
                            {
                                DMAT = DMA1 /* \_SB_.PCI0.SAT0.DMA1 */
                            }
                            Else
                            {
                                DMAT = DMA0 /* \_SB_.PCI0.SAT0.DMA0 */
                            }
                        }
                    }
                    Else
                    {
                        IRDY = (CHNF & 0x02)
                        PIOT = PIO0 /* \_SB_.PCI0.SAT0.PIO0 */
                        If ((CHNF & One))
                        {
                            DMAT = DMA0 /* \_SB_.PCI0.SAT0.DMA0 */
                        }
                    }

                    If ((((ID53 & 0x04) && (ID88 & 0xFF00)) && DMAT))
                    {
                        Local1 = Match (DerefOf (TIM0 [0x03]), MLE, DMAT, MTR, Zero, 
                            Zero)
                        If ((Local1 > 0x05))
                        {
                            Local1 = 0x05
                        }

                        GTFB (AT01, (0x40 | Local1), Local7)
                    }
                    ElseIf (((ID63 & 0xFF00) && PIOT))
                    {
                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIOT, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = (0x20 | DerefOf (DerefOf (TIM0 [0x07]) [Local0]))
                        GTFB (AT01, Local1, Local7)
                    }

                    If (IRDY)
                    {
                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIOT, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = (0x08 | DerefOf (DerefOf (TIM0 [0x06]) [Local0]))
                        GTFB (AT01, Local1, Local7)
                    }
                    ElseIf ((ID49 & 0x0400))
                    {
                        GTFB (AT01, One, Local7)
                    }

                    If (((ID59 & 0x0100) && (ID59 & 0xFF)))
                    {
                        GTFB (AT03, (ID59 & 0xFF), Local7)
                    }

                    Debug = ATAB /* \_SB_.PCI0.SAT0.ATAB */
                    Return (ATAB) /* \_SB_.PCI0.SAT0.ATAB */
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Local0 = (CMDN * 0x38)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Debug = RETB /* \_SB_.PCI0.SAT0.RATA.RETB */
                    Return (Concatenate (RETB, FZTF))
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x001F0005)  // _ADR: Address
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If ((Arg0 == 0x02))
                    {
                        REGF = Arg1
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x78, 
                        0x5A, 
                        0x3C, 
                        0x28, 
                        0x1E, 
                        0x14
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14){})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                    Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                    Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                    Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                    Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                    Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                    Offset (0x0C), 
                    Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (CHN0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (PSCR << One)
                        Local0 = (PMCR | Local1)
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local1 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local2 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (PMAE << 0x02)
                        Local4 = (PM6E << One)
                        Local3 |= Local4
                        Local0 = (PM3E | Local3)
                        Local3 = (PMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (PSAE << 0x02)
                        Local4 = (PS6E << One)
                        Local3 |= Local4
                        Local1 = (PS3E | Local3)
                        Local3 = (PSPT << 0x04)
                        Local1 |= Local3
                        GMPT = PMRI /* \_SB_.PCI0.SAT1.PMRI */
                        GMUE = Local0
                        GMUT = PMUT /* \_SB_.PCI0.SAT1.PMUT */
                        GMCR = PMCR /* \_SB_.PCI0.SAT1.PMCR */
                        GSPT = PSRI /* \_SB_.PCI0.SAT1.PSRI */
                        GSUE = Local1
                        GSUT = PSUT /* \_SB_.PCI0.SAT1.PSUT */
                        GSCR = PSCR /* \_SB_.PCI0.SAT1.PSCR */
                        STM ()
                        PMRI = GMPT /* \_SB_.PCI0.SAT1.GMPT */
                        Local0 = GMUE /* \_SB_.PCI0.SAT1.GMUE */
                        PMUT = GMUT /* \_SB_.PCI0.SAT1.GMUT */
                        PMCR = GMCR /* \_SB_.PCI0.SAT1.GMCR */
                        Local1 = GSUE /* \_SB_.PCI0.SAT1.GSUE */
                        PSUT = GSUT /* \_SB_.PCI0.SAT1.GSUT */
                        PSCR = GSCR /* \_SB_.PCI0.SAT1.GSCR */
                        If ((Local0 & One))
                        {
                            PM3E = One
                        }
                        Else
                        {
                            PM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            PM6E = One
                        }
                        Else
                        {
                            PM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            PMAE = One
                        }
                        Else
                        {
                            PMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            PS3E = One
                        }
                        Else
                        {
                            PS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            PS6E = One
                        }
                        Else
                        {
                            PS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            PSAE = One
                        }
                        Else
                        {
                            PSAE = Zero
                        }

                        ATA0 = GTF (Zero, Arg1)
                        ATA1 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (CHN1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Local1 = (SSCR << One)
                        Local0 = (SMCR | Local1)
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local1 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local1 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local2 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local2 |= Local3
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Debug = Arg0
                        TMD0 = Arg0
                        Local3 = (SMAE << 0x02)
                        Local4 = (SM6E << One)
                        Local3 |= Local4
                        Local0 = (SM3E | Local3)
                        Local3 = (SMPT << 0x04)
                        Local0 |= Local3
                        Local3 = (SSAE << 0x02)
                        Local4 = (SS6E << One)
                        Local3 |= Local4
                        Local1 = (SS3E | Local3)
                        Local3 = (SSPT << 0x04)
                        Local1 |= Local3
                        GMPT = SMRI /* \_SB_.PCI0.SAT1.SMRI */
                        GMUE = Local0
                        GMUT = SMUT /* \_SB_.PCI0.SAT1.SMUT */
                        GMCR = SMCR /* \_SB_.PCI0.SAT1.SMCR */
                        GSPT = SSRI /* \_SB_.PCI0.SAT1.SSRI */
                        GSUE = Local1
                        GSUT = SSUT /* \_SB_.PCI0.SAT1.SSUT */
                        GSCR = SSCR /* \_SB_.PCI0.SAT1.SSCR */
                        STM ()
                        SMRI = GMPT /* \_SB_.PCI0.SAT1.GMPT */
                        Local0 = GMUE /* \_SB_.PCI0.SAT1.GMUE */
                        SMUT = GMUT /* \_SB_.PCI0.SAT1.GMUT */
                        SMCR = GMCR /* \_SB_.PCI0.SAT1.GMCR */
                        Local1 = GSUE /* \_SB_.PCI0.SAT1.GSUE */
                        SSUT = GSUT /* \_SB_.PCI0.SAT1.GSUT */
                        SSCR = GSCR /* \_SB_.PCI0.SAT1.GSCR */
                        If ((Local0 & One))
                        {
                            SM3E = One
                        }
                        Else
                        {
                            SM3E = Zero
                        }

                        If ((Local0 & 0x02))
                        {
                            SM6E = One
                        }
                        Else
                        {
                            SM6E = Zero
                        }

                        If ((Local0 & 0x04))
                        {
                            SMAE = One
                        }
                        Else
                        {
                            SMAE = Zero
                        }

                        If ((Local1 & One))
                        {
                            SS3E = One
                        }
                        Else
                        {
                            SS3E = Zero
                        }

                        If ((Local1 & 0x02))
                        {
                            SS6E = One
                        }
                        Else
                        {
                            SS6E = Zero
                        }

                        If ((Local1 & 0x04))
                        {
                            SSAE = One
                        }
                        Else
                        {
                            SSAE = Zero
                        }

                        ATA2 = GTF (Zero, Arg1)
                        ATA3 = GTF (One, Arg2)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    PIO0 = Ones
                    PIO1 = Ones
                    DMA0 = Ones
                    DMA1 = Ones
                    CHNF = 0x10
                    If (REGF){}
                    Else
                    {
                        Return (TMD0) /* \_SB_.PCI0.SAT1.TMD0 */
                    }

                    If ((Arg1 & 0x20))
                    {
                        CHNF |= 0x02
                    }

                    Local6 = Match (DerefOf (TIM0 [One]), MEQ, Arg0, MTR, Zero, 
                        Zero)
                    Local7 = DerefOf (DerefOf (TIM0 [Zero]) [Local6])
                    DMA0 = Local7
                    PIO0 = Local7
                    If ((Arg4 & 0x20))
                    {
                        CHNF |= 0x08
                    }

                    Local6 = Match (DerefOf (TIM0 [0x02]), MEQ, Arg3, MTR, Zero, 
                        Zero)
                    Local7 = DerefOf (DerefOf (TIM0 [Zero]) [Local6])
                    DMA1 = Local7
                    PIO1 = Local7
                    If ((Arg1 & 0x07))
                    {
                        Local5 = Arg2
                        If ((Arg1 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg1 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA0 = DerefOf (DerefOf (TIM0 [0x03]) [Local5])
                        CHNF |= One
                    }

                    If ((Arg4 & 0x07))
                    {
                        Local5 = Arg5
                        If ((Arg4 & 0x02))
                        {
                            Local5 += 0x02
                        }

                        If ((Arg4 & 0x04))
                        {
                            Local5 += 0x04
                        }

                        DMA1 = DerefOf (DerefOf (TIM0 [0x03]) [Local5])
                        CHNF |= 0x04
                    }

                    Debug = TMD0 /* \_SB_.PCI0.SAT1.TMD0 */
                    Return (TMD0) /* \_SB_.PCI0.SAT1.TMD0 */
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF)
                    {
                        GMUE = Zero
                        GMUT = Zero
                        GSUE = Zero
                        GSUT = Zero
                        If ((CHNF & One))
                        {
                            Local0 = Match (DerefOf (TIM0 [0x03]), MLE, DMA0, MTR, Zero, 
                                Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GMUT = DerefOf (DerefOf (TIM0 [0x04]) [Local0])
                            GMUE |= One
                            If ((Local0 > 0x02))
                            {
                                GMUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GMUE &= 0xFD
                                GMUE |= 0x04
                            }
                        }
                        ElseIf (((PIO0 == Ones) | (PIO0 == Zero)))
                        {
                            If (((DMA0 < Ones) & (DMA0 > Zero)))
                            {
                                PIO0 = DMA0 /* \_SB_.PCI0.SAT1.DMA0 */
                                GMUE |= 0x80
                            }
                        }

                        If ((CHNF & 0x04))
                        {
                            Local0 = Match (DerefOf (TIM0 [0x03]), MLE, DMA1, MTR, Zero, 
                                Zero)
                            If ((Local0 > 0x05))
                            {
                                Local0 = 0x05
                            }

                            GSUT = DerefOf (DerefOf (TIM0 [0x04]) [Local0])
                            GSUE |= One
                            If ((Local0 > 0x02))
                            {
                                GSUE |= 0x02
                            }

                            If ((Local0 > 0x04))
                            {
                                GSUE &= 0xFD
                                GSUE |= 0x04
                            }
                        }
                        ElseIf (((PIO1 == Ones) | (PIO1 == Zero)))
                        {
                            If (((DMA1 < Ones) & (DMA1 > Zero)))
                            {
                                PIO1 = DMA1 /* \_SB_.PCI0.SAT1.DMA1 */
                                GSUE |= 0x80
                            }
                        }

                        If ((CHNF & 0x02))
                        {
                            GMUE |= 0x20
                        }

                        If ((CHNF & 0x08))
                        {
                            GSUE |= 0x20
                        }

                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIO0, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = DerefOf (DerefOf (TIM0 [One]) [Local0])
                        GMPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GMUE |= 0x50
                        }

                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIO1, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = DerefOf (DerefOf (TIM0 [0x02]) [Local0])
                        GSPT = Local1
                        If ((Local0 < 0x03))
                        {
                            GSUE |= 0x50
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF         // .......
                })
                Name (AT02, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90         // .......
                })
                Name (AT03, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6         // .......
                })
                Name (AT04, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91         // .......
                })
                Name (ATA0, Buffer (0x1D){})
                Name (ATA1, Buffer (0x1D){})
                Name (ATA2, Buffer (0x1D){})
                Name (ATA3, Buffer (0x1D){})
                Name (ATAB, Buffer (0x1D){})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Local0 = (CMDC * 0x38)
                    Local1 = (Local0 + 0x08)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Local0 = (CMDC * 0x07)
                    CreateByteField (ATAB, (Local0 + 0x02), A001)
                    CreateByteField (ATAB, (Local0 + 0x06), A005)
                    CMDX = Arg0
                    A001 = Arg1
                    A005 = Arg2
                    CMDC++
                }

                Method (GTF, 2, Serialized)
                {
                    Debug = Arg1
                    CMDC = Zero
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If ((SizeOf (Arg1) == 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        ID49 = IW49 /* \_SB_.PCI0.SAT1.GTF_.IW49 */
                        CreateWordField (Arg1, 0x6A, IW53)
                        ID53 = IW53 /* \_SB_.PCI0.SAT1.GTF_.IW53 */
                        CreateWordField (Arg1, 0x7E, IW63)
                        ID63 = IW63 /* \_SB_.PCI0.SAT1.GTF_.IW63 */
                        CreateWordField (Arg1, 0x76, IW59)
                        ID59 = IW59 /* \_SB_.PCI0.SAT1.GTF_.IW59 */
                        CreateWordField (Arg1, 0xB0, IW88)
                        ID88 = IW88 /* \_SB_.PCI0.SAT1.GTF_.IW88 */
                    }

                    Local7 = 0xA0
                    If (Arg0)
                    {
                        Local7 = 0xB0
                        IRDY = (CHNF & 0x08)
                        If ((CHNF & 0x10))
                        {
                            PIOT = PIO1 /* \_SB_.PCI0.SAT1.PIO1 */
                        }
                        Else
                        {
                            PIOT = PIO0 /* \_SB_.PCI0.SAT1.PIO0 */
                        }

                        If ((CHNF & 0x04))
                        {
                            If ((CHNF & 0x10))
                            {
                                DMAT = DMA1 /* \_SB_.PCI0.SAT1.DMA1 */
                            }
                            Else
                            {
                                DMAT = DMA0 /* \_SB_.PCI0.SAT1.DMA0 */
                            }
                        }
                    }
                    Else
                    {
                        IRDY = (CHNF & 0x02)
                        PIOT = PIO0 /* \_SB_.PCI0.SAT1.PIO0 */
                        If ((CHNF & One))
                        {
                            DMAT = DMA0 /* \_SB_.PCI0.SAT1.DMA0 */
                        }
                    }

                    If ((((ID53 & 0x04) && (ID88 & 0xFF00)) && DMAT))
                    {
                        Local1 = Match (DerefOf (TIM0 [0x03]), MLE, DMAT, MTR, Zero, 
                            Zero)
                        If ((Local1 > 0x05))
                        {
                            Local1 = 0x05
                        }

                        GTFB (AT01, (0x40 | Local1), Local7)
                    }
                    ElseIf (((ID63 & 0xFF00) && PIOT))
                    {
                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIOT, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = (0x20 | DerefOf (DerefOf (TIM0 [0x07]) [Local0]))
                        GTFB (AT01, Local1, Local7)
                    }

                    If (IRDY)
                    {
                        Local0 = (Match (DerefOf (TIM0 [Zero]), MGE, PIOT, MTR, Zero, 
                            Zero) & 0x03)
                        Local1 = (0x08 | DerefOf (DerefOf (TIM0 [0x06]) [Local0]))
                        GTFB (AT01, Local1, Local7)
                    }
                    ElseIf ((ID49 & 0x0400))
                    {
                        GTFB (AT01, One, Local7)
                    }

                    If (((ID59 & 0x0100) && (ID59 & 0xFF)))
                    {
                        GTFB (AT03, (ID59 & 0xFF), Local7)
                    }

                    Debug = ATAB /* \_SB_.PCI0.SAT1.ATAB */
                    Return (ATAB) /* \_SB_.PCI0.SAT1.ATAB */
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Local0 = (CMDN * 0x38)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Debug = RETB /* \_SB_.PCI0.SAT1.RATA.RETB */
                    Return (Concatenate (RETB, FZTF))
                }
            }

            Device (SMB)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                OperationRegion (SMIO, SystemIO, SMBS, SMBL)
                Field (SMIO, ByteAcc, NoLock, Preserve)
                {
                    HSTS,   8, 
                    HCNT,   8, 
                    HCMD,   8, 
                    TSAD,   8, 
                    HDT0,   8, 
                    HDT1,   8, 
                    HBDT,   8, 
                    RSAD,   8, 
                    RSDA,   16, 
                    AUST,   8, 
                    AUCT,   8, 
                    SMLP,   8, 
                    SMBP,   8, 
                    SSTS,   8, 
                    SCMD,   8, 
                    NDAD,   8, 
                    NDLB,   8, 
                    NDHB,   8
                }

                Method (SMCS, 0, NotSerialized)
                {
                    HSTS = 0x20
                }

                Scope (\_GPE)
                {
                    Method (_L07, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
                    {
                        \_SB.PCI0.SMB.HSTS = 0x20
                    }

                    Method (_L1B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
                    {
                        \_SB.PCI0.SMB.HSTS = 0x20
                    }
                }
            }

            Device (EUSB)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                Name (_S4D, 0x02)  // _S4D: S4 Device State
                Name (_S3D, 0x02)  // _S3D: S3 Device State
                Name (_S2D, 0x02)  // _S2D: S2 Device State
                Name (_S1D, 0x02)  // _S1D: S1 Device State
                Device (HUBN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PR10)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                        {
                            0x81, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x30, 
                            0x1C, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Device (PR30)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1C, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR31)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1D, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR32)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1D, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR33)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR34)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR35)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR36)
                        {
                            Name (_ADR, 0x07)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR37)
                        {
                            Name (_ADR, 0x08)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (USBE)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                Name (_S4D, 0x02)  // _S4D: S4 Device State
                Name (_S3D, 0x02)  // _S3D: S3 Device State
                Name (_S2D, 0x02)  // _S2D: S2 Device State
                Name (_S1D, 0x02)  // _S1D: S1 Device State
                Device (HUBN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PR10)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                        {
                            0x81, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            0x30, 
                            0x1C, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Device (PR30)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1C, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR31)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1D, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR32)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1D, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR33)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR34)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xB1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }

                        Device (PR35)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x10)  // _PLD: Physical Location of Device
                            {
                                0x81, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                0xE1, 
                                0x1E, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            })
                        }
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (PEX0)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR01) /* \_SB_.AR01 */
                    }

                    Return (PR01) /* \_SB_.PR01 */
                }
            }

            Device (PEX1)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR02) /* \_SB_.AR02 */
                    }

                    Return (PR02) /* \_SB_.PR02 */
                }
            }

            Device (PEX2)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR03) /* \_SB_.AR03 */
                    }

                    Return (PR03) /* \_SB_.PR03 */
                }
            }

            Device (PEX3)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR04) /* \_SB_.AR04 */
                    }

                    Return (PR04) /* \_SB_.PR04 */
                }
            }

            Device (PEX4)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR05) /* \_SB_.AR05 */
                    }

                    Return (PR05) /* \_SB_.PR05 */
                }
            }

            Device (PEX5)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR06) /* \_SB_.AR06 */
                    }

                    Return (PR06) /* \_SB_.PR06 */
                }
            }

            Device (PEX6)
            {
                Name (_ADR, 0x001C0006)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR07) /* \_SB_.AR07 */
                    }

                    Return (PR07) /* \_SB_.PR07 */
                }
            }

            Device (PEX7)
            {
                Name (_ADR, 0x001C0007)  // _ADR: Address
                OperationRegion (PXRC, PCI_Config, Zero, 0x0100)
                Field (PXRC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x60), 
                    Offset (0x62), 
                    PMS,    1, 
                    PMP,    1, 
                    Offset (0xD8), 
                        ,   30, 
                    HPE,    1, 
                    PCE,    1, 
                        ,   30, 
                    HPS,    1, 
                    PCS,    1
                }

                Method (CSS, 0, NotSerialized)
                {
                    PMS = One
                    PCS = One
                    PMS = One
                }

                Method (SPRT, 1, NotSerialized)
                {
                    CSS ()
                    PCE = One
                    CSS ()
                }

                Method (WPRT, 1, NotSerialized)
                {
                    PCE = Zero
                    CSS ()
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR08) /* \_SB_.AR08 */
                    }

                    Return (PR08) /* \_SB_.PR08 */
                }
            }

            Device (P0PA)
            {
                Name (_ADR, 0x00110000)  // _ADR: Address
            }

            Device (GBE)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (NPE1)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE2)
            {
                Name (_ADR, 0x00010001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR22) /* \_SB_.AR22 */
                    }

                    Return (PR22) /* \_SB_.PR22 */
                }
            }

            Device (NPE3)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR23) /* \_SB_.AR23 */
                    }

                    Return (PR23) /* \_SB_.PR23 */
                }
            }

            Device (NPE4)
            {
                Name (_ADR, 0x00020001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE5)
            {
                Name (_ADR, 0x00020002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE6)
            {
                Name (_ADR, 0x00020003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE7)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR27) /* \_SB_.AR27 */
                    }

                    Return (PR27) /* \_SB_.PR27 */
                }
            }

            Device (NPE8)
            {
                Name (_ADR, 0x00030001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPE9)
            {
                Name (_ADR, 0x00030002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }

            Device (NPEA)
            {
                Name (_ADR, 0x00030003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x03))
                }
            }
        }

        Scope (\_GPE)
        {
            Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.P0P9, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.EUSB, 0x02) // Device Wake
                Notify (\_SB.PCI0.USBE, 0x02) // Device Wake
                Notify (\_SB.PCI0.GBE, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
            {
                Notify (\_SB.PCI0.PEX0, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX1, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX2, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX3, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX4, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX5, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX6, 0x02) // Device Wake
                Notify (\_SB.PCI0.PEX7, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE1, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE2, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE3, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE4, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE5, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE6, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE7, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE8, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPE9, 0x02) // Device Wake
                Notify (\_SB.PCI0.NPEA, 0x02) // Device Wake
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Name (_UID, 0xAA)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
        }
    }

    OperationRegion (_SB.PCI0.SBRG.PIX0, PCI_Config, 0x60, 0x0C)
    Field (\_SB.PCI0.SBRG.PIX0, ByteAcc, NoLock, Preserve)
    {
        PIRA,   8, 
        PIRB,   8, 
        PIRC,   8, 
        PIRD,   8, 
        Offset (0x08), 
        PIRE,   8, 
        PIRF,   8, 
        PIRG,   8, 
        PIRH,   8
    }

    Scope (_SB)
    {
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        CreateWordField (BUFA, One, IRA0)
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRA & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSA) /* \_SB_.PRSA */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRA |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRA & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRA = Local0
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRB & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSB) /* \_SB_.PRSB */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRB |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRB & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRB = Local0
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRC & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSC) /* \_SB_.PRSC */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRC |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRC & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRC = Local0
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRD & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSD) /* \_SB_.PRSD */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRD |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRD & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRD = Local0
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRE & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSE) /* \_SB_.PRSE */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRE |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRE & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRE = Local0
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRF & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSF) /* \_SB_.PRSF */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRF |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRF & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRF = Local0
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRG & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSG) /* \_SB_.PRSG */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRG |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRG & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRG = Local0
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Local0 = (PIRH & 0x80)
                If (Local0)
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRSH) /* \_SB_.PRSH */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRH |= 0x80
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = (PIRH & 0x0F)
                IRA0 = (One << Local0)
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRH = Local0
            }
        }
    }

    OperationRegion (_SB.PCI0.SBRG.LPCR, PCI_Config, 0x80, 0x04)
    Field (\_SB.PCI0.SBRG.LPCR, ByteAcc, NoLock, Preserve)
    {
        CADR,   3, 
            ,   1, 
        CBDR,   3, 
        Offset (0x01), 
        LTDR,   2, 
            ,   2, 
        FDDR,   1, 
        Offset (0x02), 
        CALE,   1, 
        CBLE,   1, 
        LTLE,   1, 
        FDLE,   1, 
        Offset (0x03), 
        GLLE,   1, 
        GHLE,   1, 
        KCLE,   1, 
        MCLE,   1, 
        C1LE,   1, 
        C2LE,   1, 
        Offset (0x04)
    }

    Method (UXDV, 1, NotSerialized)
    {
        Local0 = 0xFF
        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
        _T_0 = (Arg0 + Zero)
        If ((_T_0 == 0x03F8))
        {
            Local0 = Zero
        }
        ElseIf ((_T_0 == 0x02F8))
        {
            Local0 = One
        }
        ElseIf ((_T_0 == 0x0220))
        {
            Local0 = 0x02
        }
        ElseIf ((_T_0 == 0x0228))
        {
            Local0 = 0x03
        }
        ElseIf ((_T_0 == 0x0238))
        {
            Local0 = 0x04
        }
        ElseIf ((_T_0 == 0x02E8))
        {
            Local0 = 0x05
        }
        ElseIf ((_T_0 == 0x0338))
        {
            Local0 = 0x06
        }
        ElseIf ((_T_0 == 0x03E8))
        {
            Local0 = 0x07
        }

        Return (Local0)
    }

    Method (RRIO, 4, NotSerialized)
    {
        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
        _T_0 = (Arg0 + Zero)
        If ((_T_0 == Zero))
        {
            CALE = Zero
            Local0 = UXDV (Arg2)
            If ((Local0 != 0xFF))
            {
                CADR = Local0
            }

            If (Arg1)
            {
                CALE = One
            }
        }
        ElseIf ((_T_0 == One))
        {
            CBLE = Zero
            Local0 = UXDV (Arg2)
            If ((Local0 != 0xFF))
            {
                CBDR = Local0
            }

            If (Arg1)
            {
                CBLE = One
            }
        }
        ElseIf ((_T_0 == 0x02))
        {
            LTLE = Zero
            If ((Arg2 == 0x0378))
            {
                LTDR = Zero
            }

            If ((Arg2 == 0x0278))
            {
                LTDR = One
            }

            If ((Arg2 == 0x03BC))
            {
                LTDR = 0x02
            }

            If (Arg1)
            {
                LTLE = One
            }
        }
        ElseIf ((_T_0 == 0x03))
        {
            FDLE = Zero
            If ((Arg2 == 0x03F0))
            {
                FDDR = Zero
            }

            If ((Arg2 == 0x0370))
            {
                FDDR = One
            }

            If (Arg1)
            {
                FDLE = One
            }
        }
        ElseIf ((_T_0 == 0x08))
        {
            If ((Arg2 == 0x0200))
            {
                If (Arg1)
                {
                    GLLE = One
                }
                Else
                {
                    GLLE = Zero
                }
            }

            If ((Arg2 == 0x0208))
            {
                If (Arg1)
                {
                    GHLE = One
                }
                Else
                {
                    GHLE = Zero
                }
            }
        }
        ElseIf ((_T_0 == 0x09))
        {
            If ((Arg2 == 0x0200))
            {
                If (Arg1)
                {
                    GLLE = One
                }
                Else
                {
                    GLLE = Zero
                }
            }

            If ((Arg2 == 0x0208))
            {
                If (Arg1)
                {
                    GHLE = One
                }
                Else
                {
                    GHLE = Zero
                }
            }
        }
        ElseIf ((_T_0 == 0x0A))
        {
            If (((Arg2 == 0x60) || (Arg2 == 0x64)))
            {
                If (Arg1)
                {
                    KCLE = One
                }
                Else
                {
                    KCLE = Zero
                }
            }
        }
        ElseIf ((_T_0 == 0x0B))
        {
            If (((Arg2 == 0x62) || (Arg2 == 0x66)))
            {
                If (Arg1)
                {
                    MCLE = One
                }
                Else
                {
                    MCLE = Zero
                }
            }
        }
        ElseIf ((_T_0 == 0x0C))
        {
            If ((Arg2 == 0x2E))
            {
                If (Arg1)
                {
                    C1LE = One
                }
                Else
                {
                    C1LE = Zero
                }
            }

            If ((Arg2 == 0x4E))
            {
                If (Arg1)
                {
                    C2LE = One
                }
                Else
                {
                    C2LE = Zero
                }
            }
        }
        ElseIf ((_T_0 == 0x0D))
        {
            If ((Arg2 == 0x2E))
            {
                If (Arg1)
                {
                    C1LE = One
                }
                Else
                {
                    C1LE = Zero
                }
            }

            If ((Arg2 == 0x4E))
            {
                If (Arg1)
                {
                    C2LE = One
                }
                Else
                {
                    C2LE = Zero
                }
            }
        }
    }

    Method (RDMA, 3, NotSerialized)
    {
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                Name (CRS, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFED00000,         // Address Base
                        0x00000400,         // Address Length
                        _Y1E)
                })
                OperationRegion (HCNT, SystemMemory, HPTC, 0x04)
                Field (HCNT, DWordAcc, NoLock, Preserve)
                {
                    HPTS,   2, 
                        ,   5, 
                    HPTE,   1
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (HPTE)
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (CRS, \_SB.PCI0.HPET._Y1E._BAS, HTBS)  // _BAS: Base Address
                    Local0 = (HPTS * 0x1000)
                    HTBS = (Local0 + 0xFED00000)
                    Return (CRS) /* \_SB_.PCI0.HPET.CRS_ */
                }
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        DBG8 = Arg0
        If (((Arg0 == 0x04) && (OSFL () == 0x02)))
        {
            Sleep (0x0BB8)
        }

        PTS (Arg0)
        WAKP [Zero] = Zero
        WAKP [One] = Zero
        WSSB = ASSB /* \ASSB */
        WOTB = AOTB /* \AOTB */
        WAXB = AAXB /* \AAXB */
        ASSB = Arg0
        AOTB = OSFL ()
        AAXB = Zero
        \_SB.SLPS = One
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        DBG8 = (Arg0 << 0x04)
        WAK (Arg0)
        If (ASSB)
        {
            ASSB = WSSB /* \WSSB */
            AOTB = WOTB /* \WOTB */
            AAXB = WAXB /* \WAXB */
        }

        If (DerefOf (WAKP [Zero]))
        {
            WAKP [One] = Zero
        }
        Else
        {
            WAKP [One] = Arg0
        }

        Return (WAKP) /* \WAKP */
    }

    Device (OMSC)
    {
        Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
        Name (_UID, 0x0E11)  // _UID: Unique ID
    }

    Device (_SB.RMEM)
    {
        Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
        Name (_UID, One)  // _UID: Unique ID
    }

    Scope (_SB)
    {
        Device (PTMD)
        {
            Name (_HID, EisaId ("INT3394") /* ACPI System Fan */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _CID: Compatible ID
            Name (IVER, 0x00010000)
            Name (GSCV, 0x69)
            Method (GACI, 0, NotSerialized)
            {
                OperationRegion (GCAD, SystemMemory, 0xBB336018, 0x0188)
                Field (GCAD, ByteAcc, NoLock, Preserve)
                {
                    XBUF,   3136
                }

                Name (XTMP, Buffer (0x0188){})
                XTMP = XBUF /* \_SB_.PTMD.GACI.XBUF */
                Name (RPKG, Package (0x02){})
                RPKG [Zero] = Zero
                RPKG [One] = XTMP /* \_SB_.PTMD.GACI.XTMP */
                Return (RPKG) /* \_SB_.PTMD.GACI.RPKG */
            }

            Method (GDSV, 1, Serialized)
            {
                If ((Arg0 == 0x13))
                {
                    Name (RP00, Package (0x02)
                    {
                        Zero, 
                        Buffer (0x28)
                        {
                            /* 0000 */  0x2B, 0x04, 0x00, 0x00, 0x2B, 0x04, 0x00, 0x00,  // +...+...
                            /* 0008 */  0x35, 0x05, 0x00, 0x00, 0x35, 0x05, 0x00, 0x00,  // 5...5...
                            /* 0010 */  0x40, 0x06, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00,  // @...@...
                            /* 0018 */  0x4B, 0x07, 0x00, 0x00, 0x4B, 0x07, 0x00, 0x00,  // K...K...
                            /* 0020 */  0x55, 0x08, 0x00, 0x00, 0x55, 0x08, 0x00, 0x00   // U...U...
                        }
                    })
                    Return (RP00) /* \_SB_.PTMD.GDSV.RP00 */
                    Return (Package (0x01)
                    {
                        One
                    })
                }
            }

            Method (CDRD, 1, Serialized)
            {
                Return (Package (0x02)
                {
                    Zero, 
                    Zero
                })
            }

            Method (CDWR, 2, Serialized)
            {
                Return (Zero)
            }

            Method (GXDV, 1, NotSerialized)
            {
                Name (PRF1, 0x01)
                Name (PRF2, 0x01)
                If (((PRF1 == One) && (Arg0 == One)))
                {
                    Return (Package (0x01)
                    {
                        0x02
                    })
                }

                If (((PRF2 == One) && (Arg0 == 0x02)))
                {
                    Return (Package (0x01)
                    {
                        0x02
                    })
                }

                OperationRegion (PRFA, SystemMemory, 0xBB334018, 0x0000)
                Field (PRFA, ByteAcc, NoLock, Preserve)
                {
                    XMP1,   0, 
                    XMP2,   0
                }

                Name (RPKG, Package (0x02){})
                Name (XMPT, Buffer (0x0000){})
                If ((Arg0 == One))
                {
                    XMPT = XMP1 /* \_SB_.PTMD.GXDV.XMP1 */
                    RPKG [Zero] = Zero
                    RPKG [One] = XMPT /* \_SB_.PTMD.GXDV.XMPT */
                    Return (RPKG) /* \_SB_.PTMD.GXDV.RPKG */
                }

                If ((Arg0 == 0x02))
                {
                    XMPT = XMP2 /* \_SB_.PTMD.GXDV.XMP2 */
                    RPKG [Zero] = Zero
                    RPKG [One] = XMPT /* \_SB_.PTMD.GXDV.XMPT */
                    Return (RPKG) /* \_SB_.PTMD.GXDV.RPKG */
                }

                Return (Package (0x01)
                {
                    One
                })
            }
        }
    }

    Method (WOSC, 4, NotSerialized)
    {
        CreateDWordField (Arg3, Zero, CDW1)
        If ((Arg0 == ToUUID ("ed855e0c-6c90-47bf-a62a-26de0fc5ad5c") /* Unknown UUID */))
        {
            CreateDWordField (Arg3, 0x04, CDW2)
            CreateDWordField (Arg3, 0x08, CDW3)
            If (WHEA)
            {
                If ((CDW2 & One))
                {
                    Return (One)
                }
            }
        }
        Else
        {
            CDW1 |= 0x04
        }

        Return (Zero)
    }

    Scope (_SB)
    {
        Name (\PETE, Zero)
        Name (\PSTE, Zero)
        Name (\TSTE, Zero)
        Name (\NPB0, One)
        Name (\NPB1, Zero)
        Name (\NPB2, Zero)
        Name (\NPB3, Zero)
        Name (P0ID, Zero)
        Name (P1ID, 0x20)
        Name (P2ID, 0x40)
        Name (P3ID, 0x60)
        Name (P0BM, 0x0000FFFF)
        Name (P1BM, 0x00000000)
        Name (P2BM, 0x00000000)
        Name (P3BM, 0x00000000)
        Name (CUU0, Zero)
        Name (CUU1, Zero)
        Name (CUU2, Zero)
        Name (CUU3, Zero)
        Method (PSTA, 1, NotSerialized)
        {
            If ((Arg0 == Zero))
            {
                If (NPB0)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            If ((Arg0 == One))
            {
                If (NPB1)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            If ((Arg0 == 0x02))
            {
                If (NPB2)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            If ((Arg0 == 0x03))
            {
                If (NPB3)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Return (Zero)
        }

        Method (CSTA, 2, NotSerialized)
        {
            Local0 = Zero
            If ((Arg0 == Zero))
            {
                Local0 = (P0BM >> Arg1)
            }

            If ((Arg0 == One))
            {
                Local0 = (P1BM >> Arg1)
            }

            If ((Arg0 == 0x02))
            {
                Local0 = (P2BM >> Arg1)
            }

            If ((Arg0 == 0x03))
            {
                Local0 = (P3BM >> Arg1)
            }

            Local0 &= One
            If ((Local0 == Zero))
            {
                Return (Zero)
            }
            Else
            {
                Return (One)
            }
        }

        Device (SCK0)
        {
            Name (_HID, "ACPI0004" /* Module Device */)  // _HID: Hardware ID
            Name (_UID, "CPUSCK0")  // _UID: Unique ID
            Name (SCKN, Zero)
            Name (LSTA, 0xFF)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                CUU0 = "CPUSCK0"
                Local0 = PSTA (Zero)
                Local1 = (Local0 & 0x03)
                LSTA = Local1
                Return (Local0)
            }

            Processor (C000, 0x00, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP000")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, Zero) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C001, 0x01, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP001")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, One) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C002, 0x02, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP002")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x02) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C003, 0x03, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP003")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x03) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C004, 0x04, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP004")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x04) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C005, 0x05, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP005")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x05) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C006, 0x06, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP006")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x06) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C007, 0x07, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP007")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x07) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C008, 0x08, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP008")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x08) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C009, 0x09, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP009")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x09) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C00A, 0x0A, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP00A")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x0A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C00B, 0x0B, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP00B")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x0B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C00C, 0x0C, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP00C")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x0C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C00D, 0x0D, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP00D")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x0D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C00E, 0x0E, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP00E")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x0E) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C00F, 0x0F, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP00F")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x0F) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C010, 0x80, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP010")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x10) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C011, 0x81, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP011")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x11) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C012, 0x82, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP012")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x12) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C013, 0x83, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP013")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x13) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C014, 0x84, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP014")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x14) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C015, 0x85, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP015")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x15) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C016, 0x86, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP016")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x16) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C017, 0x87, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP017")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x17) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C018, 0x88, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP018")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x18) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C019, 0x89, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP019")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x19) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C01A, 0x8A, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP01A")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x1A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C01B, 0x8B, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP01B")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x1B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C01C, 0x8C, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP01C")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x1C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C01D, 0x8D, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI0-CP01D")  // _UID: Unique ID
                Name (_PXM, Zero)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (Zero, 0x1D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }

        Device (SCK1)
        {
            Name (_HID, "ACPI0004" /* Module Device */)  // _HID: Hardware ID
            Name (_UID, "CPUSCK1")  // _UID: Unique ID
            Name (SCKN, One)
            Name (LSTA, 0xFF)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                CUU1 = "CPUSCK1"
                Local0 = PSTA (One)
                Local1 = (Local0 & 0x03)
                LSTA = Local1
                Return (Local0)
            }

            Processor (C100, 0x8E, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP100")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, Zero) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C101, 0x8F, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP101")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, One) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C102, 0x90, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP102")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x02) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C103, 0x91, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP103")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x03) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C104, 0x92, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP104")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x04) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C105, 0x93, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP105")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x05) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C106, 0x94, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP106")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x06) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C107, 0x95, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP107")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x07) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C108, 0x96, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP108")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x08) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C109, 0x97, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP109")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x09) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C10A, 0x98, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP10A")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x0A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C10B, 0x99, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP10B")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x0B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C10C, 0x9A, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP10C")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x0C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C10D, 0x9B, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP10D")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x0D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C10E, 0x9C, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP10E")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x0E) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C10F, 0x9D, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP10F")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x0F) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C110, 0x9E, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP110")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x10) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C111, 0x9F, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP111")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x11) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C112, 0xA0, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP112")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x12) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C113, 0xA1, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP113")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x13) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C114, 0xA2, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP114")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x14) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C115, 0xA3, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP115")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x15) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C116, 0xA4, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP116")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x16) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C117, 0xA5, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP117")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x17) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C118, 0xA6, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP118")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x18) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C119, 0xA7, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP119")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x19) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C11A, 0xA8, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP11A")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x1A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C11B, 0xA9, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP11B")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x1B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C11C, 0xAA, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP11C")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x1C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C11D, 0xAB, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI1-CP11D")  // _UID: Unique ID
                Name (_PXM, One)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (One, 0x1D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }

        Device (SCK2)
        {
            Name (_HID, "ACPI0004" /* Module Device */)  // _HID: Hardware ID
            Name (_UID, "CPUSCK2")  // _UID: Unique ID
            Name (SCKN, 0x02)
            Name (LSTA, 0xFF)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                CUU2 = "CPUSCK2"
                Local0 = PSTA (0x02)
                Local1 = (Local0 & 0x03)
                LSTA = Local1
                Return (Local0)
            }

            Processor (C200, 0xAC, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP200")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, Zero) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C201, 0xAD, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP201")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, One) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C202, 0xAE, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP202")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x02) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C203, 0xAF, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP203")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x03) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C204, 0xB0, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP204")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x04) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C205, 0xB1, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP205")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x05) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C206, 0xB2, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP206")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x06) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C207, 0xB3, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP207")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x07) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C208, 0xB4, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP208")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x08) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C209, 0xB5, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP209")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x09) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C20A, 0xB6, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP20A")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x0A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C20B, 0xB7, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP20B")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x0B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C20C, 0xB8, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP20C")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x0C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C20D, 0xB9, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP20D")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x0D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C20E, 0xBA, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP20E")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x0E) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C20F, 0xBB, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP20F")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x0F) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C210, 0xBC, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP210")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x10) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C211, 0xBD, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP211")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x11) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C212, 0xBE, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP212")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x12) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C213, 0xBF, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP213")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x13) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C214, 0xC0, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP214")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x14) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C215, 0xC1, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP215")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x15) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C216, 0xC2, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP216")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x16) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C217, 0xC3, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP217")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x17) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C218, 0xC4, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP218")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x18) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C219, 0xC5, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP219")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x19) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C21A, 0xC6, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP21A")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x1A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C21B, 0xC7, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP21B")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x1B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C21C, 0xC8, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP21C")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x1C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C21D, 0xC9, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI2-CP21D")  // _UID: Unique ID
                Name (_PXM, 0x02)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x02, 0x1D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }

        Device (SCK3)
        {
            Name (_HID, "ACPI0004" /* Module Device */)  // _HID: Hardware ID
            Name (_UID, "CPUSCK3")  // _UID: Unique ID
            Name (SCKN, 0x03)
            Name (LSTA, 0xFF)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                CUU3 = "CPUSCK3"
                Local0 = PSTA (0x03)
                Local1 = (Local0 & 0x03)
                LSTA = Local1
                Return (Local0)
            }

            Processor (C300, 0xCA, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP300")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, Zero) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C301, 0xCB, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP301")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, One) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C302, 0xCC, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP302")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x02) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C303, 0xCD, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP303")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x03) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C304, 0xCE, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP304")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x04) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C305, 0xCF, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP305")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x05) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C306, 0xD0, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP306")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x06) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C307, 0xD1, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP307")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x07) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C308, 0xD2, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP308")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x08) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C309, 0xD3, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP309")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x09) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C30A, 0xD4, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP30A")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x0A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C30B, 0xD5, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP30B")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x0B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C30C, 0xD6, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP30C")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x0C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C30D, 0xD7, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP30D")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x0D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C30E, 0xD8, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP30E")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x0E) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C30F, 0xD9, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP30F")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x0F) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C310, 0xDA, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP310")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x10) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C311, 0xDB, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP311")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x11) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C312, 0xDC, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP312")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x12) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C313, 0xDD, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP313")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x13) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C314, 0xDE, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP314")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x14) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C315, 0xDF, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP315")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x15) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C316, 0xE0, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP316")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x16) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C317, 0xE1, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP317")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x17) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C318, 0xE2, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP318")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x18) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C319, 0xE3, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP319")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x19) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C31A, 0xE4, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP31A")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x1A) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C31B, 0xE5, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP31B")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x1B) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C31C, 0xE6, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP31C")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x1C) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Processor (C31D, 0xE7, 0x00000410, 0x06)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, "PCI3-CP31D")  // _UID: Unique ID
                Name (_PXM, 0x03)  // _PXM: Device Proximity
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((CSTA (0x03, 0x1D) == Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }
        }
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS1)
    {
        Name (_S1, Package (0x04)  // _S1_: S1 System State
        {
            One, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS3)
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x05, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)  // _S4_: S4 System State
        {
            0x06, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            \_SB.PCI0.SBRG.SPTS (Arg0)
            \_SB.PCI0.PEX0.SPRT (Arg0)
            \_SB.PCI0.PEX1.SPRT (Arg0)
            \_SB.PCI0.PEX2.SPRT (Arg0)
            \_SB.PCI0.PEX3.SPRT (Arg0)
            \_SB.PCI0.PEX4.SPRT (Arg0)
            \_SB.PCI0.PEX5.SPRT (Arg0)
            \_SB.PCI0.PEX6.SPRT (Arg0)
            \_SB.PCI0.PEX7.SPRT (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        \_SB.PCI0.SBRG.SWAK (Arg0)
        If (\_SB.PCI0.PEX0.PMS)
        {
            \_SB.PCI0.PEX0.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX0, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX0.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX1.PMS)
        {
            \_SB.PCI0.PEX1.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX1, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX1.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX2.PMS)
        {
            \_SB.PCI0.PEX2.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX2, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX2.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX3.PMS)
        {
            \_SB.PCI0.PEX3.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX3, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX3.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX4.PMS)
        {
            \_SB.PCI0.PEX4.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX4, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX4.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX5.PMS)
        {
            \_SB.PCI0.PEX5.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX5, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX5.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX6.PMS)
        {
            \_SB.PCI0.PEX6.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX6, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX6.WPRT (Arg0)
        }

        If (\_SB.PCI0.PEX7.PMS)
        {
            \_SB.PCI0.PEX7.WPRT (Arg0)
            Notify (\_SB.PCI0.PEX7, 0x02) // Device Wake
        }
        Else
        {
            \_SB.PCI0.PEX7.WPRT (Arg0)
        }
    }

    Method (_SB._OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
    {
        If (WOSC (Arg0, Arg1, Arg3, Arg3))
        {
            Return (Arg3)
        }

        Return (Arg3)
    }
}

