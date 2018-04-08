ActiveAdmin.register Client do
  permit_params :first_name, :last_name, :company, :date_of_birth, :email, :phone, :street, :city,
                :state, :zip_code, :occupation, :entity_type, :tax_year_ends, :filing_status,
                :number_of_dependents, :spouse_first_name, :spouse_last_name, :spouse_date_of_birth,
                :spouse_phone, :spouse_email, :spouse_occupation, :notes, :primary_preparer_id, :preparer_attributes, :discontinue
  menu priority: 2
  config.sort_order = :last_name_asc

  filter :primary_preparer, as: :select, collection: proc { Preparer.all }
  filter :entity_type, as: :select, collection: [["Individual", 0], ["Partnership", 1], ["S-Corp", 2], ["C-Corp", 3], ["Non-Profit", 4], ["Trust", 5], ["Estate", 6]]
  filter :company
  filter :first_name
  filter :last_name
  filter :tax_id, label: "Tax ID"
  filter :spouse_first_name
  filter :spouse_last_name
  filter :email
  filter :state
  filter :discontinue

index do
  column :last_name
  column :first_name
  column :company
  column :entity_type
  column :preparer, sortable: :preparer do |client|
    if client.primary_preparer_id
      Preparer.find(client.primary_preparer_id).first_name
    else
      client.jobs.map(&:preparer).map(&:first_name).join(", ")
    end
  end
  actions
end

show do
  columns do
    column do
      panel "Taxpayer Info" do
        attributes_table_for client do
          row :first_name
          row :last_name
          row :date_of_birth, as: :datepicker, datepicker_options: { dateFormat: "mm/dd/yy" }
          row :email
          row :phone
          row :occupation
          row :discontinue
        end
      end
      panel "Filing Info" do
        attributes_table_for client do
          row :entity_type
          row :company
          row :tax_id, label: "Tax ID"
          row :filing_status
          row :number_of_dependents
          row :tax_year_ends, as: :datepicker, datepicker_options: { dateFormat: "mm/dd" }
        end
      end
    end
    column do
      panel 'Spouse Info' do
        attributes_table_for client do
          row :spouse_first_name
          row :spouse_last_name
          row :spouse_date_of_birth, as: :datepicker, datepicker_options: { dateFormat: "mm/dd/yy" }
          row :spouse_phone
          row :spouse_email
          row :spouse_occupation
        end
      end
      panel 'Address' do
        attributes_table_for client do
          row :street
          row :city
          row :state
          row :zip_code
        end
      end
    end
  end
  panel 'Notes' do
    attributes_table_for client do
      row :notes
    end
  end
  render 'clients/payments', { client: client }
end

  form do |f|
    f.inputs "Taxpayer Info" do
      f.input :first_name
      f.input :last_name
      f.input :entity_type, as: :select
      f.input :tax_id, label: "Tax ID"
      f.input :primary_preparer_id, as: :select, collection: [["Emily", 1], ["Jenna", 2], ["Amanda", 3], ["Brian", 4], ["Debbie", 5], ["Karen", 6]]
      f.input :company
      f.input :discontinue
      f.input :date_of_birth, as: :datepicker, datepicker_options: { dateFormat: "mm/dd/yy" }
      f.input :email
      f.input :phone
      f.input :occupation
      f.input :tax_year_ends, as: :datepicker, datepicker_options: { dateFormat: "mm/dd" }
      f.input :filing_status, as: :select
      f.input :number_of_dependents
    end
    f.inputs 'Address' do
      f.input :street
      f.input :city
      f.input :state
      f.input :zip_code
    end
    f.inputs "Spouse Info" do
      f.input :spouse_first_name
      f.input :spouse_last_name
      f.input :spouse_date_of_birth, as: :datepicker, datepicker_options: { dateFormat: "mm/dd/yy" }
      f.input :spouse_phone
      f.input :spouse_email
      f.input :spouse_occupation
    end
    f.inputs "Notes" do
      f.input :notes
    end
    f.actions
  end

  def scoped_collection
    super.includes :preparer, :jobs
  end
end
