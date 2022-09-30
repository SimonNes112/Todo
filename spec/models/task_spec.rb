require 'rails_helper'

describe Task do

    let(:user) do
        FactoryBot.create(:user)
    end

    let(:task) do
        FactoryBot.create(:task)
    end

    it 'requires a user' do
        task = Task.new(user: user)
        task.valid?

        expect(task.errors.added?(:user, :blank)).to be_falsey
    end

    it 'requires a date in the future' do
        task = Task.new(date: Date.today - 1.day)
        task.valid?

        puts task.errors.inspect

        expect(task.errors.key?(:date)).to be_truthy
    end

    it 'expects a date in the future' do
        task = Task.new(date: Date.today + 1.day)
        task.valid?

        puts task.errors.inspect

        expect(task.errors.key?(:date)).to be_falsey
    end

    it 'expects task to have a task' do
        task = Task.new(task: "new task")
        task.valid?

        puts task.errors.inspect

        expect(task.errors.key?(:task)).to be_falsey
    end

    it 'expects task to not have a task' do
        task = Task.new
        task.valid?

        puts task.errors.inspect

        expect(task.errors.added?(:task, :blank)).to be_truthy
    end
end