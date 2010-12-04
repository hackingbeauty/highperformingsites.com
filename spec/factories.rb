Factory.define :user do |user|
  user.name                   "Maximus Digeratus"
  user.email                  "maximus@yahoo.com"
  user.password               "yadayada"
  user.password_confirmation  "yadayada"
end

Factory.define :url do |url|
  url.name                    "http://www.ebay.com"
end