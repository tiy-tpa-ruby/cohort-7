module Api
  class NotesController < ApplicationController
    before_action :set_api_note, only: [:show, :update, :destroy]

    # GET /api/notes
    # GET /api/notes.json
    def index
      @api_notes = Note.all
    end

    # GET /api/notes/1
    # GET /api/notes/1.json
    def show
    end

    # POST /api/notes
    # POST /api/notes.json
    def create
      @api_note = Note.new(api_note_params)

      # Get the tags as a string
      tags = params[:tags]

      # Split them up by commas
      tag_names = tags.split(',').map { |name| name.strip }

      # Turn those array of tag string names into tag objects
      tag_objects = tag_names.map { |tag_name| Tag.find_or_create_by(name: tag_name) }

      # Assign the new tag objects to this note
      @api_note.tags = tag_objects

      # One liner.
      #  @api_note.tags = params[:tags].split(',').map { |tag_name| Tag.find_or_create_by(name: tag_name) }

      if @api_note.save
        render :show, status: :created, location: api_note_url(@api_note) # [:api, @api_note]
      else
        render :error, status: :bad_request
      end
    end

    # PATCH/PUT /api/notes/1
    # PATCH/PUT /api/notes/1.json
    def update
      if @api_note.update(api_note_params)
        render :show, status: :ok, location: @api_note
      else
        render json: @api_note.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/notes/1
    # DELETE /api/notes/1.json
    def destroy
      @api_note.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_api_note
        @api_note = Note.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def api_note_params
        params.permit(:title, :body)
      end
  end
end
