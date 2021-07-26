# frozen_string_literal: true

module Api
  class CoursesController < ApplicationController
    def index
      courses = Course.all
      render json: { status: 'ok', data: courses }, status: :ok
    end

    def show
      course = Course.where(id: course_params[:id]).first
      if course
        render json: { data: course }, status: :ok
      else
        render json: { error: 'Course not found' }, status: :not_found
      end
    end

    private

    def course_params
      params.permit(:id)
    end
  end
end
