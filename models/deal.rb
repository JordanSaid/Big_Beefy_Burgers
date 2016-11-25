require_relative( '../db/sql_runner' )

class Deal

  attr_reader( :label, :burger_id, :day_id, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @label = options['label']
    @burger_id = options['burger_id']
    @day_id = options['day_id']
  end

  def save()
    sql = "INSERT INTO deals (label, burger_id, day_id) VALUES ('#{ @label }''#{ @burger_id }',#{ @day_id }) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM deals"
    results = SqlRunner.run( sql )
    return results.map { |hash| Deal.new( hash ) }
  end

  def days
    sql = "SELECT * FROM days y
          INNER JOIN deals d
          ON d.days_id = y.id
          WHERE y.id = #{@day_id}"
    results = SqlRunner.run( sql )
    return results.map { |hash| Deal.new( hash ) }
  end

  def burgers
    sql = "SELECT * FROM burgers b
          INNER JOIN deals d
          ON d.burger_id = b.id
          WHERE b.id = #{@burger_id}"
    results = SqlRunner.run( sql )
    return results.map { |hash| Burger.new( hash ) }
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