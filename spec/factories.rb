# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Nome"
  user.email                 "example@example.com"
  user.password              "123456"
  user.password_confirmation "123456"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :subject do |subject|
  subject.description "Calculo 1"
  subject.code "MAT2453"
end

Factory.define :professor do |professor|
  professor.name "Pait"
end

Factory.define :subcomment do |subcomment|
  subcomment.comment "materia importante"
  subcomment.association :user
  subcomment.association :subject
end

Factory.define :procomment do |subcomment|
  subcomment.comment "professor bom"
  subcomment.association :user
  subcomment.association :professor
end
