<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 로고 밑 메뉴 -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar" data-sidebarbg="skin6">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/"
                                aria-expanded="false"><i data-feather="home" class="feather-icon"></i><span
                                    class="hide-menu">Index</span></a></li>
                        <!-- 사용 시 줄 표시 -->
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">메뉴</span></li>
                        
						<!-- 강의목록 -->
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/lectureList/${teacherId}/1"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">강의목록
                                </span></a>
                        </li>
                        <!-- 공지사항 -->
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/lmsNoticeList/1"
                                aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                                    class="hide-menu">공지사항
                                </span></a>
                        </li>
                        <!-- FAQ -->
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/faqList/1/total"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">FAQ
                                </span></a>
                        </li>
                        <!-- 강의계획서 등록 -->
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/addSyllabus"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">강의계획서 신청
                                </span></a>
                        </li>
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">기타</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/logout"
                                aria-expanded="false"><i data-feather="log-out" class="feather-icon"></i><span
                                    class="hide-menu">Logout</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>