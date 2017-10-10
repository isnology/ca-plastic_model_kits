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
  
  # pass css class in option hash e.g.    class: true   or  class: 'table-striped'
  # use a block to modify the row value by checking the key (String) for the field name e.g.
  # do |key, value|
  #   value = dollars(value) if Key == 'price'
  #   value
  # end
  def table_for(objs, options = {})
    str = '<table'
    if (val = options[:class])
       str << (val == true ? ' class="table table-striped table-bordered">' : " class=\"#{val}\">")
    else
      str << '>'
    end
    str << '<thead><tr>'
    objs[0].attribute_names.each do |f_name|
      unless f_name == 'id' or f_name == 'created_at' or f_name == 'updated_at' or f_name[-3, 3] == '_id'
        name = f_name.to_s.capitalize.gsub('_', ' ')
        str << '<th>'+name+'</th>'
      end
    end
    if options[:show_btn]
      str << '<th></th>'
    end
    if options[:edit_btn]
      str << '<th></th>'
    end
    if options[:delete_btn]
      str << '<th></th>'
    end
    str << '</tr></thead><tbody>'
    objs.each do |obj|
      str << '<tr>'
      obj.attributes.each do |key, value|
        unless key == 'id' or key == 'created_at' or key == 'updated_at' or key[-3, 3] == '_id'
          if (method_name = options[key.to_sym])
            str << "<td>#{__send__(method_name, value)}</td>"
          else
            str << "<td>#{value.to_s}</td>"
          end
        end
      end
      if (val = options[:show_btn])
        str << "<td>#{link_to 'Show', obj, class: val == true ? 'btn btn-success btn-sm' : val}</td>"
      end
      if (val = options[:edit_btn])
        str << "<td>#{link_to 'Edit', send('edit_'+obj.model_name.name+'_path', obj),
                              class: val == true ? 'btn btn-warning btn-sm' : val}</td>"
      end
      if (val = options[:delete_btn])
        str << "<td>#{link_to 'Destroy', obj, method: :delete, data: { confirm: 'Are you sure?' },
                              class: val == true ? 'btn btn-danger btn-sm' : val }</td>"
      end
      str << '</tr>'
    end
    str << '</tbody></table>'
    str.html_safe
  end
end
