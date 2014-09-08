class ReferralsController < ApplicationController


private
 def referral_params
    params.require(:referral).permit(
      :comment
      )
  end
end