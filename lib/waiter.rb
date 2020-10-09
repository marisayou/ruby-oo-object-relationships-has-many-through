class Waiter

    attr_accessor :name, :age

    @@all = []

    def initialize (name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        meals = self.meals
        highest_tip = 0
        tipper = nil

        meals.each do |meal|
            if meal.tip > highest_tip
                highest_tip = meal.tip
                tipper = meal.customer
            end
        end

        return tipper
    end

end