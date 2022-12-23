module ApplicationHelper
  def go_back_path
    return group_path(Group.find(params[:group_id])) if current_page?(controller: 'entities',
                                                                      action: 'new') && !current_page?(new_entity_path)

    root_path
  end
end
