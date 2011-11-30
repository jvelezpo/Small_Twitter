class PagesController < ApplicationController
  
  def home
  	@title = "Home"
  end

  def contact
  	@title = "Contact"
  end

  def about
  	@title = "About"
  end
  
  def help
  	@title = "Help"
  end
  
  def musica
  	@title = "Musica"	
  end
  
  def news
  	@title = "News"
  	@hola = hola
  end
  
  def hola
  	"Jasinto jose"
  end
end