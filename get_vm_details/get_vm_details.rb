#!/usr/bin/ruby
# get_vm_details.rb
require 'rbvmomi'
require 'json'
# declare our credentials
vi_host = "192.168.0.20"
vi_user = 'administrator@vsphere.local'
vi_pass = 'VMware1!'
# connect to vCenter
vim = RbVmomi::VIM.connect(host: vi_host, user: vi_user, password: vi_pass, insecure: true)
# find our Datacenter and print it's name
dc = vim.serviceInstance.find_datacenter
# declare our hash table of all VMs
all_vms = {}
# find our clusters and print their names
clusters = dc.hostFolder.children
for cluster in clusters
  clus_hosts = cluster.host
  for host in clus_hosts
    for vm in host.vm
      all_vms[vm.name] = {:host => host.name, :cluster => cluster.name, :network => vm.network.values[0].to_s}
    end
  end
end
# output details as pretty JSON
puts JSON.pretty_generate(all_vms)
