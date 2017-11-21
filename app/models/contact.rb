class Contact < ApplicationRecord
  def friendly_updated_at
    updated_at.strftime("%B %e, %Y")
  end

  def full_name
    full_name = "#{last_name}, #{first_name} #{middle_name}"
    return full_name
  end

  def phone_japan
    phone_japan = "+81 #{phone_number}"
    return phone_japan
  end

  # def as_json
  #   {
  #     id: id,
  #     name: full_name,
  #     email: email,
  #     phone: phone_number
  #   }
  # end
end
