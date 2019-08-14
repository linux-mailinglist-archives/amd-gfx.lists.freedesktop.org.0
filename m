Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033E08DF08
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 22:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C456E840;
	Wed, 14 Aug 2019 20:40:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770073.outbound.protection.outlook.com [40.107.77.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA386E840
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 20:40:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iznwmEvQAAnomcZhO8fybMIQIbIGJWFOE77kdXHJZEFs3FZAoJf7Tipn/jpOFWL6KSvSfb6JoPkvfrdKokYPiK6pdx76cMnZxxzod803zNz4Zmxiq1lCuhwpo2AzBBdhLKN1kc55MyQmxlPovLUfnsj7saSyjOtRC2i9hsbbCElQaiELEOOPRlZkl5+gDlKdYDjJwPhddUYmcSawXnUfgIzW1LlsEKyscsx3yfs4mKBtv1+cVxtb5jybtTzwoArSC6F9QKE8wLIPXzCav8XylDYAHd1rbPwZlp0KxPN/EfxNL+ilFsJmXc+5n8HGHzPIzOtOkLCfPT1H4dVWUjLmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7e8tC6KofDlKgGg/NwuMAYKXab1+oIuLoQsh14jvVI=;
 b=f3GwqWaQr3X8cAxAeD4H3Y5FCZ8kneU0pKmG/7bleLlqmWE7ps9HU5EbpGUfKj8kPCY5flvlu2CtcLCDAwtfxsiFg34nckg3AmA+RCUUf5/LFRptkkvmZCDo2lmp5E9uaMIkVsuN2xjRGYGE4L7r9iZPdGCBz3zrBkSyMfbSrR418EOXcKXRj33snWllCtgjBcux5R7qOj1YpsRMoKNe5jPvX+7H7RMZw4VCBME9wR9AIiIyXjjEf4Ek3kfdbr8+bydW8Msw9NBakqUXxXT01i/0Js+D9r6j4xyKXmGx5Cn1boPvP+LouaNXhWGQHfkNNctpW2Q0KuPKKH8WiUwPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0018.namprd12.prod.outlook.com
 (2603:10b6:910:16::28) by BN6PR12MB1267.namprd12.prod.outlook.com
 (2603:10b6:404:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.23; Wed, 14 Aug
 2019 20:40:44 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by CY4PR1201CA0018.outlook.office365.com
 (2603:10b6:910:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.14 via Frontend
 Transport; Wed, 14 Aug 2019 20:40:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 14 Aug 2019 20:40:44 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 14 Aug 2019 15:40:42 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 4/5] drm/amd/poweplay: Add amd_pm_funcs callback for mode 2
Date: Wed, 14 Aug 2019 16:40:16 -0400
Message-ID: <1565815217-9533-5-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(50226002)(70206006)(47776003)(70586007)(48376002)(11346002)(486006)(2616005)(476003)(126002)(14444005)(186003)(446003)(305945005)(50466002)(53936002)(8936002)(44832011)(4326008)(86362001)(54906003)(6916009)(8676002)(76176011)(5660300002)(81166006)(81156014)(51416003)(16586007)(7696005)(2351001)(336012)(478600001)(426003)(6666004)(356004)(53416004)(2906002)(26005)(316002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1267; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c553775-29fe-425b-b72d-08d720f7ae17
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1267; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1267:
X-Microsoft-Antispam-PRVS: <BN6PR12MB12678C2AF8D70CF9475E7B11EAAD0@BN6PR12MB1267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 01294F875B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: u5n1bGLe4zsBXJbtqoRSPY04of8c3Z05cSZ7mMwxGTCmPsDwBmGPfQMW2LX5FB7I4Gzi+MTjb9hP5QmNb/hNIRxIohlCBURnkhnLIFjPUflFfV7Ek8dK+MrQB2vXY3Mt3ODzS+jHPsRyaKk9tkPM3mUKFcl4/WrHYiLD5+kIuwdf43b19CDjx9Qhy0HbA+ew9LzNd8ChyfdPY44MZqFQAtKRmxgrUDfYSm4dT5W9ZzxFPkr5BAU2yM/H1X1RW3Ls6cJkDPO1nUaFq3CgRqjMa/gUYkILXgfqR8BJyoAmtmD9kTtVMfycBg1DaIRm5+BP5euW5eQ0VRvGdeIvx4gWakUujsab/izQjZcTPzpnk4OrT7Rh130owOuASbaViJfAR2XXTzd/vi7D5bBMlVA7VsdExJ9RJEKbZHl4FV4GZ5c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 20:40:44.3973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c553775-29fe-425b-b72d-08d720f7ae17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7e8tC6KofDlKgGg/NwuMAYKXab1+oIuLoQsh14jvVI=;
 b=3gbqO0BiGd929QkmDEjieue3D46eu1o0MUmMOAI1UVet4VDz1z0kV9BFjwfyyf0I8HmqHTakTcMGld2z3V3uBKPE2VHt3hdy1CTsfoTGkXGWqrrohP46rpAkymmZHC6ViqBkP0lycgWMJM1i48D63QtOWre1K0G0oTHjkAP91PI=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 evan.quan@amd.com, Shirish.S@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2UuaCB8
ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYyAgfCAy
MSArKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJm
YWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUva2dkX3BwX2ludGVyZmFjZS5oCmlu
ZGV4IGJiYTEyOTEuLjBkZTRlMzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRl
L2tnZF9wcF9pbnRlcmZhY2UuaApAQCAtMzEwLDYgKzMxMCw3IEBAIHN0cnVjdCBhbWRfcG1fZnVu
Y3MgewogCWludCAoKnNldF9hc2ljX2JhY29fc3RhdGUpKHZvaWQgKmhhbmRsZSwgaW50IHN0YXRl
KTsKIAlpbnQgKCpnZXRfcHBmZWF0dXJlX3N0YXR1cykodm9pZCAqaGFuZGxlLCBjaGFyICpidWYp
OwogCWludCAoKnNldF9wcGZlYXR1cmVfc3RhdHVzKSh2b2lkICpoYW5kbGUsIHVpbnQ2NF90IHBw
ZmVhdHVyZV9tYXNrcyk7CisJaW50ICgqYXNpY19yZXNldF9tb2RlXzIpKHZvaWQgKmhhbmRsZSk7
CiB9OwogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZF9wb3dlcnBsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dl
cnBsYXkuYwppbmRleCAyZTNkOWVmNi4uN2VmMjAyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYwpAQCAtMTUwOCw2ICsxNTA4LDI2IEBAIHN0YXRp
YyBpbnQgcHBfc2V0X3BwZmVhdHVyZV9zdGF0dXModm9pZCAqaGFuZGxlLCB1aW50NjRfdCBwcGZl
YXR1cmVfbWFza3MpCiAJcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIGludCBwcF9hc2ljX3Jlc2V0
X21vZGVfMih2b2lkICpoYW5kbGUpCit7CisJc3RydWN0IHBwX2h3bWdyICpod21nciA9IGhhbmRs
ZTsKKwkJaW50IHJldCA9IDA7CisKKwlpZiAoIWh3bWdyIHx8ICFod21nci0+cG1fZW4pCisJCXJl
dHVybiAtRUlOVkFMOworCisJaWYgKGh3bWdyLT5od21ncl9mdW5jLT5hc2ljX3Jlc2V0ID09IE5V
TEwpIHsKKwkJcHJfaW5mb19yYXRlbGltaXRlZCgiJXMgd2FzIG5vdCBpbXBsZW1lbnRlZC5cbiIs
IF9fZnVuY19fKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJbXV0ZXhfbG9jaygmaHdtZ3It
PnNtdV9sb2NrKTsKKwlyZXQgPSBod21nci0+aHdtZ3JfZnVuYy0+YXNpY19yZXNldChod21nciwg
U01VX0FTSUNfUkVTRVRfTU9ERV8yKTsKKwltdXRleF91bmxvY2soJmh3bWdyLT5zbXVfbG9jayk7
CisKKwlyZXR1cm4gcmV0OworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZF9wbV9mdW5jcyBw
cF9kcG1fZnVuY3MgPSB7CiAJLmxvYWRfZmlybXdhcmUgPSBwcF9kcG1fbG9hZF9mdywKIAkud2Fp
dF9mb3JfZndfbG9hZGluZ19jb21wbGV0ZSA9IHBwX2RwbV9md19sb2FkaW5nX2NvbXBsZXRlLApA
QCAtMTU2NCw0ICsxNTg0LDUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRfcG1fZnVuY3MgcHBf
ZHBtX2Z1bmNzID0gewogCS5zZXRfYXNpY19iYWNvX3N0YXRlID0gcHBfc2V0X2FzaWNfYmFjb19z
dGF0ZSwKIAkuZ2V0X3BwZmVhdHVyZV9zdGF0dXMgPSBwcF9nZXRfcHBmZWF0dXJlX3N0YXR1cywK
IAkuc2V0X3BwZmVhdHVyZV9zdGF0dXMgPSBwcF9zZXRfcHBmZWF0dXJlX3N0YXR1cywKKwkuYXNp
Y19yZXNldF9tb2RlXzIgPSBwcF9hc2ljX3Jlc2V0X21vZGVfMiwKIH07Ci0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
