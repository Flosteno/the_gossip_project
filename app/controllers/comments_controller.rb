class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :authenticate_user, only: [:new, :edit, :update, :create]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    @gossip = @comment.gossip
  end

  # POST /comments or /comments.json
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to gossip_path(@gossip), notice: "Commentaire ajouté !"
    else
      redirect_to gossip_path(@gossip), alert: "Erreur : impossible d’ajouter le commentaire."
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
      if @comment.update(comment_params)
        redirect_to gossip_path(@comment.gossip), notice: "Le commentaire a été mis à jour avec succès"
      else
        flash.now[:alert] = "Erreur : veuillez remplir tous les champs correctement."
        render :edit
      end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @gossip = @comment.gossip
    @comment.destroy!
    redirect_to gossip_path(@gossip), notice: "Le commentaire a été supprimé avec succès."  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      # params.expect(comment: [ :content, :user_id, :gossip_id ])
      params.require(:comment).permit(:content)
    end
end
