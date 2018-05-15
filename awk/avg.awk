BEGIN {
    printf("%-8s %-8s %-8s\n","name","avg","grade")
}
{
    total=$2+$3+$4+$5+$6
    avg=total/5
    if (avg >= 90) grade="A"
    else if (avg >= 80) grade="B"
    else if (avg >= 70) grade="C"
    else if (avg >= 60) grade="D"
    else grade="F"
    printf("%-8s %-8s %-8s\n",$1,avg,grade)
    }
