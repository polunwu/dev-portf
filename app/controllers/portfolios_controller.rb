class PortfoliosController < ApplicationController
  # GET /portfolios
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  # GET /portfolios/new
  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  # POST /portfolios
  def create
     @portfolio_item = Portfolio.new(params.require(:portfolio).permit(
       :title, :subtitle,:body, technologies_attributes: [:name]))

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

  # PATCH/PUT /portfolios/1
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

  # GET /portfolios/1
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  # DELETE /portfolios/1
  def destroy
    # Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])

    # Destroy / Delete the record
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully destroyed.' }
    end
  end
end
