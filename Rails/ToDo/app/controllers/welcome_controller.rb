class WelcomeController < ApplicationController

    def index 
        @customer = Customer.all
        
    end
end
