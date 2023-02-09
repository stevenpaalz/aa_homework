# == Schema Information
#
# Table name: people
#
#  id             :bigint           not null, primary key
#  name           :text
#  {:null=>false} :text
#  house_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Person < ApplicationRecord

    validates :name, :house_id, presence: true

    belongs_to(
        :house,
        class_name: 'House',
        foreign_key: :house_id,
        primary_key: :id
    )
end
