ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      # span class: "blank_slate" do
      #   span I18n.t("active_admin.dashboard_welcome.welcome")
      #   small I18n.t("active_admin.dashboard_welcome.call_to_action")
      # end
    end

    columns do
      column do
        panel "Recent Jobs Added" do
          ul do
            Job.where(preparer_id: 1).last(10).map do |job|
              li link_to("#{job.client.last_name} " " #{job.client.first_name} - #{job.status} - #{job.preparer.name}", admin_job_path(job))
            end
          end
        end
      end
      column do
        panel "Jobs Todo" do
          ul do
            Job.where(preparer_id: 1, status: :todo).last(10).map do |job|
              li link_to("#{job.client.last_name} " " #{job.client.first_name} - #{job.status} - #{job.preparer.name}", admin_job_path(job))
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Recent Payments" do
          ul do
            Payment.last(10).map do |pay|
              li link_to("#{pay.job.preparer.name} - #{number_to_currency(pay.amount)}", admin_preparer_path(pay.job.preparer_id))
            end
          end
        end
      end
    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
