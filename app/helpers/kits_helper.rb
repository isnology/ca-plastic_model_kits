module KitsHelper
  def dollars(price)
    str = price.to_s.split(//)
    if str.length == 1
      str.unshift('0', '0')
    elsif str.length == 2
      str.unshift('0')
    end
    '$'+str.insert(-3, '.').join
  end
  
  # pass css class in option hash e.g.    class: 'table-striped'
  # pass helper to a field in options hash e.g.   table_for(@objs, class: 'table', price: 'dollars')
  def table_for(objs, options = {})
    str = '<table'
    if (val = options[:class])
       str << " class=\"#{val}\">"
    else
      str << '>'
    end
    str << '<thead><tr>'
    objs[0].attribute_names.each do |f_name|
      unless f_name == 'id' or f_name == 'created_at' or f_name == 'updated_at'
        name = f_name.to_s.capitalize.gsub('_', ' ')
        str << '<th>'+name+'</th>'
      end
    end
    str << '</tr></thead><tbody>'
    objs.each do |obj|
      str << '<tr>'
      obj.attributes.each do |key, value|
        unless key == 'id' or key == 'created_at' or key == 'updated_at'
          if (method_name = options[key.to_sym])
            str << "<td>#{__send__(method_name, value)}</td>"
          else
            str << "<td>#{value.to_s}</td>"
          end
        end
      end
      str << '</tr>'
    end
    str << '</tbody></table>'
    str.html_safe
  end
end
