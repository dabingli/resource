class Api::Duplicator::IndexController < Api::Duplicator::BaseController

  # 记录数、最大 id、最小 id
  def meta
    table_name = params.require :table
    model = model_of_table(table_name)

    r_json({
      record_count: model.count,
      min_id: model.minimum(:id),
      max_id: model.maximum(:id),
    })
  end

  # 各 id 区间内的记录数、最大 updated_at
  # {
  #   '0-1000': {
  #     record_count: 100,
  #     max_updated_at: '2016-11-24T22:00:00.000000+08:00'
  #   }
  # }
  def max_updated_at
    interval = params.require(:interval).to_i
    table_name = params.require :table

    model = model_of_table(table_name)

    fields = [
      # MySQL 中两个整数相除结果为小数，但 PostgreSQL 中整数相除结果还是整数（商，丢弃小数部分）
      # 为保持一致，将除数转为浮点数
      "CEIL(id/#{interval.to_f}) AS number",
      "COUNT(*) AS record_count",
      "MAX(updated_at) AS max_updated_at",
    ]

    result = {}
    model.select(fields).group("number").order("number").each do |record|
      next unless record.record_count > 0
      # MySQL 查出的 number 为整数，但 PostgreSQL 查出的为 decimal
      range_end = interval * record.number.to_i
      id_range = "#{range_end - interval + 1}-#{range_end}"
      result[id_range] = {
        max_updated_at: record.max_updated_at,
        record_count: record.record_count,
      }
    end

    r_json result
  end

  # 根据 id 列表或 id 范围查询记录
  def records
    table_name = params.require :table
    id_range = params[:id_range].presence
    ids = params[:ids].presence
    fields = params[:fields].presence == 'all' ? '*' : [:id, :updated_at]

    if ids
      where = { id: ids }
    elsif id_range
      range_start, range_end = id_range.split('-').map(&:to_i)
      where = "id >= #{range_start} AND id <= #{range_end}"
    else
      return r_json 'Must pass either ids or id_range'
    end

    model = model_of_table(table_name)
    # 必须转成 hash，否则使用 CarrierWave::Uploader 的列也会被返回
    records = model.select(fields).where(where).order(:id).map(&:attributes)

    r_json records
  end

  # 根据每个 id 范围的 id 列表、最大 updated_at，找出添加、修改、删除的记录
  def updated
    table_name = params.require :table
    id_range = params.require :id_range
    ids = (params[:ids].presence || []).map(&:to_i)
    max_updated_at = params[:max_updated_at].present? ? Time.parse(params[:max_updated_at]) : nil

    model = model_of_table(table_name)
    query = model.order(:id).where('id >= ? AND id <= ?', *id_range.split('-'))
    local_ids = query.ids

    added_ids = local_ids - ids
    deleted_ids = ids - local_ids
    updated_ids = max_updated_at.nil? ? [] : query.where('updated_at >= ?', max_updated_at).order(:updated_at).ids

    r_json({
      added_ids: added_ids,
      deleted_ids: deleted_ids,
      updated_ids: updated_ids - added_ids,
    })
  end

  # 表结构
  # { name => type}
  def schema
    table_name = params.require :table

    model = model_of_table(table_name)
    columns = model.columns.inject({}) do |h, column|
      h[column.name] = column.type
      h
    end

    r_json columns
  end

  private

  def model_of_table(table_name)
    # 使用 unscoped 以避免 default_scope 的影响
    model = table_name.classify.constantize.unscoped
  end

end
