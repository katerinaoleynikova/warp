version 1.0

import "../verification/VerifyMetrics.wdl" as MetricsVerification
import "../verification/VerifyTasks.wdl" as VerifyTasks

workflow VerifyRNAWithUMIs {

  input {
    Array[File] test_metrics
    Array[File] truth_metrics
    Array[File] test_text_metrics
    Array[File] truth_text_metrics

    File test_star_aligned_bam
    File truth_star_aligned_bam
    File test_star_transcriptome_bam
    File truth_star_transcriptome_bam

    File test_one_bam
    File truth_one_bam
    File test_two_bam
    File truth_two_bam
    File test_three_bam
    File truth_three_bam
    File test_four_bam
    File truth_four_bam

    File test_tzero_bam
    File truth_tzero_bam
    File test_tone_bam
    File truth_tone_bam
    File test_ttwo_bam
    File truth_ttwo_bam
    File test_tthree_bam
    File truth_tthree_bam
    File test_tfour_bam
    File truth_tfour_bam

    File test_output_bam
    File truth_output_bam
    File test_transcriptome_bam
    File truth_transcriptome_bam
    File test_gene_tpm
    File truth_gene_tpm
    File test_gene_counts
    File truth_gene_counts
    File test_exon_counts
    File truth_exon_counts
  }

  call MetricsVerification.VerifyMetrics as CompareMetrics {
    input:
      test_metrics = test_metrics,
      truth_metrics = truth_metrics
  }

  call VerifyTasks.CompareTextFiles as CompareTextMetrics {
    input:
      test_text_files = test_text_metrics,
      truth_text_files = truth_text_metrics
  }

  call VerifyTasks.CompareBams as CompareOutputBam {
    input:
      test_bam = test_output_bam,
      truth_bam = truth_output_bam,
      lenient_header = true
  }

  call VerifyTasks.CompareBams as CompareTranscriptomeBam {
    input:
      test_bam = test_transcriptome_bam,
      truth_bam = truth_transcriptome_bam,
      lenient_header = true
  }

  call VerifyTasks.CompareCompressedTextFiles as CompareGeneTpms {
    input:
      test_zip = test_gene_tpm,
      truth_zip = truth_gene_tpm
  }

  call VerifyTasks.CompareCompressedTextFiles as CompareGeneCounts {
    input:
      test_zip = test_gene_counts,
      truth_zip = truth_gene_counts
  }

  call VerifyTasks.CompareCompressedTextFiles as CompareExonCounts {
    input:
      test_zip = test_exon_counts,
      truth_zip = truth_exon_counts
  }

  call VerifyTasks.CompareBams as CompareStarAlignedBams {
    input:
      test_bam = test_star_aligned_bam,
      truth_bam = truth_star_aligned_bam,
      lenient_header = true
  }

#  call VerifyTasks.CompareBams as CompareStarTAlignedBams {
#    input:
#      test_bam = test_star_transcriptome_bam,
#      truth_bam = truth_star_transcriptome_bam,
#      lenient_header = true
#  }

  call VerifyTasks.CompareBams as CompareOneBams {
    input:
      test_bam = test_one_bam,
      truth_bam = truth_one_bam,
      lenient_header = true
  }

  call VerifyTasks.CompareBams as CompareTwoBams {
    input:
      test_bam = test_two_bam,
      truth_bam = truth_two_bam,
      lenient_header = true
  }

  call VerifyTasks.CompareBams as CompareThreeBams {
    input:
      test_bam = test_three_bam,
      truth_bam = truth_three_bam,
      lenient_header = true
  }

#  call VerifyTasks.CompareBams as CompareFourBams {
#    input:
#      test_bam = test_four_bam,
#      truth_bam = truth_four_bam,
#      lenient_header = true
#  }

  call VerifyTasks.CompareBams as CompareTZeroBams {
    input:
      test_bam = test_tzero_bam,
      truth_bam = truth_tzero_bam,
      lenient_header = true
  }

  call VerifyTasks.CompareBams as CompareTOneBams {
    input:
      test_bam = test_tone_bam,
      truth_bam = truth_tone_bam,
      lenient_header = true
  }

  call VerifyTasks.CompareBams as CompareTTwoBams {
    input:
      test_bam = test_ttwo_bam,
      truth_bam = truth_ttwo_bam,
      lenient_header = true
  }

  call VerifyTasks.CompareBams as CompareTThreeBams {
    input:
      test_bam = test_tthree_bam,
      truth_bam = truth_tthree_bam,
      lenient_header = true
  }

#  call VerifyTasks.CompareBams as CompareTFourBams {
#    input:
#      test_bam = test_tfour_bam,
#      truth_bam = truth_tfour_bam,
#      lenient_header = true
#  }

  output {
    Array[File] metric_comparison_report_files = CompareMetrics.metric_comparison_report_files
  }
  meta {
    allowNestedInputs: true
  }
}