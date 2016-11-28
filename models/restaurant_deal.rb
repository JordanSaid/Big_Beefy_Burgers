require_relative( '../db/sql_runner' )

class RestaurantDeal

  attr_reader( :id, :deal_id, :burger_id)

  def initialize( options )
    @id = nil || options['id'].to_i
    @deal_id = options['deal_id']
    @burger_id = options['deal_id']
  end

  def save()
    sql = "INSERT INTO restaurant_deals (
      deal_id, burger_id) VALUES ('#{ @deal_id}', '#{ @burger_id}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def deal
    sql = "SELECT * FROM deals d INNER JOIN restaurant_deals rd ON rd.deal_id = d.id WHERE d.id = #{@deal_id}"
    results = SqlRunner.run( sql )
    return Deal.new( results.first )
  end

  def burger
    sql = "SELECT * FROM burgers b INNER JOIN restaurant_deals rd ON rd.burger_id = b.id WHERE b.id = #{@burger_id}"
    results = SqlRunner.run( sql )
    return Deal.new( results.first )
  end

  def self.all()
  end

  def self.delete_all
    sql = "DELETE FROM restaurant_deals"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM restaurant_deals where id = #{id}"
    SqlRunner.run( sql )
  end

  def self.destroy_by_restaurant(restaurant_id)
    sql = "DELETE FROM restaurant_deals where id = #{id}"
    SqlRunner.run( sql )
  end

end

