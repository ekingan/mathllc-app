ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    jobs = Job.where(preparer_id: current_user.preparer.id).order(id: :desc)

    columns do
      column do
        panel "Jobs Todo" do
          ol do
            jobs.where(status: :todo).reverse.map do |job|
              li link_to("#{job.client.name} - Recieved on #{job.updated_at.to_date.strftime("%m/%d/%Y")}", admin_job_path(job))
            end
          end
        end
      end
      column do
        panel "Jobs waiting on more info" do
          ol do
            jobs.where(status: :need_info).map do |job|
              li link_to("#{job.client.name} - #{job.status}", admin_job_path(job))
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Jobs that need to be scanned" do
          ol do
            jobs.not_scanned.map do |job|
              li link_to("#{job.client.name} - #{job.status}", admin_job_path(job))
            end
          end
        end
      end
      column do
        panel "Jobs that need to be printed or uploaded" do
          ol do
            jobs.not_printed_or_uploaded.each do |job|
              li link_to("#{job.client.name} - #{job.status}", admin_job_path(job))
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
        panel "Jobs Ready for efile" do
          ol do
            jobs.ready.map do |job|
              li link_to("#{job.client.name} - #{job.status}", admin_job_path(job))
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Rejected Returns" do
          ol do
            jobs.rejected.map do |job|
              li link_to("#{job.client.name} - Rejected", admin_job_path(job))
            end
          end
        end
      end
      column do
        panel "Unpaid Jobs" do
          ol do
            jobs.unpaid.where(status: [:filed, :accepted]).each do |job|
              li link_to("#{job.client.name} - #{number_to_currency(job.bill)}", admin_job_path(job))
            end
          end
        end
      end
    end
  end
end
