class Contact < ApplicationRecord
  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  belongs_to :user

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
