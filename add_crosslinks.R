# Script to add cross-links to all lesson files
# This adds "See also" sections based on topic relationships

library(tidyverse)

# Define cross-link relationships
# Format: list(file_path = c("related_file1", "related_file2", ...))

crosslinks <- list(
  # Basic Statistics
  "lessons/descriptive_stat/basic_statistics/jake_znate_charakteristiky_stredu_a_jake_jsou_mezi_nimi_rozdily.qmd" = c(
    "[Jaké jsou charakteristiky variability](jake_jsou_charakteristiky_variability.qmd) - míry rozptýlení dat",
    "[Rozdíl mezi charakteristikou středu a variability](jaky_je_rozdil_mezi_charakteristikou_stredy_a_charakteristikou_variability.qmd) - proč reportovat oboje",
    "[Jak se projeví odlehlé pozorování na průměru a medianu](../../visualizations/jak_se_projevi_odlehle_pozorovani_na_prumeru_a_medianu.qmd) - robustnost charakteristik",
    "[Co to je šikmost dat](../../visualizations/co_to_je_sikmost_dat.qmd) - vliv na volbu charakteristiky středu"
  ),

  "lessons/descriptive_stat/basic_statistics/jake_jsou_charakteristiky_variability.qmd" = c(
    "[Jaké znáte charakteristiky středu](jake_znate_charakteristiky_stredu_a_jake_jsou_mezi_nimi_rozdily.qmd) - měření centrální tendence",
    "[Rozdíl mezi rozptylem, směrodatnou odchylkou a průměrnou odchylkou](jaky_je_rozdil_mezi_rozptylem_smerodatnou_odchylkou_a_prumernou_odchylkou.qmd) - detaily o mírách variability",
    "[Které deskriptivní statistiky obsahuje krabicový graf](../../visualizations/ktere_deskriptivni_statistiky_obsahuje_krabicovy_graf.qmd) - vizualizace variability",
    "[Co to je standardní chyba průměru](../../../inferential_statistics/co_to_je_standardni_chyba_prumeru_a_k_cemu_slouzi.qmd) - variabilita odhadů"
  ),

  "lessons/descriptive_stat/basic_statistics/jake_znate_druhy_cetnosti_a_kdy_se_da_ktera_pouzit.qmd" = c(
    "[Jak dělíme statistické proměnné](../../stat_intro/4_jak_delime_statisticke_promenne.qmd) - typy proměnných pro četnosti",
    "[Co nám popisuje kontingenční tabulka](../../contingency_tables/co_nam_popisuje_kontingencni_tabulka.qmd) - četnosti pro dvě proměnné",
    "[Jaké jsou možnosti vizualizací](../../visualizations/jake_jsou_moznosti_vizualizaci_pro_kvalitativni_a_kvantitativni_promennou.qmd) - grafy četností"
  ),

  "lessons/descriptive_stat/basic_statistics/jaky_je_rozdil_mezi_charakteristikou_stredy_a_charakteristikou_variability.qmd" = c(
    "[Jaké znáte charakteristiky středu](jake_znate_charakteristiky_stredu_a_jake_jsou_mezi_nimi_rozdily.qmd) - měření centrální tendence",
    "[Jaké jsou charakteristiky variability](jake_jsou_charakteristiky_variability.qmd) - měření rozptýlení",
    "[K čemu slouží bodový odhad](../../../inferential_statistics/k_cemu_slouzi_bodovy_odhad_a_jake_bodove_odhady_znate.qmd) - odhadování parametrů"
  ),

  "lessons/descriptive_stat/basic_statistics/jaky_je_rozdil_mezi_rozptylem_smerodatnou_odchylkou_a_prumernou_odchylkou.qmd" = c(
    "[Jaké jsou charakteristiky variability](jake_jsou_charakteristiky_variability.qmd) - přehled měr variability",
    "[Co testujeme u korelačního koeficientu a u regrese](../../correlations_regressions/co_testujeme_u_korelacniho_koeficientu_a_u_regrese.qmd) - používání směrodatné odchylky",
    "[Jaké znáte standardní skóry](../../correlations_regressions/jake_znate_standardni_skory_a_k_cemu_slouzi.qmd) - standardizace pomocí SD"
  ),

  # Visualizations
  "lessons/descriptive_stat/visualizations/jake_jsou_moznosti_vizualizaci_pro_kvalitativni_a_kvantitativni_promennou.qmd" = c(
    "[Jak dělíme statistické proměnné](../../stat_intro/4_jak_delime_statisticke_promenne.qmd) - typy proměnných",
    "[Jak z histogramu poznáme vlastnosti dat](jak_z_histogramu_pozname_vlastnosti_dat.qmd) - analýza spojitých dat",
    "[Které deskriptivní statistiky obsahuje krabicový graf](ktere_deskriptivni_statistiky_obsahuje_krabicovy_graf.qmd) - alternativa k histogramu",
    "[Jaké jsou základní možnosti vizualizace dvou proměnných](jake_jsou_zakladni_moznosti_vizualizace_dvou_promennych.qmd) - bivariatní grafy"
  ),

  "lessons/descriptive_stat/visualizations/jak_z_histogramu_pozname_vlastnosti_dat.qmd" = c(
    "[Co to je šikmost dat](co_to_je_sikmost_dat.qmd) - identifikace z histogramu",
    "[Jaké jsou možnosti vizualizací](jake_jsou_moznosti_vizualizaci_pro_kvalitativni_a_kvantitativni_promennou.qmd) - volba správného grafu",
    "[Jak testujeme normalitu](../../../inferential_statistics/jak_muzeme_otestovat_normalitu.qmd) - ověření vizuálního dojmu",
    "[Co je to Anscombeho kvartet](../../correlations_regressions/co_je_to_ansombeho_kvartet.qmd) - důležitost vizualizace"
  ),

  "lessons/descriptive_stat/visualizations/ktere_deskriptivni_statistiky_obsahuje_krabicovy_graf.qmd" = c(
    "[Jaké znáte charakteristiky středu](../../basic_statistics/jake_znate_charakteristiky_stredu_a_jake_jsou_mezi_nimi_rozdily.qmd) - medián v krabicovém grafu",
    "[Jaké jsou charakteristiky variability](../../basic_statistics/jake_jsou_charakteristiky_variability.qmd) - IQR v krabicovém grafu",
    "[Jak se projeví odlehlé pozorování](jak_se_projevi_odlehle_pozorovani_na_prumeru_a_medianu.qmd) - detekce outlierů",
    "[Co to je šikmost dat](co_to_je_sikmost_dat.qmd) - rozpoznání z boxplotu"
  ),

  "lessons/descriptive_stat/visualizations/co_to_je_sikmost_dat.qmd" = c(
    "[Jak z histogramu poznáme vlastnosti dat](jak_z_histogramu_pozname_vlastnosti_dat.qmd) - vizualizace šikmosti",
    "[Jaké znáte charakteristiky středu](../../basic_statistics/jake_znate_charakteristiky_stredu_a_jake_jsou_mezi_nimi_rozdily.qmd) - vliv šikmosti na průměr vs medián",
    "[Jak se projeví odlehlé pozorování](jak_se_projevi_odlehle_pozorovani_na_prumeru_a_medianu.qmd) - příčiny šikmosti",
    "[Jak testujeme normalitu](../../../inferential_statistics/jak_muzeme_otestovat_normalitu.qmd) - testování symetrie"
  ),

  "lessons/descriptive_stat/visualizations/jak_se_projevi_odlehle_pozorovani_na_prumeru_a_medianu.qmd" = c(
    "[Jaké znáte charakteristiky středu](../../basic_statistics/jake_znate_charakteristiky_stredu_a_jake_jsou_mezi_nimi_rozdily.qmd) - průměr vs medián",
    "[Které deskriptivní statistiky obsahuje krabicový graf](ktere_deskriptivni_statistiky_obsahuje_krabicovy_graf.qmd) - detekce outlierů",
    "[Co to je šikmost dat](co_to_je_sikmost_dat.qmd) - souvislost s outliery",
    "[Co nám popisuje Spearmanův korelační koeficient](../../correlations_regressions/co_nam_popisuje_spearmanuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - robustní míra korelace"
  ),

  "lessons/descriptive_stat/visualizations/jake_jsou_zakladni_moznosti_vizualizace_dvou_promennych.qmd" = c(
    "[Jaké jsou možné vztahy mezi dvěma proměnnými](../../correlations_regressions/jake_jsou_mozne_vztahy_mezi_dvema_promennymi.qmd) - typy vztahů",
    "[Co je to Anscombeho kvartet](../../correlations_regressions/co_je_to_ansombeho_kvartet.qmd) - důležitost vizualizace",
    "[Co nám popisuje Pearsonův korelační koeficient](../../correlations_regressions/co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - kvantifikace lineárního vztahu"
  ),

  # Correlations & Regressions
  "lessons/descriptive_stat/correlations_regressions/co_je_to_ansombeho_kvartet.qmd" = c(
    "[Jaké jsou základní možnosti vizualizace dvou proměnných](../../visualizations/jake_jsou_zakladni_moznosti_vizualizace_dvou_promennych.qmd) - scatter plots",
    "[Co nám popisuje Pearsonův korelační koeficient](co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - kdy korelace klame",
    "[Jak vypada rovnice regrese](jak_vypada_rovnice_nejjednodussi_regrese_a_jak_nazyvame_jednotlive_cleny_rovnice.qmd) - lineární modely",
    "[Jaké jsou možné vztahy mezi dvěma proměnnými](jake_jsou_mozne_vztahy_mezi_dvema_promennymi.qmd) - nelineární vztahy"
  ),

  "lessons/descriptive_stat/correlations_regressions/jake_znate_standardni_skory_a_k_cemu_slouzi.qmd" = c(
    "[Jaké jsou charakteristiky variability](../../basic_statistics/jake_jsou_charakteristiky_variability.qmd) - směrodatná odchylka",
    "[Co nám popisuje Pearsonův korelační koeficient](co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd) - standardizované skóry v korelaci",
    "[Jaký je vztah mezi směrnicí primky a Pearsonovým korelačním koeficientem](jaky_je_vztah_mezi_smernici_primky_a_pearsonovym_korelacnim_koeficientem.qmd) - standardizace v regresi"
  )
)

# Function to add "See also" section to a file
add_see_also <- function(file_path, links) {
  # Read the file
  content <- readLines(file_path, warn = FALSE, encoding = "UTF-8")

  # Check if "## Viz také" already exists
  if (any(grepl("^## Viz také", content))) {
    message(sprintf("Skipping %s - already has 'Viz také' section", basename(file_path)))
    return(FALSE)
  }

  # Find the last non-empty line
  last_content_line <- max(which(nzchar(trimws(content))))

  # Create the "See also" section
  see_also <- c(
    "",
    "## Viz také",
    "",
    paste0("- ", links),
    ""
  )

  # Insert the section before the last empty lines
  new_content <- c(
    content[1:last_content_line],
    see_also
  )

  # Write back to file
  writeLines(new_content, file_path, useBytes = TRUE)
  message(sprintf("Added 'Viz také' section to %s", basename(file_path)))
  return(TRUE)
}

# Process all files
results <- map2_lgl(names(crosslinks), crosslinks, function(file, links) {
  if (file.exists(file)) {
    add_see_also(file, links)
  } else {
    message(sprintf("File not found: %s", file))
    FALSE
  }
})

cat(sprintf("\nProcessed %d files\n", sum(results)))
cat(sprintf("Skipped %d files (already have links)\n", length(results) - sum(results)))
