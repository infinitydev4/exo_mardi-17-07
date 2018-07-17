require 'pry'

class Board
    #nous allons creer un tableau qui contient 9 cases
    attr_accessor :tab
    def initialize (tab = [])
        
        9.times do |i|

            tab << BoardCase.new(" ", i)
             i += 1
             
        end
        @tab = tab.map{|t| t.value}
    end
    
    def game_over?

        ([tab[0], tab[1], tab[2]].uniq.size == 1 && [tab[0], tab[1], tab[2]].uniq != [' ']) ||
        ([tab[3], tab[4], tab[5]].uniq.size == 1 && [tab[3], tab[4], tab[5]].uniq != [' ']) ||
        ([tab[6], tab[7], tab[8]].uniq.size == 1 && [tab[6], tab[7], tab[8]].uniq != [' ']) ||
        ([tab[0], tab[3], tab[6]].uniq.size == 1 && [tab[0], tab[3], tab[6]].uniq != [' ']) ||
        ([tab[1], tab[4], tab[7]].uniq.size == 1 && [tab[1], tab[4], tab[7]].uniq != [' ']) ||
        ([tab[2], tab[5], tab[8]].uniq.size == 1 && [tab[2], tab[5], tab[8]].uniq != [' ']) ||
        ([tab[0], tab[4], tab[8]].uniq.size == 1 && [tab[0], tab[4], tab[8]].uniq != [' ']) ||
        ([tab[2], tab[4], tab[6]].uniq.size == 1 && [tab[2], tab[4], tab[6]].uniq != [' '])
    end

    def print_tab
        puts "\n   1   2   3"
        p '1 ' + @tab[0..2].join(' | ') + ' '
        p " ---|---|---"
        p '2 ' + @tab[3..5].join(' | ') + ' '
        p " ---|---|---"
        p '3 ' + @tab[6..8].join(' | ') + ' '
    puts "\n"
    end

end

class BoardCase
    attr_accessor :value, :position
        def initialize (value, position)
        @value = value
        @position = position
            
        to_s
        self.value
        end
    end

class Player
 attr_accessor :name, :team
        def initialize (name,team)
            @name = name
            @team = team
        end
    end
class Game
    attr_accessor :player1, :player2, :board
    def initialize ()
        @player1 = Player.new("player1", "X")
        @player2 = Player.new("player2","O")
        @board = Board.new

    end


    def turn (player)
    puts "c'est à #{player.name} de jouer"
    @board.print_tab
    puts "où veux-tu jouer ?"
    cases = (gets.chomp.to_i) -1
   
    
    
    while !(@board.tab[cases] == " ")
        puts "où veux-tu jouer ?"
        cases = (gets.chomp.to_i) -1

    end
    @board.tab[cases] = player.team
    @board.print_tab
    
    end
    def go
        t = 1
        while !@board.game_over?
            if t == 1
                self.turn(player1)
                t += 1
            else
                self.turn(player2)
                t -= 1
            end
    end
    if t == 1  
        @board.print_tab
        puts "\n*********************Bravo ! #{@player2.name} tu remporte la partie**********************************"
    
     else
            @board.print_tab
    
            puts "\n*********************Bravo ! #{@player1.name} tu remporte la partie**********************************"
     end
end

end

#binding.pry