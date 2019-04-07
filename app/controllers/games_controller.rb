class GamesController < ApplicationController
  QUESTIONS = [
    "Does it have clear eyes ?",
    "Is this a male ?",
    "Is he vegan ?",
    "Is he from Aquitaine ?"
  ]

  student1 = {
    "name" => "Pauline",
    "answers" => ["yes", "no", "no", "no"]
  }
  student2 = {
    "name" => "Arthur",
    "answers" => ["yes", "no", "no", "yes"]
  }
  STUDENTS = [ student1, student2 ]

  def create
  	@game = Game.create   # Ask at Game model to create a new game with new id
                          # teh new game is like that : {"id" => 1, "answers" => []}
                          # to see the game answers array, i juste need write @game["answers"]
    # create empty game answers array where we stock answers. ex: ["yes", "no", "no", "yes"]
    redirect_to edit_game_path(id: 1, quesion_id: 0), method: :get # redirect before pass by the create view
  end

  def edit
    @game_id = params["id"]
    @question_id = params["question_id"].to_i
    @question = QUESTIONS[@question_id]
  end

  def update
  # stock the answer in game answers array initialized in the create method
    @game_id = params["id"]
    @game = Game.find(@game_id)
    @game["answers"] << params["answer"]
    @game.save
    @question_id = params["question_id"].to_i
    if @question_id < QUESTIONS.size
      redirect_to edit_game_path(id: @game_id, question_id: @question_id), method: :get
    else
      redirect_to game_path(id: @game_id), method: :get
    end
  end

  def show
  	 @game_id = params["id"]
    @game = Game.find(@game_id)
    @answers = @game["answers"]
    @students = STUDENTS
  end
end
