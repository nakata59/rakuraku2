class PostsController < ApplicationController
    def new
        @post = Post.new
        if params[:keyword]
            @items = RakutenWebService::Books::Book.search(title: params[:keyword])
            @isbn_a = params[:dummy]
            @isbn_b = params[:dummy2]
          end
    end

    def create
        @post = Post.create(title: params[:post][:title], body: params[:post][:body],user_id: current_user.id)
        if @post.save
            if params[:input1].to_i != 0
              book = Book.create(isbn: params[:input1] )
              @post.books << book
            end
            if params[:input3].to_i != 0
               book = Book.create(isbn: params[:input3] )
               @post.books << book
            end
            if params[:input4].to_i != 0
               book = Book.create(isbn: params[:input4] )
               @post.books << book
            end
            if params[:input5].to_i != 0
                book = Book.create(isbn: params[:input5] )
                @post.books << book
             end
             if params[:input6].to_i != 0
                byebug
                book = Book.create(isbn: params[:input6] )
                @post.books << book
             end
             if params[:input7].to_i != 0
                book = Book.create(isbn: params[:input7] )
                @post.books << book
             end
            redirect_to @post
        else
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        @books = Book.all
        @post_books = PostBook.all
        @items = []
        if @post.books != nil
          @post.books.each do |i|
            @item = RakutenWebService::Books::Book.search(isbn: i.isbn)
            @items.push(@item)
          end
        end
    end
end
