package org.big.board.controller;

import java.util.List;

import org.big.board.dto.CourseDto;
import org.big.board.service.CourseService;
import org.big.board.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/course/courseList.do")
    public ModelAndView openCourseList() throws Exception {
        ModelAndView mv = new ModelAndView("thymeleaf/course/courseList");

        List<CourseDto> list = courseService.selectCourseList();
        mv.addObject("list", list);
        return mv;
    }
    
    @RequestMapping("/course/courseUserList.do")
    public ModelAndView openCourseUserList() throws Exception {
        ModelAndView mv = new ModelAndView("thymeleaf/course/courseUserList");

        List<CourseDto> list = courseService.selectCourseList();
        mv.addObject("list", list);
        return mv;
    }


    @RequestMapping("/course/courseWrite.do")
    public String openCourseWrite() throws Exception {
        return "thymeleaf/course/courseWrite";
    }

    @RequestMapping("/course/courseInsert.do")
    public String insertCourse(CourseDto course) throws Exception {
        courseService.insertCourse(course);
        return "redirect:/course/courseList.do";
    }

    @RequestMapping("/course/courseDetail.do")
    public ModelAndView openCourseDetail(@RequestParam int cno) throws Exception {
        ModelAndView mv = new ModelAndView("thymeleaf/course/courseDetail");
        CourseDto courseDetail = courseService.selectCourseDetail(cno);
        mv.addObject("course", courseDetail);
        return mv;
    }

    @RequestMapping("/course/courseUpdate.do")
    public String updateCourse(CourseDto course) throws Exception {
        courseService.updateCourse(course);
        return "redirect:/course/courseList.do";
    }

    @RequestMapping("/course/deleteCourse.do")
    public String deleteCourse(@RequestParam int cno) throws Exception {
        courseService.deleteCourse(cno);
        return "redirect:/course/courseList.do";
    }
    @RequestMapping("/course/courseUserResult")
    public ModelAndView courseUserResult(@RequestParam int cno, @RequestParam String m_id) {
        ModelAndView mv = new ModelAndView("thymeleaf/course/orderResult");
        
        try {
            CourseDto course = courseService.selectCourseDetail(cno);
            mv.addObject("m_id", m_id);
            mv.addObject("course", course); 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }



}
