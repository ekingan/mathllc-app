ActiveAdmin.register Job do
  permit_params :fed_form, :primary_state, :second_state, :third_state, :tmse, :portland, :status,
              :printed, :scanned, :uploaded, :filed, :ack_fed, :ack_primary_state,
              :ack_second_state, :ack_third_state, :due_date, :rejected, :job_type,
              :notes, :preparer, :client, :client_id, :preparer_id, :payment_id, preparer_attributes: [:first_name, :id],
              client_attributes: [:last_name, :id], payment_attributes: [:amount, :check_number, :payment_type]

  menu priority: 3

  scope "All Jobs Not Done" do |job|
    job.where.not(status: :done )
  end
  scope "Done Jobs" do |job|
    job.done
  end
  scope "Ready Jobs" do |job|
    job.ready
  end
  scope "Jobs Needing Attention" do |job|
    job.where(status: [:commited, :todo, :in_progress, :need_info, :need_signatures])
  end
  scope "Filed Jobs" do |job|
    job.filed
  end
  scope "All Jobs" do |job|
    Job.all
  end

  filter :preparer
  filter :client, collection: proc { Client.order(:last_name) }
  filter :status, as: :select, collection: Job.statuses
  filter :fed_form, as: :select, collection: Job.fed_forms
  filter :job_type, as: :select, collection: Job.job_types
  filter :ack_fed
  filter :ack_primary_state
  filter :due_date
  filter :rejected, as: :select

  index do
    column :id
    column :client
    column :preparer
    column "Job Type" do |job|
      job.fed_form || job.job_type
    end
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
    columns do
      column do
        panel "Client and Preparer" do
          attributes_table_for job do
            row "Preparer" do
              "#{job.preparer.first_name}  #{job.preparer.last_name}"
            end
            row "Client" do
              "#{job.client.first_name}  #{job.client.last_name}"
            end
            row "Payment" do
              number_to_currency(job.payment.amount) if job.payment
            end
            row :job_type
            row :due_date
          end
        end
        panel "Filing Details" do
          attributes_table_for job do
            row :filed
            row :ack_fed
            row :ack_primary_state
            row :ack_second_state
            row :ack_third_state
            row :rejected
          end
        end
      end
      column do
        panel "Status" do
          attributes_table_for job do
            row :status do |job|
              status_tag job.status
            end
            row :printed
            row :scanned
            row :uploaded
          end
        end
        panel "Forms" do
          attributes_table_for job do
            row :fed_form
            row :primary_state
            row :tmse
            row :portland
            row :second_state
            row :third_state
          end
        end
      end
    end

    attributes_table do
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
          f.input :job_type
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
