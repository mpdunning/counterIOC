#!../../bin/linux-x86_64/ct

< envPaths

cd ${TOP}

dbLoadDatabase "dbd/ct.dbd"
ct_registerRecordDeviceDriver pdbbase

epicsEnvSet("N","01")
epicsEnvSet("P","ESB:CT01")
#epicsEnvSet("READPV",  "ESB:GP01:VAL01") # dummy PV
#epicsEnvSet("READPV",  "ESB:A01:ADC1:AI:CH2") # toroid 355
epicsEnvSet("READPV",  "ESB:A01:ADC1:AI:CH1") # qcav 2110
#epicsEnvSet("READPV",  "13PS22:Stats1:Total_RBV") # VCC pixel count
epicsEnvSet("ACTIONPV","ESB:THSC01:SHUTTER:OC") # Gun laser fast shutter
#epicsEnvSet("ACTIONPV","ESB:GP01:VAL01") # dummy PV
#epicsEnvSet("ACTIONPV","ESB:SDG01:BO:SC:CH1") # Regen 1 Pockels cell

save_restoreSet_status_prefix( "")
save_restoreSet_IncompleteSetsOk( 1)
save_restoreSet_DatedBackupFiles( 1)
set_savefile_path( "/nfs/slac/g/testfac/esb/$(IOC)","autosave")
set_pass0_restoreFile( "ct$(N).sav")
set_pass1_restoreFile( "ct$(N).sav")

dbLoadRecords("db/ct.db","P=$(P),READPV=$(READPV),ACTIONPV=$(ACTIONPV)")

cd ${AUTOSAVE}
dbLoadRecords( "db/save_restoreStatus.db","P=$(P)")

cd ${TOP}/iocBoot/${IOC}
iocInit

create_monitor_set( "ct$(N).req",30,"P=$(P)")
