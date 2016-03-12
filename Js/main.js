$(document).ready(function () {

    var $lnkAdd = '<i class="fa fa-plus-circle"></i>',
        $lnkEdit = '<i class="fa fa-pencil"></i>',
        $lnkDelete = '<i class="fa fa-trash-o"></i>',
        $lnkBack = '<i class="fa fa-angle-left"></i>',
        $lnkHome = '<i class="fa fa-home"></i>',
        $lnkAll = '<i class="fa fa-external-link"></i>',

        $lnkPrev = '<i class="fa fa-angle-left"></i>',
        $lnkNext = '<i class="fa fa-angle-right"></i>',
        $largeIcon = 'fa-lg';


    $('.rpt-accordion .link-edit').html($lnkEdit);
    $('.rpt-accordion .link-add').html($lnkAdd);
    $('.rpt-accordion .link-delete').html($lnkDelete);
    $('.rpt-accordion .link-all').prepend($lnkAll + ' ');
    $('.rpt-accordion .link-prev').html($lnkPrev);
    $('.rpt-accordion .link-next').html($lnkNext);

    //CUTTING TEXT BY ELLIPSIS PLUGIN
    if ($('.rpt-accordion .teaser-txt').length > 0) $('.rpt-accordion .teaser-txt').ellipsis({
                                                        row: 2,
                                                        onlyFullWords: true
                                                    });

    $('.details-view .link-home').prepend($lnkHome + ' ');
    $('.details-view .link-back').prepend($lnkBack + ' ');
    $('.details-view .link-edit').prepend($lnkEdit + ' ');
    $('.details-view .link-delete').prepend($lnkDelete + ' ');


    $('.rpt-list .link-edit').prepend($lnkEdit + ' ');
    $('.rpt-list .link-add').prepend($lnkAdd + ' ');
    $('.rpt-list .link-delete').prepend($lnkDelete + ' ');
    $('.rpt-list .link-all').prepend($lnkAll + ' ');
    $('.rpt-list .link-prev').prepend($lnkPrev + ' ');
    $('.rpt-list .link-next').append(' ' + $lnkNext);

    //CUTTING TEXT BY ELLIPSIS PLUGIN
    if ($('.rpt-list .teaser-txt').length > 0) $('.rpt-list .teaser-txt').ellipsis({
                                                   row: 5,
                                                   onlyFullWords: true
                                               });

    //COLLAPSING BY BOOTSTRAP FRAMEWORK
    $('.collapse').collapse();



});