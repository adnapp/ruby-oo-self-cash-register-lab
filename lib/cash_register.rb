#require 'pry'
class CashRegister
    attr_accessor :total, :name, :items, :discount, :last_txn

    def initialize(discount = 0)
        @total = 0.to_f
        @discount = discount.to_f
        @items = []
    end

    def add_item(name, price, quantity = 1)
        self.total += (price * quantity)
        quantity.times do
            self.items << name
        end
        self.last_txn = price * quantity
    end

    def apply_discount
        if @discount != 0
            self.total = self.total * (1- (self.discount/100))
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end
    #binding.pry

    def void_last_transaction
        self.total = self.total - self.last_txn
    end
end