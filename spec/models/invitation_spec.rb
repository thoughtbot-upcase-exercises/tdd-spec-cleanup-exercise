require "rails_helper"

RSpec.describe Invitation do
  let(:invitation) { build(:invitation, team: team, user: new_user) }
  let(:new_user) { create(:user, email: "rookie@example.com") }
  let(:team) { create(:team, name: "A fine team") }
  let(:team_owner) { create(:user) }

  before do
    team.update!(owner: team_owner)
    team_owner.update!(team: team)
  end

  describe "callbacks" do
    describe "after_save" do
      context "with valid data" do
        it "invites the user" do
          invitation.save
          expect(new_user).to be_invited
        end
      end

      context "with invalid data" do
        before do
          invitation.team = nil
          invitation.save
        end

        it "does not save the invitation" do
          expect(invitation).not_to be_valid
          expect(invitation).to be_new_record
        end

        it "does not mark the user as invited" do
          expect(new_user).not_to be_invited
        end
      end
    end
  end

  describe "#event_log_statement" do
    context "when the record is saved" do
      before do
        invitation.save
      end

      it "include the name of the team" do
        log_statement = invitation.event_log_statement
        expect(log_statement).to include("A fine team")
      end

      it "include the email of the invitee" do
        log_statement = invitation.event_log_statement
        expect(log_statement).to include("rookie@example.com")
      end
    end

    context "when the record is not saved but valid" do
      it "includes the name of the team" do
        log_statement = invitation.event_log_statement
        expect(log_statement).to include("A fine team")
      end

      it "includes the email of the invitee" do
        log_statement = invitation.event_log_statement
        expect(log_statement).to include("rookie@example.com")
      end

      it "includes the word 'PENDING'" do
        log_statement = invitation.event_log_statement
        expect(log_statement).to include("PENDING")
      end
    end

    context "when the record is not saved and not valid" do
      it "includes INVALID" do
        invitation.user = nil
        log_statement = invitation.event_log_statement
        expect(log_statement).to include("INVALID")
      end
    end
  end
end
