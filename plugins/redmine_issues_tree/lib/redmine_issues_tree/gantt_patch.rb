module RedmineIssuesTree
  module GanttPatch
    # Only override the issues ordering, not the rendering
    def issues=(issues)
      # Sort issues so that all children follow their parent, regardless of project/subproject
      @issues = issues.sort_by { |issue| issue.root_id.to_i * 1_000_000 + issue.lft.to_i }
    end
  end
end

Redmine::Helpers::Gantt.prepend(RedmineIssuesTree::GanttPatch)