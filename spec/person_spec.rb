require './school_person'
require './school_rental'
require'./school_book'

describe Person do
  it 'has a name' do
    person = Person.new(65, 'Chidinma')
    expect(person.name).to eq('Chidinma')
  end

  it 'has age' do
    person = Person.new(23, 'Richard')
    expect(person.age).to eq(23)
  end

  it 'can use service' do
    person = Person.new(23, 'Richard')
    expect(person.can_use_services?).to eq(true)
  end
end