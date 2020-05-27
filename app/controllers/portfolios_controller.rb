class PortfoliosController < ApplicationController
  # GET /portfolios
  def index
    @portfolio_items = Portfolio.all
  end

  # GET /portfolios/new
  def new
    @portfolio_item = Portfolio.new
  end

  # POST /portfolios
  def create
     @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle,:body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'A new portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # GET /portfolios/1/edit
  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
end
