--
-- File generated with SQLiteStudio v3.4.4 on Wed May 10 17:16:01 2023
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: HarjoitusryhmäIlmoittautuminen
CREATE TABLE IF NOT EXISTS HarjoitusryhmäIlmoittautuminen (
    opiskelijanro INT,
    HrID          VARCHAR (20),
    PRIMARY KEY (
        opiskelijanro,
        HrID
    ),
    FOREIGN KEY (
        opiskelijanro
    )
    REFERENCES Opiskelijat (opiskelijanumero),
    FOREIGN KEY (
        HrID
    )
    REFERENCES Harjoitusryhmät (HrID) 
);

INSERT INTO HarjoitusryhmäIlmoittautuminen (
                                               opiskelijanro,
                                               HrID
                                           )
                                           VALUES (
                                               12345,
                                               'HR01'
                                           );

INSERT INTO HarjoitusryhmäIlmoittautuminen (
                                               opiskelijanro,
                                               HrID
                                           )
                                           VALUES (
                                               23456,
                                               'HR02'
                                           );

INSERT INTO HarjoitusryhmäIlmoittautuminen (
                                               opiskelijanro,
                                               HrID
                                           )
                                           VALUES (
                                               34567,
                                               'HR03'
                                           );


-- Table: Harjoitusryhmät
CREATE TABLE IF NOT EXISTS Harjoitusryhmät (
    HrID         VARCHAR      PRIMARY KEY,
    maksimimäärä INT,
    kurssikerta  VARCHAR (20),
    FOREIGN KEY (
        kurssikerta
    )
    REFERENCES Kurssikerrat (kurssikerta) 
);

INSERT INTO Harjoitusryhmät (
                                HrID,
                                maksimimäärä,
                                kurssikerta
                            )
                            VALUES (
                                'HR01',
                                30,
                                '1'
                            );

INSERT INTO Harjoitusryhmät (
                                HrID,
                                maksimimäärä,
                                kurssikerta
                            )
                            VALUES (
                                'HR02',
                                25,
                                '2'
                            );

INSERT INTO Harjoitusryhmät (
                                HrID,
                                maksimimäärä,
                                kurssikerta
                            )
                            VALUES (
                                'HR03',
                                20,
                                '3'
                            );


-- Table: HrKokoontumiset
CREATE TABLE IF NOT EXISTS HrKokoontumiset (
    HrAikaID  INT     PRIMARY KEY,
    HrID      VARCHAR,
    ajankohta DATE,
    FOREIGN KEY (
        HrID
    )
    REFERENCES Harjoitusryhmät (HrID) 
);

INSERT INTO HrKokoontumiset (
                                HrAikaID,
                                HrID,
                                ajankohta
                            )
                            VALUES (
                                'HR1',
                                'HR01',
                                '2023-05-15'
                            );

INSERT INTO HrKokoontumiset (
                                HrAikaID,
                                HrID,
                                ajankohta
                            )
                            VALUES (
                                'HR2',
                                'HR01',
                                '2023-05-22'
                            );

INSERT INTO HrKokoontumiset (
                                HrAikaID,
                                HrID,
                                ajankohta
                            )
                            VALUES (
                                'HR3',
                                'HR02',
                                '2023-05-21'
                            );


-- Table: Kurssikerrat
CREATE TABLE IF NOT EXISTS Kurssikerrat (
    kurssikerta VARCHAR (20) PRIMARY KEY,
    kurssikoodi VARCHAR (10),
    lukukausi   VARCHAR (10),
    FOREIGN KEY (
        kurssikoodi
    )
    REFERENCES Kurssit (kurssikoodi) 
);

INSERT INTO Kurssikerrat (
                             kurssikerta,
                             kurssikoodi,
                             lukukausi
                         )
                         VALUES (
                             '1',
                             'CS101',
                             'Fall 2023'
                         );

INSERT INTO Kurssikerrat (
                             kurssikerta,
                             kurssikoodi,
                             lukukausi
                         )
                         VALUES (
                             '2',
                             'CS102',
                             'Spring 2024'
                         );

INSERT INTO Kurssikerrat (
                             kurssikerta,
                             kurssikoodi,
                             lukukausi
                         )
                         VALUES (
                             '3',
                             'CS103',
                             'Summer 2024'
                         );


-- Table: Kurssit
CREATE TABLE IF NOT EXISTS Kurssit (
    kurssikoodi VARCHAR (15) PRIMARY KEY,
    nimi        VARCHAR (50),
    op          INT
);

INSERT INTO Kurssit (
                        kurssikoodi,
                        nimi,
                        op
                    )
                    VALUES (
                        'CS101',
                        'CS alkeet',
                        5
                    );

INSERT INTO Kurssit (
                        kurssikoodi,
                        nimi,
                        op
                    )
                    VALUES (
                        'CS102',
                        'Tietorakenteet',
                        5
                    );

INSERT INTO Kurssit (
                        kurssikoodi,
                        nimi,
                        op
                    )
                    VALUES (
                        'CS103',
                        'Tietokannat',
                        5
                    );

INSERT INTO Kurssit (
                        kurssikoodi,
                        nimi,
                        op
                    )
                    VALUES (
                        'CS105',
                        'studio',
                        5
                    );


-- Table: Luennot
CREATE TABLE IF NOT EXISTS Luennot (
    luentoID    VARCHAR (20) PRIMARY KEY,
    ajankohta   DATETIME,
    kurssikerta VARCHAR (10),
    FOREIGN KEY (
        kurssikerta
    )
    REFERENCES Kurssikerrat (kurssikerta) 
);

INSERT INTO Luennot (
                        luentoID,
                        ajankohta,
                        kurssikerta
                    )
                    VALUES (
                        'L1',
                        '2023-05-19',
                        '1'
                    );

INSERT INTO Luennot (
                        luentoID,
                        ajankohta,
                        kurssikerta
                    )
                    VALUES (
                        'L2',
                        '2023-05-22',
                        '2'
                    );


-- Table: LuentoKurssikerta
CREATE TABLE IF NOT EXISTS LuentoKurssikerta (
    luentoID    VARCHAR (20),
    kurssikerta VARCHAR (10),
    PRIMARY KEY (
        luentoID,
        kurssikerta
    ),
    FOREIGN KEY (
        luentoID
    )
    REFERENCES Luennot (luentoID),
    FOREIGN KEY (
        kurssikerta
    )
    REFERENCES Kurssikerrat (kurssikerta) 
);

INSERT INTO LuentoKurssikerta (
                                  luentoID,
                                  kurssikerta
                              )
                              VALUES (
                                  'L1',
                                  '1'
                              );

INSERT INTO LuentoKurssikerta (
                                  luentoID,
                                  kurssikerta
                              )
                              VALUES (
                                  'L2',
                                  '2'
                              );


-- Table: Opiskelijat
CREATE TABLE IF NOT EXISTS Opiskelijat (
    nimi             VARCHAR (50),
    opiskelijanumero INT          PRIMARY KEY,
    syntymäaika      DATE,
    tutkintoohjelma  VARCHAR (50),
    alkuaika         DATE,
    loppuaika        DATE
);

INSERT INTO Opiskelijat (
                            nimi,
                            opiskelijanumero,
                            syntymäaika,
                            tutkintoohjelma,
                            alkuaika,
                            loppuaika
                        )
                        VALUES (
                            'Dorida Mulliqi',
                            12345,
                            '2000-01-01',
                            'IT',
                            '2023-05-01',
                            '2027-05-01'
                        );

INSERT INTO Opiskelijat (
                            nimi,
                            opiskelijanumero,
                            syntymäaika,
                            tutkintoohjelma,
                            alkuaika,
                            loppuaika
                        )
                        VALUES (
                            'Basant Khattab',
                            23456,
                            '2001-02-02',
                            'CS',
                            '2023-05-01',
                            '2027-05-01'
                        );

INSERT INTO Opiskelijat (
                            nimi,
                            opiskelijanumero,
                            syntymäaika,
                            tutkintoohjelma,
                            alkuaika,
                            loppuaika
                        )
                        VALUES (
                            'Alia Skar',
                            34567,
                            '1999-03-03',
                            'KE',
                            '2022-09-01',
                            '2026-09-01'
                        );


-- Table: Rakennukset
CREATE TABLE IF NOT EXISTS Rakennukset (
    nimi   VARCHAR (50),
    osoite VARCHAR (50),
    PRIMARY KEY (
        nimi,
        osoite
    )
);

INSERT INTO Rakennukset (
                            nimi,
                            osoite
                        )
                        VALUES (
                            'T-talo',
                            '1234 katu, Espoo'
                        );

INSERT INTO Rakennukset (
                            nimi,
                            osoite
                        )
                        VALUES (
                            'A-talo',
                            '5678 katu, Espoo'
                        );


-- Table: Salit
CREATE TABLE IF NOT EXISTS Salit (
    saliID         VARCHAR (20) PRIMARY KEY,
    opiskelupaikat INT,
    tenttipaikat   INT,
    nimi           VARCHAR (50) 
);

INSERT INTO Salit (
                      saliID,
                      opiskelupaikat,
                      tenttipaikat,
                      nimi
                  )
                  VALUES (
                      'S01',
                      40,
                      20,
                      'T-talo 1'
                  );

INSERT INTO Salit (
                      saliID,
                      opiskelupaikat,
                      tenttipaikat,
                      nimi
                  )
                  VALUES (
                      'S02',
                      50,
                      30,
                      'T-talo 2'
                  );

INSERT INTO Salit (
                      saliID,
                      opiskelupaikat,
                      tenttipaikat,
                      nimi
                  )
                  VALUES (
                      'S03',
                      60,
                      40,
                      'A-talo 1'
                  );


-- Table: Salivaraukset
CREATE TABLE IF NOT EXISTS Salivaraukset (
    varausID      VARCHAR (20) PRIMARY KEY,
    saliID        VARCHAR (20),
    tilaisuus     VARCHAR (50),
    ajankohta     DATETIME,
    varauspvm     DATE,
    työntekijänro INT,
    FOREIGN KEY (
        saliID
    )
    REFERENCES Salit (saliID),
    FOREIGN KEY (
        työntekijänro
    )
    REFERENCES Työntekijät (työntekijänro) 
);

INSERT INTO Salivaraukset (
                              varausID,
                              saliID,
                              tilaisuus,
                              ajankohta,
                              varauspvm,
                              työntekijänro
                          )
                          VALUES (
                              'V01',
                              'S01',
                              'L1',
                              '10:00:00',
                              '2023-05-19',
                              2
                          );

INSERT INTO Salivaraukset (
                              varausID,
                              saliID,
                              tilaisuus,
                              ajankohta,
                              varauspvm,
                              työntekijänro
                          )
                          VALUES (
                              'V02',
                              'S02',
                              'L2',
                              '14:00:00',
                              '2023-05-22',
                              3
                          );


-- Table: Salivarusteet
CREATE TABLE IF NOT EXISTS Salivarusteet (
    saliID    VARCHAR (20),
    varusteID VARCHAR (20),
    PRIMARY KEY (
        saliID,
        varusteID
    )
);


-- Table: Tentit
CREATE TABLE IF NOT EXISTS Tentit (
    tenttiID  VARCHAR (20) PRIMARY KEY,
    ajankohta DATETIME
);

INSERT INTO Tentit (
                       tenttiID,
                       ajankohta
                   )
                   VALUES (
                       'T1',
                       '2023-06-01'
                   );

INSERT INTO Tentit (
                       tenttiID,
                       ajankohta
                   )
                   VALUES (
                       'T2',
                       '2023-07-01'
                   );


-- Table: TenttiIlmot
CREATE TABLE IF NOT EXISTS TenttiIlmot (
    ilmoID        VARCHAR (20) PRIMARY KEY,
    opiskelijanro INT,
    tenttiID      VARCHAR (20),
    ilmopvm       DATE,
    kieli         VARCHAR (10),
    FOREIGN KEY (
        opiskelijanro
    )
    REFERENCES Opiskelijat (opiskelijanumero),
    FOREIGN KEY (
        tenttiID
    )
    REFERENCES Tentit (tenttiID) 
);

INSERT INTO TenttiIlmot (
                            ilmoID,
                            opiskelijanro,
                            tenttiID,
                            ilmopvm,
                            kieli
                        )
                        VALUES (
                            'I1',
                            12345,
                            'T1',
                            '2023-05-30',
                            'EN'
                        );

INSERT INTO TenttiIlmot (
                            ilmoID,
                            opiskelijanro,
                            tenttiID,
                            ilmopvm,
                            kieli
                        )
                        VALUES (
                            'I2',
                            23456,
                            'T1',
                            '2023-05-31',
                            'FI'
                        );

INSERT INTO TenttiIlmot (
                            ilmoID,
                            opiskelijanro,
                            tenttiID,
                            ilmopvm,
                            kieli
                        )
                        VALUES (
                            'I3',
                            34567,
                            'T2',
                            '2023-06-30',
                            'EN'
                        );


-- Table: Tenttisuoritukset
CREATE TABLE IF NOT EXISTS Tenttisuoritukset (
    opiskelijanro INT,
    tenttiID      VARCHAR,
    arvosana      INT,
    PRIMARY KEY (
        opiskelijanro,
        tenttiID
    ),
    FOREIGN KEY (
        opiskelijanro
    )
    REFERENCES Opiskelijat (opiskelijanumero),
    FOREIGN KEY (
        tenttiID
    )
    REFERENCES Tentit (tenttiID) 
);

INSERT INTO Tenttisuoritukset (
                                  opiskelijanro,
                                  tenttiID,
                                  arvosana
                              )
                              VALUES (
                                  12345,
                                  'T1',
                                  3
                              );

INSERT INTO Tenttisuoritukset (
                                  opiskelijanro,
                                  tenttiID,
                                  arvosana
                              )
                              VALUES (
                                  23456,
                                  'T1',
                                  5
                              );

INSERT INTO Tenttisuoritukset (
                                  opiskelijanro,
                                  tenttiID,
                                  arvosana
                              )
                              VALUES (
                                  34567,
                                  'T2',
                                  4
                              );


-- Table: Työntekijät
CREATE TABLE IF NOT EXISTS Työntekijät (
    työntekijänro INT          PRIMARY KEY,
    tehtävänimike VARCHAR (50),
    nimi          VARCHAR (50),
    osoite        VARCHAR (50),
    puhelin       VARCHAR (20),
    alkamispvm    DATE,
    loppumispvm   DATE
);

INSERT INTO Työntekijät (
                            työntekijänro,
                            tehtävänimike,
                            nimi,
                            osoite,
                            puhelin,
                            alkamispvm,
                            loppumispvm
                        )
                        VALUES (
                            1,
                            'Professori',
                            'Matti Meikäläinen',
                            'Otakaari 1, Espoo',
                            '0401234567',
                            '2019-08-01',
                            NULL
                        );

INSERT INTO Työntekijät (
                            työntekijänro,
                            tehtävänimike,
                            nimi,
                            osoite,
                            puhelin,
                            alkamispvm,
                            loppumispvm
                        )
                        VALUES (
                            2,
                            'Yliopisto-opettaja',
                            'Liisa Laitinen',
                            'Otakaari 2, Espoo',
                            '0407654321',
                            '2018-01-01',
                            NULL
                        );

INSERT INTO Työntekijät (
                            työntekijänro,
                            tehtävänimike,
                            nimi,
                            osoite,
                            puhelin,
                            alkamispvm,
                            loppumispvm
                        )
                        VALUES (
                            3,
                            'Assistentti',
                            'Mikko Mikkonen',
                            'Otakaari 3, 02150 Espoo',
                            '0405551234',
                            '2021-03-01',
                            '2023-12-31'
                        );


-- Index: idx_harjoitusryhma_ilmoittautuminen_HrID
CREATE INDEX IF NOT EXISTS idx_harjoitusryhma_ilmoittautuminen_HrID ON Harjoitusryhmäilmoittautuminen (
    HrID
);


-- Index: idx_harjoitusryhma_ilmoittautuminen_opiskelijanro
CREATE INDEX IF NOT EXISTS idx_harjoitusryhma_ilmoittautuminen_opiskelijanro ON Harjoitusryhmäilmoittautuminen (
    opiskelijanro
);


-- Index: idx_harjoitusryhmat_HrID
CREATE INDEX IF NOT EXISTS idx_harjoitusryhmat_HrID ON Harjoitusryhmät (
    HrID
);


-- Index: idx_hrkokoontumiset_ajankohta
CREATE INDEX IF NOT EXISTS idx_hrkokoontumiset_ajankohta ON HrKokoontumiset (
    ajankohta
);


-- Index: idx_hrkokoontumiset_HrID
CREATE INDEX IF NOT EXISTS idx_hrkokoontumiset_HrID ON HrKokoontumiset (
    HrID
);


-- Index: idx_kurssikerrat_kurssikerta
CREATE INDEX IF NOT EXISTS idx_kurssikerrat_kurssikerta ON Kurssikerrat (
    kurssikerta
);


-- Index: idx_kurssikerrat_kurssikoodi
CREATE INDEX IF NOT EXISTS idx_kurssikerrat_kurssikoodi ON Kurssikerrat (
    kurssikoodi
);


-- Index: idx_kurssit_kurssikoodi
CREATE INDEX IF NOT EXISTS idx_kurssit_kurssikoodi ON Kurssit (
    kurssikoodi
);


-- Index: idx_luennot_kurssikerta
CREATE INDEX IF NOT EXISTS idx_luennot_kurssikerta ON Luennot (
    kurssikerta
);


-- Index: idx_luennot_luentoID
CREATE INDEX IF NOT EXISTS idx_luennot_luentoID ON Luennot (
    luentoID
);


-- Index: idx_luento_kurssikerta_kurssikerta
CREATE INDEX IF NOT EXISTS idx_luento_kurssikerta_kurssikerta ON LuentoKurssikerta (
    kurssikerta
);


-- Index: idx_luento_kurssikerta_luentoID
CREATE INDEX IF NOT EXISTS idx_luento_kurssikerta_luentoID ON LuentoKurssikerta (
    luentoID
);


-- Index: idx_opiskelijat_opiskelijanumero
CREATE INDEX IF NOT EXISTS idx_opiskelijat_opiskelijanumero ON Opiskelijat (
    opiskelijanumero
);


-- Index: idx_opiskelijat_tutkintoohjelma
CREATE INDEX IF NOT EXISTS idx_opiskelijat_tutkintoohjelma ON Opiskelijat (
    tutkintoohjelma
);


-- Index: idx_rakennukset_nimi
CREATE INDEX IF NOT EXISTS idx_rakennukset_nimi ON Rakennukset (
    nimi
);


-- Index: idx_salit_saliID
CREATE INDEX IF NOT EXISTS idx_salit_saliID ON Salit (
    saliID
);


-- Index: idx_salivaraukset_ajankohta
CREATE INDEX IF NOT EXISTS idx_salivaraukset_ajankohta ON Salivaraukset (
    ajankohta
);


-- Index: idx_salivaraukset_saliID
CREATE INDEX IF NOT EXISTS idx_salivaraukset_saliID ON Salivaraukset (
    saliID
);


-- Index: idx_salivaraukset_tyontekijanro
CREATE INDEX IF NOT EXISTS idx_salivaraukset_tyontekijanro ON Salivaraukset (
    työntekijänro
);


-- Index: idx_tentit_ajankohta
CREATE INDEX IF NOT EXISTS idx_tentit_ajankohta ON Tentit (
    ajankohta
);


-- Index: idx_tentit_tenttiID
CREATE INDEX IF NOT EXISTS idx_tentit_tenttiID ON Tentit (
    tenttiID
);


-- Index: idx_tentti_ilmot_kieli
CREATE INDEX IF NOT EXISTS idx_tentti_ilmot_kieli ON Tenttiilmot (
    kieli
);


-- Index: idx_tentti_ilmot_opiskelijanro
CREATE INDEX IF NOT EXISTS idx_tentti_ilmot_opiskelijanro ON Tenttiilmot (
    opiskelijanro
);


-- Index: idx_tentti_ilmot_tenttiID
CREATE INDEX IF NOT EXISTS idx_tentti_ilmot_tenttiID ON Tenttiilmot (
    tenttiID
);


-- Index: idx_tenttisuoritukset_opiskelijanro
CREATE INDEX IF NOT EXISTS idx_tenttisuoritukset_opiskelijanro ON Tenttisuoritukset (
    opiskelijanro
);


-- Index: idx_tenttisuoritukset_tenttiID
CREATE INDEX IF NOT EXISTS idx_tenttisuoritukset_tenttiID ON Tenttisuoritukset (
    tenttiID
);


-- Index: idx_tyontekijat_tyontekijanro
CREATE INDEX IF NOT EXISTS idx_tyontekijat_tyontekijanro ON Työntekijät (
    työntekijänro
);


-- View: KurssiIlmoittautuminen
CREATE VIEW IF NOT EXISTS KurssiIlmoittautuminen AS
    SELECT Kurssikerrat.kurssikoodi,
           Kurssikerrat.lukukausi,
           COUNT(DISTINCT Opiskelijat.opiskelijanumero) AS Ilmoittautuminen
      FROM Kurssikerrat
           JOIN
           HrKokoontumiset ON Kurssikerrat.kurssikerta = HrKokoontumiset.kurssikerta
           JOIN
           HarjoitusryhmäIlmoittautuminen ON HrKokoontumiset.HrID = HarjoitusryhmäIlmoittautuminen.HrID
           JOIN
           Opiskelijat ON HarjoitusryhmäIlmoittautuminen.opiskelijanro = Opiskelijat.opiskelijanumero
     GROUP BY Kurssikerrat.kurssikoodi,
              Kurssikerrat.lukukausi;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
