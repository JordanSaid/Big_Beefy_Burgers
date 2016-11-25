require_relative( '../db/sql_runner' )

class Restaurant

  attr_reader( :name, :burger_id, :deal_id, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @burger_id = options['burger_id']
    @deal_id = options['deal_id']
  end

  def save()
    sql = "INSERT INTO restaurants (name, burger_id, deal_id) VALUES ('#{ @name }''#{ @burger_id }',#{ @deal_id }) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM restaurants"
    results = SqlRunner.run( sql )
    return results.map { |hash| Restaurant.new( hash ) }
  end

  def deals
    sql = "SELECT * FROM deals d
          INNER JOIN restaurants r
          ON r.deal_id = d.id
          WHERE d.id = #{@deal_id}"
    results = SqlRunner.run( sql )
    return results.map { |hash| Deal.new( hash ) }
  end

  def burgers
    sql = "SELECT * FROM burgers b
          INNER JOIN restaurants r
          ON r.burger_id = b.id
          WHERE b.id = #{@burger_id}"
    results = SqlRunner.run( sql )
    return results.map { |hash| Burger.new( hash ) }
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
