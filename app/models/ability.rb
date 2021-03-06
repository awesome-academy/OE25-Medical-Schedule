class Ability
  include CanCan::Ability

  def initialize user
    can :read, Doctor
    can :new, Appointment
    return unless user

    can [:show, :update], User, id: user.id

    case user.role
    when "Admin"
      can :manage, :all
    when "Staff"
      can :update, Doctor
      can :index, Patient
      can [:index, :update], Appointment
    when "Doctor"
      can :read, Comment
    when "Patient"
      can :create, Appointment
      can :manage, Comment, patient_id: user.id
    end
  end
end
