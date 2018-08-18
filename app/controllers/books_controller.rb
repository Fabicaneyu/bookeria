class BooksController < ApplicationController
  # GET
  def index
  	@books = Book.all # lista todos os livros do banco de dados 
  end

  # GET
  def new
    @book = Book.new # criando um objeto novo do tipo Book
  end

  # POST
  def create
    @book = Book.new(books_params) #crio um objeto com os dados que vieram do usuário
    @book.save # salvo no banco de dados e ele vai criar um ID no banco de dados

    redirect_to @book # show porque o @book já tem um objeto com o ID, é um objeto só
  end

  # GET
  def show
  	# como ela não se conversam , eu preciso procurar no banco de dados de novo 
    @book = Book.find(params[:id]) # buscando esse ID no banco de dados
  end

  private

  def books_params
    params.require(:book).permit(:title, :author, :genre, :year)
  end
end