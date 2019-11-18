require 'date'

class User
  attr_accessor :name, :birth_day, :birth_month, :birth_year

  def initialize(args)
    @name = args[:name]
    @birth_all =
      Date.parse("#{args[:birth_year]}#{args[:birth_month]}#{args[:birth_day]}")
    @today = Date.today
  end

  def age
    today_yday_wleap = Date.leap?(@today.year) ? (@today.yday - 1) : @today.yday
    bday_yday_wleap =
      Date.leap?(@birth_all.year) ? (@birth_all.yday - 1) : @birth_all.yday
    age_years =
      (@today.year - @birth_all.year) -
        (today_yday_wleap >= bday_yday_wleap ? 0 : 1)

    # Range of days between last birthday and today
    last_bday = @birth_all.next_year(age_years)
    age_days = (last_bday..@today).count

    return { years: age_years, days: age_days }
  end

  def next_birthday
    next_birthday = @birth_all.next_year(age[:years] + 1)

    return(
      {
        year: next_birthday.year,
        month: next_birthday.month,
        day: next_birthday.day
      }
    )
  end
end