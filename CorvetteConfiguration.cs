using System;

public class CorvetteConfiguration
{
    String color, trim;
    Boolean frontLift,wingSpoiler,doors,floorMats;

    static string photoString;
    static string colorString;
    static string wingsString;
    static string downorupString;
    static string baseImageString;

    int basePrice = 67495;
    int frontLiftCost = 1495;//Not available when 1lt trim is selected
    int premiumTrim = 6800;
    int wingSpoilerCost = 1150;
    int illuminatedDoorCost = 345;
    int carpetedMatsCost = 235;
    int redColorPrice = 995;
    int totalPrice = 0;

    public CorvetteConfiguration()
	{
        photoString = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.white.top.up.bmp";
        colorString = "white";
        wingsString = "";
        downorupString = "up";
        baseImageString = "http://itec-web-dev04.radford.edu/ews/corvette/corvette." + colorString + ".top." + downorupString + "." + wingsString + ".bmp";

    }

    public String getCurrentImage()
    {

        if (colorComboxBox.SelectedIndex == 0)
        {
            if (wingCheckBox.Checked == true)
            {
                if (downOrUpCheckbox1.Checked == true)
                {
                    pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.white.top.down.wing.bmp";
                }
                else if (downOrUpCheckbox1.Checked == false)
                {
                    pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.white.top.up.wing.bmp";
                }

            }
            else
            {
                if (downOrUpCheckbox1.Checked == true)
                {
                    pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.white.top.down.bmp";
                }
                else if (downOrUpCheckbox1.Checked == false)
                {
                    pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.white.top.up.bmp";
                }
            }

        }
        else if (colorComboxBox.SelectedIndex == 1)
        {
            if (wingCheckBox.Checked == true)
            {
                if (downOrUpCheckbox1.Checked == true)
                {
                    pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.red.top.down.wing.bmp";
                }
                else if (downOrUpCheckbox1.Checked == false)
                {
                    pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.red.top.up.wing.bmp";
                }

            }
            else
            {
                if (downOrUpCheckbox1.Checked == true)
                {
                    pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.red.top.down.bmp";
                }
                else if (downOrUpCheckbox1.Checked == false)
                {
                    pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.red.top.up.bmp";
                }
            }

        }
        return pictureBox1.ImageLocation;
    }

    private int GetBasePrice()
    {
        if (colorComboxBox.SelectedIndex == 0)
        {
            return basePrice;
        }
        else if (colorComboxBox.SelectedIndex == 1)
        {
            return basePrice + redColorPrice;
        }
        else
        {
            return 0;
        }
    }

    private int GetTrimPrice()
    {
        if (trimTypeComboBox.SelectedIndex == 1)
        {
            return premiumTrim;

        }
        else
        {
            return 0;
        }
    }

    private string getFinalPrice()
    {
        int colorPrice;
        int trimPrice;
        int memoryFoamPrice;
        int wingsPrice;
        int doorPrice;
        int floorMatsPrice;
        //1)Color price
        //2)Trim type
        //3)Memory system or not
        //4)rear wings
        //5)Door plates
        //6) Floor mats
        colorPrice = GetColorPrice();
        trimPrice = GetTrimPrice();
        memoryFoamPrice = GetFoamPrice();
        wingsPrice = GetWingsPrice();
        doorPrice = GetDoorPrice();
        floorMatsPrice = GetFloorPrice();

        if (colorPrice > 0)
        {
            if (colorPrice > basePrice)
            {
                priceLabel.Text = "$" + String.Format("{0:n0}", basePrice) + Environment.NewLine +
                "  + $" + String.Format("{0:n0}", redColorPrice);
                colorString = "red";
            }
            else if (colorPrice == basePrice)
            {
                priceLabel.Text = "$" + String.Format("{0:n0}", basePrice);
                colorString = "white";
            }


            if (trimPrice > 0)
            {
                priceLabel.Text = priceLabel.Text + Environment.NewLine +
                   "  + $" + String.Format("{0:n0}", premiumTrim);
            }

            if (memoryFoamPrice > 0)
            {
                priceLabel.Text = priceLabel.Text + Environment.NewLine +
                   "  + $" + String.Format("{0:n0}", memoryFoamPrice);
            }

            if (wingsPrice > 0)
            {
                priceLabel.Text = priceLabel.Text + Environment.NewLine +
                   "  + $" + String.Format("{0:n0}", wingsPrice);

                wingsString = "wing";
            }

            if (doorPrice > 0)
            {
                priceLabel.Text = priceLabel.Text + Environment.NewLine +
                   "  + $" + String.Format("{0:n0}", doorPrice);
            }

            if (floorMatsPrice > 0)
            {
                priceLabel.Text = priceLabel.Text + Environment.NewLine +
                   "  + $" + String.Format("{0:n0}", floorMatsPrice);
            }

        }
        else
        {
            priceLabel.Text = "";
        }

        return priceLabel.Text;
    }

    private void ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
    {

        switch (photosComboBox.SelectedIndex)
        {
            case 0:
                pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.white.top.up.bmp";
                break;
            case 1:
                pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.white.top.down.bmp";
                break;
            case 2:
                pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.red.top.up.bmp";
                break;
            case 3:
                pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.red.top.down.bmp";
                break;
            case 4:
                pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.white.top.up.wing.bmp";
                break;
            case 5:
                pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.white.top.down.wing.bmp";
                break;
            case 6:
                pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.red.top.up.wing.bmp";
                break;
            case 7:
                pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.red.top.down.wing.bmp";
                break;


        }

        if (photosComboBox.SelectedIndex == 1)
        {
            pictureBox1.ImageLocation = "http://itec-web-dev04.radford.edu/ews/corvette/corvette.white.top.down.bmp";
        }
    }

    private void TrimTypeLabel_Click(object sender, EventArgs e)
    {
        Form3 f = new Form3();
        f.Show();
    }

    private void FrontLiftCheckbox_Click(object sender, EventArgs e)
    {

        if (frontLiftCheckbox.Checked == true)
        {
            priceLabel.Text = getPriceLabel();

        }
        else if (frontLiftCheckbox.Checked == false)
        {
            priceLabel.Text = getPriceLabel();
        }
    }

    private int GetFloorPrice()
    {
        if (carpetFloorsCheckBox.Checked == true)
        {
            return carpetedMatsCost;
        }
        else
        {
            return 0;
        }
    }

    private int GetDoorPrice()
    {
        if (stillPlatesCheckBox.Checked == true)
        {
            return illuminatedDoorCost;
        }
        else
        {
            return 0;
        }
    }

    private int GetWingsPrice()
    {
        if (wingCheckBox.Checked == true)
        {
            return wingSpoilerCost;
        }
        else
        {
            return 0;
        }
    }

    private int GetFoamPrice()
    {
        if (frontLiftCheckbox.Checked == true)
        {
            return frontLiftCost;
        }
        else
        {
            return 0;
        }
    }

    private void WingCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        if (wingCheckBox.Checked == true)
        {
            wingsString = "wing";
        }
        else
        {
            wingsString = "";
        }
        getPriceLabel();
    }

    private void StillPlatesCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        getPriceLabel();
    }

    private void CarpetFloorsCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        getPriceLabel();
    }

    private int GetColorPrice()
    {
        if (colorComboxBox.SelectedIndex == 0)
        {
            return basePrice;
        }
        else if (colorComboxBox.SelectedIndex == 1)
        {
            return basePrice + redColorPrice;
        }
        else
        {
            return 0;
        }
    }


    


}
