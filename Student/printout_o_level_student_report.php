

<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);



class OLevelStudentReport {
    private $student_id  = 0;
    private $conn = null;

    public $aggregates = 0;
    public $is_missing_core = false;

    function __construct ($db_conn, $student_id)
    {
        $this->student_id = $student_id;
        $this->conn = $db_conn;
    }

    function __destruct ()
    {
        $this->conn = null;
        $student_id  = 0;
    }

    public function getStudenDetatils ()
    {
        $sql = "SELECT STUDENTS.* 
            FROM o_level_students  AS STUDENTS
            WHERE  STUDENTS.id = {$this->student_id} ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $results = $stmt->fetch(PDO::FETCH_OBJ);
        return $results; 
    }


    public function getStudentSchoolDetails ()
    {

        $sql = "SELECT SCHOOLS.* 
            FROM o_level_students  AS STUDENTS
            JOIN schools AS SCHOOLS ON SCHOOLS.id = STUDENTS.school_id
            WHERE  STUDENTS.id = {$this->student_id} ";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $results = $stmt->fetch(PDO::FETCH_OBJ);
        return $results;
    }

    public function getStudentSubjectMarks ()
    {
        //get subjects for student
        $sql = "SELECT SUBJECTS.id, SUBJECTS.name, IF((MIN(MARKS.marks) = -1 OR SUBJECTS.no_of_papers_done <> COUNT(MARKS.marks)), 'X', AVG(MARKS.marks) ) AS average_score, PAPERS.subject_id, SUBJECTS.is_core
            FROM `o_level_student_marks` AS MARKS
            JOIN o_level_subejcts_papers AS PAPERS ON PAPERS.id = MARKS.subject_paper_id
            JOIN o_level_subejcts AS SUBJECTS ON SUBJECTS.id = PAPERS.subject_id
            WHERE MARKS.student_id = {$this->student_id} GROUP BY PAPERS.subject_id";

        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_OBJ);

        $data = [];
        $aggregates =  0;
        $found_subject_ids = [];
        foreach ($results as $subject) {
            //grade student from here
            $found_subject_ids[] = $subject->id;

            $subject_aggregate = 0;
            if (($subject->average_score == 'X')) {
                $subject_aggregate = 'X';
                $subject->grade = 'X';
            } elseif ($subject->average_score >= 80) {
                $subject_aggregate = 1;
                $subject->grade = 'D1';
            } elseif ($subject->average_score >= 75) {
                $subject_aggregate = 2;
                $subject->grade = 'D2';
            } elseif ($subject->average_score >= 66) {
                $subject_aggregate = 3;
                $subject->grade = 'C3';
            }elseif ($subject->average_score >= 60) {
                $subject_aggregate = 4;
                $subject->grade = 'C4';
            }elseif ($subject->average_score >= 55) {
                $subject_aggregate = 5;
                $subject->grade = 'C5';
            }elseif ($subject->average_score >= 50) {
                $subject_aggregate = 6;
                $subject->grade = 'C6';
            }elseif ($subject->average_score >= 45) {
                $subject_aggregate = 7;
                $subject->grade = 'P7';
            } elseif ($subject->average_score >= 35) {
                $subject_aggregate = 8;
                $subject->grade = 'P8';
            }else {
                $subject_aggregate = 9;
                $subject->grade = 'F9';
            }
            $subject->subject_aggregate = $subject_aggregate;

            $data[] = $subject;
        }

        $aggregates = $this->getBestDone8($data);

        $this->aggregates = $aggregates;

        // find missing core subjects
        $missing_subjects = $this->getMissingCoreSubejcts($found_subject_ids);

        if (!empty($missing_subjects)) {
            $this->is_missing_core = true;
        }

        return array_merge($missing_subjects, $results );
    }


    public function getBestDone8 ($subjects_details)
    {
        $new_results = []; // max initial size is 8

        foreach ($subjects_details as $key => $subjects_detail) {
            if ($subjects_detail->grade == 'X')
                    continue;

            if (count($new_results) < 8) {
                $new_results[] = $subjects_detail;
                continue;
            } else { // means stack is already ull with 8

                // check if new subjuect is lower than some that exists
                foreach ($new_results as $key2 => $new_result) {
                    if ($new_result->subject_aggregate > $subjects_detail->subject_aggregate) {
                        // shift paper and break
                        $new_result[$key2] = $subjects_detail;
                        break;
                    }
                }
            }
        }

        // grade best 8 done
        $best_done_agg = 0;
        foreach ($new_results as $key => $new_result) {
            $best_done_agg += $new_result->subject_aggregate;
        }

        return $best_done_agg;

    }

    /**
     * This will check for the missing subjects that are core
     * @param student subjects data
     * @return array mussing subjects
     */
    private function getMissingCoreSubejcts($found_subject_ids)
    {
        $all_ids = implode(',', $found_subject_ids);
        if (empty($all_ids)){
            $all_ids = "-1";
        }

        $stmt = $this->conn->query("SELECT `id`, `name`, 'X' AS average_score, 'X' AS grade 
            FROM o_level_subejcts WHERE id NOT IN ($all_ids) AND is_core = '1'; ");

        return $stmt->fetchAll(PDO::FETCH_OBJ);

    }

    public function getGrade ()
    {
        $grade = 'X';
        if ($this->is_missing_core) {
            return 'X';
        }elseif ($this->aggregates >= 8 && $this->aggregates <= 32) {
            return 1;
        } elseif ($this->aggregates > 32 && $this->aggregates <= 45) {
            return 2;
        } elseif ($this->aggregates > 45 && $this->aggregates <= 58) {
            return 3;
        } elseif ($this->aggregates > 58 && $this->aggregates <= 68) {
            return 4;
        } elseif ($this->aggregates > 68 && $this->aggregates <= 72) {
            return 4;
        } else {
            return "U";
        }
    }
}


$student_id_collection = $_GET['student_ids'];
$studet_ids = explode(',', $student_id_collection);

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>O Level Student Report</title>
</head>
<body>
    
<main >

    <header>
        <div class="hide-on-print">
            <button onClick="printReport()">Print</button>
        </div>
    </header>

    <?php
        require '../Includes/Class/db_connect.php';
        $db_conn = new DatabaseConnection ();
        // $db_conn->conn;
        $page_count = 0;
        foreach ($studet_ids as $key => $student_id):
            $page_count++;
            $OLevelStudentReport = new OLevelStudentReport ($db_conn->conn, $student_id);
            $student_details = $OLevelStudentReport->getStudenDetatils();
            $school_details = $OLevelStudentReport->getStudentSchoolDetails();
            $studentSubejcts = $OLevelStudentReport->getStudentSubjectMarks();
    ?>
        <!-- begin section for generaing students report -->
        <section style="border:solid; padding: 10px; width: 800px; margin:auto; background-image:url('../Images/watermark.png'); background-repeat:no-repeat; background-size: cover; background-position: center;">
            <div style="text-align:center;">

            <table style="margin-left: 5%;">
                <tr>
                    <td>
                        <img src="../Images/logo.jpeg" style="width:130px; height: 130px;" alt="">
                    </td>
                    <td>
                        <h2 stlye="display:inline">KAMPALA INTEGRATED SECONDARY SCHOOLS' <br> EXAMINATION BUREAU 2019</h2>
                    </td>
                </tr>

            </table>
                
                <h4 style="margin:0px;">MOCK PASSLIP</h4>
            </div>

            <table style="margin-left:10%; ">
                <tr>
                    <th>Student's Name</th>
                    <td><span><?=$student_details->second_name?> <?=$student_details->first_name?></span>  </td>

                    <th>School</th>
                    <td><span><?=$school_details->name?></span>  </td>

                    <th>District</th>
                    <td><span><?=$school_details->district?></span>  </td>

                    <th>Center No:</th>
                    <td><span><?=$school_details->center_no?></span>  </td>

                </tr>
            </table>


            <div style="text-align:center;">
                <table style="margin-left:auto; margin-right:auto;">
                    <thead>
                        <tr>
                            <th style="text-align:left; width:20px;">&nbsp;&nbsp;&nbsp;</th>
                            <th style="text-align:left; ">Subject</th>
                            <th style="text-align:center; width:200px;">Score</th>
                            <th style="text-align:center; width:200px;">Grade</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            foreach ($studentSubejcts as $counter => $value):
                        ?>
                            <tr>
                                <td style="text-align:left; width:20px;"><?=($counter + 1)?></td>
                                <td style="text-align:left; "><?=$value->name?></td>
                                <td style="text-align:center; width:200px;"><?=round($value->average_score, 0)?></td>
                                <td style="text-align:center; width:200px;"><?=$value->grade?></td>
                            </tr>
                        <?php
                            endforeach;
                        ?>
                        <tr>
                            <td colspan="2"><b>GRADE:&nbsp;&nbsp;</b> AGGREGATE&nbsp;<?=$OLevelStudentReport->aggregates;?></td>
                            <td style="text-align:center; width:200px;"></td>
                            <td style="text-align:center; width:200px;">***RESULT <?=$OLevelStudentReport->getGrade();?>***</td>
                        </tr>
                    </tbody>
                </table>
            </div>
                        
            <br>
            <div>
                <div style="text-align:center;">
                    <span ><em>"Quality assessment for reliable results"</em></span>
                </div>
            </div>

        </section>
        <br><br>
        <!-- end section for generaing students report -->
        
        <?php
            if ($page_count == 2):
            $page_count = 0;
        ?>
            <p style = "page-break-before:always;"></p>
        <?php
            endif;
        ?>

    <?php
        endforeach;
    ?>
    
</main>


<script>

    function printReport ()
    {
        window.print();
    }
</script>


</body>
</html>