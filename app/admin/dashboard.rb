ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    jobs = Job.where(preparer_id: current_user.preparer.id).order(updated_at: :desc)

    columns do
      column do
        panel "Jobs to follow up on" do
          ul do
            jobs.where(status: :need_info || :need_signatures).last(10).map do |job|
              li link_to("#{job.client.name} - #{job.status}", admin_job_path(job))
            end
          end
        end
      end
      column do
        panel "Jobs Todo" do
          ul do
            jobs.where(status: :todo).map do |job|
              li link_to("#{job.client.name} - #{job.updated_at.to_date}", admin_job_path(job))
            end
          end
        end
      end
    end
    columns do
      column do
        panel "Recent Payments" do
          ul do
            jobs.each do |job|
              Payment.where(job_id: job.id).map do |pay|
                li link_to("#{number_to_currency(pay.amount)} - #{pay.job.client.name} - #{pay.created_at.to_date} ", admin_preparer_path(pay.job.preparer_id))
              end
            end
          end
        end
      end
    end
  end
end
