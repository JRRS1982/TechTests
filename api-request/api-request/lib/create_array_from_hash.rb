# frozen_string_literal: true

# will create an array of the values from a hash's keys.
module CreateArrayFromHash
  def create_array_from_hash(hash:, key:)
    result = []
    return if hash.nil?

    hash.select do |each_key|
      result << each_key[key]
    end
    result
  end
end
