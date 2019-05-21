class Account < ApplicationRecord

  scope :for_reseller, -> (_reseller_id) { where(reseller_id: _reseller_id) }

  belongs_to :reseller

  before_create :calc_total_price

  after_create :send_to_popguide

  validates :name, presence: true
  validates :qty, presence: true, numericality: true
  validates :accesses, presence: true

  def sent?
    self.remote_id.present?
  end

  def calc_total_price
    _total_price = 0.0
    for pm in PopMap.where(id: self.accesses)
      _total_price = pm.price * self.qty
    end
    self.total_price = _total_price
  end

  def send_to_popguide
    response = Popguide::Account::Create.call(self)
    if response['success']
      self.update_attributes(remote_id: response['group']['id'],
                           response_credentials: response['group']['credentials'])
    else
      false
    end
  end

end
