module DashboardHelper
	
  
	def employees_by_project
    column_chart employees_by_project_employees_path library: {
      title: {text: 'Employees by project'},
      yAxis: {
         # allowDecimals: false,
         title: {
             text: 'Name'
         }
      },
      xAxis: {
        title: {
          text: 'Project count'
        }
      }
    }
  end

end
