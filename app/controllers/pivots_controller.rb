class PivotsController < ApplicationController
   before_filter :signed_in_user

   def create
	    @pivot = current_user.pivots.build(params[:pivot])
	    if @pivot.save
	      flash[:success] = "Pivot created!"
	      redirect_to current_user
	    else
	      render current_user
	    end
   end


   def destroy
   end

end
