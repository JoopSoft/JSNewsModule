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
        ///<summary>
        /// The ID of your object with the name of the News
        ///</summary>
        public int NewsId { get; set; }
        ///<summary>
        /// A string with the title of the News
        ///</summary>
        public string NewsTitle { get; set; }

        ///<summary>
        /// The date the news was created
        ///</summary>
        public string NewsDate { get; set; }

        ///<summary>
        /// A string with the image url of the News
        ///</summary>
        public string ImageUrl { get; set; }
        
        ///<summary>
        /// A string with the teaser text of the News
        ///</summary>
        public string NewsTeaserText { get; set; }

        ///<summary>
        /// A string with the content of the News
        ///</summary>
        public string NewsContent { get; set; }

        ///<summary>
        /// The ModuleId of where the object was created and gets displayed
        ///</summary>
        public int ModuleId { get; set; }

    }
}
