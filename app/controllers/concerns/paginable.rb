module Paginable
  extend ActiveSupport::Concern

  protected

  def get_links_serializer_options(link_paths, collection)
    {
      links: {
        first: send(link_paths, page: 1),
        last: send(link_paths, page: collection.count),
        prev: send(link_paths, page: collection.prev),
        next: send(link_paths, page: collection.next)
      }
    }
  end

  def current_page
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:per_page] || 20).to_i
  end
end
