using gaz.Main;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity.Infrastructure;
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
using static gaz.MainWindow;

namespace gaz.Pages
{
    public partial class gaz : Page
    {
        public gaz()
        {
            InitializeComponent();
            username.Text = "Добро пожаловать, " + Role.UserName;
            
            if (Role.UserRole == "admin")
            { 
                MenuItem Emlpoyee = new MenuItem();
                Emlpoyee.Header = "Сотрудники";
                Emlpoyee.Click += new RoutedEventHandler(menuEmpl_Click);
                MainMenu.Items.Insert(1, Emlpoyee);
            }

            if (Role.UserRole == "empl")
            {

            }

            ApplyFilters();
        }

        private void txbSearchName_TextChanged(object sender, TextChangedEventArgs e)
        {
            ApplyFilters();
        }

        private void txbSearchCode_TextChanged(object sender, TextChangedEventArgs e)
        {
            ApplyFilters();
        }

        private void menuAdd_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new AddDist());
        }
        private void ApplyFilters()
        {
            string searchText = txbSearchName.Text.ToLower();
            var query = dbConnect.entObj.Pipelines.AsQueryable();
            if (!string.IsNullOrEmpty(txbSearchCode.Text))
            {
                int searchCode = Convert.ToInt32(txbSearchCode.Text);

                query = query.Where(m => m.Code == searchCode);
            }

            if (!string.IsNullOrEmpty(txbSearchName.Text))
            {
                query = query.Where(m => m.Location.ToLower().Contains(searchText));
            }
            dist.ItemsSource = query.ToList();
        }
        private void menuExit_Click(object sender, RoutedEventArgs e)
        {
            
            if (MessageBox.Show("Вы уверены, что хотите выйти?", "Выйти?", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                Application.Current.Shutdown();
        }

        private void dist_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dist.SelectedItem != null)
            {
                var mat = dist.SelectedItem;
                this.NavigationService.Navigate(new EditDist(mat));
            }
        }

        private void menuEmpl_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new Empl());
        }

        private void cmbFilterPlace_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ApplyFilters();
        }

        private void MenuBack_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }
    }
}
