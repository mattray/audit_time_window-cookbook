#
# Cookbook:: audit_time_window
# Recipe:: default
#

current_time = Time.now.strftime("%H%M").to_i

profiles = node['audit_time_window']['profiles']

profiles.keys.each do |profile|
  profiles[profile]['start'].each_index do |i|
    start = profiles[profile]['start'][i].to_i
    finish = profiles[profile]['end'][i].to_i
    # iterate over the start and end pairs and check against the time
    if (start <= current_time) && (current_time <= finish)
      # temporarily add to the existing attributes
      if profiles[profile]['audit_artifactory'] # audit_artifactory will handle
        node.default['audit_artifactory']['profiles'][profile] = node['audit_time_window']['profiles'][profile]
      else
        node.default['audit']['profiles'][profile] = node['audit_time_window']['profiles'][profile]
      end
      log "Audit Time Window has scheduled #{profile} at #{current_time} between #{start} and #{finish}."
    end
  end
end
