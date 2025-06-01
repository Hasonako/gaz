using gaz.Main;
using System;
using System.Collections.Generic;
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
    /// Interaction logic for AdminPage.xaml
    /// </summary>
    public partial class AdminPage : Page
    {
        public AdminPage()
        {
            InitializeComponent();
        }

        private void EmployeeBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Empl());
        }

        private void PipelinesBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new gaz());
        }

        private void menuLogout_Click(object sender, RoutedEventArgs e)
        {
            Role.UserId = 0;
            Role.UserName = "";
            Role.UserRole = "";
            NavigationService.Navigate(new auth());
        }

        private void menuExit_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы уверены, что хотите выйти?", "Выйти?", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                Application.Current.Shutdown();
        }
    }
}
