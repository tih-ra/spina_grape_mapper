
module SpinaGrapeMapper
  class Base

    GRPOUPER = :view_template

    Spina::Partable.class_eval do
      def map_json
        parts.map{ |part| { part => part.map_json } }.reduce(:merge).merge( map_childrens_json )
      end

      def map_childrens_json
        (respond_to?(:children) && children.length > 0) ? children.map { |child| child.map_json.merge({ GRPOUPER => child.try(GRPOUPER).pluralize }) }.group_by{ |group| group[GRPOUPER] } : {}
      end
    end

    Spina::Part.class_eval do
      def get_partable_type
        try( "#{ self.class.to_s.demodulize.underscore }able_type".to_sym )
      end

      def partable_type_to_method
        "JsonBy#{ get_partable_type.demodulize }".underscore
      end

      def json_by_photo_collection
        try(:content).photos
      end

      def json_by_structure
        try(:content).structure_items.map{ |structure_item| structure_item.map_json }
      end

      def map_json
        respond_to?(partable_type_to_method) ? try(partable_type_to_method) : try(:content)
      end
    end

  end
end
