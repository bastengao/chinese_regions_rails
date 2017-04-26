require 'securerandom'

module ChineseRegionsRails
  module Helper
    def city_picker_tag(name, value = nil, options = {})
      HelperUtil.setup_options(options)

      _raw_label = HelperUtil.raw_label(value)
      _raw_value = HelperUtil.raw_value(value)


      output = ActiveSupport::SafeBuffer.new
      output << text_field_tag(nil, _raw_label, options)
      output << hidden_field_tag(name, _raw_value, {
                                   data: { "city-picker-value-for" =>  options[:data][:id] }
                                })
    end
  end

  module Builder
    def city_picker(method, options = {})
      HelperUtil.setup_options(options)

      options[:name] = nil

      value = retrive_value(method)
      _raw_label = HelperUtil.raw_label(value)
      _raw_value = HelperUtil.raw_value(value)

      options[:value] = _raw_label

      output = ActiveSupport::SafeBuffer.new
      output << text_field(nil, options)
      output << hidden_field(method, {
                               value: _raw_value,
                               data: { "city-picker-value-for" => options[:data][:id] }
                             })
    end

    private
    def retrive_value(method)
      object = self.instance_variable_get("@object")
      object.public_send(method) if object
    end
  end

  module HelperUtil
    def self.setup_options(options)
      input_identifer = SecureRandom.hex(8)
      if data = options[:data]
        data.merge!(toggle: "city-picker", id: input_identifer)
      else
        data = {toggle: "city-picker", id: input_identifer}
        options[:data] = data
      end
      options.merge!(readonly: true)
    end

    def self.raw_label(value)
      return unless value

      if value.is_a?(ChineseRegions::Region)
        value.full_name("/")
      else
        ChineseRegions::Region.find_by(id: value).full_name("/")
      end
    end

    def self.raw_value(value)
      return unless value

      if value.is_a?(ChineseRegions::Region)
        value.id
      else
        value
      end
    end
  end
end
