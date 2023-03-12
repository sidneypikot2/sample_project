
class Users::CreateService < ApplicationService

  def call
    attributes = context.attributes ? context.attributes : serialize(context.user)
    if attributes[:image].class == String
      attributes[:image] = Shrine.remote_url(attributes[:image])
    end
    user = User.new(attributes)
    if user.valid? && user.save
      context.user = user
      context.message = "Create successful"
    else
      context.user = user
      context.message = user.errors.full_messages
      context.fail!
    end
  end

  private
  def serialize(user)
    {
      first_name:          user['firstName'],
      last_name:           user['lastName'],
      maiden_name:         user['maidenName'],
      age:                user['age'],
      gender:             user['gender'],
      email:              user['email'],
      phone:              user['phone'],
      username:           user['username'],
      password:           user['password'],
      birth_date:          user['birthDate'],
      image:              user['image'],
      height:             user['height'],
      weight:             user['weight'],
      eye_color:           user['eyeColor'],
      hair_color:          user['hair']['color'],
      hair_type:           user['hair']['type'],
      domain:             user['domain'],
      ip:                 user['ip'],
      mac_address:         user['macAddress'],
      university:         user['university'],
      ein:                user['ein'],
      ssn:                user['ssn'],
      user_agent:          user['userAgent'],
      bank_attributes:   {
        card_expire:       user['bank']['cardExpire'],
        card_number:       user['bank']['cardNumber'],
        card_type:         user['bank']['cardType'],
        currency:         user['bank']['currency'],
        iban:             user['bank']['iban'],
        },
      address_attributes:   {
        address:          user['address']['address'],
        city:             user['address']['city'],
        lat:              user['address']['coordinates']['lat'],
        lng:              user['address']['coordinates']['lng'],
        postal_code:       user['address']['postalCode'],
        state:            user['address']['state'],
        },
      company_attributes: {
        department:       user['company']['department'],
        name:             user['company']['name'],
        title:            user['company']['title'],
        address_attributes:   {
          address:        user['company']['address']['address'],
          city:           user['company']['address']['city'],
          lat:            user['company']['address']['coordinates']['lat'],
          lng:            user['company']['address']['coordinates']['lng'],
          postal_code:     user['company']['address']['postalCode'],
          state:          user['company']['address']['state'],
          }
        }
    }
  end
end