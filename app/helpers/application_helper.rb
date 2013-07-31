module ApplicationHelper
  def patients_only(&block)
    block.call if current_patient
  end

  def doctors_only(&block)
    block.call if current_doctor
  end
end
