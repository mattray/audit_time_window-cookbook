# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'audit_time_window'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'audit_time_window::default', 'audit::default'

# Specify a custom source for a single cookbook:
cookbook 'audit_time_window', path: '.'

default['audit']['profiles']['linux-patch-baseline']['url'] = 'https://github.com/dev-sec/linux-patch-baseline'
