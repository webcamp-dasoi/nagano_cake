class SearchController < ApplicationController

	def search
		@model = params["search"]["model"]
		@content = params["search"]["content"]
		@how = params["search"]["how"]
		@datas = search_for(@how, @model, @content)
		if @model == 'end_user'
			render :end_users
		elsif @model == 'product'
			@products = Product.page(params[:page]).per(10)
			render :products
		end
	end

	def end_users
	end

	def products
	end

	private

	def match(model, content)
		if model == 'end_user'
			EndUser.where(last_name: content)
		elsif model == 'product'
			Product.where(name: content)
		end
	end

	def forward(model, content)
		if model == 'end_user'
			EndUser.where("last_name LIKE ?", "#{content}%")
		elsif model == 'product'
			Product.where("name LIKE ?", "#{content}%")
		end
	end

	def backward(model, content)
		if model == 'end_user'
			EndUser.where("last_name LIKE ?", "%#{content}")
		elsif model == 'product'
			Product.where("name LIKE ?", "%#{content}")
		end
	end

	def partical(model, content)
		if model == 'end_user'
			EndUser.where("last_name LIKE ?", "%#{content}%")
		elsif model == 'product'
			Product.where("name LIKE ?", "%#{content}%")
		end
	end

	def search_for(how, model, content)
		case how
			when 'match'
				match(model, content)
			when 'forward'
				forward(model, content)
			when 'backward'
				backward(model, content)
			when 'partical'
				partical(model, content)
		end
	end

end

