# 🏫 TUL – Technická univerzita v Liberci

Vítejte v centrálním repozitáři TUL! Tento repozitář slouží jako úložiště zdrojů, kódu a dokumentace související s projekty a studiem.

## 📚 Přehled

Struktura repozitáře je navržena pro **přehlednost, spolupráci a snadnou orientaci**. Najdeš tu vše od předmětů přes skripta až po užitečné odkazy.

## ⚡ Předměty

<style>
.grid-predmety {
  display: grid;
  grid-template-columns: 1fr 1fr; /* 2 sloupce na desktopu */
  gap: 15px;
}

@media (max-width: 768px) {
  .grid-predmety {
    grid-template-columns: 1fr; /* 1 sloupec na mobilu */
  }
}

.karta {
  padding: 15px;
  border-radius: 10px;
  text-align: center;
  background-color: purple;
}

.karta a {
  color: white;
  font-weight: 400;
}

</style>

<div class="grid-predmety">

  <div class="karta">
    <a href="algoritmizace_programovani_java_1/">💻 Programování Java 1</a>
  </div>

  <div class="karta">
    <a href="linearni_algerbra_diskretni_mat/">📐 Lineární algebra a diskrétní mat</a>
  </div>

  <div class="karta">
    <a href="matematika_1/">🔢 Matematika 1</a>
  </div>

  <div class="karta">
    <a href="seminar/">📝 Matematika Seminář</a>
  </div>

   <div class="karta">
    <a href="shell_linux/">🐚 Shell / Linux</a>
  </div>

   <div class="karta">
    <a href="matlab/">📊 Matlab</a>
  </div>   
  
  <div class="karta">
    <a href="inzenyrstvi/">⚙️ Inženýrství</a>
  </div>

  <div class="karta">
   <a href="odkazy/">🔗 Odkazy </a>
  </div>

</div>

## 🌟 Klíčové vlastnosti

- Organizovaná struktura složek a materiálů.
- Dokumentace pro snadné používání a sdílení.
- Kód připravený pro další rozvoj.

---

## 🚀 Začínáme

```bash
git clone https://github.com/deesdav/TUL.git
cd TUL
```

## 🖥️ Spuštění lokálního webu s MkDocs (Material)

```bash
py -m pip install --upgrade pip
py -m pip install mkdocs mkdocs-material
py -m mkdocs serve
```

```bash
Otevřete v prohlížeči: http://127.0.0.1:8000
```

- Tip: Obrázky a ikony umístěte do složky docs/images, aby MkDocs správně načítal materiály.

## 🤝 Přispívání

1. Forkněte repo.
2. Vytvořte nový branch pro změny.
3. Odešlete Pull Request s popisem změn.
