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
# for .hb files.  Pandas'
# read_csv with the following
# settings should do the trick
# for profile data:
# header=1     # To use the variable list as column headers
# comment='*'  # For the trailing ** at end of .hb stations
# delim_whitespace=True  # Whitespace delimiter
# 
# For position, etc. a simple system
# call to head -1 | awk (since it's
# only one dive) should suffice, i.e.
# import subprocess
# getVersion =  subprocess.Popen("awk '{print $7}' /etc/redhat-release", shell=True, stdout=subprocess.PIPE).stdout
#===========================

# Set the Seaglider ID
set sgid = 532

# Set working data directory
set datdir = /mnt/courses/eos1505

# Download the current dive file
wget http://vocal.sams.ac.uk/sg${sgid}/dive/dive_last/last_dive.nc

# Get the dive number from the NetCDF file
set dn =  `ncdump -h last_dive.nc |  grep dive_number | awk '{print $3}'`

# Check if that file has already been downloaded.  This is only
# likely to occur on the last dive of the mission or during
# unexpected technical issues.
if ( -e ${datdir}/sg${sgid}/p${sgid}${dn}.nc ) then
    echo ${datdir}/sg${sgid}/p${sgid}${dn}.nc already exists.  Nothing to do.
    rm -f last_dive.nc
else
    mv last_dive.nc ${datdir}/sg${sgid}/p${sgid}${dn}.nc

    # First convert,
    # Second select only the dive,
    # Third compute th and s0
    sgnc_convert ${datdir}/sg${sgid}/p${sgid}${dn}.nc > tmp1.hb
    hb_extract tmp1.hb -Teg | hb_propcalc -Pde/pr/te/th/sa/s0 > tmp2.hb

    # Add bottom depth to the header
    hb_update_pdr tmp2.hb -T/home/sgary/hydrobase2/lib/topo.onetenthdeg.swap.dat
    mv tmp2.hb.up ${datdir}/sg${sgid}/p${sgid}${dn}.hb
    rm tmp1.hb
    rm tmp2.hb
   
endif

# Done!
