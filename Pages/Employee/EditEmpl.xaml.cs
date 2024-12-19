using gaz.Main;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Security.Cryptography;
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
using static System.Runtime.CompilerServices.RuntimeHelpers;

namespace gaz.Pages
{
    public partial class EditEmpl : Page
    {
        private authorization EmplObj;
        public EditEmpl(object imp)
        {
            InitializeComponent();
            DataContext = imp;
            var mid = TypeDescriptor.GetProperties(DataContext)["id"].GetValue(DataContext);
            EmplObj = dbConnect.entObj.authorization.FirstOrDefault(e => e.id == (int)mid);

            cmbFilterRole.SelectedValuePath = "role";
            cmbFilterRole.DisplayMemberPath = "role";
            cmbFilterRole.ItemsSource = dbConnect.entObj.authorization.GroupBy(e => e.role).ToList();
            cmbFilterRole.SelectedValue = EmplObj.role;
        }

        private void menuBack_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new Empl());
        }

        private void menuDlt_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы уверены?", "Удаление сотрудника", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                dbConnect.entObj.authorization.Remove(EmplObj);
                dbConnect.entObj.SaveChanges();
                this.NavigationService.Navigate(new Empl());
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            EmplObj.name = txbName.Text;
            EmplObj.login = txbLogin.Text;
            EmplObj.password = txbPassword.Text;
            EmplObj.role = cmbFilterRole.Text;
            dbConnect.entObj.SaveChanges();
            MessageBox.Show(
                "Сохранено",
                "Уведомление",
                MessageBoxButton.OK,
                MessageBoxImage.Warning
                );
            this.NavigationService.Navigate(new Empl());
        }
    }
}
