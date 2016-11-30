require_relative( '../db/sql_runner' )

class Restaurant

  attr_reader( :name, :menu,  :website, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @menu = options['menu']
    @website = options['website']
  end

  def save()
    sql = "INSERT INTO restaurants (name, menu, website) VALUES ('#{ @name }', '#{ @menu }', '#{ @website }') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.find( id )
    sql = "SELECT * FROM restaurants WHERE id = #{id};"
    restaurant = SqlRunner.run( sql )
    result = Restaurant.new( restaurant.first )
    return result
  end

  def self.all()
    sql = "SELECT * FROM restaurants"
    results = SqlRunner.run( sql )
    return results.map { |hash| Restaurant.new( hash ) }
  end

  def self.update( options )
    sql = "UPDATE restaurants SET
        name='#{options['name']}',
        menu='#{options['menu']}',
        website='#{options['website']}'
        WHERE id=#{options['id']}"
    SqlRunner.run( sql )
  end

  def self.delete_all
    sql = "DELETE FROM restaurants"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM restaurants where id = #{id}"
    SqlRunner.run( sql )
  end

end
