# frozen_string_literal: true

Puppet::Type.newtype(:globus_connect_config) do
  ensurable

  newparam(:name, namevar: true) do
    desc 'Section/setting name to manage from /etc/globus-connect-server.conf'
    # namevar should be of the form section/setting
    validate do |value|
      unless value =~ %r{\S+/\S+}
        raise(Puppet::Error, "Invalid globus_connect_config #{value}, entries should be in the form of section/setting.")
      end
    end
  end

  newproperty(:value) do
    desc 'The value of the setting to be defined.'
    munge do |value|
      value = value.to_s.strip
      value.capitalize! if value =~ %r{^(true|false)$}i
      value
    end

    newvalues(%r{^[\S ]*$})

    def is_to_s(currentvalue) # rubocop:disable Style/PredicateName
      if resource.secret?
        '[old secret redacted]'
      else
        currentvalue
      end
    end

    def should_to_s(newvalue)
      if resource.secret?
        '[new secret redacted]'
      else
        newvalue
      end
    end
  end

  newparam(:secret, boolean: true) do
    desc 'Whether to hide the value from Puppet logs. Defaults to `false`.'

    newvalues(:true, :false)

    defaultto false
  end

  validate do
    if self[:ensure] == :present && self[:value].nil?
      raise Puppet::Error, "Property value must be set for #{self[:name]} when ensure is present"
    end
  end

  autorequire(:file) do
    [
      '/etc/globus-connect-server.conf'
    ]
  end
end
