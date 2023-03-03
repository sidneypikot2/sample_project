class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name
  attributes :last_name
  attributes :age
  attributes :gender
  attributes :email
  attributes :phone
  attributes :username
  attributes :password
  attributes :birth_date
  attributes :image
  attributes :height
  attributes :weight
  attribute :hair do |object|
    {
      color: object.hair_color,
      type: object.hair_type
    }
  end
  attribute :domain
  attribute :ip
  attribute :mac_address
  attribute :university
  attribute :ein
  attribute :ssn
  attribute :user_agent

  attribute :address do |object|
    {
      address: {
        address: object.address.address,
        city: object.address.city,
        coordinates: {
            lat: object.address.lat,
            lng: object.address.lng
        }
      },
      postal_code: object.address.postal_code,
      state: object.address.state
    }
  end

  attribute :bank do |object|
    {
      id: object.bank.id,
      card_expire: object.bank.card_expire,
      card_number: object.bank.card_number,
      card_type: object.bank.card_type,
      currency: object.bank.currency,
      iban: object.bank.iban
    }
  end

  attribute :company do |object|
    {
      address: {
        address: object.company.address.address,
        city: object.company.address.city,
        coordinates: {
            lat: object.company.address.lat,
            lng: object.company.address.lng
        },
        postal_code: object.company.address.postal_code,
        state: object.company.address.state
      },
      department: object.company.department,
      name: object.company.name,
      title: object.company.title
    }
  end
end
