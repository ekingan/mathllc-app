ActiveAdmin.register Payment do
	belongs_to :job, optional: true
	permit_params :client_attributes, :job_attributes, :preparer_attributes, :job_id, :amount, :payment_type, :partial_payment, :check_number
	menu priority: 4

	action_item only: [:show] do |job|
		link_to "New Payment", new_admin_payment_path
	end

  actions :all, :except => [:edit]

	filter :preparer
	filter :job_id, as: :select
	filter :amount
	filter :created_at
	filter :payment_type, as: :select, collection: Payment.payment_types
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
		column "Job" do |payment|
			link_to Job.find(payment.job_id).id, admin_job_path(payment.job_id)
		end
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
			row "Job" do
			  link_to "#{payment.job_id}", admin_job_path(payment.job_id)
			end
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
      row :partial_payment
		end
	end

	form do |f|
    f.semantic_errors *f.object.errors.keys
		f.inputs "Payment Info" do
			f.input :job, as: :select, collection: Job.unpaid.order(id: :desc).map{ |job| ["#{job.client.last_name}-#{job.client.first_name}-$#{job.bill}", job.id] }
			f.input :amount
			f.input :payment_type
			f.input :check_number
      f.input :partial_payment
		end
		f.actions
	end

end
