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
  
  def table_header(obj, klass = nil)
    str = '<table'
    klass ? str << ' class="'+klass+'">'+"\r\n" : str << ">\r\n"
    str << "<thead>\r\n<tr>\r\n"
    obj[0].attribute_names.each do |key|
      unless key == 'id' or key == 'created_at' or key == 'updated_at'
        name = key.to_s.gsub('_', ' ')
        str << '<th>'+name+"</th>\r\n"
      end
    end
    str << "</tr>\n</thead>\n<tbody>"
  end
  
  def table_row(obj)
    str = "<tr>\r\n"
    obj.attributes.each do |key, value|
      unless key == 'id' or key == 'created_at' or key == 'updated_at'
        str << '<td>'+value.to_s+"</td>\r\n"
      end
    end
    str << "</tr>\r\n"
  end
  
  def table_end
    "</tbody>\r\n</table>\r\n"
  end
end
