# Set variables for new virtual machine
$VNAME = 'Test-DC'
$SWITCH = 'Default Switch' 
$ISO = **#PATH of where the ISO is located**
$VMPATH = **#PATH of where you want the vm to be stored**
$VHDSize = 40GB 
$VMEM = 8GB 
$CPU = 2 

# Create the base of the virtual machine
New-VM -Name $VNAME -Path $VMPATH -NewVHDPath $VMPATH"$VNAME\$VNAME.vhdx" -MemoryStartupBytes $VMEM -Switch $SWITCH -NewVHDSizeBytes $VHDSize -Generation 2
# Add drive controller and dvd drive to vm
Add-VMScsiController -VMName $VNAME
Add-VMDvdDrive -VMName $VNAME -ControllerNumber 1 -ControllerLocation 0 -Path $ISO

# Mount the ISO to the dvd drive
# DVDDRIVE variable set here as VM is required to exsist first
$DVDDRIVE = Get-VMDvdDrive -VMName $VNAME
Set-VMFirmware -VMName $VNAME -FirstBootDevice $DVDDRIVE

# Start the virtual machine and connect
Start-VM -VMName $VNAME