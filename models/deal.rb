require_relative( '../db/sql_runner' )

class Deal

  attr_reader( :name, :description, :day_id, :restaurant_id, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @description = options['description']
    @day_id = options['day_id'].to_i
    @restaurant_id = options['restaurant_id'].to_i
  end

  def save()
    sql = "INSERT INTO deals (name, description, day_id, restaurant_id) VALUES ('#{ @name }', '#{ @description }',#{ @day_id }, #{ @restaurant_id }) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM deals;"
    results = SqlRunner.run( sql )
    return results.map { |hash| Deal.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM deals WHERE id = #{id}"
    results = SqlRunner.run( sql )
    return Deal.new( results.first )
  end

  def day()
      sql = "SELECT * FROM days WHERE id = #{@day_id};"
      day = SqlRunner.run( sql )
      return Day.new(day[0])
  end

  def restaurant()
      sql = "SELECT * FROM restaurants WHERE id = #{@restaurant_id};"
      restaurant = SqlRunner.run( sql )
      return Restaurant.new(restaurant[0])
  end

  def self.delete_all
    sql = "DELETE FROM deals"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM deals where id = #{id}"
    SqlRunner.run( sql )
  end

end