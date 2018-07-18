require_relative 'boardCase'

class Board 
    attr_accessor :board
    def initialize(board=[])#on initialise  le tableau vide
        9.times do
            board<<BoardCase.new() #ajouter dans un array des object BoardCase
        end
        @board=board.map{|h| h.boardCase} #le map recupere array des object BoardCase et leur id bizarre
                                          #et casse pied et le transform en tableau ne contenant que les valeur des object boardcase



    end
    def affichage#initialisation de l'affichage
        puts"   1   2   3"
        puts"   ---------"
        puts"   #{@board[0]} | #{@board[1]} | #{@board[2]}"
        puts"   ---------"
        puts"   #{@board[3]} | #{@board[4]} | #{@board[5]}"
        puts"   ---------"
        puts"   #{@board[6]} | #{@board[7]} | #{@board[8]}"
        puts"   ---------"
        puts"   7   8   9"
    end
    def game_over? #Les conditions de victoire si la value n'est pas ' ' et que que 3 case du tableau sont identique et aligné 
        [@board[0], @board[1], @board[2]].uniq.size == 1 && [@board[0], @board[1], @board[2]].uniq!=[" "]||#le uniq.size==1 sert a savoir sile tableau uniq qui prend que les symbole 
        [@board[3], @board[4], @board[5]].uniq.size == 1 && [@board[3], @board[4], @board[5]].uniq!=[" "]||#de façon unique a bien un taile de 1 ce qui equivant a dire
        [@board[6], @board[7], @board[8]].uniq.size == 1 && [@board[6], @board[7], @board[8]].uniq!=[" "]||# une ligne de X|X|X equivaut a un tableau unique |X| de taille 1 pareil pour 0
        [@board[0], @board[3], @board[6]].uniq.size == 1 && [@board[0], @board[3], @board[6]].uniq!=[" "]||#que ça sois en ligne ou diagonale
        [@board[1], @board[4], @board[7]].uniq.size == 1 && [@board[1], @board[4], @board[7]].uniq!=[" "]||
        [@board[2], @board[5], @board[8]].uniq.size == 1 && [@board[2], @board[5], @board[8]].uniq!=[" "]||
        [@board[0], @board[4], @board[8]].uniq.size == 1 && [@board[0], @board[4], @board[8]].uniq!=[" "]||
        [@board[2], @board[4], @board[6]].uniq.size == 1 && [@board[2], @board[4], @board[6]].uniq!=[" "]
    end
    def tie #Les conditions du nul
        !@board.include?(' ')#faut qu'aucune des case ne contienne un espace)
    end
end