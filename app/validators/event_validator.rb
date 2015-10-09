class EventValidator < ActiveModel::Validator
  def validate(record)

    if record.cutoff_datetime > record.start_time
      record.errors[:base] << "Cut-off time can not be after start time."
    end

    if record.cutoff_datetime < DateTime.now
      record.errors[:base] << "Cut-off time can not be in the past."
    end

    if record.start_datetime < DateTime.now
      record.errors[:base] << "Start time can not be in the past."
    end
  end
end

