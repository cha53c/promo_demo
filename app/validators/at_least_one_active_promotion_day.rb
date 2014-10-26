class AtLeastOneActivePromotionDay < ActiveModel::Validator
  def validate(record)
    unless record.mon || record.tue || record.wed || record.thu || record.fri || record.sat || record.sun
      record.errors.add :base, "There needs to be a least one active weekday"
    end
  end
end