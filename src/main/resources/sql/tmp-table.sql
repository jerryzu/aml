CREATE TABLE
    pers_web_app_grp_member
    (
        cst_no VARCHAR(30),
        acc_name VARCHAR(100),
        nation VARCHAR(30),
        id_type VARCHAR(30),
        id_no VARCHAR(20),
        occupation_code VARCHAR(61),
        occupation CHAR(0) NOT NULL
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;
CREATE TABLE
    pers_web_app_insured
    (
        cst_no VARCHAR(30),
        acc_name VARCHAR(100),
        cst_sex VARCHAR(30),
        nation VARCHAR(30),
        id_type VARCHAR(30),
        id_no VARCHAR(20),
        id_deadline DATETIME,
        occupation_code VARCHAR(30),
        income DECIMAL(20,2),
        contact1 VARCHAR(20),
        contact2 VARCHAR(50),
        contact3 VARCHAR(30),
        address1 VARCHAR(200),
        address2 VARCHAR(200),
        address3 VARCHAR(200),
        company VARCHAR(100),
        c_country VARCHAR(30),
        c_aml_addr VARCHAR(200),
        c_clnt_mrk VARCHAR(1)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;
CREATE TABLE
    pers_web_clm_bank
    (
        cst_no VARCHAR(30),
        acc_name VARCHAR(100),
        c_id_card CHAR(0) NOT NULL,
        id_type VARCHAR(15),
        id_no VARCHAR(100),
        contact1 VARCHAR(50)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;
CREATE TABLE
    pers_web_ply_applicant
    (
        cst_no VARCHAR(30),
        acc_name VARCHAR(100) NOT NULL,
        cst_sex VARCHAR(30),
        nation VARCHAR(30),
        id_type VARCHAR(30),
        id_no VARCHAR(20),
        id_deadline DATETIME,
        occupation_code VARCHAR(30),
        occupation VARCHAR(20),
        contact1 VARCHAR(50),
        address1 VARCHAR(200),
        company VARCHAR(100)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;
CREATE TABLE
    pers_web_ply_bnfc
    (
        cst_no VARCHAR(30),
        acc_name VARCHAR(100),
        cst_sex VARCHAR(30),
        nation VARCHAR(30),
        id_type VARCHAR(30),
        id_no VARCHAR(20),
        contact1 VARCHAR(50),
        contact2 VARCHAR(20)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;
CREATE TABLE
    units_web_app_insured
    (
        cst_no VARCHAR(30),
        acc_name VARCHAR(100),
        address VARCHAR(200),
        operate VARCHAR(50),
        license VARCHAR(50),
        id_deadline DATETIME,
        org_no VARCHAR(50),
        tax_no VARCHAR(50),
        rep_name VARCHAR(100),
        id_type2 VARCHAR(30),
        id_no2 VARCHAR(20),
        id_deadline2 DATETIME,
        man_name VARCHAR(100),
        id_type3 VARCHAR(30),
        id_no3 VARCHAR(30),
        id_deadline3 DATETIME,
        ope_name VARCHAR(100),
        id_no4 VARCHAR(20),
        id_deadline4 DATETIME,
        industry VARCHAR(30),
        reg_amt VARCHAR(30)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;
CREATE TABLE
    units_web_ply_applicant
    (
        cst_no VARCHAR(30),
        acc_name VARCHAR(100) NOT NULL,
        address VARCHAR(200),
        operate VARCHAR(50),
        license VARCHAR(50),
        id_deadline DATETIME,
        org_no VARCHAR(50),
        tax_no VARCHAR(50),
        rep_name VARCHAR(100),
        id_type2 VARCHAR(30),
        id_no2 VARCHAR(20),
        id_deadline2 DATETIME,
        man_name VARCHAR(100),
        id_type3 VARCHAR(30),
        id_no3 VARCHAR(30),
        id_deadline3 DATETIME,
        ope_name VARCHAR(100),
        id_type4 VARCHAR(30),
        id_no4 VARCHAR(20),
        id_deadline4 DATETIME,
        industry_code VARCHAR(30),
        industry VARCHAR(30)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;
CREATE TABLE
    units_web_ply_bnfc
    (
        cst_no VARCHAR(30),
        acc_name VARCHAR(100),
        address VARCHAR(200),
        ope_name VARCHAR(100),
        id_type4 VARCHAR(30),
        id_no4 VARCHAR(20)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;