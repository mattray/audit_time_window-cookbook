# Audit Time Window

This cookbook allows for controlling additional compliance profiles to be added within time windows that they are valid to run. The windows are controlled by an attribute hash of times with the profile to that are valid to run within those times. If the Chef client does not have an InSpec audit scheduled during that timeframe, these profiles will not be added, they are strictly only available within these times.

## Attributes

The format for adding InSpec profiles managed by `audit_time_window` is the same for adding standard compliance profiles, but the attribute namespace is `audit_time_window` instead of `audit` and there are 2 additional attributes of arrays. The `start` and `end` arrays map 1-1 where the first time in the `start` completes with the first time in the `end`. Following this example:

    default['audit_time_window']['profiles']['linux-patch-baseline']['url'] = 'https://github.com/dev-sec/linux-patch-baseline'
    default['audit_time_window']['profiles']['linux-patch-baseline']['start'] = ['0300', '1500']
    default['audit_time_window']['profiles']['linux-patch-baseline']['end'] = ['0400', '1600']

There are 2 time windows of 3-4AM and 3-4PM where this profile may be checked.

## Audit Artifactory Cookbook

If you are using the [audit_artifactory](https://github.com/mattray/audit_artifactory-cookbook) set

    default['audit_time_window']['profiles']['linux-patch-baseline']['audit_artifactory'] = true

and the profile will be copied into the `audit_artifactory` namespace for processing by that cookbook at run time.
