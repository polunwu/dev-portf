class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout "portfolio"
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
     @portfolio_item = Portfolio.new(portfolio_params)

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
  end

  # PATCH/PUT /portfolios/1
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # GET /portfolios/1
  def show
  end

  # DELETE /portfolios/1
  def destroy
    # Destroy / Delete the record
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully destroyed.' }
    end
  end

  private
    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle,
                                        :body, 
                                        technologies_attributes: [:name]
                                        )
    end

    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end
end
