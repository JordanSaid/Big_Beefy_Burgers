require_relative( '../db/sql_runner' )

class Burger

  attr_reader( :name, :restaurant_id, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @restaurant_id = options['restaurant_id'].to_i
  end

  def save()
    sql = "INSERT INTO burgers (name, restaurant_id) VALUES ('#{ @name }', '#{ @restaurant_id}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def restaurant()
      sql = "SELECT * FROM restaurants WHERE id = #{@restaurant_id};"
      restaurant = SqlRunner.run( sql )
      return Restaurant.new(restaurant[0])
  end

  def self.all()
    sql = "SELECT * FROM burgers"
    results = SqlRunner.run( sql )
    return results.map { |hash| Burger.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM burgers WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Burger.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM burgers"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM burgers where id = #{id}"
    SqlRunner.run( sql )
  end

end