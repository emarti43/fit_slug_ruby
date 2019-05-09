class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, "f02351f5dff6d2b3017f2baa56cf6d10eadcb0df694c643d6bbb868ae8d413d120e8711db39b5cff2fb0b0096050673b70b83bf96434d652ccb503227987756f")
    end

    def decode(token)
      body = JWT.decode(token, "f02351f5dff6d2b3017f2baa56cf6d10eadcb0df694c643d6bbb868ae8d413d120e8711db39b5cff2fb0b0096050673b70b83bf96434d652ccb503227987756f")[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end
