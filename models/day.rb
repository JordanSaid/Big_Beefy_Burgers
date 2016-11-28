require_relative( '../db/sql_runner' )

class Day

  attr_reader(:name, :id)

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
  end 

  def save()
    sql = "INSERT INTO days (name) VALUES ('#{ @name }') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM days"
    results = SqlRunner.run( sql )
    return results.map { |hash| Day.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM days WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Day.new( results.first )
  end

  def self.find_name( name )
    sql = "SELECT * FROM days WHERE name='#{name}'"
    results = SqlRunner.run( sql )
    return results.map { |hash| Day.new( hash ) }
  end

  def self.delete_all
    sql = "DELETE FROM days"
    SqlRunner.run( sql )
  end

end
