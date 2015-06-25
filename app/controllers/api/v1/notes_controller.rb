module Api
  module V1
    class NotesController < ApplicationController
      before_action :set_note, only: [:show, :update, :destroy]
      
      # GET /notes
      # GET /notes.json
      def index
        # @notes = Note.all

        # render json: @notes
        serialized_notes = ActiveModel::ArraySerializer.new(Note.all, each_serializer: NoteSerializer)
        render json: serialized_notes
      end

      # GET /notes/1
      # GET /notes/1.json
      def show
        render json: @note
      end

      # POST /notes
      # POST /notes.json
      def create
        @note = Note.new(note_params)

        if @note.save
          render json: @note, status: :created, location: api_v1_note_path(@note)#@note
        else
          render json: @note.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /notes/1
      # PATCH/PUT /notes/1.json
      def update
        @note = Note.find(params[:id])

        if @note.update(note_params)
          head :no_content
        else
          render json: @note.errors, status: :unprocessable_entity
        end
      end

      # DELETE /notes/1
      # DELETE /notes/1.json
      def destroy
        @note.destroy

        head :no_content
      end

      private

        def set_note
          @note = Note.find(params[:id])
        end

        def note_params
          params.require(:note).permit(:title, :body, :category_id) if params[:note]
        end
    end
  end
end