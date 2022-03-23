package org.broadinstitute.dsp.pipelines.inputs

import java.net.URI

import io.circe.{Decoder, Encoder}
import io.circe.generic.extras.semiauto.{
  deriveConfiguredDecoder,
  deriveConfiguredEncoder
}

object RNAWithUMIsValidationInputs
    extends EncodableInputs[RNAWithUMIsValidationInputs] {
  override def workflowNames: Seq[String] = Seq("VerifyRNAWithUMIs")
  override implicit val decoder: Decoder[RNAWithUMIsValidationInputs] =
    deriveConfiguredDecoder
  override implicit val encoder: Encoder[RNAWithUMIsValidationInputs] =
    deriveConfiguredEncoder
}

case class RNAWithUMIsValidationInputs(
    truth_metrics: Seq[URI],
    test_metrics: Seq[URI],
    truth_text_metrics: Seq[URI],
    test_text_metrics: Seq[URI],
    test_star_aligned_bam: URI,
    truth_star_aligned_bam: URI,
    test_star_transcriptome_bam: URI,
    truth_star_transcriptome_bam: URI,
    test_one_bam: URI,
    truth_one_bam: URI,
    test_two_bam: URI,
    truth_two_bam: URI,
    test_three_bam: URI,
    truth_three_bam: URI,
    test_four_bam: URI,
    truth_four_bam: URI,
    test_tzero_bam: URI,
    truth_tzero_bam: URI,
    test_tone_bam: URI,
    truth_tone_bam: URI,
    test_ttwo_bam: URI,
    truth_ttwo_bam: URI,
    test_tthree_bam: URI,
    truth_tthree_bam: URI,
    test_tfour_bam: URI,
    truth_tfour_bam: URI,
    test_output_bam: URI,
    truth_output_bam: URI,
    test_transcriptome_bam: URI,
    truth_transcriptome_bam: URI,
    test_gene_tpm: URI,
    truth_gene_tpm: URI,
    test_gene_counts: URI,
    truth_gene_counts: URI,
    test_exon_counts: URI,
    truth_exon_counts: URI
)
