package project.hrmsystem.model;

import java.util.List;

public class statisticsDto {

    private long totalCompletedWorks;
    private long totalEmployees;
    private double totalSalary;
    private long totalDepartments;
    private long totalUserCompletedWorks;

    private List<User> offEmployees;
    private List<Work> unAssignedWorks;


    public statisticsDto() {
    }

    public long getTotalCompletedWorks() {
        return totalCompletedWorks;
    }

    public void setTotalCompletedWorks(long totalCompletedWorks) {
        this.totalCompletedWorks = totalCompletedWorks;
    }

    public long getTotalEmployees() {
        return totalEmployees;
    }

    public void setTotalEmployees(long totalEmployees) {
        this.totalEmployees = totalEmployees;
    }

    public double getTotalSalary() {
        return totalSalary;
    }

    public void setTotalSalary(double totalSalary) {
        this.totalSalary = totalSalary;
    }

    public List<User> getOffEmployees() {
        return offEmployees;
    }

    public void setOffEmployees(List<User> offEmployees) {
        this.offEmployees = offEmployees;
    }

    public List<Work> getUnAssignedWorks() {
        return unAssignedWorks;
    }

    public void setUnAssignedWorks(List<Work> unAssignedWorks) {
        this.unAssignedWorks = unAssignedWorks;
    }

    public long getTotalDepartments() {
        return totalDepartments;
    }

    public void setTotalDepartments(long totalDepartments) {
        this.totalDepartments = totalDepartments;
    }

    public long getTotalUserCompletedWorks() {
        return totalUserCompletedWorks;
    }

    public void setTotalUserCompletedWorks(long totalUserCompletedWorks) {
        this.totalUserCompletedWorks = totalUserCompletedWorks;
    }
}
