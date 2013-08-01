module ApplicationHelper
  def patients_only(&block)
    block.call if current_patient
  end

  def doctors_only(&block)
    block.call if current_doctor
  end

  def doctors_only_bid
    yield if current_doctor == @bid.doctor
  end
end
