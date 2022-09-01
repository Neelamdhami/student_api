ActiveAdmin.register User do

  permit_params :first_name, :last_name, :gender, :dob, :address

  #active_admin_importable

  action_item :only => :index do
      link_to 'Add Bulk Student', :action => 'upload_csv'
    end
  
    collection_action :upload_csv do
      render "admin/csv/upload_csv"
    end
  
    collection_action :import_csv, :method => :post do
      CsvDb.convert_save("user", params[:dump][:file])
      redirect_to :action => :index, :notice => "CSV imported successfully!"
    end
  

end
