ActiveAdmin.register Wage do
	# permit_params :preparer_attributes, :amount, :preparer_id
	# menu priority: 5
	# filter :preparer, as: :select, collection: Preparer.all.map(&:first_name)
	# filter :amount
	# filter :created_at
  #
	# index do
  #   column :id
  #   column "Preparer" do |wage|
  #     link_to Preparer.find(wage.preparer_id).name , admin_preparer_path(wage.preparer_id)
  #   end
  #   column :amount do |wage|
  #   	number_to_currency(wage.amount)
  #   end
  #   column :created_at
  #   actions
  # end
  #
	# action_item only: [:show] do |job|
	# 	link_to "New Wage", new_admin_wage_path
	# end
  #
	# show do
	# 	attributes_table do
	# 		row "Preparer" do
	# 			link_to "#{wage.preparer.first_name}  #{wage.preparer.last_name}", admin_preparer_path(wage.preparer)
	# 		end
	# 		row :amount do
	# 			number_to_currency(wage.amount)
	# 		end
	# 		row "Paid On" do
	# 			wage.created_at
	# 		end
	# 	end
	# end
  #
	# form do |f|
  #   f.semantic_errors *f.object.errors.keys
	# 	f.inputs "Wage Info" do
	# 		f.input :amount
	# 	end
	# 	f.inputs "Preparer Info" do
	# 		f.input :preparer, as: :select, collection: Preparer.all.map {|prep| [prep.first_name, prep.id]}
	# 	end
	# 	f.actions
	# end

end
