class PlayersController < ApplicationController
  before_action :set_team
  before_action :set_player, only: [:edit, :update, :destroy]

  def create
    @player = @team.players.new(player_params)
    if @player.save
      redirect_to @team, notice: "Player created!"
    else
      # Show errors on the post's show page
      @players = @team.players
      render "teams/show"
    end
  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to @team, notice: "Player updated!"
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to @team, alert: "Player was deleted."
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_player
    @player = @team.players.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :about, :team_id)
  end
end 

