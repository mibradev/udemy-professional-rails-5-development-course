class PortfoliosController < ApplicationController
  layout 'portfolio'
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @portfolio_items = Portfolio.order(:position)
    authorize @portfolio_items
  end

  def show
    authorize @portfolio_item
  end

  def new
    @portfolio_item = Portfolio.new
    authorize @portfolio_item
    3.times { @portfolio_item.technologies.build }
  end

  def edit
    authorize @portfolio_item
  end

  def create
    @portfolio_item = Portfolio.new(portfolios_params)
    authorize @portfolio_item

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_url, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @portfolio_item

    respond_to do |format|
      if @portfolio_item.update(portfolios_params)
        format.html { redirect_to portfolios_url, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @portfolio_item
    @portfolio_item.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end

  def sort
    authorize :portfolio
    params[:order].each { |k, v| Portfolio.find_by_id(v[:id])&.update(position: v[:position]) }
    head :no_content
  end

  private
    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end

    def portfolios_params
      params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
    end
end
