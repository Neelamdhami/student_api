ActiveAdmin.register Education do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :class_name, :board, :percentage, :passing_year, :branch, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:class_name, :board, :percentage, :passing_year, :branch, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do 
    selectable_column 
    id_column  
    column :class_name
    column :board
    column :percentage
    column :passing_year
    column :branch
    column "Student Name", :user_id do |user|
      user = User.find_by(id: user.user_id)
      # sms_temp = AccountBlock::SmsTemplate.find_by(id: object.template_id)
      link_to(user&.first_name&.capitalize, admin_user_path(user&.id))
    end
  
  column :created_at do |object|
    object.created_at.to_s
  end
  column :updated_at do |object|
    object.updated_at.to_s
  end
  actions

  end

  form do |f|
    f.inputs do
      f.input :user_id, label: "Student Name", as: :select, collection:User.all.collect { |obj| [obj.first_name, obj.id] }
      f.input :class_name
      f.input :board
      f.input :percentage
      f.input :passing_year
      f.input :branch
      
    end
    f.actions
  end 

  
end
