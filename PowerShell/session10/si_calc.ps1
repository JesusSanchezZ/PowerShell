# Automatización: Básica

#============================================
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Width = 500
$form.Height = 250
$form.Text = $title;
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$form.AutoSize = $false

############ Definición de una etiqueta de texto
$textlabel = New-Object System.Windows.Forms.Label
$textlabel.Left = 25;
$textlabel.Top = 15
$textlabel.Text = 'Principal'

########### Etiqueta de texto 2
$textlabel2 = New-Object System.Windows.Forms.Label
$textlabel2.Left = 25
$textlabel2.Top = 50
$textlabel2.Text = 'Rate'

########### Etiqueta de texto 3
$textlabel3 = New-Object System.Windows.Forms.Label
$textlabel3.Left = 25
$textlabel3.Top = 85
$textlabel3.Text = 'Time(in years)'

########### Caja de texto 4
$textlabel4 = New-Object System.Windows.Forms.Label
$textlabel4.Left = 25
$textlabel4.Top = 155
$textlabel4.Text = 'Interest Amount'

########### Caja de texto 5
$textlabel5 = New-Object System.Windows.Forms.Label
$textlabel5.Left = 155
$textlabel5.Top = 155
$textlabel5.Text = '----'

########### Caja de texto para entrada
$Principal = New-Object System.Windows.Forms.TextBox
$principal.Left = 150;
$Principal.top = 10
$Principal.Width = 200

########## Caja de texto 2
$Rate = New-Object System.Windows.Forms.TextBox
$Rate.Left = 150
$Rate.Top = 50
$Rate.Width = 200

########## Caja de texto 3
$Time = New-Object System.Windows.Forms.TextBox
$Time.Left = 150
$Time.top = 90
$Time.Width = 200

########## Definición de valores para las cajas de texto
$defaultValue = "0"
$Principal.Text = $defaultValue
$Rate.Text = $defaultValue
$Time.Text = $defaultValue

########## Definición de un botón
$button = New-Object System.Windows.Forms.Button
$button.Left = 360
$button.Top = 85
$button.Width = 100
$button.Text = 'Enter'

########## Evento
$eventHandler = [System.EventHandler]{
    $Principal.Text
    $Rate.Text
    $Time.Text

    $principal_amount = [double] $Principal.Text
    $interest_rate = [double] $Rate.Text
    $time_period = [double] $Time.Text

    $interest = ($principal_amount * $interest_rate * $time_period) / 100
    $form.Text = "Your will have to pay interest of $interest currency units"

    $textlabel5.Text = $interest
    
    #$form.Close()
}

$button.Add_Click($eventHandler)


########### 
$form.Controls.Add($button)
$form.Controls.Add($textlabel)
$form.Controls.Add($textlabel2)
$form.Controls.Add($textlabel3)
$form.Controls.Add($textlabel4)
$form.Controls.Add($textlabel5)
$form.Controls.Add($Principal)
$form.Controls.Add($Rate)
$form.Controls.Add($Time)
$ret = $form.ShowDialog()


