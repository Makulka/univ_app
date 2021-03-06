class StudentsController < ApplicationController
    
    before_action :find_student, only: [:show, :edit, :update]
    
    def index
        @students = Student.all
    end
    
    def new
        @student = Student.new
    end
    
    def show
    end
    
    def edit
    end
    
    def create
        @student = Student.new(student_params)
        if @student.save
            flash[:notice] = "you have successfully signed up"
            redirect_to @student
        else
            render "new"
        end
    end
    
    def update
        if @student.update(student_params)
            flash[:notice] = "you have successfully edited your profile"
            redirect_to @student
        else
            render "edit"
        end
    end
    
    private
    def student_params
        params.require(:student).permit(:name, :email, :password, :password_confirmation)
    end
    
    def find_student
        @student = Student.find(params[:id])
    end
end