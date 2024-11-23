class User < ApplicationRecord
  has_secure_password

  generates_token_for :email_verification, expires_in: 2.days do
    email
  end

  generates_token_for :password_reset, expires_in: 20.minutes do
    password_salt.last(10)
  end

  belongs_to :role

  has_many :organizations_users
  has_many :organizations, through: :organizations_users

  has_many :organizations_where_admin, -> { where(organizations_users: { is_admin: true }) }, through: :organizations_users, source: :organization
  has_many :organizations_where_default, -> { where(organizations_users: { is_default: true }) }, through: :organizations_users, source: :organization
  has_many :organizations_where_owner, -> { where(organizations_users: { is_admin: true, is_owner: true }) }, through: :organizations_users, source: :organization
  has_many :organizations_where_user, -> { where(organizations_users: { is_admin: false, is_guest: false, is_owner: false }) }, through: :organizations_users, source: :organization

  has_many :sessions, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, allow_nil: true, length: { minimum: 12 }

  normalizes :email, with: -> { _1.strip.downcase }

  before_validation :set_default_attributes

  before_validation if: :email_changed?, on: :update do
    self.verified = false
  end

  after_update if: :password_digest_previously_changed? do
    sessions.where.not(id: Current.session).delete_all
  end

  def admin?
    role_key == "admin"
  end

  def default_organization_id=(organization_id)
    User.transaction do
      self.organizations_users.update_all(is_default: false, updated_at: Time.current)
      self.organizations_users.find_by(id: organization_id).update(is_default: true)
    end
  end

  def default_organization
    @default_organization ||= self.organizations_where_default.first
  end
  
  def organization_user?
    role_key == "organization_user"
  end

  def role_key
    @role_key ||= self.role&.key
  end

  private

    def set_default_attributes
      self.attributes = {
        role: self.role || Role.find_by(key: "organization_user"),
      }
    end
end
