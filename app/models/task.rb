class Task < ApplicationRecord
    # タイトル、開始日、終了日を必須項目として設定
  validates :title, :start_date, :end_date, presence: true

  # タイトルは最大20文字まで
  validates :title, length: { maximum: 20 }

  # 終了日が開始日以降の日付であることを確認
  validate :end_date_after_start_date

  # スケジュールメモは最大500文字まで
  validates :memo, length: { maximum: 500 }, allow_blank: true

  private

  # 終了日が開始日より後の日付であることを確認するカスタムバリデーション
  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?
    if end_date <= start_date
      errors.add(:end_date, "は開始日より後の日付にしてください")
    end
  end
end
