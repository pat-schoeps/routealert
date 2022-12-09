class Route < ApplicationRecord

  def schedule_alerts
    if !schedule_id
      self.set_schedule_id
    end

    self.days.each do |day|
      date = DateTime.now.in_time_zone(time_zone).at_beginning_of_week
      date = date + (day - 1).days
      date = date.change({hour: sa_h, minute: sa_m})

      if DateTime.now > date
        puts "forward one week"
        date = date + 1.week
      end

      #subtract 30mins + travel time from start for check
      check_time = (30 + travel_time)
      check_date = date - check_time.minutes
      CheckForAlertJob.set(wait_until: check_date).perform_later(id, schedule_id)
    end
  end

  def set_schedule_id
    self.update!(schedule_id: SecureRandom.base64(24))
  end
end
