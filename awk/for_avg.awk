BEGIN {OFS="\t"}

{
    total=0
    for (i=2;i<=NF;i++)
        total+=$i
    avg=total/(NF-1)
    student_avg[NR]=avg
    if (avg >= 90) grade="A"
    else if (avg >= 80) grade="B"
    else if (avg >= 70) grade="C"
    else if (avg >= 60) grade="D"
    else grade="F"
    ++class_grade[grade]
    print $1,avg,grade
}

END {
    for (x=1;x<=NR;x++)
        class_avg_total+=student_avg[x]
    class_average=class_avg_total/NR
    for (x=1;x<=NR;x++)
        if (student_avg[x] >= class_average)
            ++above_average
        else
            ++below_average
    print ""
    print "class average: ",class_average
    print "at or above average: ", above_average
    print "below average: ",below_average
    for (letter_grade in class_grade)
        print letter_grade ":",class_grade[letter_grade]|"sort"
    }
