class CreateNetPromoterScores < ActiveRecord::Migration[5.2]
  def change
    create_table :net_promoter_scores do |t|
      t.integer :score, null: false
      t.string  :touchpoint, null: false
      t.belongs_to :respondent, polymorphic: true
      t.belongs_to :object, polymorphic: true

      t.timestamps
    end
    add_indexes
  end

  private

  def add_indexes
    add_index :net_promoter_scores, [:touchpoint]
    add_index :net_promoter_scores, %i[respondent_id respondent_type]
    add_index :net_promoter_scores, %i[object_id object_type]
    add_index :net_promoter_scores, %i[touchpoint respondent_id respondent_type object_id object_type], unique: true, name: 'net_promoter_scores_data_integrity'
  end
end
