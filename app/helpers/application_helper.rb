module ApplicationHelper
  def go_back_path
    return group_path(Group.find(params[:group_id])) if current_page_is_entity_with_group_path?

    root_path
  end

  private

  def current_page_is_entity_with_group_path?
    current_page?(controller: 'entities', action: 'new') && !current_page?(new_entity_path)
  end
end
