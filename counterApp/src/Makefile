TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ct
# ct.dbd will be created and installed
DBD += ct.dbd

# ct.dbd will be made up from these files:
ct_DBD += base.dbd
ct_DBD += asSupport.dbd

# Include dbd files from all support applications:
#ct_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
ct_LIBS += autosave 

# ct_registerRecordDeviceDriver.cpp derives from ct.dbd
ct_SRCS += ct_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ct_SRCS_DEFAULT += ctMain.cpp
ct_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ct_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
ct_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

