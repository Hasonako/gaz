using gaz.Main;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace gaz.Pages
{
    /// <summary>
    /// Логика взаимодействия для Empl.xaml
    /// </summary>
    public partial class Empl : Page
    {
        public Empl()
        {
            InitializeComponent();
            emp.ItemsSource = dbConnect.entObj.Users.ToList();
            lvTasks.ItemsSource = dbConnect.entObj.UserTasks.ToList();
        }
        private void emp_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (emp.SelectedItem != null)
            {
                var imp = emp.SelectedItem;
                this.NavigationService.Navigate(new EditEmpl(imp));
            }
        }
        private void ApplyFilters()
        {
            string searchName = txbSearchName.Text.ToLower();
            var query = dbConnect.entObj.Users.AsQueryable();

            if (!string.IsNullOrEmpty(txbSearchName.Text))
                query = query.Where(m => m.name.ToLower().Contains(searchName));

            emp.ItemsSource = query.ToList();
        }
        private void menuAddEmpl_Click(object sender, RoutedEventArgs e) => this.NavigationService.Navigate(new AddEmpl());
        private void menuBack_Click(object sender, RoutedEventArgs e)
        {
            if (Role.UserRole == "Admin") this.NavigationService.Navigate(new Employee.AdminPage());
            if (Role.UserRole == "ComUser") this.NavigationService.Navigate(new gaz());
        }     
        private void txbSearchName_TextChanged(object sender, TextChangedEventArgs e) => ApplyFilters();
        private void menuAddTask_Click(object sender, RoutedEventArgs e) => NavigationService.Navigate(new Employee.AddTaskPage());

        private void emp_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            if(emp.SelectedItem != null)
            {
                var selectedEmployee = emp.SelectedItem as User;
                var tasks = dbConnect.entObj.UserTasks.Where(t => t.EmployeeId == selectedEmployee.id).ToList();

                if (tasks.Count == 0)
                {
                    MessageBox.Show("У этого сотрудника нет задач.");
                }

                lvTasks.ItemsSource = tasks;
            }
        }
    }
}
