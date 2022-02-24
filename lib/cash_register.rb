
require "pry"

class CashRegister 

    attr_accessor :total, :discount, :title, :price, :quantity, :items_total, :prices_total 

    def initialize(discount = 0) 
        @total = 0
        @discount = discount
        @items_total = []
        @prices_total = []
    end


    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        self.items_total.fill(title,  self.items_total.size, quantity)
        # self.prices_total.fill(price,  self.prices_total.size, quantity)
        self.prices_total << price * quantity
    end

    def apply_discount()j
        self.total = (self.total * (1 - (self.discount/100.00))).to_i

        if discount == 0
            return "There is no discount to apply."
        else 
            return "After the discount, the total comes to $#{self.total}."
        end

    end


    def items
        return self.items_total
    end

    def void_last_transaction
        self.total -= prices_total[-1]
        prices_total.pop
        if prices_total.length == 0
            return 0.0
        end
    end

end

# binding.pry