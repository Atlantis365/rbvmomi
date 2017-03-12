# Get VM Details
## Overview
This script uses the VMware Ruby module (`rbvmomi`) to get a list of VMs from a vCenter server, and detail the cluster, host, and network that it is currently associated with.

This was really just an excuse to have a play with Ruby, and rbvmomi to see what I could do.

The output will be in JSON format, but this could potentially be modified to do something different with the resulting data.
## Instructions
The following lines in the script will need amending for your environment:
```ruby
# declare our credentials
vi_host = "192.168.0.20"
vi_user = 'administrator@vsphere.local'
vi_pass = 'VMware1!'
```
The script can then have its permissions modified using `chmod +x get_vm_details.rb`, and be run from the CLI.
## Example output
```json
Icarus: root$ ./get_vm_details.rb
{
  "ChefServer01": {
    "host": "vbrmgtesx01.virtualbrakeman.local",
    "cluster": "VBR_Mgmt_Cluster",
    "network": "vSS_Mgmt_Network"
  }
}
Icarus: root$
```
