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
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/manager/"
                                aria-expanded="false"><i data-feather="home" class="feather-icon"></i><span
                                    class="hide-menu">Index</span></a></li>
                        <!-- 사용 시 줄 표시 -->
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">메뉴 옵션 1</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/manager/lmsNoticeList/1"
                                aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                                    class="hide-menu">공지사항
                                    </span></a>
                        <li class="sidebar-item"> <a class="sidebar-link" href="${path}/manager/memberQueue/1/1"
                                aria-expanded="false"><i data-feather="tag" class="feather-icon"></i><span
                                    class="hide-menu">강사/학생 관리
                                </span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path }/manager/lectureList/1"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">강좌 목록</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/manager/classroomList/1"
                                aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                                    class="hide-menu">강의실 관리</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path }/manager/textbookList/1"
                                aria-expanded="false"><i data-feather="file-text" class="feather-icon"></i><span
                                    class="hide-menu">교재 관리</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path }/manager/faqList/강의/1"
                                aria-expanded="false"><i data-feather="file-text" class="feather-icon"></i><span
                                    class="hide-menu">FAQ</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path }/manager/memberList/1/선택안함"
                           		aria-expanded="false"><i data-feather="file-text" class="feather-icon"></i><span
                              		class="hide-menu">강사/학생리스트</span></a></li>
                         <li class="sidebar-item"> <a class="sidebar-link has-arrow"
                                aria-expanded="false"><i data-feather="file-text" class="feather-icon"></i><span
                                    class="hide-menu">chart</span></a>
                        <ul aria-expanded="false" class="collapse  first-level base-level-line">
                            <li class="sidebar-item">
                            	<a href="${path }/chart/studentInOutCount.jsp" class="sidebar-link">
                            		<span class="hide-menu">학생 가입/탈퇴 수</span>
                            	</a>
                           	</li>
                           	<li class="sidebar-item">
                           		<a href="${path }/chart/teacherInOutCount.jsp" class="sidebar-link">
                           			<span class="hide-menu">강사 가입/탈퇴 수</span>
                           		</a>
                          	</li>
                           	<li class="sidebar-item">
                           		<a href="${path }/chart/teacherAndStudentCount.jsp" class="sidebar-link">
                           			<span class="hide-menu">lms이용자 수</span>
                           		</a>
                          	</li>
                        </ul>
                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">기타</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${path}/manager/logout"
                                aria-expanded="false"><i data-feather="log-out" class="feather-icon"></i><span
                                    class="hide-menu">Logout</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>