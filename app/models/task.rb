class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
    validates :memo, length: { maximum: 500 }
    validates :start_date, presence: true
    validates :end_date, presence: true
  # 終了日が開始日より後の日付であることを確認するカスタムバリデーション
  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?
    if end_date <= start_date
      errors.add(:end_date, "は開始日より後の日付にしてください")
    end
  end
end
