ActiveAdmin.register Payment do
	belongs_to :job, optional: true
	permit_params :client_attributes, :job_attributes, :preparer_attributes, :job_id, :amount, :payment_type, :check_number

	filter :preparer
	filter :job_id, as: :select
	filter :amount
	filter :created_at
	filter :payment_type, as: :select
	filter :check_number

	index do
    column :id
    column "Client" do |payment|
      c = Client.find(payment.job.client_id)
      link_to [c.last_name, c.first_name].join(', '), admin_client_path(payment.job.client_id)
    end
    column "Preparer" do |payment|
      link_to Preparer.find(payment.job.preparer_id).first_name, admin_preparer_path(payment.job.preparer_id)
    end
    column :job_id
    column "Amount" do |payment|
    	number_to_currency(payment.amount)
    end
    column :payment_type
    column :check_number
    column :created_at
    actions
  end

	show do
		attributes_table do
			row :job_id
			row "Preparer" do
				link_to "#{payment.job.preparer.first_name}  #{payment.job.preparer.last_name}", admin_preparer_path(payment.job.preparer)
			end
			row "Client" do
				link_to "#{payment.job.client.first_name}  #{payment.job.client.last_name}", admin_client_path(payment.job.client)
			end
			row "Amount" do
				number_to_currency(payment.amount)
			end
			row "Received On" do
				payment.created_at
			end
			row :payment_type
			row :check_number
		end
	end

	form do |f|
    f.semantic_errors *f.object.errors.keys
		f.inputs "Payment Info" do
			f.input :job, member_label: Proc.new { |j| j.id }
			f.input :amount
			f.input :payment_type
			f.input :check_number
		end
		f.actions
	end

end
