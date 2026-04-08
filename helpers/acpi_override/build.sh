sudo cat /sys/firmware/acpi/tables/DSDT > dsdt.dat
iasl -d dsdt.dat
echo "Increasing the OEM version"
iasl -tc dsdt.dsl
iasl -tc hp.asl
mkdir -p kernel/firmware/acpi
cp dsdt.aml ssdt1.aml kernel/firmware/acpi
find kernel | cpio -H newc --create > acpi_override
# cp acpi_override /boot