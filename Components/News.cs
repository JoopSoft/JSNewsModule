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
    [TableName("JSNewsModule_News")]
    //setup the primary key for table
    [PrimaryKey("NewsId", AutoIncrement = true)]
    //configure caching using PetaPoco
    [Cacheable("News", CacheItemPriority.Default, 20)]
    //scope the objects to the ModuleId of a module on a page (or copy of a module on a page)
    [Scope("ModuleId")]
    class News
    {
        public int NewsId { get; set; }
        public int CustomOrderId { get; set; }
        public string NewsTitle { get; set; }
        public bool ShowNewsDate { get; set; }
        public string NewsDate { get; set; }
        public bool ShowNewsImg { get; set; }
        public string ImageUrl { get; set; }
        public string NewsTeaserText { get; set; }
        public string NewsContent { get; set; }
        public bool ShowReadMore { get; set; }
        public string ReadMoreText { get; set; }
        public bool ShowBack { get; set; }
        public string BackText { get; set; }
        public bool ShowHome { get; set; }
        public string HomeText { get; set; }
        public int ModuleId { get; set; }

    }
}
