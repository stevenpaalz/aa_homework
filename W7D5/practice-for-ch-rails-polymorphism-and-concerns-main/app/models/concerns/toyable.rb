module Toyable
    extend ActiveSupport::Concern
  
    included do
        has_many :toys, as: :toyable
    end
  
    def receive_toy(name)
        # debugger
        Toy.find_or_create_by(name: name, toyable_type: (self.class), toyable_id: self.id )
    end
  end