require "rake"

shared_context 'task' do
  let(:rake) { Rake::Application.new }
  let(:task_name) { self.class.top_level_description }
  let(:task_path) { "lib/tasks/#{task_name.split(':').first}" }
  let(:task) { rake[task_name] }

  subject { task.invoke }

  def loaded_files_excluding_current_rake_file
    $".reject { |file| file == "#{Dir.pwd}#{task_path}.rake}" }
  end

  before do
    Rake.application = rake
    Rake.application.rake_require(task_path, [Dir.pwd], loaded_files_excluding_current_rake_file)
  end
end
