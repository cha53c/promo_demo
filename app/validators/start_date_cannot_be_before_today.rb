class StartDateCannotBeBeforeToday < ActiveModel::Validator
  def validate(record)
    if record.starts && record.starts < Date.today
      record.errors.add :starts, 'date cannot be in the past'
    end
  end
end