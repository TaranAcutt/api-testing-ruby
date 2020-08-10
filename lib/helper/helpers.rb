module Helpers

  def response_upon_error (response)
    puts '------------------------------RESPONSE------------------------------'.colorize(:blue)
    pp response
    puts '------------------------------RESPONSE------------------------------'.colorize(:blue)
  end

  def skip_if_empty (code, body)
    if code == 200
      if body.empty?
        pending('NO DATA RETURNED FOR SELECTED QUERY')
        raise 'NO DATA, SKIPPING TEST'
      end
    end
  end

  def skip_if_nil (code, body)
    if code == 200
      if body.equal? nil
        pending('NIL RETURNED')
        raise 'NIL RETURNED, SKIPPING TEST'
      end
    end
  end
end


