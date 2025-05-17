using gaz.Main;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml;

namespace gaz.Pages
{
    /// <summary>
    /// Логика взаимодействия для auth.xaml
    /// </summary>
    public partial class auth : Page
    {
        public auth()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            dbConnect.entObj = new gazEntities();

            var user = dbConnect.entObj.authorization.FirstOrDefault(x => x.password == pass.Password && x.login == log.Text);
            if (user == null) wrong.Content = "Неверный логин или пароль";
            else 
            {
                Role.UserName = user.name;
                Role.UserRole = user.role;
                Role.UserId = user.id;
                if(user.role == "admin") this.NavigationService.Navigate(new Employee.DashBoard());
                if (user.role == "empl") this.NavigationService.Navigate(new Employee.DashBoard());
            }
        }
    }
}
