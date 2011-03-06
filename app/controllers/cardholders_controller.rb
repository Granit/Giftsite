class CardholdersController < ApplicationController
  # GET /cardholders
  # GET /cardholders.xml
  def index
    @cardholders = Cardholder.all
    @k_id = params[:k_id]
    @choose_card = params[:choose_card]
	unless @k_id.nil?
		@cardholder = Cardholder.find(@k_id)
		@cards = (@cardholder.cards + [nil]*MAX_CARD_NUMBER)[0..2]
	end
	@free_cards = Card.find_by_unassigned
	unless params[:c_id].nil?
		@card = Card.find(params[:c_id])
		@cardholder.cards.push(@card)
		@cardholder.update_attributes(:count=>@cardholder.cards.length)
		redirect_to :back, :params => @params
	end
	unless params[:clear_card].nil?
		@card = Card.find(params[:clear_card])
		@cardholder.cards=@cardholder.cards-[@card]
		@cardholder.update_attributes(:count=>@cardholder.cards.length)
		redirect_to :back, :params => @params
	end
	

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.xml  { render :xml => @cardholders }
    #end
  end

  # GET /cardholders/1
  # GET /cardholders/1.xml
  def show
    @cardholder = Cardholder.find(params[:id])
	@cards = @cardholder.cards
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cardholder }
    end
  end

  # GET /cardholders/new
  # GET /cardholders/new.xml
  def new
    @cardholder = Cardholder.new
	@cards = @cardholder.cards
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cardholder }
    end
  end

  # GET /cardholders/1/edit
  def edit
    @cardholder = Cardholder.find(params[:id])
  end

  # POST /cardholders
  # POST /cardholders.xml
  def create
    @cardholder = Cardholder.new(params[:cardholder])

    respond_to do |format|
      if @cardholder.save
        flash[:notice] = "Cardholder was successfully created."
        format.html { redirect_to(@cardholder) }
        format.xml  { render :xml => @cardholder, :status => :created, :location => @cardholder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cardholder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cardholders/1
  # PUT /cardholders/1.xml
  def update
    @cardholder = Cardholder.find(params[:id])

    respond_to do |format|
      if @cardholder.update_attributes(params[:cardholder])
        flash[:notice] = 'Cardholder was successfully updated.'
        format.html { redirect_to(@cardholder) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cardholder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cardholders/1
  # DELETE /cardholders/1.xml
  def destroy
  	
    @cardholder = Cardholder.find(params[:id])
    @cardholder.destroy

    respond_to do |format|
      format.html { redirect_to(cardholders_url) }
      format.xml  { head :ok }
    end
  end
  
end
