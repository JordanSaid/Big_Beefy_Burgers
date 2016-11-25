require_relative( '../db/sql_runner' )

class RestaurantDeal

  attr_reader( :id, :restaurant_id, :deal_id)

  def initialize( options )
    @id = nil || options['id'].to_i
    @restaurant_id = options['restaurant_id']
    @deal_id = options['deal_id']
  end

  def save()
    sql = "INSERT INTO restaurant_deals (
      restaurant_id, deal_id) VALUES ('#{ @restaurant_id }', '#{ @deal_id}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def restaurant
    sql = "SELECT * FROM restaurants r INNER JOIN restaurant_deals rd ON rd.restaurant_id = r.id WHERE r.id = #{@restaurant_id}"
    results = SqlRunner.run( sql )
    return Restaurant.new( results.first )
  end

  def deal
    sql = "SELECT * FROM deals d INNER JOIN restaurant_deals rd ON rd.deal_id = d.id WHERE d.id = #{@deal_id}"
    results = SqlRunner.run( sql )
    return Deal.new( results.first )
  end

  def self.all()
    sql = "SELECT * FROM restaurant_deals"
    results = SqlRunner.run( sql )
    return results.map { |hash| restaurant_deal.new( hash ) }
  end

  def self.delete_all
    sql = "DELETE FROM restaurant_deals"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM restaurant_deals where id = #{id}"
    SqlRunner.run( sql )
  end

end

