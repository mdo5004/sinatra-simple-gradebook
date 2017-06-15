class AssignmentController < ApplicationController
    get "/classes/:id/assignments/new" do
        @klass = Klass.find_by(id: params[:id])
        binding.pry
        erb :'assignments/new'
    end

    post "/classes/:id/assignments/new" do
        klass = Klass.find(params[:id])
        @assignment = klass.assignments.create(params[:name])
        if @assignment.save
            redirect to("/classes/#{params[:id]}")
        else
            erb :'assignments/new'
        end
    end
end