module SpinaGrapeMapper
  class MapJson < Base

    def initialize(resource_id)
      @resource_id = resource_id
    end

    def json_by_page_name
      Spina::Page.find_by!(name: @resource_id).map_json
    end

    def json_by_page_id
      Spina::Page.find(@resource_id).map_json
    end

  end
end
