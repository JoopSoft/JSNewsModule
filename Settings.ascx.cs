/*
' Copyright (c) 2016  JoopSoft
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/

using System;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using JS.Modules.JSNewsModule.Components;

namespace JS.Modules.JSNewsModule
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Settings class manages Module Settings
    /// 
    /// Typically your settings control would be used to manage settings for your module.
    /// There are two types of settings, ModuleSettings, and TabModuleSettings.
    /// 
    /// ModuleSettings apply to all "copies" of a module on a site, no matter which page the module is on. 
    /// 
    /// TabModuleSettings apply only to the current module on the current page, if you copy that module to
    /// another page the settings are not transferred.
    /// 
    /// If you happen to save both TabModuleSettings and ModuleSettings, TabModuleSettings overrides ModuleSettings.
    /// 
    /// Below we have some examples of how to access these settings but you will need to uncomment to use.
    /// 
    /// Because the control inherits from JSNewsModuleSettingsBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class Settings : JSNewsModuleModuleSettingsBase
    {
        #region Base Method Implementations

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// LoadSettings loads the settings from the Database and displays them
        /// </summary>
        /// -----------------------------------------------------------------------------
        public override void LoadSettings()
        {

            try
            {
                if (!IsPostBack)
                {
                    var sc = new SettingsController();
                    var cs = sc.LoadSettings();
                    foreach (CustomSettings s in cs)
                    {
                        if (s.SettingsId == ModuleId)
                        {
                            cbShowNewsDate.Checked = s.ShowNewsDate;
                            cbShowNewsImg.Checked = s.ShowNewsImg;
                            cbShowReadMore.Checked = s.ShowReadMore;
                            txtReadMoreText.Text = s.ReadMoreText;
                            cbShowBack.Checked = s.ShowBack;
                            txtBackText.Text = s.BackText;
                            cbShowHome.Checked = s.ShowHome;
                            txtHomeText.Text = s.HomeText;
                            return;
                        }
                        else
                        {
                            var ds = sc.LoadSingleSettings(0);
                            cbShowNewsDate.Checked = ds.ShowNewsDate;
                            cbShowNewsImg.Checked = ds.ShowNewsImg;
                            cbShowReadMore.Checked = ds.ShowReadMore;
                            txtReadMoreText.Text = ds.ReadMoreText;
                            cbShowBack.Checked = ds.ShowBack;
                            txtBackText.Text = ds.BackText;
                            cbShowHome.Checked = ds.ShowHome;
                            txtHomeText.Text = ds.HomeText;
                        }
                   }
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// UpdateSettings saves the modified settings to the Database
        /// </summary>
        /// -----------------------------------------------------------------------------
        public override void UpdateSettings()
        {
            try
            {
                bool isSettingsPresent = false;
                var sc = new SettingsController();
                var cs = sc.LoadSettings();
                foreach (CustomSettings s in cs)
                {
                    if (s.SettingsId == ModuleId)
                    {
                        isSettingsPresent = true;
                    }
                }
                if (!isSettingsPresent)
                {
                    var ns = new CustomSettings()
                    {
                        SettingsId = ModuleId,
                        ShowNewsDate = cbShowNewsDate.Checked,
                        ShowNewsImg = cbShowNewsImg.Checked,
                        ShowReadMore = cbShowReadMore.Checked,
                        ReadMoreText = txtReadMoreText.Text.Trim(),
                        ShowBack = cbShowBack.Checked,
                        BackText = txtBackText.Text.Trim(),
                        ShowHome = cbShowHome.Checked,
                        HomeText = txtHomeText.Text.Trim()
                    };
                    sc.AddSettings(ns);
                    Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
                }
                else
                {
                    var s = sc.LoadSingleSettings(ModuleId);
                    s.ShowNewsDate = cbShowNewsDate.Checked;
                    s.ShowNewsImg = cbShowNewsImg.Checked;
                    s.ShowReadMore = cbShowReadMore.Checked;
                    s.ReadMoreText = txtReadMoreText.Text.Trim();
                    s.ShowBack = cbShowBack.Checked;
                    s.BackText = txtBackText.Text.Trim();
                    s.ShowHome = cbShowHome.Checked;
                    s.HomeText = txtHomeText.Text.Trim();
                    sc.UpdateSettings(s);
                    Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
                }

            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        #endregion

    }
}