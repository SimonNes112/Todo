class WelcomeController < ApplicationController
    def index
      @welcome = Welcome.all
    end
end