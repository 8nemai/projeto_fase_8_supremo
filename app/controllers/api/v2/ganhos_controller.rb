class Api::V2::GanhosController < ApplicationController
    
    before_action :authenticate_with_token!

	def index 


		ganhos = current_user.ganhos.ransack(params[:q]).result

		render json: ganhos, status: 200


	end


	def show 


		ganho = current_user.ganhos.find(params[:id])

		render json: ganho, status: 200

	end

	def create 


		ganho = current_user.ganhos.build(ganho_params)

		if ganho.save 

			render json: ganho, status: 201

		else

			render json: { errors: ganho.errors }, status: 422

		end

	end


	def update

		ganho = current_user.ganhos.find(params[:id])

		if ganho.update_attributes(ganho_params)

			render json: ganho, status: 200

		else 


			render json: { errors: ganho.errors}, status: 422

		end

	end

	def destroy 

		ganho = current_user.ganhos.find(params[:id])

		ganho.destroy

		head 204

	end
	
	

	
	private 

	
	def ganho_params

		params.require(:ganho).permit(:description, :value, :date)

	end
		

    
    
end
