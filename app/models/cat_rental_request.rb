class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: ["APPROVED", "DENIED", "PENDING"] }
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:cat_id] << "Cannot overlap with a request that was already approved"
    end
  end

  def overlapping_requests
    self.cat.rental_requests.where.not(id: self.id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def approve!
    transaction do
      self.status = "APPROVED"
      self.save
      overlapping_pending_requests.update_all(status: "DENIED")
    end
  end

  def deny!
    self.status = "DENIED"
    self.save
  end
end
