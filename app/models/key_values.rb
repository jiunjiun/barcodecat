module KeyValues

  class Base < ActiveHash::Base
    def self.id_options
      all.map {|t| [t.name, t.id]}
    end

    def self.code_options
      all.map {|t| [t.name, t.code]}
    end

    def self.id_hash
      Hash[*(all.map{|t| [t.id, t.name]}.flatten)]
    end

    def self.code_hash
      Hash[*(all.map{|t| [t.code, t.name]}.flatten)]
    end

    def self.attributes
      all.map {|t| t.attributes }
    end

    def self.find_by_code(code)
      super(code.to_s)
    end
  end

  module Event
    class Category < KeyValues::Base
      self.data = [
        {id: 1, code: ''},
        {id: 2, code: ''}
      ]
    end
  end

  module Product
    class BannerStyle < KeyValues::Base
      self.data = [
        {id: 1, code: :white, name: '亮色系'},
        {id: 2, code: :dark,  name: '暗色系'}
      ]
    end
  end
end
