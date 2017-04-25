module ChineseRegionsRails
  module HelperUtil
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

  module Helper
    def city_picker_tag(name, value = nil, options = {})
      if data = options[:data]
        data.merge!(toggle: "city-picker")
      else
        data = {toggle: "city-picker"}
        options[:data] = data
      end
      options.merge!(readonly: true)

      _raw_label = HelperUtil.raw_label(value)
      _raw_value = HelperUtil.raw_value(value)


      output = ActiveSupport::SafeBuffer.new
      output << '<div style="position: relative;">'.html_safe
      output <<   text_field_tag(nil, _raw_label, options)
      output <<   hidden_field_tag(name, _raw_value, { data: { "city-picker-value" => "true" } })
      output << '</div>'.html_safe
    end
  end

  module Builder
    def city_picker(method, options = {})
      if data = options[:data]
        data.merge!(toggle: "city-picker")
      else
        data = {toggle: "city-picker"}
        options[:data] = data
      end
      options.merge!(readonly: true)
      options[:name] = nil

      value = retrive_value(method)
      _raw_label = HelperUtil.raw_label(value)
      _raw_value = HelperUtil.raw_value(value)

      options[:value] = _raw_label

      output = ActiveSupport::SafeBuffer.new
      output << '<div style="position: relative;">'.html_safe
      output <<   text_field(nil, options)
      output <<   hidden_field(method, { value: _raw_value, data: { "city-picker-value" => "true" } })
      output << '</div>'.html_safe
    end

    private
    def retrive_value(method)
      object = self.instance_variable_get("@object")
      object.public_send(method) if object
    end
  end
end
