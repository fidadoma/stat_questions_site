# Comprehensive script to add cross-links ("Viz také" sections) to all lesson files
# Based on topic relationships identified in the exploration phase

library(tidyverse)

# Define comprehensive cross-link relationships
# Format: list("file_basename" = c("link 1", "link 2", ...))

crosslinks <- list(

  # ============================================================================
  # VISUALIZATIONS
  # ============================================================================

  "jake_jsou_moznosti_vizualizaci_pro_kvalitativni_a_kvantitativni_promennou.qmd" = c(
    "- [Jak dělíme statistické proměnné](../../stat_intro/4_jak_delime_statisticke_promenne.qmd) - typy proměnných",
    "- [Jak z histogramu poznáme vlastnosti dat](jak_z_histogramu_pozname_vlastnosti_dat.qmd) - analýza spojitých dat",
    "- [Které deskriptivní statistiky obsahuje krabicový graf](ktere_deskriptivni_statistiky_obsahuje_krabicovy_graf.qmd) - alternativa k histogramu",
    "- [Jaké jsou základní možnosti vizualizace dvou proměnných](jake_jsou_zakladni_moznosti_vizualizace_dvou_promennych.qmd) - bivariatní grafy"
  ),

  "jak_z_histogramu_pozname_vlastnosti_dat.qmd" = c(
    "- [Co to je šikmost dat](co_to_je_sikmost_dat.qmd) - identifikace z histogramu",
    "- [Jaké jsou možnosti vizualizací](jake_jsou_moznosti_vizualizaci_pro_kvalitativni_a_kvantitativni_promennou.qmd) - volba správného grafu",
    "- [Jak testujeme normalitu](../../../inferential_statistics/jak_muzeme_otestovat_normalitu.qmd) - ověření vizuálního dojmu",
    "- [Co je to Anscombeho kvartet](../../correlations_regressions/co_je_to_ansombeho_kvartet.qmd) - důležitost vizualizace"
  ),

  "ktere_deskriptivni_statistiky_obsahuje_krabicovy_graf.qmd" = c(
    "- [Jaké znáte charakteristiky středu](../../basic_statistics/jake_znate_charakteristiky_stredu_a_jake_jsou_mezi_nimi_rozdily.qmd) - medián v krabicovém grafu",
    "- [Jaké jsou charakteristiky variability](../../basic_statistics/jake_jsou_charakteristiky_variability.qmd) - IQR v krabicovém grafu",
    "- [Jak se projeví odlehlé pozorování](jak_se_projevi_odlehle_pozorovani_na_prumeru_a_medianu.qmd) - detekce outlierů",
    "- [Co to je šikmost dat](co_to_je_sikmost_dat.qmd) - rozpoznání z boxplotu"
  ),

  "co_to_je_sikmost_dat.qmd" = c(
    "- [Jak z histogramu poznáme vlastnosti dat](jak_z_histogramu_pozname_vlastnosti_dat.qmd) - vizualizace šikmosti",
    "- [Jaké znáte charakteristiky středu](../../basic_statistics/jake_znate_charakteristiky_stredu_a_jake_jsou_mezi_nimi_rozdily.qmd) - vliv šikmosti na průměr vs medián",
    "- [Jak se projeví odlehlé pozorování](jak_se_projevi_odlehle_pozorovani_na_prumeru_a_medianu.qmd) - příčiny šikmosti",
    "- [Jak testujeme normalitu](../../../inferential_statistics/jak_muzeme_otestovat_normalitu.qmd) - testování symetrie"
  ),

  "jak_se_projevi_odlehle_pozorovani_na_prumeru_a_medianu.qmd" = c(
    "- [Jaké znáte charakteristiky středu](../../basic_statistics/jake_znate_charakteristiky_stredu_a_jake_jsou_mezi_nimi_rozdily.qmd) - průměr vs medián",
    "- [Které deskriptivní statistiky obsahuje krabicový graf](ktere_deskriptivni_statistiky_obsahuje_krabicovy_graf.qmd) - detekce outlierů",
    "- [Co to je šikmost dat](co_to_je_sikmost_dat.qmd) - souvislost s outliery",
    "- [Co nám popisuje Spearmanův korelační koeficient](../../correlations_regressions/co_nam_popisuje_spearmanuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - robustní míra korelace"
  ),

  "jake_jsou_zakladni_moznosti_vizualizace_dvou_promennych.qmd" = c(
    "- [Jaké jsou možné vztahy mezi dvěma proměnnými](../../correlations_regressions/jake_jsou_mozne_vztahy_mezi_dvema_promennymi.qmd) - typy vztahů",
    "- [Co je to Anscombeho kvartet](../../correlations_regressions/co_je_to_ansombeho_kvartet.qmd) - důležitost vizualizace",
    "- [Co nám popisuje Pearsonův korelační koeficient](../../correlations_regressions/co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - kvantifikace lineárního vztahu"
  ),

  # ============================================================================
  # CONTINGENCY TABLES
  # ============================================================================

  "co_nam_popisuje_kontingencni_tabulka.qmd" = c(
    "- [Jaké znáte druhy četností](../../basic_statistics/jake_znate_druhy_cetnosti_a_kdy_se_da_ktera_pouzit.qmd) - četnosti v tabulkách",
    "- [Jaké znáte možnosti relativních četností pro kontingenční tabulku](jake_znate_moznosti_relativnich_cetnosti_pro_kontingencni_tabulku.qmd) - typy procentování",
    "- [Co to je χ² rozdělení](../../../inferential_statistics/co_to_je_2_rozdeleni_a_k_cemu_ho_pouzivame.qmd) - testování nezávislosti",
    "- [Jaké jsou možné koeficienty asociace pro 2x2 tabulku](jake_jsou_mozne_koeficienty_asociace_pro_2x2_tabulku_a_jake_jsou_jejich_vlastnosti.qmd) - měření síly vztahu"
  ),

  "jake_znate_moznosti_relativnich_cetnosti_pro_kontingencni_tabulku.qmd" = c(
    "- [Co nám popisuje kontingenční tabulka](co_nam_popisuje_kontingencni_tabulka.qmd) - základy kontingenčních tabulek",
    "- [Jaké znáte druhy četností](../../basic_statistics/jake_znate_druhy_cetnosti_a_kdy_se_da_ktera_pouzit.qmd) - typy četností",
    "- [Jaké znáte verze χ² testu](../../../inferential_statistics/jake_znate_verze_2_testu_a_k_cemu_slouzi.qmd) - testování vztahů"
  ),

  "jake_jsou_mozne_koeficienty_asociace_pro_2x2_tabulku_a_jake_jsou_jejich_vlastnosti.qmd" = c(
    "- [Co nám popisuje kontingenční tabulka](co_nam_popisuje_kontingencni_tabulka.qmd) - kontext asociačních koeficientů",
    "- [Jaké znáte koeficienty asociace pro tabulky R×C](../../../inferential_statistics/jake_znate_koeficienty_asociace_pro_tabulky_r_c.qmd) - rozšíření na větší tabulky",
    "- [Co nám popisuje Pearsonův korelační koeficient](../../correlations_regressions/co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - korelace pro číselné proměnné"
  ),

  # ============================================================================
  # CORRELATIONS & REGRESSIONS
  # ============================================================================

  "co_je_to_ansombeho_kvartet.qmd" = c(
    "- [Jaké jsou základní možnosti vizualizace dvou proměnných](../../visualizations/jake_jsou_zakladni_moznosti_vizualizace_dvou_promennych.qmd) - scatter plots",
    "- [Co nám popisuje Pearsonův korelační koeficient](co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - kdy korelace klame",
    "- [Jak vypadá rovnice regrese](jak_vypada_rovnice_nejjednodussi_regrese_a_jak_nazyvame_jednotlive_cleny_rovnice.qmd) - lineární modely",
    "- [Jaké jsou možné vztahy mezi dvěma proměnnými](jake_jsou_mozne_vztahy_mezi_dvema_promennymi.qmd) - nelineární vztahy"
  ),

  "jake_znate_standardni_skory_a_k_cemu_slouzi.qmd" = c(
    "- [Jaké jsou charakteristiky variability](../../basic_statistics/jake_jsou_charakteristiky_variability.qmd) - směrodatná odchylka",
    "- [Co nám popisuje Pearsonův korelační koeficient](co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - standardizované skóry v korelaci",
    "- [Jaký je vztah mezi směrnicí přímky a Pearsonovým korelačním koeficientem](jaky_je_vztah_mezi_smernici_primky_a_pearsonovym_korelacnim_koeficientem.qmd) - standardizace v regresi"
  ),

  "co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd" = c(
    "- [Co nám popisuje Spearmanův korelační koeficient](co_nam_popisuje_spearmanuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - neparametrická alternativa",
    "- [Jaký je rozdíl mezi korelací a kauzalitou](jaky_je_rozdil_mezi_korelaci_a_kauzalitou.qmd) - interpretace korelace",
    "- [Co je to Anscombeho kvartet](co_je_to_ansombeho_kvartet.qmd) - vždy vizualizujte!",
    "- [Jaký je vztah mezi směrnicí přímky a Pearsonovým korelačním koeficientem](jaky_je_vztah_mezi_smernici_primky_a_pearsonovym_korelacnim_koeficientem.qmd) - vztah ke regresi",
    "- [Co testujeme u korelačního koeficientu](../../../inferential_statistics/co_testujeme_u_korelacniho_koeficientu_a_u_regrese.qmd) - testování významnosti"
  ),

  "co_nam_popisuje_spearmanuv_korelacni_koeficient_a_kdy_se_pouziva.qmd" = c(
    "- [Co nám popisuje Pearsonův korelační koeficient](co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - parametrická alternativa",
    "- [Rozdíl mezi ordinální a číselnou proměnnou](../../stat_intro/7_jaky_je_rozdil_mezi_ordinalni_a_ciselnou_promennou.qmd) - kdy použít Spearmana",
    "- [Jak se projeví odlehlé pozorování](../../visualizations/jak_se_projevi_odlehle_pozorovani_na_prumeru_a_medianu.qmd) - robustnost Spearmana",
    "- [Jaké znáte základní neparametrické testy](../../../inferential_statistics/jake_znate_zakladni_neparametricke_testy.qmd) - souvisejíc í metody"
  ),

  "jak_vypada_rovnice_nejjednodussi_regrese_a_jak_nazyvame_jednotlive_cleny_rovnice.qmd" = c(
    "- [Jak určit kvalitu modelu](jak_urcit_kvalitu_modelu_a_jak_byste_ji_interpretovali.qmd) - R² a další míry",
    "- [Jaký je vztah mezi směrnicí přímky a Pearsonovým korelačním koeficientem](jaky_je_vztah_mezi_smernici_primky_a_pearsonovym_korelacnim_koeficientem.qmd) - korelace vs regrese",
    "- [Co testujeme u regrese](../../../inferential_statistics/co_testujeme_u_korelacniho_koeficientu_a_u_regrese.qmd) - testování koeficientů",
    "- [Co to je normalita reziduí](../../../inferential_statistics/co_to_je_normalita_rezidui_u_regrese_jak_to_pozname.qmd) - předpoklady regrese"
  ),

  "jak_urcit_kvalitu_modelu_a_jak_byste_ji_interpretovali.qmd" = c(
    "- [Jak vypadá rovnice regrese](jak_vypada_rovnice_nejjednodussi_regrese_a_jak_nazyvame_jednotlive_cleny_rovnice.qmd) - regresní model",
    "- [Jak porovnáváme několik regresních modelů](../../../inferential_statistics/jak_porovnavame_nekolik_regresnich_modelu_s_vice_prediktory.qmd) - srovnání modelů",
    "- [Co to je normalita reziduí](../../../inferential_statistics/co_to_je_normalita_rezidui_u_regrese_jak_to_pozname.qmd) - diagnostika modelu"
  ),

  "jaky_je_rozdil_mezi_korelaci_a_kauzalitou.qmd" = c(
    "- [Co nám popisuje Pearsonův korelační koeficient](co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - měření korelace",
    "- [Co to je DAG](../../../causal_inference/co_to_je_dag.qmd) - kauzální diagramy",
    "- [Jak funguje fork v DAGu](../../../causal_inference/jak_funguje_fork_v_dagu.qmd) - confounding",
    "- [Co to je Berksonův paradox](../../../causal_inference/co_to_je_berksonuv_paradox_a_jak_se_projevuje.qmd) - falešné korelace"
  ),

  "jake_jsou_mozne_vztahy_mezi_dvema_promennymi.qmd" = c(
    "- [Co nám popisuje Pearsonův korelační koeficient](co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - lineární vztahy",
    "- [Co je to Anscombeho kvartet](co_je_to_ansombeho_kvartet.qmd) - různé typy vztahů",
    "- [Jaké jsou základní možnosti vizualizace dvou proměnných](../../visualizations/jake_jsou_zakladni_moznosti_vizualizace_dvou_promennych.qmd) - vizualizace vztahů"
  ),

  "jaky_je_vztah_mezi_smernici_primky_a_pearsonovym_korelacnim_koeficientem.qmd" = c(
    "- [Co nám popisuje Pearsonův korelační koeficient](co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - korelace",
    "- [Jak vypadá rovnice regrese](jak_vypada_rovnice_nejjednodussi_regrese_a_jak_nazyvame_jednotlive_cleny_rovnice.qmd) - regresní koeficienty",
    "- [Jaké znáte standardní skóry](jake_znate_standardni_skory_a_k_cemu_slouzi.qmd) - standardizace"
  )
)

# Function to add "Viz také" section to files
add_see_also_to_files <- function(base_dir) {

  results <- list()

  for (filename in names(crosslinks)) {

    # Find the file in the directory structure
    file_paths <- list.files(base_dir, pattern = filename, recursive = TRUE, full.names = TRUE)

    if (length(file_paths) == 0) {
      message(sprintf("File not found: %s", filename))
      results[[filename]] <- "not_found"
      next
    }

    if (length(file_paths) > 1) {
      message(sprintf("Multiple files found for %s, using first: %s", filename, file_paths[1]))
    }

    file_path <- file_paths[1]

    # Read the file
    tryCatch({
      content <- readLines(file_path, warn = FALSE, encoding = "UTF-8")

      # Check if "## Viz také" already exists
      if (any(grepl("^## Viz také", content))) {
        message(sprintf("Skipping %s - already has 'Viz také' section", filename))
        results[[filename]] <- "skipped"
        next
      }

      # Find the last non-empty line
      last_content_line <- max(which(nzchar(trimws(content))))

      # Create the "Viz také" section
      see_also <- c(
        "",
        "## Viz také",
        "",
        crosslinks[[filename]],
        ""
      )

      # Insert the section
      new_content <- c(
        content[1:last_content_line],
        see_also
      )

      # Write back to file
      writeLines(new_content, file_path, useBytes = TRUE)
      message(sprintf("✓ Added 'Viz také' to: %s", filename))
      results[[filename]] <- "added"

    }, error = function(e) {
      message(sprintf("Error processing %s: %s", filename, e$message))
      results[[filename]] <- "error"
    })
  }

  return(results)
}

# Run the function
message("Adding cross-links to lesson files...")
message(strrep("=", 80))

results <- add_see_also_to_files("lessons")

# Summary
message(paste0("\n", strrep("=", 80)))
message("SUMMARY:")
message(sprintf("Files processed: %d", length(results)))
message(sprintf("  - Added: %d", sum(results == "added")))
message(sprintf("  - Skipped (already have links): %d", sum(results == "skipped")))
message(sprintf("  - Not found: %d", sum(results == "not_found")))
message(sprintf("  - Errors: %d", sum(results == "error")))
message(strrep("=", 80))

cat("\nDone! Cross-links have been added to the lesson files.\n")
