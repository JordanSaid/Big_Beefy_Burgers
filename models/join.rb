require_relative( '../db/sql_runner' )

class Join

  attr_reader( :id, :restaurant_id, :deal_id)

  def initialize( options )
    @id = nil || options['id'].to_i
    @restaurant_id = options['restaurant_id']
    @deal_id = options['deal_id']
  end

  def save()
    sql = "INSERT INTO joins (
      restaurant_id, deal_id) VALUES ('#{ @restaurant_id }', '#{ @deal_id}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM joins"
    results = SqlRunner.run( sql )
    return results.map { |hash| Join.new( hash ) }
  end

  def self.delete_all
    sql = "DELETE FROM joins"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM joins where id = #{id}"
    SqlRunner.run( sql )
  end

end

