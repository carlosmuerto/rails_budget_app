module ApplicationHelper
  def go_back_path
    return group_path(Group.find(params[:group_id])) if current_page_is_entity_with_group_path?
    return groups_path if current_page_is_from_groups_but_not_index?
    return entities_path if current_page_is_from_entities_but_not_index?

    root_path
  end

  def current_page_is_from_groups_but_not_index?
    controller_name == 'groups' && !current_page?(controller: 'groups', action: 'index')
  end

  def current_page_is_from_entities_but_not_index?
    controller_name == 'entities' && !current_page?(controller: 'entities', action: 'index')
  end

  def current_page_is_entity_with_group_path?
    current_page?(controller: 'entities', action: 'new') && !current_page?(new_entity_path)
  end
end
