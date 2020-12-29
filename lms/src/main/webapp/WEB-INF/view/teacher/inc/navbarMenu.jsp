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
                        <li class="nav-small-cap"><span class="hide-menu">메뉴 옵션 1</span></li>
                        
                        <!-- 공지사항 -->
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/lmsNoticeList/1"
                                aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                                    class="hide-menu">공지사항
                                </span></a>
                        </li>
						<!-- 질문게시판 목록 -->
                        <li class="sidebar-item"> <a class="sidebar-link" href="${path}/teacher/questionList/${teacherId}/1"
                                aria-expanded="false"><i data-feather="tag" class="feather-icon"></i><span
                                    class="hide-menu">질문게시판
                                </span></a>
                        </li>
						<!-- 강의목록 -->
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/lectureList/${teacherId}/1"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">강의목록
                                </span></a>
                        </li>
                        <!-- 과제 -->
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/teacher/reportList/${teacherId}/1"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">과제
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
                                    class="hide-menu">강의계획서
                                </span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i data-feather="file-text" class="feather-icon"></i><span
                                    class="hide-menu">4</span></a>
                            <!-- 메뉴안에 리스트 넣고 싶으면 사용 -->
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="form-inputs.html" class="sidebar-link"><span
                                            class="hide-menu"> 4-1
                                        </span></a>
                                </li>
                                <li class="sidebar-item"><a href="form-input-grid.html" class="sidebar-link"><span
                                            class="hide-menu"> 4-2
                                        </span></a>
                                </li>
                                <li class="sidebar-item"><a href="form-checkbox-radio.html" class="sidebar-link"><span
                                            class="hide-menu"> 4-3
                                        </span></a>
                                </li>
                            </ul>
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