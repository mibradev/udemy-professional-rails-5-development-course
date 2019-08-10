module PagesHelper
  def skill_class(skill)
    case skill.percent_utilized
    when (66..100) then 'bg-success'
    when (33...66) then 'bg-warning'
    else 'bg-danger'
    end
  end
end
