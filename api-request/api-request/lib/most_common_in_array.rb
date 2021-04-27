# frozen_string_literal: true

# keeping it single responsability and with a named parameter so its clear what
# needs to be passed into the module.
module MostCommonInArray
  def most_common_in_array(array:)
    result = array.uniq.max_by do |i|
      array.count(i)
    end
    result
  end
end
