class MoneyController < ApplicationController

  def index
    unless session[:gold]
      session[:gold] = 0
    end
    unless session[:list]
      session[:list] = []
    end
  end

  def farm
      gold = rand(10..20)
      session[:gold] += gold

      output = {

        'str' => "Earned #{gold} golds, at the farm",
        'color' => 'green'

      }

      session[:list].push(output)

    redirect_to '/'
  end

  def cave
      gold = rand(5..10)
      session[:gold] += gold

      output = {

        'str' => "Earned #{gold} at the cave",
        'color' => 'green'

      }
      session[:list].push(output)

    redirect_to '/'
  end

  def house
    gold = rand(2..5)
    session[:gold] += gold
    output = {

      'str' => "Earned #{gold} golds, at the house",
      'color' => 'green'

    }

      session[:list].push(output)

    redirect_to '/'
  end

  def casino
    chance = rand(1..2)
    if chance == 2
      gold = rand(0..50)
      session[:gold] += gold

      output = {

        'str' => "Entered a casino and won #{gold} golds",
        'color' => 'green'
        
      }

      session[:list].push(output)

    else
      gold = rand(0..50)
      session[:gold] -= gold
        
      if session[:gold] <= 0
        output = {

          'str' => "Entered a casino and lost all your money...Ouch!",
          'color' => 'red'
          
        }

        session[:list].push(output)
      end

      output = {

        'str' => "Entered a casino and lost #{gold} golds!",
        'color' => 'red'

      }

      session[:list].push(output)

    end
    redirect_to '/'
  end

  def reset
    session.clear
    redirect_to '/'
  end
end
