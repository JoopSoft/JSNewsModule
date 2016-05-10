/*
' Copyright (c) 2016 JoopSoft
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
using System.Web.Caching;
using DotNetNuke.Common.Utilities;
using DotNetNuke.ComponentModel.DataAnnotations;
using DotNetNuke.Entities.Content;

namespace JS.Modules.JSNewsModule.Components
{
    [TableName("JSNewsModule_Settings")]
    //setup the primary key for table
    [PrimaryKey("SettingsId", AutoIncrement = false)]
    //configure caching using PetaPoco
    [Cacheable("CustomSettings", CacheItemPriority.Default, 20)]
    //scope the objects to the ModuleId of a module on a page (or copy of a module on a page)
    [Scope("ModuleId")]
    class CustomSettings
    {
        public int SettingsId { get; set; }
        public string ViewMode { get; set; }
        public bool UsePaging { get; set; }
        public int NewsPerPage { get; set; }
        public bool ShowNewsDate { get; set; }
        public bool ShowNewsImg { get; set; }
        public bool ShowReadMore { get; set; }
        public string ReadMoreText { get; set; }
        public bool ShowBack { get; set; }
        public string BackText { get; set; }
        public bool ShowHome { get; set; }
        public string HomeText { get; set; }
        public bool ShowCustomOrderId { get; set; }
        public bool IsSorted { get; set; }
        public string SortBy { get; set; }
        public string SortType { get; set; }
        public bool ShowNewsButton { get; set; }
        public string NewsButtonText { get; set; }
        public string NewsButtonPage { get; set; }
    }
}
