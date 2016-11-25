require_relative( '../db/sql_runner' )

class Restaurant

  attr_reader( :name, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO restaurants (name) VALUES ('#{ @name }') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM restaurants"
    results = SqlRunner.run( sql )
    return results.map { |hash| Restaurant.new( hash ) }
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
