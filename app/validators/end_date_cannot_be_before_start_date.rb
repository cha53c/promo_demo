class EndDateCannotBeBeforeStartDate < ActiveModel::Validator
  def validate(record)
    if record.ends && record.starts && record.ends < record.starts
      record.errors.add :ends, 'date cannot be before the start'
    end
  end
end