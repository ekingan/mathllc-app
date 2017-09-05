ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    jobs = Job.where(preparer_id: current_user.preparer.id)

    columns do
      column do
        panel "Jobs to follow up on" do
          ul do
            jobs.where(status: :need_info || :need_signatures).last(10).map do |job|
              li link_to("#{job.client.last_name} " " #{job.client.first_name} - #{job.status} - #{job.preparer.name}", admin_job_path(job))
            end
          end
        end
      end
      column do
        panel "Jobs Todo" do
          ul do
            jobs.where(status: :todo).last(10).map do |job|
              li link_to("#{job.client.last_name} " " #{job.client.first_name}", admin_job_path(job))
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
                li link_to("#{pay.job.preparer.name} - #{number_to_currency(pay.amount)}", admin_preparer_path(pay.job.preparer_id))
              end
            end
          end
        end
      end
    end
  end
end
