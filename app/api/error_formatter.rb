module ErrorFormatter
  def self.call message, backtrace, options, env
    { :status => 'error', :data => message }.to_json
  end
end