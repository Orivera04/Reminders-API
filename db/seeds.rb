# frozen_string_literal: true

begin
  puts '|-----------------------------------|'
  puts '|         Creating Seeds            |'
  puts '|-----------------------------------|'

  puts '\n ==> Creating Mark Down Styles'

  FormattingStyle.find_or_create_by(id: 1, name: 'MarkdownV2')
  FormattingStyle.find_or_create_by(id: 2, name: 'HTML')

  puts '\n ==> Creating Type Schedules'

  # Every day
  TypeSchedule.find_or_create_by(id: 1, name: 'Daily')
  # Specific days
  TypeSchedule.find_or_create_by(id: 2, name: 'Specific')

  puts '\n *** Finished ***'
end
