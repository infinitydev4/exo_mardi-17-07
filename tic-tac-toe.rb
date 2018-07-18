require'pry'

class BoardCase
    attr_accessor :boardCase
    def initialize(boardCase=" ")
        @boardCase=boardCase #initalise la case
    end
end

class Board 
    attr_accessor :board
    def initialize(board=[])
        9.times do
            board<<BoardCase.new()
        end
        @board=board.map{|h| h.boardCase}


    end
    def affichage
        puts"   1   2   3"
        puts"   ---------"
        puts"1  #{@board[0]} | #{@board[1]} | #{@board[2]}"
        puts"   ---------"
        puts"2  #{@board[3]} | #{@board[4]} | #{@board[5]}"
        puts"   ---------"
        puts"3  #{@board[6]} | #{@board[7]} | #{@board[8]}"
        puts"   ---------"
        puts"   1   2   3"
    end
    def game_over?
        [@board[0], @board[1], @board[2]].uniq.size == 1 && [@board[0], @board[1], @board[2]].uniq!=[" "]||
        [@board[3], @board[4], @board[5]].uniq.size == 1 && [@board[3], @board[4], @board[5]].uniq!=[" "]||
        [@board[6], @board[7], @board[8]].uniq.size == 1 && [@board[6], @board[7], @board[8]].uniq!=[" "]||
        [@board[0], @board[3], @board[6]].uniq.size == 1 && [@board[0], @board[3], @board[6]].uniq!=[" "]||
        [@board[1], @board[4], @board[7]].uniq.size == 1 && [@board[1], @board[4], @board[7]].uniq!=[" "]||
        [@board[2], @board[5], @board[8]].uniq.size == 1 && [@board[2], @board[5], @board[8]].uniq!=[" "]||
        [@board[0], @board[4], @board[8]].uniq.size == 1 && [@board[0], @board[4], @board[8]].uniq!=[" "]||
        [@board[2], @board[4], @board[6]].uniq.size == 1 && [@board[2], @board[4], @board[6]].uniq!=[" "]
    end
    def tie
        !@board.include?(' ')
    end
end

class Player
  attr_accessor :value, :name
    def initialize (value,name)
    @player
    @value=value
    @name=name
    end
end

class Game
attr_accessor :J1, :J2, :tab
    
    def initialize 
        puts"bienvenue dans le Tic Tac Toe de bertyn "
        puts"entrer prenom joueur X"
        nameJ1=gets.chomp
        puts"entrer prenom joueur O"
        nameJ2=gets.chomp
        @J1=Player.new(value="X",name=nameJ1)
        @J2=Player.new(value="O",name=nameJ2)
        @tab=Board.new()
        @symb=true
    end

    def tour()
puts 'Rentrz un nombre de 1 a 9 afin de choisir vos(lcase 1 est en haut a gauche'
    @coord=gets.chomp.to_i-1
    while @coord<0||@coord>9
        puts"Error"
        puts "Rentrz un nombre de 1 a 9 afin de choisir"
        @coord=gets.chomp.to_i-1
    end
    if @tab.board[(@coord.to_i)].include?" "
       
    if @symb==true
            @tab.board[(@coord.to_i)]=@J1.value
             @tab.affichage
        else @symb==false
            @tab.board[(@coord.to_i)]=@J2.value
            @tab.affichage
        end
    else
        puts"------Erreur cette casse est occupé!!!!------"
        puts "--Rentrez un nombre une boardcase inocupé!!!--"
        tour()
    end
    @symb=!@symb  # a la fin du tour la valeur symbole change afin d empecher le mem symbole de joué 2fois
    end
   

    
    def start
        #lance le jeu du tictactoe
        while !self.tab.game_over?
         self.tour
            if self.tab.tie
            puts "match nul"
            break

            end 
        end
        if self.tab.game_over? && @symb==false
            puts "C'est #{@J1.name} X qui a gagné"
        elsif self.tab.game_over? && @symb==true
            puts "C'est #{@J2.name} O qui a gagné"
        end
    end
end
gam1=Game.new
gam1.start