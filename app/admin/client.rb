ActiveAdmin.register Client do
	ActiveAdmin.register Client do
	  permit_params :first_name, :last_name, :company, :date_of_birth, :email, :phone, :street, :city,
	                :state, :zip_code, :occupation, :entity_type, :tax_year_ends, :filing_status,
	                :number_of_dependents, :spouse_first_name, :spouse_last_name, :spouse_date_of_birth,
	                :spouse_phone, :spouse_email, :spouse_occupation, :notes, :preparer_attributes
	  menu priority: 2

	  filter :entity_type, as: :select
	  filter :first_name
	  filter :last_name
	  filter :spouse_first_name
	  filter :spouse_last_name
	  filter :email
	  filter :phone
	  filter :city
	  filter :state
	  filter :occupation
	  filter :tax_year_ends
	  filter :filing_status, as: :select

	  action_item only: [:show] do
	    link_to "New Job", new_admin_job_path
	  end

	index do
	  column :id
	  column :last_name
	  column :first_name
	  column :email
	  column :phone
	  column :entity_type
	  column :spouse_first_name
	  actions
	end

	show do
	  attributes_table do
	    row :entity_type
	    row :first_name
	    row :last_name
	    row :company
	    row :filing_status
	    row :date_of_birth, as: :datepicker, datepicker_options: { dateFormat: "mm/dd/yy" }
	    row :email
	    row :phone
	    row :city
	    row :state
	    row :zip_code
	    row :occupation
	    row :number_of_dependents
	    row :tax_year_ends, as: :datepicker, datepicker_options: { dateFormat: "mm/dd" }
	    row :spouse_first_name
	    row :spouse_last_name
	    row :spouse_date_of_birth, as: :datepicker, datepicker_options: { dateFormat: "mm/dd/yy" }
	    row :spouse_phone
	    row :spouse_email
	    row :spouse_occupation
	    render 'clients/payments', { client: client }
	    row :notes
	  end
	end

	  form do |f|
	    f.inputs "Taxpayer Info" do
	      f.input :first_name
	      f.input :last_name
	      f.input :company
	      f.input :date_of_birth, as: :datepicker, datepicker_options: { dateFormat: "mm/dd/yy" }
	      f.input :email
	      f.input :phone
	      f.input :city
	      f.input :state
	      f.input :zip_code
	      f.input :occupation
	      f.input :entity_type, as: :select
	      f.input :tax_year_ends, as: :datepicker, datepicker_options: { dateFormat: "mm/dd" }
	      f.input :filing_status, as: :select
	      f.input :number_of_dependents
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


end
