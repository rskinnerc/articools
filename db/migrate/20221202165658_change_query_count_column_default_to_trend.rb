class ChangeQueryCountColumnDefaultToTrend < ActiveRecord::Migration[7.0]
  def change
    change_column_default :trends, :query_count, 0
  end
end
