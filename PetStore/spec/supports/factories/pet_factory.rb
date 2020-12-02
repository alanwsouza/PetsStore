require_relative '../models/pet_model.rb'

FactoryBot.define do
    factory :Pets do
      id        {0}
      category  {{'id'=> 0, 'name'=> 'string'}}
      name      {Faker::Creature::Animal.name}
      photoUrls {['string']}
      tags      {[{'id'=> 0, 'name'=> 'string'}]}
      status    {'available'}
    end
end