using gaz.Main;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity;
using System.Linq;
using System.Runtime.InteropServices;
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
    /// Логика взаимодействия для AddDist.xaml
    /// </summary>
    public partial class AddDist : Page
    {
        public AddDist()
        {
            InitializeComponent();
            cmbFilterStatus.SelectedValuePath = "name";
            cmbFilterStatus.DisplayMemberPath = "name";
            cmbFilterStatus.ItemsSource = dbConnect.entObj.PipeStatus.GroupBy(o => o.name).ToList();
        }

        private void menuBack_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txbCode.Text) ||
                    string.IsNullOrWhiteSpace(txbLoc.Text) ||
                    string.IsNullOrWhiteSpace(txbLength.Text) ||
                    string.IsNullOrWhiteSpace(txbPressure.Text) ||
                    string.IsNullOrWhiteSpace(cmbFilterStatus.Text))
                {
                    MessageBox.Show("Пожалуйста, заполните все поля.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                // Проверка: целое число для кода
                if (!int.TryParse(txbCode.Text, out int pipelineCode))
                {
                    MessageBox.Show("Код газопровода должен быть целым числом.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                var existingPipeline = dbConnect.entObj.Pipelines.FirstOrDefault(p => p.Code == pipelineCode);

                if (existingPipeline != null)
                {
                    MessageBox.Show("Трубопровод с таким кодом уже существует!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                // Проверка: дата установки
                if (dpInstallDate.SelectedDate == null)
                {
                    MessageBox.Show("Выберите дату.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                // Проверка: дата след инспекции
                if (dpNextInspectionDate.SelectedDate == null)
                {
                    MessageBox.Show("Выберите дату следующей инспекции.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                // Проверка: длина
                if (!decimal.TryParse(txbLength.Text, out decimal length) || length <= 0)
                {
                    MessageBox.Show("Длина должна быть положительным числом.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                // Проверка: давление
                if (!decimal.TryParse(txbPressure.Text, out decimal pressure) || pressure <= 0)
                {
                    MessageBox.Show("Давление должно быть положительным числом.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                // Поиск статуса
                var selectedStatus = dbConnect.entObj.PipeStatus.FirstOrDefault(x => x.name == cmbFilterStatus.Text);

                if (selectedStatus == null)
                {
                    MessageBox.Show("Выбранный статус не найден в базе данных.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                DateTime selectedDate = dpInstallDate.SelectedDate.Value;
                DateTime selectedDateNextInsp = dpNextInspectionDate.SelectedDate.Value;

                if (selectedDate > DateTime.Today)
                {
                    MessageBox.Show("Дата установки не может быть позже сегодняшнего дня.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                if (selectedDateNextInsp < DateTime.Today)
                {
                    MessageBox.Show("Дата следующей инспекции не может быть раньше сегодняшнего дня.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                // Создание объекта
                Pipeline distObj = new Pipeline()
                {
                    Code = pipelineCode,
                    Location = txbLoc.Text.Trim(),
                    InstallationDate = selectedDate,
                    NextInspectionDate = selectedDateNextInsp,
                    Length = length,
                    Pressure = pressure,
                    Status = selectedStatus.id
                };

                // Сохранение
                dbConnect.entObj.Pipelines.Add(distObj);
                dbConnect.entObj.SaveChanges();

                MessageBox.Show("Газопровод успешно добавлен.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                this.NavigationService.Navigate(new gaz());
            }
            catch 
            {
                MessageBox.Show(
                    "Введены неверные данные",
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning
                    );
            }
        }
        private const decimal Step = 0.1m;

        private void BtnInc_Click(object sender, RoutedEventArgs e)
        {
            if (decimal.TryParse(txbPressure.Text, out decimal value))
            {
                value += Step;
                txbPressure.Text = value.ToString("0.0");
            }
            else
            {
                MessageBox.Show("Введите корректное число.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void BtnDec_Click(object sender, RoutedEventArgs e)
        {
            if (decimal.TryParse(txbPressure.Text, out decimal value))
            {
                value -= Step;
                if (value < 0) value = 0;
                txbPressure.Text = value.ToString("0.0");
            }
            else
            {
                MessageBox.Show("Введите корректное число.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}
