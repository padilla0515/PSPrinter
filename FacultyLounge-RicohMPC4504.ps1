######################################################
#Staging Drivers
######################################################
C:\Windows\System32\pnputil.exe /add-driver "C:\Intune\RicohMPC4504Drivers\oemsetup.inf" /install

######################################################
#Install Drivers
######################################################
$DriverName = "RICOH MP C4504 PCL 6"
Add-PrinterDriver -Name $DriverName


######################################################
#Add Printer Port | Check if port already exist
######################################################

$PortName = "Faculty Lounge"
$PortAddress = "172.17.30.68"

$CheckPort = Get-PrinterPort -Name $PortName -ErrorAction SilentlyContinue
If (-not $CheckPort)
    {
    Add-PrinterPort -Name $PortName -PrinterHostAddress $PortAddress
    }

######################################################
#Install Printer
######################################################
Add-Printer -Name "Faculty Lounge - RICOH MP C4504" -PortName $PortName -DriverName $DriverName

New-Item "C:\Intune\test.txt"

