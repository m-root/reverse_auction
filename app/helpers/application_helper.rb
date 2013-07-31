module ApplicationHelper
  def patients_only(&block)
    concat(block.call) if current_patient
  end

  def doctors_only(&block)
    concat(block.call) if current_doctor
  end
end
