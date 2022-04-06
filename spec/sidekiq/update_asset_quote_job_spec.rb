# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe UpdateAssetQuoteJob, type: :job do
  it 'calls a job' do
    expect do
      UpdateAssetQuoteJob.perform_async('Asset')
    end.to change(UpdateAssetQuoteJob.jobs, :size).by(1)
  end
end
