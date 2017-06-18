# ActiveAdmin.register Wage do
# 	permit_params :preparer_attributes, :amount
#
# 	filter :preparer, as: :select, collection: Preparer.all.map(&:first_name)
# 	filter :amount
# 	filter :created_at
#
# 	index do
#     column :id
#     # column "Preparer" do |wage|
#     #   link_to Preparer.find(wage.preparer_id), admin_preparer_path(wage.preparer_id)
#     # end
#     column :job_id
#     column "Amount" do |wage|
#     	number_to_currency(wage.amount)
#     end
#     column :created_at
#     actions
#   end
#
# 	show do
# 		attributes_table do
# 			row :job_id
# 			# row "Preparer" do
# 			# 	link_to "#{wage.preparer.first_name}  #{wage.preparer.last_name}", admin_preparer_path(wage.preparer)
# 			# end
# 			row "Amount" do
# 				number_to_currency(payment.amount)
# 			end
# 			row "Received On" do
# 				payment.created_at
# 			end
# 		end
# 	end
#
# 	form do |f|
#     f.semantic_errors *f.object.errors.keys
# 		f.inputs "Wage Info" do
# 			f.input :Amount
# 		end
# 		f.actions
# 	end
#
# end
