class Attendee
  attr_reader :name
              :budget
  def initialize(name: 'Megan', budget: '$50')
    @name = name
    @budget = budget.split("$").pop.to_i
  end
end