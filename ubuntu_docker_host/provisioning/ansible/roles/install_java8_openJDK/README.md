Ansible Role For Install Java8 (Self-Contained) playbook
=========================================

This playbook will install an OpenJDK Java8 JDK onto the target server, install the unrestricted export licenses and register it as the default Java in alternatives.

Tasks performed by this rolebook:

* Install OpenJDK RPM
* Install Apache-Commons/JSVC

Required/related rolebooks:

None.

Pre-Requisites
--------------

None.

Specific Variables for Rolebook
-------------------------------
These are the variables in use in this rolebook, along with details on where they should be defined.

Expected entries supplied as --extra-vars for standard usage
------------------------------------------------------------

Expected entries in host_vars for standard usage
------------------------------------------------

Other variables used in this rolebook
-------------------------------------
These are the variables in use in this rolebook, along with details on where they should be defined.

```
jsvc_rpm_file:
```
The name of the Apache-Commons RPM to install.  This is defined in defaults.

Global Variables used by Rolebook
-------------------------------
These are global variables used by this rolebook, these are defined in /group_vars/all

```
software_dest_tmp_dir:
```
The root folder on the Ansible server into which Jenkins transfers artifacts for deployment.
