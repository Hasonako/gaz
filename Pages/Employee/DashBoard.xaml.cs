using gaz.Main;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
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

namespace gaz.Pages.Employee
{
    /// <summary>
    /// Interaction logic for DashBoard.xaml
    /// </summary>
    public partial class DashBoard : Page
    {
        public DashBoard()
        {
            InitializeComponent();
            username.Text = "Добро пожаловать, " + Role.UserName;
            TodayDay.Text = DateTime.Now.ToString("dd.MM.yyyy");
            dgrEvents.ItemsSource = dbConnect.entObj.Event.Where(x => x.EmployeeID == Role.UserId).ToList();
            dgrTasks.ItemsSource = dbConnect.entObj.UserTask.Where(x => x.EmployeeId == Role.UserId).ToList();
        }

        private void menuExit_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы уверены, что хотите выйти?", "Выйти?", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                Application.Current.Shutdown();
        }

        private void PipeLines_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new gaz());
        }
    }
}
