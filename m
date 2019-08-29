Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FA7A20CF
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 18:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEA16E15C;
	Thu, 29 Aug 2019 16:24:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700044.outbound.protection.outlook.com [40.107.70.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0E06E142
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 16:24:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAx7g7nvOvS3QKbJFBJiHF6hBRFGxtoLew2ECo/8ieLIu5Nf3CgcQJUEaEYg3lE2MmoxdRB1ClQqZlCwVrbUi4snnqO+33nzAye4FPTlKKNw9UJnrYiEx5Rd+9dxWqfJPSTLBq7/O+fOTleqIOMUQ5Rcl+/0CDx0ilsfl1kFxk9XaekUvIxOAkMUtl1Kt/0cuDd/JRplt2FgDXtUMov3kBg6/Jf/vGPycF5UMouqQ/IM6kVqDGs5tSh6b16OhET01S8ozV55PHlPcSO1J2z1FHKJrhZdzSgLcr3oN/qnkv3+snIXX8PFzWhbDg0c2+W+aQbthpr4THtVbnb3MFfBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy7cdlygeubsdvYAnIoPoFohy8jsuglPH8G0P+UvJ70=;
 b=IXBq1q0MoUqCGU+Ge7m3LiKlAM8Ljk5gi52KzVUsdxGvSVrfQKzbAXYXwhBPwEfYeo+PDQh1MUI5Uh73Sa/uMOdf+puJhQ6k5NQs5L55uB4MWY3LvC1wjZMc14PWTwsgP1aIg+mqKyNUTLCIO6th4jIuJ5QdoDYpaRhFFjTgRMOR9IgUOxKyivGn6RrYVFNOcMFelIhOJ3dsen9gM6qLn1XbTl0BHAhLHwObaALQFUCEXEWex5yXDvfYW63YtzsW4WjSgHSjqCughFMZRb2PHEZh26mKAAzjSPhOpOo85EmABNvQzJP0FsASYYSklxVOzw63ldXwHQbTu7b8BSxVGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0008.namprd12.prod.outlook.com
 (2603:10b6:910:16::18) by MWHPR12MB1536.namprd12.prod.outlook.com
 (2603:10b6:301:6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Thu, 29 Aug
 2019 16:24:10 +0000
Received: from BY2NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by CY4PR1201CA0008.outlook.office365.com
 (2603:10b6:910:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 16:24:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT037.mail.protection.outlook.com (10.152.84.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 16:24:10 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 11:23:49 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/20] drm/amd/display: only enable HDCP for DCN+
Date: Thu, 29 Aug 2019 12:22:52 -0400
Message-ID: <20190829162253.10195-20-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(53936002)(4326008)(50226002)(186003)(11346002)(2906002)(2616005)(2351001)(5024004)(70206006)(86362001)(70586007)(316002)(48376002)(126002)(16586007)(8936002)(14444005)(81166006)(81156014)(8676002)(7696005)(51416003)(76176011)(6666004)(356004)(426003)(478600001)(336012)(53416004)(6916009)(36756003)(486006)(47776003)(26005)(446003)(1076003)(50466002)(305945005)(476003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1536; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2829627c-4128-4a14-3d08-08d72c9d52b1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR12MB1536; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1536:
X-Microsoft-Antispam-PRVS: <MWHPR12MB153692145DDD5E782347A32CF9A20@MWHPR12MB1536.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: IXPnLGizvOjNE7WJ40OlsnPAimvQEFb5LobvHX0Mw8dmZuI4czaR6gjoNnbQMxKVE9RPadN4xXJWku+7PxGYq1zl8EXF+00hfbiaUNX21wFju4EJXDmAtx/nnMo3za+hFOc+yqcfniRWupiyYgjrUb78I4kYxKq9I5hN6VbNGZIfIsf2qMAKMpONJ4Km4PL/qSajsOa65Xj2ZvieyWigvzld2qg5FpFCEFRschnSnko28lke4Lppi0VPHpag4HNd6QrZnHyFBIgTxTU4EO5TjqKmAt61wPO8TX0T8287uPzNdBahXfb43gK3e5plbziZsbzoimPlmYZZRV1lDesqg1aCGUUViu88FU2R7ZykTLcabGKuM9zYyLYoyVDkanU8+bUPOscmhO7HzSaiNUkD02k5Pu3/vuhkFGLnHxnF0iE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 16:24:10.3538 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2829627c-4128-4a14-3d08-08d72c9d52b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1536
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy7cdlygeubsdvYAnIoPoFohy8jsuglPH8G0P+UvJ70=;
 b=m1zoPoiBhwC0QjP1DOZ0uAFgn4Y1PWvXENUtCYAkRhKyUmCVsPCWLgV5gehErVuth3SO3zCMKfYumrIxhNLjDdSBgBJGWq6MbrJiebGdD/gjRUFAitNm1sBr+LF29iuu6Lp8HHzGPBIMSNTYf3SoTEm0SUa1vHlv7D0CD9O1voA=
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
biBocGQgc28gZ3VhcmQgaXQgYXN3ZWxsCgpDaGFuZ2UtSWQ6IEkxZjQyNWJjYTZlYjExMzlhNGIw
ZmU4MDhjNDU1ZGYxNDhjYTA5MjVlClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hhIDxC
aGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyB8IDIwICsrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGUzZjU0NzQ5MGIw
ZS4uMmI0ZWVhZDE4N2Y2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
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
dGlhbGl6ZV9kcm1fZGV2aWNlKGFkZXYpKSB7CiAJCURSTV9FUlJPUigKQEAgLTE0OTYsNyArMTQ5
OCw4IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9ocGRfaXJxKHZvaWQgKnBhcmFtKQogCW11dGV4X2xv
Y2soJmFjb25uZWN0b3ItPmhwZF9sb2NrKTsKIAogI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0hE
Q1AKLQloZGNwX3Jlc2V0X2Rpc3BsYXkoYWRldi0+ZG0uaGRjcF93b3JrcXVldWUsIGFjb25uZWN0
b3ItPmRjX2xpbmstPmxpbmtfaW5kZXgpOworCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9S
QVZFTikKKwkJaGRjcF9yZXNldF9kaXNwbGF5KGFkZXYtPmRtLmhkY3Bfd29ya3F1ZXVlLCBhY29u
bmVjdG9yLT5kY19saW5rLT5saW5rX2luZGV4KTsKICNlbmRpZgogCWlmIChhY29ubmVjdG9yLT5m
YWtlX2VuYWJsZSkKIAkJYWNvbm5lY3Rvci0+ZmFrZV9lbmFibGUgPSBmYWxzZTsKQEAgLTUwODYs
NyArNTA4OSw4IEBAIHZvaWQgYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9pbml0X2hlbHBlcihzdHJ1Y3Qg
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
