#!/bin/tcsh -f
#===========================
# The new version of Ferret
# does not like the new
# basestation's files.
#
# So, as a work around,
# convert the .nc file to
# .hb format, compute th,
# s0 in addition, and store
# as an .hb file.
#
# Then the .hb file can be
# picked up by a Python reader
# for .hb files.
#===========================

# Set the Seaglider ID
set sgid = 532

# Set working data directory
set datdir = /mnt/courses/eos1505

foreach file ( ${datdir}/sg${sgid}/archive/p${sgid}*.nc )

    set bn = `basename ${file} .nc`

    # First convert,
    # Second select only the dive,
    # Third compute th and s0
    sgnc_convert ${file} > tmp1.hb
    hb_extract tmp1.hb -Teg | hb_propcalc -Pde/pr/te/th/sa/s0 > tmp2.hb

    # Add bottom depth to the header
    hb_update_pdr tmp2.hb -T/home/sgary/hydrobase2/lib/topo.onetenthdeg.swap.dat
    mv tmp2.hb.up ${datdir}/sg${sgid}/archive/${bn}.hb
    rm tmp1.hb
    rm tmp2.hb
   
end

# Done!
