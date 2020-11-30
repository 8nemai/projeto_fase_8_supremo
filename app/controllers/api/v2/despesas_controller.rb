class Api::V2::DespesasController < ApplicationController
    
    before_action :authenticate_with_token!

	def index 


		despesas = current_user.despesas.ransack(params[:q]).result

		render json: despesas, status: 200


	end


	def show 


		despesa = current_user.despesas.find(params[:id])

		render json: despesa, status: 200

	end

	def create 


		despesa = current_user.despesas.build(despesa_params)

		if despesa.save 

			render json: despesa, status: 201

		else

			render json: { errors: despesa.errors }, status: 422

		end

	end


	def update

		despesa = current_user.despesas.find(params[:id])

		if despesa.update_attributes(despesa_params)

			render json: despesa, status: 200

		else 


			render json: { errors: despesa.errors}, status: 422

		end

	end

	def destroy 

		despesa = current_user.despesas.find(params[:id])

		despesa.destroy

		head 204

	end
	
	

	
	private 

	
	def despesa_params

		params.require(:despesa).permit(:description, :value, :date)

	end

    
    
end
