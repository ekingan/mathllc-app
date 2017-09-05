ActiveAdmin.register Job do
  permit_params :fed_form, :primary_state, :second_state, :third_state, :tmse, :portland, :status,
              :printed, :scanned, :uploaded, :filed, :ack_fed, :ack_primary_state,
              :ack_second_state, :ack_third_state, :due_date, :rejected, :job_type,
              :notes, :preparer, :client, :client_id, :preparer_id, :payment_id, preparer_attributes: [:first_name, :id],
              client_attributes: [:last_name, :id], payment_attributes: [:amount, :check_number, :payment_type]

  menu priority: 3

  scope "In Process", default: true do |job|
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

  batch_action :todo do |selection|
    Job.find(selection).each do |job|
      job.update_attribute(:status, :todo)
    end
    redirect_to admin_jobs_path, :notice => "Marked jobs todo"
  end

  batch_action :in_progress do |selection|
    Job.find(selection).each do |job|
      job.update_attribute(:status, :in_progress)
    end
    redirect_to admin_jobs_path, :notice => "Marked jobs in progress"
  end

  batch_action :need_info do |selection|
    Job.find(selection).each do |job|
      job.update_attribute(:status, :need_info)
    end
    redirect_to admin_jobs_path, :notice => "Marked jobs as needing info"
  end

  batch_action :need_signatures do |selection|
    Job.find(selection).each do |job|
      job.update_attribute(:status, :need_signatures)
    end
    redirect_to admin_jobs_path, :notice => "Marked jobs as needing signatures"
  end

  batch_action :upload do |selection|
    Job.find(selection).each do |job|
      job.update_attribute(:uploaded, true)
    end
    redirect_to admin_jobs_path, :notice => "Marked jobs as uploaded"
  end

  batch_action :scan do |selection|
    Job.find(selection).each do |job|
      job.update_attribute(:scanned, true)
    end
    redirect_to admin_jobs_path, :notice => "Marked jobs as scanned"
  end

  batch_action :print do |selection|
    Job.find(selection).each do |job|
      job.update_attribute(:printed, true)
    end
    redirect_to admin_jobs_path, :notice => "Marked jobs as printed"
  end

  batch_action :ready do |selection|
    Job.find(selection).each do |job|
      job.update_attribute(:status, :ready)
    end
    redirect_to admin_jobs_path, :notice => "Marked jobs as ready"
  end

  batch_action :file do |selection|
    Job.find(selection).each do |job|
      job.update_attribute(:filed, Time.now)
    end
    redirect_to admin_jobs_path, :notice => "Marked jobs as filed"
  end

  batch_action :finish do |selection|
    Job.find(selection).each do |job|
      job.update_attribute(:status, :done)
    end
    redirect_to admin_jobs_path, :notice => "Marked jobs as done"
  end

  index do
    selectable_column
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
    column "Filed" do |job|
      if job.filed
        status_tag "Yes"
      else
        status_tag "No"
      end
    end
		column "Paid", sortable: :paid do |job|
			status_tag job.payment ? "yes" : 'no'
		end
    actions
  end

  action_item only: [:show] do |job|
    link_to "New Job", new_admin_job_path
  end

  show :title do |job|
    job.to_param
  end

  show do
    columns do
      column do
        panel "Client and Preparer" do
          attributes_table_for job do
            row "Preparer" do
              "#{job.preparer.first_name}  #{job.preparer.last_name}"
            end
            row "Client" do
              "#{job.client.name}"
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
