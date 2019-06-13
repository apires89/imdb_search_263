class MoviesController < ApplicationController
  def index
    if params[:query].present?
     #@movies = Movie.where(title: params[:query])
     #@movies = Movie.where("title ILIKE ?", params[:query])
     #@movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
     #sql_query = "title ILIKE :query OR syllabus ILIKE :query"
     #@movies = Movie.where(sql_query, query: "%#{params[:query]}%" )
    #  sql_query = " \
    #     movies.title @@ :query \
    #     OR movies.syllabus @@ :query \
    #     OR directors.first_name @@ :query \
    #     OR directors.last_name @@ :query \
    #   "
    # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%" )
    # @movies = Movie.search_263(params[:query])
    #@movies = Movie.global_search(params[:query])
    @results = PgSearch.multisearch(params[:query])
    else
      @movies = Movie.all
    end
  end
end
