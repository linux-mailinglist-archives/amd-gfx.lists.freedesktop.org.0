Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A228DD09C
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 22:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6706E059;
	Fri, 18 Oct 2019 20:49:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720062.outbound.protection.outlook.com [40.107.72.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891EE6E03C
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 20:49:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uyl3hRzP7uw6fYmYXkTES4R6FdFogwFnGBX2uuxuCiEIru6lOETdaDfJ/k0oooTsMzdJqLaqH2fXN+C83a1u2SvAlx7cn4X+esFSjnoZFHKeXVn7AZpWF7kscGjQqC5duKVLfqPN+rOu7cW67cnmRMd521rdYqXh22x7n2s+Ed3GUw0XVnya+nAdY8J1QwSnWOx75/PNeqAA2WBRVJhhHSk7foTJlR+7F4Id2LcFgE0m/wZNu0Je8MGbTcGiwb+Kc/jlj+qAaAju+byYon/uE6M8hkNiwPXK5L86COUwgyPT9Uu/MkDujxYRWZS3mA6gTwaTc5LZqTQbmZhU6rn3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vap7romU8Ez3Hfhuf/idce1PZBd+Opr2vFZYl1WGSyc=;
 b=hdK+hmGVVg5JdNQpiXaKKeag41RDjWtXvvpIbWwTY247xAq//ADInwxoakG/J8p9a5s599Y3kYJUw5FscQjbbXZXMiLavSDRrgHjkD7V5dpi0oqMaziBO1La/1NKj6GS8o09CdWsZJo8e67VzsjvO5tcd8AgTtfeugE9FwwnK7y4q+WJb2aaIezxitbBhh6t3asjKZxUFt/hRunBVqdyJAVq9wI6qMtGyF5muCGuZr3HAsbixTarlft63bpG0QFWgYvDvaqSUHrWl6pxq9/JareMSRjqCkVEyWlKtQ/heFoztZ2J6rqNvYy6ITRAciIRlcFOzIQBxxJKWiYEI72Wbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 CY4PR12MB1512.namprd12.prod.outlook.com (2603:10b6:910:3::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Fri, 18 Oct 2019 20:49:52 +0000
Received: from BY2NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20 via Frontend
 Transport; Fri, 18 Oct 2019 20:49:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT035.mail.protection.outlook.com (10.152.84.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Fri, 18 Oct 2019 20:49:51 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 18 Oct
 2019 15:49:50 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 18 Oct 2019 15:49:49 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amdgpu: Use ARCTURUS in RAS EEPROM.
Date: Fri, 18 Oct 2019 16:48:30 -0400
Message-ID: <1571431711-30149-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(428003)(189003)(199004)(356004)(50226002)(26005)(6666004)(76176011)(4326008)(51416003)(81166006)(7696005)(81156014)(316002)(305945005)(16586007)(2906002)(53416004)(8936002)(54906003)(8676002)(86362001)(70586007)(70206006)(5660300002)(47776003)(2351001)(6916009)(14444005)(36756003)(426003)(186003)(336012)(50466002)(48376002)(478600001)(11346002)(486006)(2616005)(446003)(126002)(476003)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1512; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c45b253-b81d-492b-6190-08d7540cb91d
X-MS-TrafficTypeDiagnostic: CY4PR12MB1512:
X-Microsoft-Antispam-PRVS: <CY4PR12MB151256F74A3050F2F8DDC297EA6C0@CY4PR12MB1512.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 01949FE337
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aZjpagtjLdJxxm1EnRb/RNcuwMyIFPUNVvSjBsJXyh1vrT46XRV0GT/H/qRgWa5jYhj65SvtlpXKc52zc2/zOkm0DFNydxuUQ5TZ08+C5//Ocv/0otyAeZfOXxDsQLvSHaV04AcP/EHhhEcd0laT6oHs9NUf/OjMftuTE5gzgtKjWOhMl7U33bfk0blOlmq9QZDJtGy9lZ4Ky7jl+hJNKDB6yR4QYCHouClSse5LZzDksHuwvR/GEwmGtBiB3ouLoG1Vu4xzlek4Dx1FrMx+dsYwRiWefTKSY8sXwipL0HcTU/jnWLIv2OX7THFRmYl4b+irPJmF3hiDOfqoDQKi7pOiuotdgs2qVF5r88jTlxbD6nbkcn4S5zwLMQITvn4ConNqMP5AwyDPfrTxXsfdw3fDVSx2BLNWMnZZN8Q9J/Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 20:49:51.6944 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c45b253-b81d-492b-6190-08d7540cb91d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1512
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vap7romU8Ez3Hfhuf/idce1PZBd+Opr2vFZYl1WGSyc=;
 b=nInLUGB2KQ63FZ2ur1/pCRyrrZEUeQqIbSv++Wv6+JHRNG1BG8n9esWwwC480ic5UkTgcJIsqnv1US24Xf3LtB9fvLnz02jClAfbo2i1oiFxHbBQnX+SKzJCsvseJSbVQ2/AFrEHzhPlNvngZ5cyrrQbYObkC02oO1nU1GAj5yE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Guchun.Chen@amd.com,
 Tao.Zhou1@amd.com, noreply-confluence@amd.com, Alexander.Deucher@amd.com,
 Evan.Quan@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYyB8
IDkgKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19l
ZXByb20uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMK
aW5kZXggMjBhZjBhMS4uN2RlMTZjMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzX2VlcHJvbS5jCkBAIC0yMTYsNiArMjE2LDEwIEBAIGludCBhbWRncHVfcmFz
X2VlcHJvbV9pbml0KHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sICpjb250cm9sKQog
CQlyZXQgPSBzbXVfdjExXzBfaTJjX2VlcHJvbV9jb250cm9sX2luaXQoJmNvbnRyb2wtPmVlcHJv
bV9hY2Nlc3Nvcik7CiAJCWJyZWFrOwogCisJY2FzZSBDSElQX0FSQ1RVUlVTOgorCQlyZXQgPSBz
bXVfaTJjX2VlcHJvbV9pbml0KCZhZGV2LT5zbXUsICZjb250cm9sLT5lZXByb21fYWNjZXNzb3Ip
OworCQlicmVhazsKKwogCWRlZmF1bHQ6CiAJCXJldHVybiAwOwogCX0KQEAgLTI2MCw2ICsyNjQs
OSBAQCB2b2lkIGFtZGdwdV9yYXNfZWVwcm9tX2Zpbmkoc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9t
X2NvbnRyb2wgKmNvbnRyb2wpCiAJY2FzZSBDSElQX1ZFR0EyMDoKIAkJc211X3YxMV8wX2kyY19l
ZXByb21fY29udHJvbF9maW5pKCZjb250cm9sLT5lZXByb21fYWNjZXNzb3IpOwogCQlicmVhazsK
KwljYXNlIENISVBfQVJDVFVSVVM6CisJCXNtdV9pMmNfZWVwcm9tX2ZpbmkoJmFkZXYtPnNtdSwg
JmNvbnRyb2wtPmVlcHJvbV9hY2Nlc3Nvcik7CisJCWJyZWFrOwogCiAJZGVmYXVsdDoKIAkJcmV0
dXJuOwpAQCAtMzY0LDcgKzM3MSw3IEBAIGludCBhbWRncHVfcmFzX2VlcHJvbV9wcm9jZXNzX3Jl
Y29kcyhzdHJ1Y3QgYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwKIAlzdHJ1Y3Qg
ZWVwcm9tX3RhYmxlX3JlY29yZCAqcmVjb3JkOwogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
ID0gdG9fYW1kZ3B1X2RldmljZShjb250cm9sKTsKIAotCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0g
Q0hJUF9WRUdBMjApCisJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX1ZFR0EyMCAmJiBhZGV2
LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJVUykKIAkJcmV0dXJuIDA7CiAKIAlidWZmcyA9IGtj
YWxsb2MobnVtLCBFRVBST01fQUREUkVTU19TSVpFICsgRUVQUk9NX1RBQkxFX1JFQ09SRF9TSVpF
LAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
