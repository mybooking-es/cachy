require 'cachy/wrapper'

# Wrapper for Moneta http://github.com/wycats/moneta/tree/master
class Cachy::MonetaWrapper < Cachy::Wrapper
  def write(key, result, options={})
    # Transform :expires_in into :expires
    if options.has_key?(:expires_in)
      options.store(:expires, options[:expires_in].to_i)
      options.delete(:expires_in)
    end
    ::Yito::Logger.instance.logger.debug  "MONETA-WRAPPER:: write #{key} options: #{options.inspect}"
    @wrapped.store(key, result, options)
  end

  def delete(key, options={})
    ::Yito::Logger.instance.logger.debug  "MONETA-WRAPPER:: delete #{key} options: #{options.inspect}"
    @wrapped.delete(key)
  end

end