Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC858DE1C
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 21:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8256E821;
	Wed, 14 Aug 2019 19:54:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800043.outbound.protection.outlook.com [40.107.80.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DCF6E821
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 19:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUC+OnLs6NACboSC9CEP18zBkcmDrl+B2rB67BpzTiWOzLMeYPJRpNMmjLsmEgrc6Kp1NTfyYKoXPdHGzFL7I+xb47aKKnB/kx+GnAUJQA/BfbgxSymLeNaYBBiBUVtq1KOoUAIcUc8mxkQfuTWgyvJ1YZGtAN3dHgMVAcnLhtmJkf9mta5eZtbqhZ0XcI3i5RNtOD+DwfeK0Um0Ve2WKZLBvqmcC+pFx8WpK0Y6i5E+m0UB318Fy5Z+QRMtGqAGk+MehhIwMzy0+/ZmIY+38ClTqoUdbW+4Q5ACC709kZrswlkouyJaCByD6dOPNVUoyNiR5vNpgPjlVVRZjOeDyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXFq/3+t7OB7qIgpkiRqeME6a2d/uLWfpiaFomv/QRc=;
 b=f8aJrS3Qv2dTQrkDujw0mVign5eRmTl06XtE1mN3hGpnhZm8AxQvQ5YO1q+iAn4oWGF60HHa8Xvdrw/zpsFHunbQrDZkfKgqKCHr9DvKR7XVlruFJM9yN1+JLWR01l7C06MvzxTOpACqDkRu77OQOI73SAdUWoq3EvupM9ieaxm2/2DQtO5+qX3Wgt8JKBcSLhEvtAFQLMILnyz+Q8dCO0mCqjp+kYQqxCxMvhODzKsFzJMpEPcPs2vEBzbpQShrRsXYFMzrqrFnxqS09a3wqMclL2mrvxQhoL2wpBFVwDNyh22EwvZVMT4iecO0FkF1BK7bsSGrtgaRKQxSAfQQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0045.namprd12.prod.outlook.com (2603:10b6:405:70::31)
 by BN7PR12MB2705.namprd12.prod.outlook.com (2603:10b6:408:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15; Wed, 14 Aug
 2019 19:53:58 +0000
Received: from BY2NAM03FT060.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by BN6PR12CA0045.outlook.office365.com
 (2603:10b6:405:70::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.18 via Frontend
 Transport; Wed, 14 Aug 2019 19:53:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT060.mail.protection.outlook.com (10.152.85.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Wed, 14 Aug 2019 19:53:57 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 14 Aug 2019 14:53:54 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amd/powerplay: Add support for mode2 ASIC reset.
Date: Wed, 14 Aug 2019 15:53:33 -0400
Message-ID: <1565812414-26117-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565812414-26117-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1565812414-26117-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(376002)(136003)(2980300002)(428003)(199004)(189003)(316002)(16586007)(14444005)(486006)(36756003)(70206006)(5660300002)(50226002)(81156014)(81166006)(8936002)(70586007)(446003)(11346002)(126002)(2616005)(476003)(6916009)(44832011)(305945005)(86362001)(53416004)(2351001)(8676002)(76176011)(186003)(53936002)(51416003)(7696005)(4326008)(336012)(426003)(26005)(48376002)(478600001)(2906002)(50466002)(6666004)(356004)(54906003)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2705; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14241f39-6127-4e53-76e0-08d720f1250b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2705; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2705:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2705E0B0C2C3C68B012E646DEAAD0@BN7PR12MB2705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 01294F875B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: skgYF1AJnM9uSCQ2YuHZwxCQXgFCkiaMuJdLf9OqpWzBd62A1mjirIoNOh+Ib1i+kY6AErKD3lbzGqsjBpR/MJ3hTmX5BfLRKnjAmH33I3k3opm47/gIld9v8t86sUidAmyN2lDhRerEGFnxEufAlsGUy2KcDFIESQ4+NTfncQZvqxB7FbBqLBReeTjXyUJfH/KDYcfqK+sA02b9eymBrVJgVZwNHqiq6SkKVXleQ5BmWpu+PgFXuaSEK6td6qQNBIpy6ira7lrulIlLW9YUwrkX4g20dVPSvPH+5k9Px2jwM62Zqa49EresLHVHimixGNdSDtVq1R/YEBN2CRyrBepMKZJ+orKxD0Du0T4SPo3FruCnj/VnrHaaRlI8BkDu1V0oT54ycZ0+lEec1ArnSbvRNNFGkTEI6uyCGTDB+UI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 19:53:57.5308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14241f39-6127-4e53-76e0-08d720f1250b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2705
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXFq/3+t7OB7qIgpkiRqeME6a2d/uLWfpiaFomv/QRc=;
 b=UkNb5N6/4pRNBJN0Y9vVisEYIHA0CQjIeiqZQdnNfVHAwET8dQM0g9J/sl8r7SzqhysuydjgiXo48Z3EYP+RVG+ZzFawykEErcKuEa372MAMNhjKwXmj0Rj/DqAOcaibkL7PhL2A/FVeKVJJY34/AWaokQMMBtAk+MMeBfr3KhA=
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

TW9kZSAyIEdQVSByZXNldCBzaG91bGQgYmUgZG9uZSBieSBzZW5kaW5nIG1lc3NhZ2UgdG8gU01V
LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2tnZF9wcF9pbnRlcmZhY2Uu
aCAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXku
YyAgICAgfCAyMSArKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMgfCAgNyArKysrKysrCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9pbmMvaHdtZ3IuaCAgICAgICAgIHwgIDkgKysrKysrKysrCiA0IGZpbGVz
IGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2luY2x1ZGUva2dkX3BwX2ludGVyZmFjZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNs
dWRlL2tnZF9wcF9pbnRlcmZhY2UuaAppbmRleCBiYmExMjkxLi45YzQ3N2I0IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUva2dkX3BwX2ludGVyZmFjZS5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmgKQEAgLTMxMCw2ICsz
MTAsNyBAQCBzdHJ1Y3QgYW1kX3BtX2Z1bmNzIHsKIAlpbnQgKCpzZXRfYXNpY19iYWNvX3N0YXRl
KSh2b2lkICpoYW5kbGUsIGludCBzdGF0ZSk7CiAJaW50ICgqZ2V0X3BwZmVhdHVyZV9zdGF0dXMp
KHZvaWQgKmhhbmRsZSwgY2hhciAqYnVmKTsKIAlpbnQgKCpzZXRfcHBmZWF0dXJlX3N0YXR1cyko
dm9pZCAqaGFuZGxlLCB1aW50NjRfdCBwcGZlYXR1cmVfbWFza3MpOworCWludCAoKmFzaWNfcmVz
ZXRfbW9kXzIpKHZvaWQgKmhhbmRsZSk7CiB9OwogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYwppbmRleCAyZTNkOWVmNi4uYmVjY2E3NiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZF9wb3dlcnBsYXkuYwpAQCAt
MTUwOCw2ICsxNTA4LDI2IEBAIHN0YXRpYyBpbnQgcHBfc2V0X3BwZmVhdHVyZV9zdGF0dXModm9p
ZCAqaGFuZGxlLCB1aW50NjRfdCBwcGZlYXR1cmVfbWFza3MpCiAJcmV0dXJuIHJldDsKIH0KIAor
c3RhdGljIGludCBwcF9hc2ljX3Jlc2V0X21vZGVfMih2b2lkICpoYW5kbGUpCit7CisJc3RydWN0
IHBwX2h3bWdyICpod21nciA9IGhhbmRsZTsKKwkJaW50IHJldCA9IDA7CisKKwlpZiAoIWh3bWdy
IHx8ICFod21nci0+cG1fZW4pCisJCXJldHVybiAtRUlOVkFMOworCisJaWYgKGh3bWdyLT5od21n
cl9mdW5jLT5hc2ljX3Jlc2V0ID09IE5VTEwpIHsKKwkJcHJfaW5mb19yYXRlbGltaXRlZCgiJXMg
d2FzIG5vdCBpbXBsZW1lbnRlZC5cbiIsIF9fZnVuY19fKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJ
fQorCisJbXV0ZXhfbG9jaygmaHdtZ3ItPnNtdV9sb2NrKTsKKwlyZXQgPSBod21nci0+aHdtZ3Jf
ZnVuYy0+YXNpY19yZXNldChod21nciwgU01VX0FTQ0lfUkVTRVRfTU9ERV8yKTsKKwltdXRleF91
bmxvY2soJmh3bWdyLT5zbXVfbG9jayk7CisKKwlyZXR1cm4gcmV0OworfQorCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGFtZF9wbV9mdW5jcyBwcF9kcG1fZnVuY3MgPSB7CiAJLmxvYWRfZmlybXdhcmUg
PSBwcF9kcG1fbG9hZF9mdywKIAkud2FpdF9mb3JfZndfbG9hZGluZ19jb21wbGV0ZSA9IHBwX2Rw
bV9md19sb2FkaW5nX2NvbXBsZXRlLApAQCAtMTU2NCw0ICsxNTg0LDUgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBhbWRfcG1fZnVuY3MgcHBfZHBtX2Z1bmNzID0gewogCS5zZXRfYXNpY19iYWNvX3N0
YXRlID0gcHBfc2V0X2FzaWNfYmFjb19zdGF0ZSwKIAkuZ2V0X3BwZmVhdHVyZV9zdGF0dXMgPSBw
cF9nZXRfcHBmZWF0dXJlX3N0YXR1cywKIAkuc2V0X3BwZmVhdHVyZV9zdGF0dXMgPSBwcF9zZXRf
cHBmZWF0dXJlX3N0YXR1cywKKwkuYXNpY19yZXNldF9tb2RfMiA9IHBwX2FzaWNfcmVzZXRfbW9k
ZV8yLAogfTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdy
L3NtdTEwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUx
MF9od21nci5jCmluZGV4IDE4ZTc4MGYuLjExMTU3NjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3IuYwpAQCAtMTMxMSw2ICsxMzExLDEy
IEBAIHN0YXRpYyBpbnQgc211MTBfc2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZShzdHJ1Y3QgcHBfaHdt
Z3IgKmh3bWdyLCBsb25nICppbnB1dCwgdWluCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQg
c211MTBfYXNpY19yZXNldChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBlbnVtIFNNVV9BU0lDX1JF
U0VUX01PREUgbW9kZSkKK3sKKwlyZXR1cm4gc211bV9zZW5kX21zZ190b19zbWNfd2l0aF9wYXJh
bWV0ZXIoaHdtZ3IsCisJCQkJCQkgICBQUFNNQ19NU0dfRGV2aWNlRHJpdmVyUmVzZXQsCisJCQkJ
CQkgICBtb2RlKTsKK30KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwcF9od21ncl9mdW5jIHNtdTEw
X2h3bWdyX2Z1bmNzID0gewogCS5iYWNrZW5kX2luaXQgPSBzbXUxMF9od21ncl9iYWNrZW5kX2lu
aXQsCkBAIC0xMzU1LDYgKzEzNjEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwX2h3bWdyX2Z1
bmMgc211MTBfaHdtZ3JfZnVuY3MgPSB7CiAJLnNldF9oYXJkX21pbl9mY2xrX2J5X2ZyZXEgPSBz
bXUxMF9zZXRfaGFyZF9taW5fZmNsa19ieV9mcmVxLAogCS5nZXRfcG93ZXJfcHJvZmlsZV9tb2Rl
ID0gc211MTBfZ2V0X3Bvd2VyX3Byb2ZpbGVfbW9kZSwKIAkuc2V0X3Bvd2VyX3Byb2ZpbGVfbW9k
ZSA9IHNtdTEwX3NldF9wb3dlcl9wcm9maWxlX21vZGUsCisJLmFzaWNfcmVzZXQgPSBzbXUxMF9h
c2ljX3Jlc2V0LAogfTsKIAogaW50IHNtdTEwX2luaXRfZnVuY3Rpb25fcG9pbnRlcnMoc3RydWN0
IHBwX2h3bWdyICpod21ncikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2luYy9od21nci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2h3bWdy
LmgKaW5kZXggMDdmZDY0YS4uZDU4MzU2OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL2h3bWdyLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL2h3bWdyLmgKQEAgLTE4OSw2ICsxODksMTQgQEAgc3RydWN0IHBobV92Y2VfY2xvY2tf
dm9sdGFnZV9kZXBlbmRlbmN5X3RhYmxlIHsKIAlzdHJ1Y3QgcGhtX3ZjZV9jbG9ja192b2x0YWdl
X2RlcGVuZGVuY3lfcmVjb3JkIGVudHJpZXNbMV07CiB9OwogCisKK2VudW0gU01VX0FTSUNfUkVT
RVRfTU9ERQoreworICAgIFNNVV9BU0NJX1JFU0VUX01PREVfMCwKKyAgICBTTVVfQVNDSV9SRVNF
VF9NT0RFXzEsCisgICAgU01VX0FTQ0lfUkVTRVRfTU9ERV8yLAorfTsKKwogc3RydWN0IHBwX3Nt
dW1ncl9mdW5jIHsKIAljaGFyICpuYW1lOwogCWludCAoKnNtdV9pbml0KShzdHJ1Y3QgcHBfaHdt
Z3IgICpod21ncik7CkBAIC0zNDUsNiArMzUzLDcgQEAgc3RydWN0IHBwX2h3bWdyX2Z1bmMgewog
CWludCAoKmdldF9wcGZlYXR1cmVfc3RhdHVzKShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBjaGFy
ICpidWYpOwogCWludCAoKnNldF9wcGZlYXR1cmVfc3RhdHVzKShzdHJ1Y3QgcHBfaHdtZ3IgKmh3
bWdyLCB1aW50NjRfdCBwcGZlYXR1cmVfbWFza3MpOwogCWludCAoKnNldF9tcDFfc3RhdGUpKHN0
cnVjdCBwcF9od21nciAqaHdtZ3IsIGVudW0gcHBfbXAxX3N0YXRlIG1wMV9zdGF0ZSk7CisJaW50
ICgqYXNpY19yZXNldCkoc3RydWN0IHBwX2h3bWdyICpod21nciwgZW51bSBTTVVfQVNJQ19SRVNF
VF9NT0RFIG1vZGUpOwogfTsKIAogc3RydWN0IHBwX3RhYmxlX2Z1bmMgewotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
