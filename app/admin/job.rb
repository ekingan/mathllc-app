ActiveAdmin.register Job do
  permit_params :fed_form, :primary_state, :second_state, :third_state, :tmse, :portland, :status,
              :printed, :scanned, :uploaded, :filed, :ack_fed, :ack_primary_state,
              :ack_second_state, :ack_third_state, :due_date, :rejected,
              :notes, :preparer, :client, :client_id, :preparer_id, :payment_id, preparer_attributes: [:first_name, :id],
              client_attributes: [:last_name, :id], payment_attributes: [:amount, :check_number, :payment_type]

  menu priority: 3

  filter :client_last_name, as: :select, collection: Client.all.map{|c| c.last_name}.sort
  filter :client_id, as: :select, label: "Client ID"
  filter :status, as: :select
  filter :fed_form
  filter :ack_fed
  filter :ack_primary_state
  filter :due_date
  filter :rejected, as: :select

  index do
    column :id
    column "Client", sortable: :client_id do |job|
      c = Client.find(job.client_id)
      link_to [c.last_name, c.first_name].join(' '), admin_client_path(job.client_id)
    end
    column "Preparer", sortable: :preparer_id do |job|
      link_to Preparer.find(job.preparer_id).name, admin_preparer_path(job.preparer_id)
    end
    column :fed_form
    column :status, sortable: :status do |job|
      status_tag job.status
    end
    column :printed
    column :scanned
    column :uploaded
    column :filed
    column "Fed Accepted", :ack_fed
    column "State Accepted", :ack_primary_state
    column :rejected
		column "Paid", sortable: :paid do |job|
			status_tag job.payment ? "yes" : 'no'
		end
    actions
  end
  # overrides create of new client
  # action_item only: [:show] do |job|
  #   link_to "Receive Payment", new_admin_payment_path(job)
  # end

  show do
    attributes_table do
      row "Preparer" do
        "#{job.preparer.first_name}  #{job.preparer.last_name}"
      end
      row "Client" do
        "#{job.client.first_name}  #{job.client.last_name}"
      end
      row :status do |job|
        status_tag job.status
      end
      row :fed_form
      row :primary_state
      row :tmse
      row :portland
      row :due_date
      row :printed
      row :scanned
      row :uploaded
      row :filed
      row :ack_fed
      row :ack_primary_state
      row :ack_second_state
      row :ack_third_state
      row :rejected
      row "Payment" do
        number_to_currency(job.payment.amount) if job.payment
      end
      row :notes
    end
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Preparer" do
      f.input :preparer, as: :select, collection: Preparer.all.map {|prep| [prep.first_name, prep.id]}
    end
    f.inputs "Client" do
      f.input :client, as: :select, collection: Client.all.map {|c| [ "#{c.name}", c.id]}.sort
    end
    f.inputs "Status" do
      f.input :status
      f.input :printed
      f.input :scanned
      f.input :uploaded
      f.input :due_date, as: :datepicker
    end
    tabs do
      tab "Tax Return Info" do
        f.inputs "Job Info" do
          f.input :fed_form
          f.input :primary_state
          f.input :tmse
          f.input :portland
        end
        f.inputs "Acceptances" do
          f.input :filed, as: :datepicker
          f.input :ack_fed, as: :datepicker
          f.input :ack_primary_state, as: :datepicker
          f.input :ack_second_state, as: :datepicker
          f.input :ack_third_state, as: :datepicker
          f.input :rejected
        end
      end
      tab "Other Job Type" do
        f.inputs "Job Info" do
          f.input :type
        end
      end
    end

    f.inputs "Preparer Notes" do
      f.input :notes
    end
      f.actions
  end

  controller do
    def update
      super
    end
  end

end
