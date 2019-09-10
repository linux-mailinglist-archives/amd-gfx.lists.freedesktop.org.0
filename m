Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E71AF19A
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB176E975;
	Tue, 10 Sep 2019 19:06:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770072.outbound.protection.outlook.com [40.107.77.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77F66E975
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUMASsZ6WNDnKpCyaYAmexp/4xz9zjE+LryY+oVIRuMcUFPZQJq3x3NhhAzDX0mvxeohk1tkQI1Ql1O2ySmoqEhOqyvXQlDA1ZUgpDk81L4bjKG0nqeTVkKroB6qvGLbKxj4dp57zLfA/McqFo9azCfT0PhUC67WkDtVVBp2LzkqAzpWnVlX6RpGapnuviNsMIA/7uN+gYz7jgy3Gzx1iCSXSatuARD/VkQftnkdeEtYZHOTlCQ9VgnOfR9kENhRkEtEXG7/Zpau4q8Wy5jgwoKidVtLjfVG8C9jh7Q6yw4erb77Drhop8ceuSLREtbcWn7dbLIX0jK/hA+eodJCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiHMEbxnI58QLIrcmTBQTE9JL8c3NGXjJMsZIFuAniM=;
 b=gKimst66XSS0VEBkLjwG8NfBeLggqtlUxSPlzxB675dsNlPjCOvTUo3/tqXKy+3ZctvJeCFCQmTI5uBN/41mG6f7WO/xeZHCa7qSOAiwC6wzOqRmAm1qJwe0r0GaRQM0NYkBQ6nmvFzUzxHuyEd7/t/EQ1MRqJcMm//xQDJvy6DwfO1CSQ2slOUbFOIyxKuw2uSFuTk+XrXl8W+p/gZ2kJfvgvnE3UcfmskCQZGUs1Qp2hohuTuEg0CDAk17K6EXtr2EYPaVu3ik2YeiY7ANBbS6qsmUBY4N0lESNrBGqtQGLNnWEMkpOiHMS/fG/GudAqDMgH874vu0F5QIxTsGdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0011.namprd12.prod.outlook.com
 (2603:10b6:301:4a::21) by DM5PR1201MB0012.namprd12.prod.outlook.com
 (2603:10b6:3:e7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 19:06:27 +0000
Received: from DM3NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by MWHPR1201CA0011.outlook.office365.com
 (2603:10b6:301:4a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.13 via Frontend
 Transport; Tue, 10 Sep 2019 19:06:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT020.mail.protection.outlook.com (10.152.82.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:06:27 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:06:21 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/20] drm/amd/display: only enable HDCP for DCN+
Date: Tue, 10 Sep 2019 15:05:53 -0400
Message-ID: <20190910190554.1539-20-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-10-Bhawanpreet.Lakha@amd.com>
 <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(2906002)(53416004)(2351001)(86362001)(1076003)(50226002)(81156014)(81166006)(8676002)(4326008)(8936002)(305945005)(5660300002)(14444005)(50466002)(356004)(36756003)(53936002)(6666004)(26005)(316002)(16586007)(48376002)(70586007)(70206006)(5024004)(76176011)(51416003)(7696005)(478600001)(486006)(186003)(336012)(426003)(446003)(11346002)(2616005)(476003)(126002)(47776003)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0012; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eedb072a-afe7-49b2-d0fa-08d73621fb1c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR1201MB0012; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0012:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB001278614A1B8D837DD730ECF9B60@DM5PR1201MB0012.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: w7+RqwuduN7lj9moOJXkN4Cpve7ejYhzVTH0yPU9wgd2p98wGWkMkHwEOGmEMQsLIWNZ+ciCDGiSYvg++w3e8645TjauvJGhYVZOCUXLBaXqVCmyRcKCMJKe99lHQ/Fwwep6IYnCWQ8x8gAJCU3r5EOmI528x5+M6nRLVq/SILxqqwK2wtVcWeVOvGblT9eGs0IDsV5yF+prKQU4gSZvNJwoVCDZHFlLDbu3z0WP2bGKr5C4Jd/Y5FHWjUT4Kc3TITiD1xqoXS+jDyejg7n6RrWdYKHeyN3LCv8UPifQ3UWv640JTnS51GH6b3LvoEeqxk9PO8uRint6DAW5ke410Lv0Ib+wBN+36StOTFGX1TILMp0XJOg/Gem5TTW8GGET05FhFtoeb+BdsGtDwgyh/6p0fP0lLPGDpyTdI9vnAjI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:06:27.0014 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eedb072a-afe7-49b2-d0fa-08d73621fb1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0012
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiHMEbxnI58QLIrcmTBQTE9JL8c3NGXjJMsZIFuAniM=;
 b=cAH4zLg/NTz1YtYfDdLe5obdXt/e+ZYR1ehTQqNrYm8wh3uwTDn55PmG6Q5sOut+wuyu/dnZPwu3NXpaZzgS1w981ef1yCNc16O7dFyVORffcMntzHLsKvmAgI33ZPvboBtlbkEHGa8xJaiZBCJQKjVbQWsU+i3F2iky/yddR10=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2UgZG9uJ3Qgc3VwcG9ydCBIRENQIGZvciBwcmUgUkFWRU4gYXNpY3MKCltIb3ddCkNo
ZWNrIGlmIHdlIGFyZSBSQVZFTisuIFVzZSB0aGlzIHRvIGF0dGFjaCB0aGUgY29udGVudF9wcm90
ZWN0aW9uCnByb3BlcnR5LCB0aGlzIHdheSB1c2VybW9kZSBjYW4ndCB0cnkgdG8gZW5hYmxlIEhE
Q1Agb24gcHJlIERDTiBhc2ljcy4KCkFsc28gd2UgbmVlZCB0byB1cGRhdGUgdGhlIG1vZHVsZSBv
biBocGQgc28gZ3VhcmQgaXQgYXN3ZWxsCgpTaWduZWQtb2ZmLWJ5OiBCaGF3YW5wcmVldCBMYWto
YSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5k
IDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyB8IDIwICsrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDg3OWI3MGYyY2Iw
ZC4uYTcwYzFmNTEyZGQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTczMywxNCArNzMzLDE2IEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X2RtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJYW1kZ3B1X2RtX2luaXRf
Y29sb3JfbW9kKCk7CiAKICNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19IRENQCi0JYWRldi0+ZG0u
aGRjcF93b3JrcXVldWUgPSBoZGNwX2NyZWF0ZV93b3JrcXVldWUoJmFkZXYtPnBzcCwgJmluaXRf
cGFyYW1zLmNwX3BzcCwgYWRldi0+ZG0uZGMpOworCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJ
UF9SQVZFTikgeworCQlhZGV2LT5kbS5oZGNwX3dvcmtxdWV1ZSA9IGhkY3BfY3JlYXRlX3dvcmtx
dWV1ZSgmYWRldi0+cHNwLCAmaW5pdF9wYXJhbXMuY3BfcHNwLCBhZGV2LT5kbS5kYyk7CiAKLQlp
ZiAoIWFkZXYtPmRtLmhkY3Bfd29ya3F1ZXVlKQotCQlEUk1fRVJST1IoImFtZGdwdTogZmFpbGVk
IHRvIGluaXRpYWxpemUgaGRjcF93b3JrcXVldWUuXG4iKTsKLQllbHNlCi0JCURSTV9ERUJVR19E
UklWRVIoImFtZGdwdTogaGRjcF93b3JrcXVldWUgaW5pdCBkb25lICVwLlxuIiwgYWRldi0+ZG0u
aGRjcF93b3JrcXVldWUpOworCQlpZiAoIWFkZXYtPmRtLmhkY3Bfd29ya3F1ZXVlKQorCQkJRFJN
X0VSUk9SKCJhbWRncHU6IGZhaWxlZCB0byBpbml0aWFsaXplIGhkY3Bfd29ya3F1ZXVlLlxuIik7
CisJCWVsc2UKKwkJCURSTV9ERUJVR19EUklWRVIoImFtZGdwdTogaGRjcF93b3JrcXVldWUgaW5p
dCBkb25lICVwLlxuIiwgYWRldi0+ZG0uaGRjcF93b3JrcXVldWUpOwogCi0JZGNfaW5pdF9jYWxs
YmFja3MoYWRldi0+ZG0uZGMsICZpbml0X3BhcmFtcyk7CisJCWRjX2luaXRfY2FsbGJhY2tzKGFk
ZXYtPmRtLmRjLCAmaW5pdF9wYXJhbXMpOworCX0KICNlbmRpZgogCWlmIChhbWRncHVfZG1faW5p
dGlhbGl6ZV9kcm1fZGV2aWNlKGFkZXYpKSB7CiAJCURSTV9FUlJPUigKQEAgLTE0OTcsNyArMTQ5
OSw4IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9ocGRfaXJxKHZvaWQgKnBhcmFtKQogCW11dGV4X2xv
Y2soJmFjb25uZWN0b3ItPmhwZF9sb2NrKTsKIAogI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0hE
Q1AKLQloZGNwX3Jlc2V0X2Rpc3BsYXkoYWRldi0+ZG0uaGRjcF93b3JrcXVldWUsIGFjb25uZWN0
b3ItPmRjX2xpbmstPmxpbmtfaW5kZXgpOworCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9S
QVZFTikKKwkJaGRjcF9yZXNldF9kaXNwbGF5KGFkZXYtPmRtLmhkY3Bfd29ya3F1ZXVlLCBhY29u
bmVjdG9yLT5kY19saW5rLT5saW5rX2luZGV4KTsKICNlbmRpZgogCWlmIChhY29ubmVjdG9yLT5m
YWtlX2VuYWJsZSkKIAkJYWNvbm5lY3Rvci0+ZmFrZV9lbmFibGUgPSBmYWxzZTsKQEAgLTUxMDMs
NyArNTEwNiw4IEBAIHZvaWQgYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9pbml0X2hlbHBlcihzdHJ1Y3Qg
YW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sCiAJCWRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5
KCZhY29ubmVjdG9yLT5iYXNlLmJhc2UsCiAJCQkJYWRldi0+bW9kZV9pbmZvLmZyZWVzeW5jX2Nh
cGFibGVfcHJvcGVydHksIDApOwogI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0hEQ1AKLQkJZHJt
X2Nvbm5lY3Rvcl9hdHRhY2hfY29udGVudF9wcm90ZWN0aW9uX3Byb3BlcnR5KCZhY29ubmVjdG9y
LT5iYXNlLCBmYWxzZSk7CisJCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9SQVZFTikKKwkJ
CWRybV9jb25uZWN0b3JfYXR0YWNoX2NvbnRlbnRfcHJvdGVjdGlvbl9wcm9wZXJ0eSgmYWNvbm5l
Y3Rvci0+YmFzZSwgZmFsc2UpOwogI2VuZGlmCiAJfQogfQotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
