class RestaurantsController < ApplicationController

   # before_filter :authenticate_user!

  def index
   @restaurants = Restaurant.all
   @dishes = Dish.all
  end

  def favorites
   @restaurants = Restaurant.all
  end

  def createdish
    d = Dish.create({
    name: params[:new_dish],
    restaurant_id: params[:new_restaurant_id]
    })
    redirect_to :back
  end

  def deletedish
   id = params[:id]
   @dish = Dish.find(id)
   @dish.delete
   @dish.save!
   redirect_to :back
  end

  def ratings
  id = params[:user_id]
  @new_r = Restaurant.find(id)
  @new_r.rating = params[:user_rating]
  @new_r.save!
  redirect_to :back
  end

  def delete
   id = params[:id]
   @restaurant = Restaurant.find(id)
   @restaurant.delete
   @restaurant.save!
   redirect_to :back
  end


  def create

    new_chef = Chef.create({
        name: params[:new_chef]
        
    })

    new_restaurant = Restaurant.create({
        name: params[:new_restaurant],
        # cuisine: params[:new_cuisine],
        rating: params[:new_rating],
        chef_id: new_chef.id
        })


    redirect_to :back
  end
    def create2
    new_chef = Chef.create({
        name: params[:new_chef]
        
    })

    new_restaurant = Restaurant.create({
        name: params[:new_restaurant],
        # cuisine: params[:new_cuisine],
        rating: params[:new_rating],
        chef_id: new_chef.id
        })
    redirect_to :back
  end

  def show
  


   @restaurants = Restaurant.all
   @dishes = Dish.all

   id = params[:id]
   @restaurant = Restaurant.find(id)

   @restaurant_name_map = @restaurant.name.gsub(" ","+")
   @restaurant_name_pre_gsub = @restaurant.name.downcase
   @restaurant_name = @restaurant.name.gsub(" ","%20")
   url = "http://api.yelp.com/business_review_search?term=#{@restaurant_name}&location=New%20York&ywsid=qWgJko1K1_GbLzg4ir5HTw"
   response = HTTParty.get(url)
   @restaurant_hash = JSON(response.body)

    @yelp_rating = @restaurant_hash["businesses"][0]["avg_rating"] * 20
   






   #  @restaurant_name = params[:name].gsub(" ","%20")
    # url = "http://api.yelp.com/business_review_search?term=#{@restaurant_name}&location=New%20York&ywsid=qWgJko1K1_GbLzg4ir5HTw"
   #  response = HTTParty.get(url)
   #  @restaurant_hash = JSON(response.body)


   #Michelin Stars:

    @michelin = {}
    
    @michelin["ai fiori"] = 1
    @michelin["aldea"] = 1
    @michelin["annisa"] = 1
    @michelin["aquavit"] = 1
    @michelin["aska"] = 1
    @michelin["aureole"] = 1
    @michelin["a voce columbus"] = 1
    @michelin["a voce madison"] = 1
    @michelin["a voce"] = 1
    @michelin["babbo"] = 1
    @michelin["blanca"] = 1
    @michelin["blue hill"] = 1
    @michelin["bouley"] = 1
    @michelin["breslin"] = 1
    @michelin["the breslin"] = 1
    @michelin["brushstroke"] = 1
    @michelin["cafe boulud"] = 1
    @michelin["cafe china"] = 1
    @michelin["carbone"] = 1
    @michelin["casa mono"] = 1
    @michelin["caviar russe"] = 1
    @michelin["danji"] = 1
    @michelin["danny brown wine bar & kitchen"] = 1
    @michelin["danny brown wine bar and kitchen"] = 1
    @michelin["del posto"] = 1
    @michelin["dovetail"] = 1
    @michelin["15 east"] = 1
    @michelin["fifteen east"] = 1
    @michelin["gotham bar and grill"] = 1
    @michelin["gramercy tavern"] = 1
    @michelin["hakkasan"] = 1
    @michelin["ichimura"] = 1
    @michelin["jewel bako"] = 1
    @michelin["junoon"] = 1
    @michelin["kajitsu"] = 1
    @michelin["kyo ya"] = 1
    @michelin["lan sheng"] = 1
    @michelin["le restaurant"] = 1
    @michelin["lincoln"] = 1
    @michelin["minetta tavern"] = 1
    @michelin["modern"] = 1
    @michelin["the modern"] = 1
    @michelin["musket room"] = 1
    @michelin["the musket room"] = 1
    @michelin["nomad"] = 1
    @michelin["the nomad"] = 1
    @michelin["oceana"] = 1
    @michelin["peter luger"] = 1
    @michelin["peter luger steak house"] = 1
    @michelin["public"] = 1
    @michelin["rosanjin"] = 1
    @michelin["rouge tomate"] = 1
    @michelin["seasonal"] = 1
    @michelin["spotted pig"] = 1
    @michelin["sushi azabu"] = 1
    @michelin["sushi of gari"] = 1
    @michelin["tamarind tribeca"] = 1
    @michelin["tamarind"] = 1
    @michelin["telepan"] = 1
    @michelin["tori shin"] = 1
    @michelin["torrisi italian specialties"] = 1
    @michelin["tulsi"] = 1
    @michelin["wallse"] = 1
    @michelin["wd 50"] = 1
    @michelin["wd-50"] = 1
    @michelin["wd~50"] = 1

    #2 michelin stars
    @michelin["atera"] = 2
    @michelin["jungsik"] = 2
    @michelin["marea"] = 2
    @michelin["momofuku ko"] = 2
    @michelin["soto"] = 2

    #3 michelin stars
    @michelin["chef's table at brooklyn fare"] = 3
    @michelin["chefs table at brooklyn fare"] = 3
    @michelin["brooklyn fare"] = 3
    @michelin["daniel"] = 3
    @michelin["eleven madison park"] = 3
    @michelin["jean georges"] = 3
    @michelin["jean-georges"] = 3
    @michelin["le bernardin"] = 3
    @michelin["masa"] = 3
    @michelin["per se"] = 3

# if @michelin[@restaurant_name_pre_gsub] == 1  
#     @michelin_rating = 90
# elsif @michelin[@restaurant_name_pre_gsub] == 2
#     @michelin_rating = 95
# elsif @michelin[@restaurant_name_pre_gsub] == 3
#     @michelin_rating = 100
# else
#     @michelin_rating = nil
# end




    #New York Times
    @nyt = {}

    #NYT 1 star

    @nyt["456 Shanghai Cuisine"] = 1
    @nyt["5 ninth"] = 1
    @nyt["aburiya kinnosuke"] = 1
    @nyt["agave"] = 1
    @nyt["alison eighteen"] = 1
    @nyt["almayass"] = 1
    @nyt["anella"] = 1
    @nyt["arabelle"] = 1
    @nyt["asiate"] = 1
    @nyt["atlantic grill"] = 1
    @nyt["aureole"] = 1
    @nyt["avra"] = 1
    @nyt["azalea"] = 1
    @nyt["balaboosta"] = 1
    @nyt["barbes"] = 1
    @nyt["barbounia"] = 1
    @nyt["barbuto"] = 1
    @nyt["benoit"] = 1
    @nyt["biang"] = 1
    @nyt["biang!"] = 1
    @nyt["blaue gans"] = 1
    @nyt["blue smoke"] = 1
    @nyt["blue water grill"] = 1
    @nyt["bobby van's steakhouse"] = 1
    @nyt["bobby vans steakhouse"] = 1
    @nyt["bobo"] = 1
    @nyt["brasserie 8 1/2"] = 1
    @nyt["butter"] = 1
    @nyt["buttermilk channel"] = 1
    @nyt["cafe cluny"] = 1
    @nyt["cafe luxembourg"] = 1
    @nyt["cafe un deux trois"] = 1
    @nyt["calle ocho"] = 1
    @nyt["calliope"] = 1
    @nyt["candle 79"] = 1
    @nyt["caravaggio"] = 1
    @nyt["carlyle restaurant"] = 1
    @nyt["casa la femme"] = 1
    @nyt["centrico"] = 1
    @nyt["charlie bird"] = 1
    @nyt["chez sardine"] = 1
    @nyt["china grill"] = 1
    @nyt["chin chin"] = 1
    @nyt["cipriani downtown"] = 1
    @nyt["co"] = 1
    @nyt["co."] = 1
    @nyt["colonie"] = 1
    @nyt["commerce"] = 1
    @nyt["convivium osteria"] = 1
    @nyt["coppelia"] = 1
    @nyt["crema"] = 1
    @nyt["crown"] = 1
    @nyt["danji"] = 1
    @nyt["da silvano"] = 1
    @nyt["dawat"] = 1
    @nyt["delicatessen"] = 1
    @nyt["delmonico's"] = 1
    @nyt["delmonicos"] = 1
    @nyt["desmond's"] = 1
    @nyt["desmonds"] = 1
    @nyt["dim sum go go"] = 1
    @nyt["dos caminos"] = 1
    @nyt["duane park"] = 1
    @nyt["ed's chowder house"] = 1
    @nyt["eds chowder house"] = 1
    @nyt["el toro blanco"] = 1
    @nyt["empellon taqueria"] = 1
    @nyt["en japanese brasserie"] = 1
    @nyt["fatty cue"] = 1
    @nyt["fatty 'cue"] = 1
    @nyt["fishtail by david burke"] = 1
    @nyt["fishtail"] = 1
    @nyt["flex mussels"] = 1
    @nyt["freds at barneys ny"] = 1
    @nyt["fred's at barneys ny"] = 1
    @nyt["freds at barneys new york"] = 1
    @nyt["fred's at barneys new york"] = 1
    @nyt["gastroarte"] = 1
    @nyt["gemma"] = 1
    @nyt["gigino"] = 1
    @nyt["gottino"] = 1
    @nyt["hakkasan new york"] = 1
    @nyt["hakkasan"] = 1
    @nyt["harry's cafe and steak"] = 1
    @nyt["harrys cafe and steak"] = 1
    @nyt["harry's cafe & steak"] = 1
    @nyt["harrys cafe & steak"] = 1
    @nyt["hospoda"] = 1
    @nyt["hunan kitchen of grand sichuan"] = 1
    @nyt["ici"] = 1
    @nyt["il cantinori"] = 1
    @nyt["il giglio"] = 1
    @nyt["ilili"] = 1
    @nyt["indochine"] = 1
    @nyt["ippudo"] = 1
    @nyt["isa"] = 1
    @nyt["james"] = 1
    @nyt["jewel bako"] = 1
    @nyt["kanoyama"] = 1
    @nyt["katz's"] = 1
    @nyt["katzs"] = 1
    @nyt["katz's delicatessen"] = 1
    @nyt["katzs delicatessen"] = 1
    @nyt["kefi"] = 1
    @nyt["khe yo"] = 1
    @nyt["khe-yo"] = 1
    @nyt["kurumazushi"] = 1
    @nyt["kutsher's tribeca"] = 1
    @nyt["la boite en boise"] = 1
    @nyt["l'absinthe"] = 1
    @nyt["l absinthe"] = 1
    @nyt["la esquina"] = 1
    @nyt["lafayette"] = 1
    @nyt["lakruwana"] = 1
    @nyt["la masseria"] = 1
    @nyt["landmarc"] = 1
    @nyt["l'artusi"] = 1
    @nyt["l artusi"] = 1
    @nyt["la silhouette"] = 1
    @nyt["la sirene"] = 1
    @nyt["le cirque"] = 1
    @nyt["le relais de venise l'entrecote"] = 1
    @nyt["le relais de venise l entrecote"] = 1
    @nyt["les halles downtown"] = 1
    @nyt["louro"] = 1
    @nyt["l'apicio"] = 1
    @nyt["lumi"] = 1
    @nyt["lupa"] = 1
    @nyt["lure fishbar"] = 1
    @nyt["macao trading company"] = 1
    @nyt["madangsui"] = 1
    @nyt["maloney & porcelli"] = 1
    @nyt["maloney and porcelli"] = 1
    @nyt["manzanilla"] = 1
    @nyt["markjoseph steakhouse"] = 1
    @nyt["moim"] = 1
    @nyt["morandi"] = 1
    @nyt["morimoto"] = 1
    @nyt["motorino"] = 1
    @nyt["mp taverna astoria"] = 1
    @nyt["mr. k's"] = 1
    @nyt["mr k's"] = 1
    @nyt["mr. ks"] = 1
    @nyt["mr ks"] = 1
    @nyt["miko"] = 1
    @nyt["ocean grill"] = 1
    @nyt["olives new york"] = 1
    @nyt["olives"] = 1
    @nyt["onieal's soho"] = 1
    @nyt["onieals soho"] = 1
    @nyt["osteria del circo"] = 1
    @nyt["osteria morini"] = 1
    @nyt["palm"] = 1
    @nyt["palm too"] = 1
    @nyt["pastis"] = 1
    @nyt["patroon"] = 1
    @nyt["peasant"] = 1
    @nyt["peels"] = 1
    @nyt["pera mediterranean brasserie"] = 1
    @nyt["perilla"] = 1
    @nyt["porter house new york"] = 1
    @nyt["porter house"] = 1
    @nyt["prune"] = 1
    @nyt["public"] = 1
    @nyt["pulino's bar and pizzeria"] = 1
    @nyt["pulino's bar & pizzeria"] = 1
    @nyt["pulinos bar and pizzeria"] = 1
    @nyt["pulinos bar & pizzeria"] = 1
    @nyt["purple yam"] = 1
    @nyt["pylos"] = 1
    @nyt["quality italian"] = 1
    @nyt["randazzo's clam bar"] = 1
    @nyt["randazzos clam bar"] = 1
    @nyt["rayuela"] = 1
    @nyt["redeye grill"] = 1
    @nyt["reynard"] = 1
    @nyt["robertos"] = 1
    @nyt["roberto's"] = 1
    @nyt["roc restaurant"] = 1
    @nyt["rosemary's"] = 1
    @nyt["rosemarys"] = 1
    @nyt["rouge tomate"] = 1
    @nyt["royal seafood restaurant"] = 1
    @nyt["rye"] = 1
    @nyt["sasabune"] = 1
    @nyt["savore"] = 1
    @nyt["saxon & parole"] = 1
    @nyt["saxon and parole"] = 1
    @nyt["scalini fedeli"] = 1
    @nyt["sd26"] = 1
    @nyt["second avenue deli"] = 1
    @nyt["shake shack"] = 1
    @nyt["sip sak"] = 1
    @nyt["socarrat paella bar"] = 1
    @nyt["somtum der"] = 1
    @nyt["sparks steak house"] = 1
    @nyt["spice market"] = 1
    @nyt["st. anselm"] = 1
    @nyt["st anselm"] = 1
    @nyt["saint anselm"] = 1
    @nyt["stanton social"] = 1
    @nyt["suenos"] = 1
    @nyt["sueños"] = 1
    @nyt["sushi azabu"] = 1
    @nyt["takashi"] = 1
    @nyt["talde"] = 1
    @nyt["tanoreen"] = 1
    @nyt["taqueria tlaxcalli"] = 1
    @nyt["tenpenny"] = 1
    @nyt["teodora"] = 1
    @nyt["terroir"] = 1
    @nyt["the breslin bar and dining room"] = 1
    @nyt["breslin bar and dining room"] = 1
    @nyt["the breslin bar & dining room"] = 1
    @nyt["breslin bar & dining room"] = 1
    @nyt["the fat radish"] = 1
    @nyt["fat radish"] = 1
    @nyt["the grocery"] = 1
    @nyt["the hurricane club"] = 1
    @nyt["grocery"] = 1
    @nyt["hurricane club"] = 1
    @nyt["the lambs club"] = 1
    @nyt["lambs club"] = 1
    @nyt["the lion"] = 1
    @nyt["lion"] = 1
    @nyt["the marrow"] = 1
    @nyt["marrow"] = 1
    @nyt["the national bar and dining rooms"] = 1
    @nyt["national bar and dining rooms"] = 1
    @nyt["the national bar & dining rooms"] = 1
    @nyt["national bar & dining rooms"] = 1
    @nyt["the pines"] = 1
    @nyt["pines"] = 1
    @nyt["the redhead"] = 1
    @nyt["redhead"] = 1
    @nyt["the russian tea room"] = 1
    @nyt["russian tea room"] = 1
    @nyt["the spotted pig"] = 1
    @nyt["spotted pig"] = 1
    @nyt["the standard grill"] = 1
    @nyt["standard grill"] = 1
    @nyt["the waverly inn"] = 1
    @nyt["waverly inn"] = 1
    @nyt["toloache"] = 1
    @nyt["trattoria dell'arte"] = 1
    @nyt["trestle on tenth"] = 1
    @nyt["tulsi"] = 1
    @nyt["txikito"] = 1
    @nyt["ushiwakamaru"] = 1
    @nyt["vic and anthony's steakhouse"] = 1
    @nyt["vic and anthonys steakhouse"] = 1
    @nyt["victor's cafe"] = 1
    @nyt["victors cafe"] = 1
    @nyt["wall & water"] = 1
    @nyt["whiskey soda lounge"] = 1
    @nyt["whiskey soda lounge ny"] = 1
    @nyt["whiskey soda lounge new york"] = 1
    @nyt["whiskey soda lounge new york city"] = 1
    @nyt["yunnan kitchen"] = 1


    #NYT 2 stars
    @nyt["10 downing"] = 2
    @nyt["ten downing"] = 2
    @nyt["15 east"] = 2
    @nyt["fifteen east"] = 2
    @nyt["abboccato"] = 2
    @nyt["abc cocina"] = 2
    @nyt["abc kitchen"] = 2
    @nyt["acme"] = 2
    @nyt["aldea"] = 2
    @nyt["alder"] = 2
    @nyt["al di la"] = 2
    @nyt["amma"] = 2
    @nyt["annisa"] = 2
    @nyt["aquagrill"] = 2
    @nyt["aquavit"] = 2
    @nyt["arlington club"] = 2
    @nyt["armani ristorante fifth avenue"] = 2
    @nyt["armani ristorante 5th avenue"] = 2
    @nyt["armani ristorante"] = 2
    @nyt["artisanal"] = 2
    @nyt["aska"] = 2
    @nyt["august"] = 2
    @nyt["a voce"] = 2
    @nyt["a vice madison"] = 2
    @nyt["a voce columbus"] = 2
    @nyt["back forty west"] = 2
    @nyt["balthazar"] = 2
    @nyt["bar americain"] = 2
    @nyt["bar boulud"] = 2
    @nyt["becco"] = 2
    @nyt["bice"] = 2
    @nyt["blanca"] = 2
    @nyt["blt steak"] = 2
    @nyt["blue fin"] = 2
    @nyt["blue ribbon sushi"] = 2
    @nyt["blue ribbon sushi bar and grill"] = 2
    @nyt["blue ribbon sushi bar & grill"] = 2
    @nyt["bond street"] = 2
    @nyt["bond st"] = 2
    @nyt["boqueria"] = 2
    @nyt["boulud sud"] = 2
    @nyt["brasserie"] = 2
    @nyt["bread tribeca"] = 2
    @nyt["brushstroke"] = 2
    @nyt["buddakan"] = 2
    @nyt["buddakan new york"] = 2
    @nyt["cafe sabarsky"] = 2
    @nyt["cafe centro"] = 2
    @nyt["cafe china"] = 2
    @nyt["cafe d'alsace"] = 2
    @nyt["cafe dalsace"] = 2
    @nyt["casa lever"] = 2
    @nyt["casa mono"] = 2
    @nyt["caviar russe"] = 2
    @nyt["cesca"] = 2
    @nyt["'cesca"] = 2
    @nyt["cho dang gol"] = 2
    @nyt["chola"] = 2
    @nyt["churrascaria plataforma"] = 2
    @nyt["circus"] = 2
    @nyt["city hall"] = 2
    @nyt["cookshop"] = 2
    @nyt["costata"] = 2
    @nyt["da umberto"] = 2
    @nyt["david burke townhouse"] = 2
    @nyt["db bistro moderne"] = 2
    @nyt["dbgb kitchen and bar"] = 2
    @nyt["dbgb kitchen & bar"] = 2
    @nyt["devi"] = 2
    @nyt["degustation"] = 2
    @nyt["degustation wine and tasting bar"] = 2
    @nyt["degustation wine & tasting bar"] = 2
    @nyt["dirt candy"] = 2
    @nyt["docks oyster bar and seafood grill"] = 2
    @nyt["docks oyster bar & seafood grill"] = 2
    @nyt["donguri"] = 2
    @nyt["dressler"] = 2
    @nyt["eight mile creek"] = 2
    @nyt["8 mile creek"] = 2
    @nyt["empellon cocina"] = 2
    @nyt["estela"] = 2
    @nyt["estiatorio milos"] = 2
    @nyt["fatty crab"] = 2
    @nyt["fatty cue"] = 2
    @nyt["fatty 'cue"] = 2
    @nyt["firebird"] = 2
    @nyt["four seasons"] = 2
    @nyt["franny's"] = 2
    @nyt["frannys"] = 2
    @nyt["fresco"] = 2
    @nyt["fresco by scotto restaurant"] = 2
    @nyt["gabriels bar and restaurant"] = 2
    @nyt["gabriel's bar and restaurant"] = 2
    @nyt["gabriels bar & restaurant"] = 2
    @nyt["gabriel's bar & restaurant"] = 2
    @nyt["gari"] = 2
    @nyt["sushi of gari"] = 2
    @nyt["gordon ramsay at the london"] = 2
    @nyt["gordon ramsay"] = 2
    @nyt["great ny noodle town"] = 2
    @nyt["great n.y. noodle town"] = 2
    @nyt["gwynnett st"] = 2
    @nyt["gwynnett st."] = 2
    @nyt["gwynnett street"] = 2
    @nyt["hangawi"] = 2
    @nyt["hanjan"] = 2
    @nyt["hatsuhana"] = 2
    @nyt["heartbeat"] = 2
    @nyt["hearth"] = 2
    @nyt["hill country barbecue market"] = 2
    @nyt["i coppi"] = 2
    @nyt["il gattopardo"] = 2
    @nyt["il mulino"] = 2
    @nyt["i trulli"] = 2
    @nyt["jeepney"] = 2
    @nyt["joe's shanghai"] = 2
    @nyt["joes shanghai"] = 2
    @nyt["jungsik"] = 2
    @nyt["junoon"] = 2
    @nyt["kajitsu"] = 2
    @nyt["kang suh"] = 2
    @nyt["kang suh restaurant"] = 2
    @nyt["keens"] = 2
    @nyt["keens steakhouse"] = 2
    @nyt["kin shop"] = 2
    @nyt["kittichai"] = 2
    @nyt["krescendo"] = 2
    @nyt["la fonda del sol"] = 2
    @nyt["lake pavilion"] = 2
    @nyt["la promenade des anglais"] = 2
    @nyt["la vara"] = 2
    @nyt["le colonial"] = 2
    @nyt["le perigord"] = 2
    @nyt["le restaurant"] = 2
    @nyt["les halles"] = 2
    @nyt["lincoln"] = 2
    @nyt["lincoln ristorante"] = 2
    @nyt["locanda verde"] = 2
    @nyt["ma peche"] = 2
    @nyt["momofuku ma peche"] = 2
    @nyt["maialino"] = 2
    @nyt["marc forgione"] = 2
    @nyt["marcos"] = 2
    @nyt["marco's"] = 2
    @nyt["market table"] = 2
    @nyt["marseille"] = 2
    @nyt["mas"] = 2
    @nyt["mas la grillade"] = 2
    @nyt["mas (la grillade)"] = 2
    @nyt["maya"] = 2
    @nyt["maysville"] = 2
    @nyt["megu"] = 2
    @nyt["michael jordans steak house nyc"] = 2
    @nyt["michael jordans steak house"] = 2
    @nyt["michael jordan's steak house nyc"] = 2
    @nyt["michael jordan's steak house"] = 2
    @nyt["mighty quinns barbeque"] = 2
    @nyt["mighty quinn's barbeque"] = 2
    @nyt["mighty quinns"] = 2
    @nyt["mighty quinn's"] = 2
    @nyt["millesime"] = 2
    @nyt["mission chinese food"] = 2
    @nyt["molyvos"] = 2
    @nyt["monkey bar"] = 2
    @nyt["montmartre"] = 2
    @nyt["morgan dining room"] = 2
    @nyt["moti mahal delux"] = 2
    @nyt["m wells dinette"] = 2
    @nyt["m. wells dinette"] = 2
    @nyt["nadaman hakubai"] = 2
    @nyt["neta"] = 2
    @nyt["nice matin"] = 2
    @nyt["nick and tonis cafe"] = 2
    @nyt["nick and toni's cafe"] = 2
    @nyt["nick and tonis"] = 2
    @nyt["nick and toni's"] = 2
    @nyt["north end grill"] = 2
    @nyt["nougatine"] = 2
    @nyt["nougatine at jean georges"] = 2
    @nyt["nougatine jean georges"] = 2
    @nyt["novita"] = 2
    @nyt["oceana"] = 2
    @nyt["oriental garden"] = 2
    @nyt["orsay"] = 2
    @nyt["orso"] = 2
    @nyt["otto"] = 2
    @nyt["otto enoteca pizzeria"] = 2
    @nyt["otto enoteca"] = 2
    @nyt["Ouset"] = 2
    @nyt["Pampano"] = 2
    @nyt["paola's"] = 2
    @nyt["paolas"] = 2
    @nyt["parm"] = 2
    @nyt["pearl and ash"] = 2
    @nyt["pearl & ash"] = 2
    @nyt["perbacco"] = 2
    @nyt["periyali"] = 2
    @nyt["perla"] = 2
    @nyt["peter luger"] = 2
    @nyt["peter luger steak house"] = 2
    @nyt["petrossian"] = 2
    @nyt["pig and khao"] = 2
    @nyt["pig & khao"] = 2
    @nyt["ping's chinese restaurant"] = 2
    @nyt["pings chinese restaurant"] = 2
    @nyt["ping's seafood"] = 2
    @nyt["pings seafood"] = 2
    @nyt["piora"] = 2
    @nyt["pok pok ny"] = 2
    @nyt["pok pok"] = 2
    @nyt["prime meats"] = 2
    @nyt["recette"] = 2
    @nyt["redfarm"] = 2
    @nyt["red farm"] = 2
    @nyt["red rooster harlem"] = 2
    @nyt["resto"] = 2
    @nyt["river cafe"] = 2
    @nyt["the river cafe"] = 2
    @nyt["riverpark"] = 2
    @nyt["roberta's"] = 2
    @nyt["robertas"] = 2
    @nyt["rosanjin"] = 2
    @nyt["rouge et blanc"] = 2
    @nyt["salaam bombay indian cuisine"] = 2
    @nyt["salaam bombay"] = 2
    @nyt["salinas"] = 2
    @nyt["sea grill"] = 2
    @nyt["seasonal"] = 2
    @nyt["sfoglia"] = 2
    @nyt["shun lee palace"] = 2
    @nyt["smith & wollensky steak house"] = 2
    @nyt["smith and wollensky steak house"] = 2
    @nyt["solera"] = 2
    @nyt["soto"] = 2
    @nyt["spicy and tasty"] = 2
    @nyt["spicy & tasty"] = 2
    @nyt["spigolo"] = 2
    @nyt["sripraphai"] = 2
    @nyt["stone park cafe"] = 2
    @nyt["strip house"] = 2
    @nyt["sushi dojo"] = 2
    @nyt["sushi seki"] = 2
    @nyt["szechuan gourmet"] = 2
    @nyt["taboon"] = 2
    @nyt["tamarind"] = 2
    @nyt["tamarind tribeca"] = 2
    @nyt["tang pavilion"] = 2
    @nyt["telepan"] = 2
    @nyt["tertulia"] = 2
    @nyt["thalia"] = 2
    @nyt["the dutch"] = 2
    @nyt["the elm"] = 2
    @nyt["the harrison"] = 2
    @nyt["the john dory oyster bar"] = 2
    @nyt["the leopard at des artistes"] = 2
    @nyt["the little owl"] = 2
    @nyt["the loeb central park boathouse"] = 2
    @nyt["the mark restaurant by jean georges"] = 2
    @nyt["the mark restaurant by jean-georges"] = 2
    @nyt["the mark restaurant"] = 2
    @nyt["the red cat"] = 2
    @nyt["the water club"] = 2
    @nyt["thirty acres"] = 2
    @nyt["tocqueville"] = 2
    @nyt["toro"] = 2
    @nyt["torrisi italian specialties"] = 2
    @nyt["triomphe"] = 2
    @nyt["uncle boons"] = 2
    @nyt["uncle boon's"] = 2
    @nyt["union square cafe"] = 2
    @nyt["upstairs at 21"] = 2
    @nyt["upstairs at '21'"] = 2
    @nyt["wallse"] = 2
    @nyt["wolfgang's steakhouse"] = 2
    @nyt["wolfgangs steakhouse"] = 2
    @nyt["wong"] = 2











    #NYT 3 stars

    @nyt["a voce columbus"] = 3
    @nyt["a voce madison"] = 3
    @nyt["a voce"] = 3
    @nyt["ai fiori"] = 3
    @nyt["atera"] = 3
    @nyt["babbo"] = 3
    @nyt["the bar room at the modern"] = 3
    @nyt["bar room at the modern"] = 3
    @nyt["bar room at modern"] = 3
    @nyt["betony"] = 3
    @nyt["blt fish"] = 3
    @nyt["blue hill"] = 3
    @nyt["bouley"] = 3
    @nyt["brushstroke"] = 3
    @nyt["cafe boulud"] = 3
    @nyt["carbone"] = 3
    @nyt["chef's table at brooklyn fare"] = 3
    @nyt["chefs table at brooklyn fare"] = 3
    @nyt["brooklyn fare"] = 3
    @nyt["colicchio and sons"] = 3
    @nyt["colicchio & sons"] = 3
    @nyt["craft"] = 3
    @nyt["daniel"] = 3
    @nyt["the dining room at the modern"] = 3
    @nyt["dinning room at the modern"] = 3
    @nyt["dovetail"] = 3
    @nyt["esca"] = 3
    @nyt["felidia"] = 3
    @nyt["gotham bar and grill"] = 3
    @nyt["gotham bar & grill"] = 3
    @nyt["gramercy tavern"] = 3
    @nyt["ichimura at brushstroke"] = 3
    @nyt["ichimura brushstroke"] = 3
    @nyt["il buco alimentari & vineria"] = 3
    @nyt["il buco alimentari and vineria"] = 3
    @nyt["kyo ya"] = 3
    @nyt["la grenouille"] = 3
    @nyt["marea"] = 3
    @nyt["masa"] = 3
    @nyt["minetta tavern"] = 3
    @nyt["the modern"] = 3
    @nyt["modern"] = 3
    @nyt["momofuku ko"] = 3
    @nyt["momofuku ssam bar"] = 3
    @nyt["momofuku ssam"] = 3
    @nyt["nobu 57"] = 3
    @nyt["nobu"] = 3
    @nyt["nomad"] = 3
    @nyt["the nomad"] = 3
    @nyt["perry st."] = 3
    @nyt["perry street"] = 3
    @nyt["perry st"] = 3
    @nyt["picholine"] = 3
    @nyt["scarpetta"] = 3
    @nyt["sushi yasuda"] = 3
    @nyt["veritas"] = 3
    @nyt["wd-50"] = 3
    @nyt["wd 50"] = 3
    @nyt["wd~50"] = 3


    #NYT 4 stars
    
    @nyt["del posto"] = 4
    @nyt["delposto"] = 4
    @nyt["eleven madison park"] = 4
    @nyt["jean georges"] = 4
    @nyt["jean-georges"] = 4
    @nyt["le bernardin"] = 4
    @nyt["per se"] = 4
    @nyt["sushi nakazawa"] = 4


    #Average tally

 if @michelin[@restaurant_name_pre_gsub] == 1
   @michelin_rating = 90
 elsif @michelin[@restaurant_name_pre_gsub] == 2
   @michelin_rating = 95
 elsif @michelin[@restaurant_name_pre_gsub] == 3
   @michelin_rating = 100
 else
 @michelin_rating = nil
 end


if @nyt[@restaurant_name_pre_gsub] == 1
@nyt_rating = 85
elsif @nyt[@restaurant_name_pre_gsub] == 2
@nyt_rating = 90
elsif @nyt[@restaurant_name_pre_gsub] == 3
@nyt_rating = 95
elsif @nyt[@restaurant_name_pre_gsub] == 4
@nyt_rating = 100
else
@nyt_rating = nil
end



  end

  def search


    

    @restaurants = Restaurant.all
    @dishes = Dish.all

  	
    @restaurant_name_map = params[:name].gsub(" ","+")
  	@restaurant_name_pre_gsub = params[:name].downcase
  	@restaurant_name = params[:name].gsub(" ","%20")
  	url = "http://api.yelp.com/business_review_search?term=#{@restaurant_name}&location=New%20York&ywsid=qWgJko1K1_GbLzg4ir5HTw"
    response = HTTParty.get(url)
    @restaurant_hash = JSON(response.body)

    @yelp_rating = @restaurant_hash["businesses"][0]["avg_rating"] * 20
   #Michelin Stars:

    @michelin = {}
  	
    @michelin["ai fiori"] = 1
    @michelin["aldea"] = 1
    @michelin["annisa"] = 1
    @michelin["aquavit"] = 1
    @michelin["aska"] = 1
    @michelin["aureole"] = 1
    @michelin["a voce columbus"] = 1
    @michelin["a voce madison"] = 1
    @michelin["a voce"] = 1
    @michelin["babbo"] = 1
    @michelin["blanca"] = 1
    @michelin["blue hill"] = 1
    @michelin["bouley"] = 1
    @michelin["breslin"] = 1
    @michelin["the breslin"] = 1
    @michelin["brushstroke"] = 1
    @michelin["cafe boulud"] = 1
    @michelin["cafe china"] = 1
    @michelin["carbone"] = 1
    @michelin["casa mono"] = 1
    @michelin["caviar russe"] = 1
    @michelin["danji"] = 1
    @michelin["danny brown wine bar & kitchen"] = 1
    @michelin["danny brown wine bar and kitchen"] = 1
    @michelin["del posto"] = 1
    @michelin["dovetail"] = 1
    @michelin["15 east"] = 1
    @michelin["fifteen east"] = 1
    @michelin["gotham bar and grill"] = 1
    @michelin["gramercy tavern"] = 1
    @michelin["hakkasan"] = 1
    @michelin["ichimura"] = 1
    @michelin["jewel bako"] = 1
    @michelin["junoon"] = 1
    @michelin["kajitsu"] = 1
    @michelin["kyo ya"] = 1
    @michelin["lan sheng"] = 1
    @michelin["le restaurant"] = 1
    @michelin["lincoln"] = 1
    @michelin["minetta tavern"] = 1
    @michelin["modern"] = 1
    @michelin["the modern"] = 1
    @michelin["musket room"] = 1
    @michelin["the musket room"] = 1
    @michelin["nomad"] = 1
    @michelin["the nomad"] = 1
    @michelin["oceana"] = 1
    @michelin["peter luger"] = 1
    @michelin["peter luger steak house"] = 1
    @michelin["public"] = 1
    @michelin["rosanjin"] = 1
    @michelin["rouge tomate"] = 1
    @michelin["seasonal"] = 1
    @michelin["spotted pig"] = 1
    @michelin["sushi azabu"] = 1
    @michelin["sushi of gari"] = 1
    @michelin["tamarind tribeca"] = 1
    @michelin["tamarind"] = 1
    @michelin["telepan"] = 1
    @michelin["tori shin"] = 1
    @michelin["torrisi italian specialties"] = 1
    @michelin["tulsi"] = 1
    @michelin["wallse"] = 1
    @michelin["wd 50"] = 1
    @michelin["wd-50"] = 1
    @michelin["wd~50"] = 1

    #2 michelin stars
    @michelin["atera"] = 2
    @michelin["jungsik"] = 2
    @michelin["marea"] = 2
    @michelin["momofuku ko"] = 2
    @michelin["soto"] = 2

    #3 michelin stars
    @michelin["chef's table at brooklyn fare"] = 3
    @michelin["chefs table at brooklyn fare"] = 3
    @michelin["brooklyn fare"] = 3
    @michelin["daniel"] = 3
    @michelin["eleven madison park"] = 3
    @michelin["jean georges"] = 3
    @michelin["jean-georges"] = 3
    @michelin["le bernardin"] = 3
    @michelin["masa"] = 3
    @michelin["per se"] = 3


    #New York Times
    @nyt = {}

    #NYT 1 star

    @nyt["456 Shanghai Cuisine"] = 1
    @nyt["5 ninth"] = 1
    @nyt["aburiya kinnosuke"] = 1
    @nyt["agave"] = 1
    @nyt["alison eighteen"] = 1
    @nyt["almayass"] = 1
    @nyt["anella"] = 1
    @nyt["arabelle"] = 1
    @nyt["asiate"] = 1
    @nyt["atlantic grill"] = 1
    @nyt["aureole"] = 1
    @nyt["avra"] = 1
    @nyt["azalea"] = 1
    @nyt["balaboosta"] = 1
    @nyt["barbes"] = 1
    @nyt["barbounia"] = 1
    @nyt["barbuto"] = 1
    @nyt["benoit"] = 1
    @nyt["biang"] = 1
    @nyt["biang!"] = 1
    @nyt["blaue gans"] = 1
    @nyt["blue smoke"] = 1
    @nyt["blue water grill"] = 1
    @nyt["bobby van's steakhouse"] = 1
    @nyt["bobby vans steakhouse"] = 1
    @nyt["bobo"] = 1
    @nyt["brasserie 8 1/2"] = 1
    @nyt["butter"] = 1
    @nyt["buttermilk channel"] = 1
    @nyt["cafe cluny"] = 1
    @nyt["cafe luxembourg"] = 1
    @nyt["cafe un deux trois"] = 1
    @nyt["calle ocho"] = 1
    @nyt["calliope"] = 1
    @nyt["candle 79"] = 1
    @nyt["caravaggio"] = 1
    @nyt["carlyle restaurant"] = 1
    @nyt["casa la femme"] = 1
    @nyt["centrico"] = 1
    @nyt["charlie bird"] = 1
    @nyt["chez sardine"] = 1
    @nyt["china grill"] = 1
    @nyt["chin chin"] = 1
    @nyt["cipriani downtown"] = 1
    @nyt["co"] = 1
    @nyt["co."] = 1
    @nyt["colonie"] = 1
    @nyt["commerce"] = 1
    @nyt["convivium osteria"] = 1
    @nyt["coppelia"] = 1
    @nyt["crema"] = 1
    @nyt["crown"] = 1
    @nyt["danji"] = 1
    @nyt["da silvano"] = 1
    @nyt["dawat"] = 1
    @nyt["delicatessen"] = 1
    @nyt["delmonico's"] = 1
    @nyt["delmonicos"] = 1
    @nyt["desmond's"] = 1
    @nyt["desmonds"] = 1
    @nyt["dim sum go go"] = 1
    @nyt["dos caminos"] = 1
    @nyt["duane park"] = 1
    @nyt["ed's chowder house"] = 1
    @nyt["eds chowder house"] = 1
    @nyt["el toro blanco"] = 1
    @nyt["empellon taqueria"] = 1
    @nyt["en japanese brasserie"] = 1
    @nyt["fatty cue"] = 1
    @nyt["fatty 'cue"] = 1
    @nyt["fishtail by david burke"] = 1
    @nyt["fishtail"] = 1
    @nyt["flex mussels"] = 1
    @nyt["freds at barneys ny"] = 1
    @nyt["fred's at barneys ny"] = 1
    @nyt["freds at barneys new york"] = 1
    @nyt["fred's at barneys new york"] = 1
    @nyt["gastroarte"] = 1
    @nyt["gemma"] = 1
    @nyt["gigino"] = 1
    @nyt["gottino"] = 1
    @nyt["hakkasan new york"] = 1
    @nyt["hakkasan"] = 1
    @nyt["harry's cafe and steak"] = 1
    @nyt["harrys cafe and steak"] = 1
    @nyt["harry's cafe & steak"] = 1
    @nyt["harrys cafe & steak"] = 1
    @nyt["hospoda"] = 1
    @nyt["hunan kitchen of grand sichuan"] = 1
    @nyt["ici"] = 1
    @nyt["il cantinori"] = 1
    @nyt["il giglio"] = 1
    @nyt["ilili"] = 1
    @nyt["indochine"] = 1
    @nyt["ippudo"] = 1
    @nyt["isa"] = 1
    @nyt["james"] = 1
    @nyt["jewel bako"] = 1
    @nyt["kanoyama"] = 1
    @nyt["katz's"] = 1
    @nyt["katzs"] = 1
    @nyt["katz's delicatessen"] = 1
    @nyt["katzs delicatessen"] = 1
    @nyt["kefi"] = 1
    @nyt["khe yo"] = 1
    @nyt["khe-yo"] = 1
    @nyt["kurumazushi"] = 1
    @nyt["kutsher's tribeca"] = 1
    @nyt["la boite en boise"] = 1
    @nyt["l'absinthe"] = 1
    @nyt["l absinthe"] = 1
    @nyt["la esquina"] = 1
    @nyt["lafayette"] = 1
    @nyt["lakruwana"] = 1
    @nyt["la masseria"] = 1
    @nyt["landmarc"] = 1
    @nyt["l'artusi"] = 1
    @nyt["l artusi"] = 1
    @nyt["la silhouette"] = 1
    @nyt["la sirene"] = 1
    @nyt["le cirque"] = 1
    @nyt["le relais de venise l'entrecote"] = 1
    @nyt["le relais de venise l entrecote"] = 1
    @nyt["les halles downtown"] = 1
    @nyt["louro"] = 1
    @nyt["l'apicio"] = 1
    @nyt["lumi"] = 1
    @nyt["lupa"] = 1
    @nyt["lure fishbar"] = 1
    @nyt["macao trading company"] = 1
    @nyt["madangsui"] = 1
    @nyt["maloney & porcelli"] = 1
    @nyt["maloney and porcelli"] = 1
    @nyt["manzanilla"] = 1
    @nyt["markjoseph steakhouse"] = 1
    @nyt["moim"] = 1
    @nyt["morandi"] = 1
    @nyt["morimoto"] = 1
    @nyt["motorino"] = 1
    @nyt["mp taverna astoria"] = 1
    @nyt["mr. k's"] = 1
    @nyt["mr k's"] = 1
    @nyt["mr. ks"] = 1
    @nyt["mr ks"] = 1
    @nyt["miko"] = 1
    @nyt["ocean grill"] = 1
    @nyt["olives new york"] = 1
    @nyt["olives"] = 1
    @nyt["onieal's soho"] = 1
    @nyt["onieals soho"] = 1
    @nyt["osteria del circo"] = 1
    @nyt["osteria morini"] = 1
    @nyt["palm"] = 1
    @nyt["palm too"] = 1
    @nyt["pastis"] = 1
    @nyt["patroon"] = 1
    @nyt["peasant"] = 1
    @nyt["peels"] = 1
    @nyt["pera mediterranean brasserie"] = 1
    @nyt["perilla"] = 1
    @nyt["porter house new york"] = 1
    @nyt["porter house"] = 1
    @nyt["prune"] = 1
    @nyt["public"] = 1
    @nyt["pulino's bar and pizzeria"] = 1
    @nyt["pulino's bar & pizzeria"] = 1
    @nyt["pulinos bar and pizzeria"] = 1
    @nyt["pulinos bar & pizzeria"] = 1
    @nyt["purple yam"] = 1
    @nyt["pylos"] = 1
    @nyt["quality italian"] = 1
    @nyt["randazzo's clam bar"] = 1
    @nyt["randazzos clam bar"] = 1
    @nyt["rayuela"] = 1
    @nyt["redeye grill"] = 1
    @nyt["reynard"] = 1
    @nyt["robertos"] = 1
    @nyt["roberto's"] = 1
    @nyt["roc restaurant"] = 1
    @nyt["rosemary's"] = 1
    @nyt["rosemarys"] = 1
    @nyt["rouge tomate"] = 1
    @nyt["royal seafood restaurant"] = 1
    @nyt["rye"] = 1
    @nyt["sasabune"] = 1
    @nyt["savore"] = 1
    @nyt["saxon & parole"] = 1
    @nyt["saxon and parole"] = 1
    @nyt["scalini fedeli"] = 1
    @nyt["sd26"] = 1
    @nyt["second avenue deli"] = 1
    @nyt["shake shack"] = 1
    @nyt["sip sak"] = 1
    @nyt["socarrat paella bar"] = 1
    @nyt["somtum der"] = 1
    @nyt["sparks steak house"] = 1
    @nyt["spice market"] = 1
    @nyt["st. anselm"] = 1
    @nyt["st anselm"] = 1
    @nyt["saint anselm"] = 1
    @nyt["stanton social"] = 1
    @nyt["suenos"] = 1
    @nyt["sueños"] = 1
    @nyt["sushi azabu"] = 1
    @nyt["takashi"] = 1
    @nyt["talde"] = 1
    @nyt["tanoreen"] = 1
    @nyt["taqueria tlaxcalli"] = 1
    @nyt["tenpenny"] = 1
    @nyt["teodora"] = 1
    @nyt["terroir"] = 1
    @nyt["the breslin bar and dining room"] = 1
    @nyt["breslin bar and dining room"] = 1
    @nyt["the breslin bar & dining room"] = 1
    @nyt["breslin bar & dining room"] = 1
    @nyt["the fat radish"] = 1
    @nyt["fat radish"] = 1
    @nyt["the grocery"] = 1
    @nyt["the hurricane club"] = 1
    @nyt["grocery"] = 1
    @nyt["hurricane club"] = 1
    @nyt["the lambs club"] = 1
    @nyt["lambs club"] = 1
    @nyt["the lion"] = 1
    @nyt["lion"] = 1
    @nyt["the marrow"] = 1
    @nyt["marrow"] = 1
    @nyt["the national bar and dining rooms"] = 1
    @nyt["national bar and dining rooms"] = 1
    @nyt["the national bar & dining rooms"] = 1
    @nyt["national bar & dining rooms"] = 1
    @nyt["the pines"] = 1
    @nyt["pines"] = 1
    @nyt["the redhead"] = 1
    @nyt["redhead"] = 1
    @nyt["the russian tea room"] = 1
    @nyt["russian tea room"] = 1
    @nyt["the spotted pig"] = 1
    @nyt["spotted pig"] = 1
    @nyt["the standard grill"] = 1
    @nyt["standard grill"] = 1
    @nyt["the waverly inn"] = 1
    @nyt["waverly inn"] = 1
    @nyt["toloache"] = 1
    @nyt["trattoria dell'arte"] = 1
    @nyt["trestle on tenth"] = 1
    @nyt["tulsi"] = 1
    @nyt["txikito"] = 1
    @nyt["ushiwakamaru"] = 1
    @nyt["vic and anthony's steakhouse"] = 1
    @nyt["vic and anthonys steakhouse"] = 1
    @nyt["victor's cafe"] = 1
    @nyt["victors cafe"] = 1
    @nyt["wall & water"] = 1
    @nyt["whiskey soda lounge"] = 1
    @nyt["whiskey soda lounge ny"] = 1
    @nyt["whiskey soda lounge new york"] = 1
    @nyt["whiskey soda lounge new york city"] = 1
    @nyt["yunnan kitchen"] = 1


    #NYT 2 stars
    @nyt["10 downing"] = 2
    @nyt["ten downing"] = 2
    @nyt["15 east"] = 2
    @nyt["fifteen east"] = 2
    @nyt["abboccato"] = 2
    @nyt["abc cocina"] = 2
    @nyt["abc kitchen"] = 2
    @nyt["acme"] = 2
    @nyt["aldea"] = 2
    @nyt["alder"] = 2
    @nyt["al di la"] = 2
    @nyt["amma"] = 2
    @nyt["annisa"] = 2
    @nyt["aquagrill"] = 2
    @nyt["aquavit"] = 2
    @nyt["arlington club"] = 2
    @nyt["armani ristorante fifth avenue"] = 2
    @nyt["armani ristorante 5th avenue"] = 2
    @nyt["armani ristorante"] = 2
    @nyt["artisanal"] = 2
    @nyt["aska"] = 2
    @nyt["august"] = 2
    @nyt["a voce"] = 2
    @nyt["a vice madison"] = 2
    @nyt["a voce columbus"] = 2
    @nyt["back forty west"] = 2
    @nyt["balthazar"] = 2
    @nyt["bar americain"] = 2
    @nyt["bar boulud"] = 2
    @nyt["becco"] = 2
    @nyt["bice"] = 2
    @nyt["blanca"] = 2
    @nyt["blt steak"] = 2
    @nyt["blue fin"] = 2
    @nyt["blue ribbon sushi"] = 2
    @nyt["blue ribbon sushi bar and grill"] = 2
    @nyt["blue ribbon sushi bar & grill"] = 2
    @nyt["bond street"] = 2
    @nyt["bond st"] = 2
    @nyt["boqueria"] = 2
    @nyt["boulud sud"] = 2
    @nyt["brasserie"] = 2
    @nyt["bread tribeca"] = 2
    @nyt["brushstroke"] = 2
    @nyt["buddakan"] = 2
    @nyt["buddakan new york"] = 2
    @nyt["cafe sabarsky"] = 2
    @nyt["cafe centro"] = 2
    @nyt["cafe china"] = 2
    @nyt["cafe d'alsace"] = 2
    @nyt["cafe dalsace"] = 2
    @nyt["casa lever"] = 2
    @nyt["casa mono"] = 2
    @nyt["caviar russe"] = 2
    @nyt["cesca"] = 2
    @nyt["'cesca"] = 2
    @nyt["cho dang gol"] = 2
    @nyt["chola"] = 2
    @nyt["churrascaria plataforma"] = 2
    @nyt["circus"] = 2
    @nyt["city hall"] = 2
    @nyt["cookshop"] = 2
    @nyt["costata"] = 2
    @nyt["da umberto"] = 2
    @nyt["david burke townhouse"] = 2
    @nyt["db bistro moderne"] = 2
    @nyt["dbgb kitchen and bar"] = 2
    @nyt["dbgb kitchen & bar"] = 2
    @nyt["devi"] = 2
    @nyt["degustation"] = 2
    @nyt["degustation wine and tasting bar"] = 2
    @nyt["degustation wine & tasting bar"] = 2
    @nyt["dirt candy"] = 2
    @nyt["docks oyster bar and seafood grill"] = 2
    @nyt["docks oyster bar & seafood grill"] = 2
    @nyt["donguri"] = 2
    @nyt["dressler"] = 2
    @nyt["eight mile creek"] = 2
    @nyt["8 mile creek"] = 2
    @nyt["empellon cocina"] = 2
    @nyt["estela"] = 2
    @nyt["estiatorio milos"] = 2
    @nyt["fatty crab"] = 2
    @nyt["fatty cue"] = 2
    @nyt["fatty 'cue"] = 2
    @nyt["firebird"] = 2
    @nyt["four seasons"] = 2
    @nyt["franny's"] = 2
    @nyt["frannys"] = 2
    @nyt["fresco"] = 2
    @nyt["fresco by scotto restaurant"] = 2
    @nyt["gabriels bar and restaurant"] = 2
    @nyt["gabriel's bar and restaurant"] = 2
    @nyt["gabriels bar & restaurant"] = 2
    @nyt["gabriel's bar & restaurant"] = 2
    @nyt["gari"] = 2
    @nyt["sushi of gari"] = 2
    @nyt["gordon ramsay at the london"] = 2
    @nyt["gordon ramsay"] = 2
    @nyt["great ny noodle town"] = 2
    @nyt["great n.y. noodle town"] = 2
    @nyt["gwynnett st"] = 2
    @nyt["gwynnett st."] = 2
    @nyt["gwynnett street"] = 2
    @nyt["hangawi"] = 2
    @nyt["hanjan"] = 2
    @nyt["hatsuhana"] = 2
    @nyt["heartbeat"] = 2
    @nyt["hearth"] = 2
    @nyt["hill country barbecue market"] = 2
    @nyt["i coppi"] = 2
    @nyt["il gattopardo"] = 2
    @nyt["il mulino"] = 2
    @nyt["i trulli"] = 2
    @nyt["jeepney"] = 2
    @nyt["joe's shanghai"] = 2
    @nyt["joes shanghai"] = 2
    @nyt["jungsik"] = 2
    @nyt["junoon"] = 2
    @nyt["kajitsu"] = 2
    @nyt["kang suh"] = 2
    @nyt["kang suh restaurant"] = 2
    @nyt["keens"] = 2
    @nyt["keens steakhouse"] = 2
    @nyt["kin shop"] = 2
    @nyt["kittichai"] = 2
    @nyt["krescendo"] = 2
    @nyt["la fonda del sol"] = 2
    @nyt["lake pavilion"] = 2
    @nyt["la promenade des anglais"] = 2
    @nyt["la vara"] = 2
    @nyt["le colonial"] = 2
    @nyt["le perigord"] = 2
    @nyt["le restaurant"] = 2
    @nyt["les halles"] = 2
    @nyt["lincoln"] = 2
    @nyt["lincoln ristorante"] = 2
    @nyt["locanda verde"] = 2
    @nyt["ma peche"] = 2
    @nyt["momofuku ma peche"] = 2
    @nyt["maialino"] = 2
    @nyt["marc forgione"] = 2
    @nyt["marcos"] = 2
    @nyt["marco's"] = 2
    @nyt["market table"] = 2
    @nyt["marseille"] = 2
    @nyt["mas"] = 2
    @nyt["mas la grillade"] = 2
    @nyt["mas (la grillade)"] = 2
    @nyt["maya"] = 2
    @nyt["maysville"] = 2
    @nyt["megu"] = 2
    @nyt["michael jordans steak house nyc"] = 2
    @nyt["michael jordans steak house"] = 2
    @nyt["michael jordan's steak house nyc"] = 2
    @nyt["michael jordan's steak house"] = 2
    @nyt["mighty quinns barbeque"] = 2
    @nyt["mighty quinn's barbeque"] = 2
    @nyt["mighty quinns"] = 2
    @nyt["mighty quinn's"] = 2
    @nyt["millesime"] = 2
    @nyt["mission chinese food"] = 2
    @nyt["molyvos"] = 2
    @nyt["monkey bar"] = 2
    @nyt["montmartre"] = 2
    @nyt["morgan dining room"] = 2
    @nyt["moti mahal delux"] = 2
    @nyt["m wells dinette"] = 2
    @nyt["m. wells dinette"] = 2
    @nyt["nadaman hakubai"] = 2
    @nyt["neta"] = 2
    @nyt["nice matin"] = 2
    @nyt["nick and tonis cafe"] = 2
    @nyt["nick and toni's cafe"] = 2
    @nyt["nick and tonis"] = 2
    @nyt["nick and toni's"] = 2
    @nyt["north end grill"] = 2
    @nyt["nougatine"] = 2
    @nyt["nougatine at jean georges"] = 2
    @nyt["nougatine jean georges"] = 2
    @nyt["novita"] = 2
    @nyt["oceana"] = 2
    @nyt["oriental garden"] = 2
    @nyt["orsay"] = 2
    @nyt["orso"] = 2
    @nyt["otto"] = 2
    @nyt["otto enoteca pizzeria"] = 2
    @nyt["otto enoteca"] = 2
    @nyt["Ouset"] = 2
    @nyt["Pampano"] = 2
    @nyt["paola's"] = 2
    @nyt["paolas"] = 2
    @nyt["parm"] = 2
    @nyt["pearl and ash"] = 2
    @nyt["pearl & ash"] = 2
    @nyt["perbacco"] = 2
    @nyt["periyali"] = 2
    @nyt["perla"] = 2
    @nyt["peter luger"] = 2
    @nyt["peter luger steak house"] = 2
    @nyt["petrossian"] = 2
    @nyt["pig and khao"] = 2
    @nyt["pig & khao"] = 2
    @nyt["ping's chinese restaurant"] = 2
    @nyt["pings chinese restaurant"] = 2
    @nyt["ping's seafood"] = 2
    @nyt["pings seafood"] = 2
    @nyt["piora"] = 2
    @nyt["pok pok ny"] = 2
    @nyt["pok pok"] = 2
    @nyt["prime meats"] = 2
    @nyt["recette"] = 2
    @nyt["redfarm"] = 2
    @nyt["red farm"] = 2
    @nyt["red rooster harlem"] = 2
    @nyt["resto"] = 2
    @nyt["river cafe"] = 2
    @nyt["the river cafe"] = 2
    @nyt["riverpark"] = 2
    @nyt["roberta's"] = 2
    @nyt["robertas"] = 2
    @nyt["rosanjin"] = 2
    @nyt["rouge et blanc"] = 2
    @nyt["salaam bombay indian cuisine"] = 2
    @nyt["salaam bombay"] = 2
    @nyt["salinas"] = 2
    @nyt["sea grill"] = 2
    @nyt["seasonal"] = 2
    @nyt["sfoglia"] = 2
    @nyt["shun lee palace"] = 2
    @nyt["smith & wollensky steak house"] = 2
    @nyt["smith and wollensky steak house"] = 2
    @nyt["solera"] = 2
    @nyt["soto"] = 2
    @nyt["spicy and tasty"] = 2
    @nyt["spicy & tasty"] = 2
    @nyt["spigolo"] = 2
    @nyt["sripraphai"] = 2
    @nyt["stone park cafe"] = 2
    @nyt["strip house"] = 2
    @nyt["sushi dojo"] = 2
    @nyt["sushi seki"] = 2
    @nyt["szechuan gourmet"] = 2
    @nyt["taboon"] = 2
    @nyt["tamarind"] = 2
    @nyt["tamarind tribeca"] = 2
    @nyt["tang pavilion"] = 2
    @nyt["telepan"] = 2
    @nyt["tertulia"] = 2
    @nyt["thalia"] = 2
    @nyt["the dutch"] = 2
    @nyt["the elm"] = 2
    @nyt["the harrison"] = 2
    @nyt["the john dory oyster bar"] = 2
    @nyt["the leopard at des artistes"] = 2
    @nyt["the little owl"] = 2
    @nyt["the loeb central park boathouse"] = 2
    @nyt["the mark restaurant by jean georges"] = 2
    @nyt["the mark restaurant by jean-georges"] = 2
    @nyt["the mark restaurant"] = 2
    @nyt["the red cat"] = 2
    @nyt["the water club"] = 2
    @nyt["thirty acres"] = 2
    @nyt["tocqueville"] = 2
    @nyt["toro"] = 2
    @nyt["torrisi italian specialties"] = 2
    @nyt["triomphe"] = 2
    @nyt["uncle boons"] = 2
    @nyt["uncle boon's"] = 2
    @nyt["union square cafe"] = 2
    @nyt["upstairs at 21"] = 2
    @nyt["upstairs at '21'"] = 2
    @nyt["wallse"] = 2
    @nyt["wolfgang's steakhouse"] = 2
    @nyt["wolfgangs steakhouse"] = 2
    @nyt["wong"] = 2











    #NYT 3 stars

    @nyt["a voce columbus"] = 3
    @nyt["a voce madison"] = 3
    @nyt["a voce"] = 3
    @nyt["ai fiori"] = 3
    @nyt["atera"] = 3
    @nyt["babbo"] = 3
    @nyt["the bar room at the modern"] = 3
    @nyt["bar room at the modern"] = 3
    @nyt["bar room at modern"] = 3
    @nyt["betony"] = 3
    @nyt["blt fish"] = 3
    @nyt["blue hill"] = 3
    @nyt["bouley"] = 3
    @nyt["brushstroke"] = 3
    @nyt["cafe boulud"] = 3
    @nyt["carbone"] = 3
    @nyt["chef's table at brooklyn fare"] = 3
    @nyt["chefs table at brooklyn fare"] = 3
    @nyt["brooklyn fare"] = 3
    @nyt["colicchio and sons"] = 3
    @nyt["colicchio & sons"] = 3
    @nyt["craft"] = 3
    @nyt["daniel"] = 3
    @nyt["the dining room at the modern"] = 3
    @nyt["dinning room at the modern"] = 3
    @nyt["dovetail"] = 3
    @nyt["esca"] = 3
    @nyt["felidia"] = 3
    @nyt["gotham bar and grill"] = 3
    @nyt["gotham bar & grill"] = 3
    @nyt["gramercy tavern"] = 3
    @nyt["ichimura at brushstroke"] = 3
    @nyt["ichimura brushstroke"] = 3
    @nyt["il buco alimentari & vineria"] = 3
    @nyt["il buco alimentari and vineria"] = 3
    @nyt["kyo ya"] = 3
    @nyt["la grenouille"] = 3
    @nyt["marea"] = 3
    @nyt["masa"] = 3
    @nyt["minetta tavern"] = 3
    @nyt["the modern"] = 3
    @nyt["modern"] = 3
    @nyt["momofuku ko"] = 3
    @nyt["momofuku ssam bar"] = 3
    @nyt["momofuku ssam"] = 3
    @nyt["nobu 57"] = 3
    @nyt["nobu"] = 3
    @nyt["nomad"] = 3
    @nyt["the nomad"] = 3
    @nyt["perry st."] = 3
    @nyt["perry street"] = 3
    @nyt["perry st"] = 3
    @nyt["picholine"] = 3
    @nyt["scarpetta"] = 3
    @nyt["sushi yasuda"] = 3
    @nyt["veritas"] = 3
    @nyt["wd-50"] = 3
    @nyt["wd 50"] = 3
    @nyt["wd~50"] = 3


    #NYT 4 stars
    
    @nyt["del posto"] = 4
    @nyt["delposto"] = 4
    @nyt["eleven madison park"] = 4
    @nyt["jean georges"] = 4
    @nyt["jean-georges"] = 4
    @nyt["le bernardin"] = 4
    @nyt["per se"] = 4
    @nyt["sushi nakazawa"] = 4


 #Average tally

 if @michelin[@restaurant_name_pre_gsub] == 1
   @michelin_rating = 90
 elsif @michelin[@restaurant_name_pre_gsub] == 2
   @michelin_rating = 95
 elsif @michelin[@restaurant_name_pre_gsub] == 3
   @michelin_rating = 100
 else
 @michelin_rating = nil
 end


if @nyt[@restaurant_name_pre_gsub] == 1
@nyt_rating = 85
elsif @nyt[@restaurant_name_pre_gsub] == 2
@nyt_rating = 90
elsif @nyt[@restaurant_name_pre_gsub] == 3
@nyt_rating = 95
elsif @nyt[@restaurant_name_pre_gsub] == 4
@nyt_rating = 100
else
@nyt_rating = nil
end
    #How to use hash:
    #@restaurant_hash["businesses"][0]['rating_img_url']
    #@restaurant_hash["businesses"][0]["avg_rating"]

    #Yelp API Documentation:
    #http://www.yelp.com/developers/documentation/search_api
  end
  


end


