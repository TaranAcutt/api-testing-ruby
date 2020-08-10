require 'chronic'

module Dates
  class << self
    attr_accessor :range, :range_exceeded, :range_reversed, :single, :single_day_from, :single_day_to, :thirty_days_from, :thirty_days_to, :ninety_days_from, :ninety_days_to, :gnip_from, :gnip_to
  end

  def self.date_generator (range)
    URI.encode_www_form_component((Chronic.parse(range).utc.iso8601).to_s)
  end

  def self.date_formatter (first_date, second_date)
    ('from=' + first_date + '&to=' + second_date)
  end

  def self.snip_gnip (date)
    date.gsub( '-', '').gsub('T', '').gsub('%3A', '').chomp('00Z')
  end

  @single_day_from = date_generator('28 days ago at 00:00')

  @single_day_to = date_generator('27 days ago at 00:00')

  @single_day_from = date_generator('18 days ago at 00:00')

  @single_day_to = date_generator('17 days ago at 00:00')

  @seven_days_from = date_generator('8 days ago at 00:00')

  @seven_days_to = date_generator('1 day ago at 00:00')

  @thirty_days_from = date_generator('34 days ago at 00:00')

  @thirty_days_to = date_generator('4 day ago at 00:00')

  @ninety_days_from = date_generator('97 days ago at 00:00')

  @ninety_days_to = date_generator('7 days ago at 00:00')

  @four_hundred_days_ago = date_generator('400 days ago at 00:00')

  @gnip_from = date_generator('21 days ago at 18:00')

  @gnip_to = date_generator('21 days ago at 19:00')

  @range_exceeded = date_formatter(@four_hundred_days_ago, @seven_days_to)

  @range_reversed = date_formatter(@single_day_to, @single_day_from)

  @single = { single_day: date_formatter(@single_day_from, @single_day_to) }

  @range = [{ summary: 'single_day', date: date_formatter(@single_day_from, @single_day_to) },
            { summary: 'seven_days', date: date_formatter(@seven_days_from, @seven_days_to) },
            { summary: 'ninety_days', date: date_formatter(@ninety_days_from, @ninety_days_to) }]

end


