ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    jobs = Job.where(preparer_id: current_user.preparer.id).order(id: :desc)

    columns do
      column do
        panel "Jobs to follow up on" do
          ol do
            jobs.where(status: :need_info).map do |job|
              li link_to("#{job.client.name} - #{job.status}", admin_job_path(job))
            end
          end
        end
      end
      column do
        panel "Jobs Todo" do
          ol do
            jobs.where(status: :todo).reverse.map do |job|
              li link_to("#{job.client.name} - Recieved on #{job.updated_at.to_date.strftime("%m/%d/%Y")}", admin_job_path(job))
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Jobs needing signatures" do
          ol do
            jobs.where(status: :need_signatures).reverse.map do |job|
              li link_to("#{job.client.name} - #{job.status}", admin_job_path(job))
            end
          end
        end
      end
      column do
        panel "Jobs in progress" do
          ol do
            jobs.where(status: :in_progress).reverse.map do |job|
              li link_to("#{job.client.name} - Updated on #{job.updated_at.to_date.strftime("%m/%d/%Y")}", admin_job_path(job))
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Ready Jobs" do
          ol do
            jobs.ready.map do |job|
              li link_to("#{job.client.name} - #{job.status}", admin_job_path(job))
            end
          end
        end
      end
      column do
        panel "Unpaid Jobs" do
          ol do
            jobs.unpaid.filed.each do |job|
              li link_to("#{job.client.name} - #{number_to_currency(job.bill)}", admin_job_path(job)) unless job.payment
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Filed Jobs" do
          ol do
            jobs.filed.limit(25).map do |job|
              li link_to("#{job.client.name} - Filed on #{job.filed.strftime("%m/%d/%Y") if job.filed}", admin_job_path(job))
            end
          end
        end
      end
      column do
        panel "Accepted Jobs" do
          ol do
            jobs.where(status: :accepted).reverse.map do |job|
              li link_to("#{job.client.name} - Accepted on #{job.ack_fed.strftime("%m/%d/%Y")}", admin_job_path(job))
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Recent Payments" do
          ol do
            #refactor this
            jobs.paid.limit(35).each do |job|
              Payment.where(job_id: job.id).map do |pay|
                li link_to("#{number_to_currency(pay.amount)} - #{pay.job.client.name} - Received on  #{pay.created_at.to_date.strftime("%m/%d/%Y")} ", admin_payment_path(pay))
              end
            end
          end
        end
      end
    end
  end
end
