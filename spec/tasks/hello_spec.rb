RSpec.describe 'hello' do
  include_context 'task'

  it 'puts greeting message to stdout' do
    expect { subject }.to output("Hello, it works!\n").to_stdout
  end
end
