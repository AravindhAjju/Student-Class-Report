class SubjectScoresController < ApplicationController
  before_action :set_subject_score, only: [:show, :edit, :update, :destroy]

  # GET /subject_scores
  # GET /subject_scores.json
  def index
    @subject_scores = SubjectScore.all
  end

  # GET /subject_scores/1
  # GET /subject_scores/1.json
  def show
  end

  # GET /subject_scores/new
  def new
    @subject_score = SubjectScore.new
  end

  # GET /subject_scores/1/edit
  def edit
  end

  # POST /subject_scores
  # POST /subject_scores.json
  def create
    @subject_score = SubjectScore.new(subject_score_params)

    respond_to do |format|
      if @subject_score.save
        format.html { redirect_to @subject_score, notice: 'Subject score was successfully created.' }
        format.json { render :show, status: :created, location: @subject_score }
      else
        format.html { render :new }
        format.json { render json: @subject_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_scores/1
  # PATCH/PUT /subject_scores/1.json
  def update
    respond_to do |format|
      if @subject_score.update(subject_score_params)
        format.html { redirect_to @subject_score, notice: 'Subject score was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject_score }
      else
        format.html { render :edit }
        format.json { render json: @subject_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_scores/1
  # DELETE /subject_scores/1.json
  def destroy
    @subject_score.destroy
    respond_to do |format|
      format.html { redirect_to subject_scores_url, notice: 'Subject score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_score
      @subject_score = SubjectScore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_score_params
      params.require(:subject_score).permit(:scrore)
    end
end
