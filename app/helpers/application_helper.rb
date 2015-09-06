module ApplicationHelper
  def google_maps_api
    "http://maps.googleapis.com/maps/api/js"
  end

  def edit_button path
    link_to 'Edit', path, {class: 'btn btn-primary'}
  end

  def delete_button path, obj_desc
    link_to 'Delete', path, {method: :delete, class: 'btn btn-danger', data: {confirm: "Are you sure you want to delete #{obj_desc}"}}
  end

  def back_button path
    link_to 'Back', path, {class: 'btn btn-default'}
  end

  # module BootstrapExtension
  #   FORM_CONTROL_CLASS = "form-control"
  #
  #   # Override the 'text_field_tag' method defined in FormTagHelper[1]
  #   #
  #   # [1] https://github.com/rails/rails/blob/master/actionview/lib/action_view/helpers/form_tag_helper.rb
  #   def form_tag_helper(name, value = nil, options = {})
  #     class_name = options[:class]
  #     if class_name.nil?
  #       # Add 'form-control' as the only class if no class was provided
  #       options[:class] = FORM_CONTROL_CLASS
  #     else
  #       # Add ' form-control' to the class if it doesn't already exist
  #       options[:class] << " #{FORM_CONTROL_CLASS}" if
  #           " #{class_name} ".index(" #{FORM_CONTROL_CLASS} ").nil?
  #     end
  #
  #     # Call the original 'text_field_tag' method to do the real work
  #     super
  #   end
  # end
  #
  # # Add the modified method to ApplicationHelper
  # include BootstrapExtension
end
