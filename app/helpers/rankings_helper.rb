module RankingsHelper
  def choice_value
    return 1  if rank_choice == "great"
    return 0  if rank_choice == "ok"
    return -1 if rank_choice == "meh"
  end
end