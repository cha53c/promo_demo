class StartDateCannotBeBeforeToday < ActiveModel::Validator
  def validate(record)
    # start_date = Date.strptime(record.starts, '%d-%m-%Y')
    if record.starts < Date.today
      record.errors.add :starts, 'date cannot be in the past'
    end
  end
end