class Api::V1::NotesController < ApplicationController

  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    note = Note.new(note_params)
    if note.save
      render json: note
    else
      render json: 'Error', status: 404
    end
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    render json: note
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
