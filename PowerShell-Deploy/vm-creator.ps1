# Set variables for new virtual machine
$VNAME = 'Test-DC'
$SWITCH = 'Default Switch'
$ISO = 'F:\Work\Files\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.iso'
$VMPATH = "G:\$VNAME"
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
vmconnect.exe