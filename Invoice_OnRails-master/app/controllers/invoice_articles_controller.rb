class InvoiceArticlesController < ApplicationController
  before_action :set_invoice_article, only: [:show, :edit, :update, :destroy]

  # GET /invoice_articles
  # GET /invoice_articles.json
  def index
    @invoice_articles = InvoiceArticle.all
  end

  # GET /invoice_articles/1
  # GET /invoice_articles/1.json
  def show
  end

  # GET /invoice_articles/new
  def new
    @invoice_article = InvoiceArticle.new
  end

  # GET /invoice_articles/1/edit
  def edit
  end

  # POST /invoice_articles
  # POST /invoice_articles.json
  def create
    @invoice_article = InvoiceArticle.new(invoice_article_params)

    respond_to do |format|
      if @invoice_article.save
        format.html { redirect_to @invoice_article, notice: 'Invoice article was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_article }
      else
        format.html { render :new }
        format.json { render json: @invoice_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_articles/1
  # PATCH/PUT /invoice_articles/1.json
  def update
    respond_to do |format|
      if @invoice_article.update(invoice_article_params)
        format.html { redirect_to @invoice_article, notice: 'Invoice article was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_article }
      else
        format.html { render :edit }
        format.json { render json: @invoice_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_articles/1
  # DELETE /invoice_articles/1.json
  def destroy
    @invoice_article.destroy
    respond_to do |format|
      format.html { redirect_to invoice_articles_url, notice: 'Invoice article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_article
      @invoice_article = InvoiceArticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_article_params
      params.require(:invoice_article).permit(:invoice_id, :articles, :codice, :titolo, :descrizione, :quantita, :prezzo_unitario, :importo, :tax_id, :totale_ivato)
    end
end
