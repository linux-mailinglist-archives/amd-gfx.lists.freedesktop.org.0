Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CD7D1A97
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6976EA71;
	Wed,  9 Oct 2019 21:06:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760047.outbound.protection.outlook.com [40.107.76.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDFD6EA6A
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMD2lT/ZOOOVlDjiOxWyemHAIKjrKoBIa/XZ88UvBx+o+MG1kQfon5ro6npOgACrZ7zywgrniAm5HiyYbgC0rQmWSKUn6iBUi9/6CArZ0mh8+D9LAUqeit8lGzB1FBRVmenacbw9cUC00TPx96VQ7xFcQ+K63cAduKu0olYMmeY3+r9Di8DvEW1xV2Qq+7seepWKc+vHhHoUcfUE081F5hzRF/nLyDnrgVOcyhIzpe+QI1ZetXlf71UhmyxVlW6O9hX/Oq4YRAxQPh/dWTTgj0jFxiF0J5RUlUi8NolVxWXuRj2EmzuqioILodFPczi1IY49unQJEi6FWrGmBDIe9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcCMFi3X9CTzRq5kTdR/ZHj4yxTWHNv8nexiMA3ztYk=;
 b=iLbl/5tAzvvk4Y0hxKfqvHpX814gmLoPrZ4cA2ruuKpZ7lqUoSSuHSCPcjhOV4ivYlrB9koajzJ9gSXcHxlkpyzhaXy/FQkmE+0B+AQZyKSdRhAffyWP8LNyLADuOsTbX4TD6opUQ6uC9yaBKI16316fDfkOb9v8vSeFwALSwr4WbpiWeJJQtpHoFJxODfkY0uiSJ6/ju/aiGtSHd1L8/ToYZf1Sl21OCP7CMZEBjFdWgjAZx0OF3hueQclDg9gm16+pij0ren87pmOYV3wJiaIyYLbwUC29Uu1doCw72pxCerfjalFAO7jqHtJJhIQYlr8m7n6yeYBnfeFs23RFAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:5:1c0::42)
 by BN6PR12MB1492.namprd12.prod.outlook.com (2603:10b6:405:11::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 21:06:30 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM6PR12CA0029.outlook.office365.com
 (2603:10b6:5:1c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:29 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:29 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 22/26] drm/amd/display: Fix rn audio playback and video
 playback speed
Date: Wed, 9 Oct 2019 17:06:09 -0400
Message-ID: <20191009210613.17929-23-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(428003)(199004)(189003)(54906003)(70206006)(16586007)(36756003)(316002)(478600001)(4326008)(70586007)(50466002)(6666004)(356004)(48376002)(47776003)(8936002)(126002)(2906002)(5660300002)(476003)(305945005)(2351001)(6916009)(26005)(8676002)(2616005)(186003)(7696005)(51416003)(53416004)(86362001)(76176011)(1076003)(81166006)(426003)(446003)(81156014)(50226002)(486006)(336012)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1492; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea51cfdc-9738-455c-dc0d-08d74cfc8e40
X-MS-TrafficTypeDiagnostic: BN6PR12MB1492:
X-Microsoft-Antispam-PRVS: <BN6PR12MB149249C5A960BAB1C25F90C0F9950@BN6PR12MB1492.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LdJp0qQbkgGS29jekCB17O+966Zxq4bsc9yIbccAh9cx60ZMdjEGdEsKlBFCJ2+wU/uJNnli4xy3NE1L+ujcEbmTI8LSo+kVyscfF+4UKNVmpoKfytyPexECOgG/PV4nUjtbQrW/MEVmC4Zx7Ma4OrE0oA4+c8nXn+60+so/O356jKwPAbalIA1N0sqAXaCvhDQ6QS3d6uPipLvpHTo2AzbL48pIMS+sIPGUSkRk/UhSK7VL9CpuLQ76yTZIPJAIyc5f/RLhT24ah/C4EeAfoLITPS1AQvSKNwp9H1JybOM8sLfqNASZ8tkRsZPPoj59cQ0WNF+pFhXNi5lDHlLdPo/v5lP+h7FurCB4Z+/NONO23Z7ixSyA4zUpagp6RyMB0smty2/CpzDLUwuotOIV0rpxIDfGljEZ7+HZJ4bj8Bc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:29.7018 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea51cfdc-9738-455c-dc0d-08d74cfc8e40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1492
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcCMFi3X9CTzRq5kTdR/ZHj4yxTWHNv8nexiMA3ztYk=;
 b=AhqzSh5KTHYKfANHxCslCBUjBVqbvRFjzqimHspo+EQAP7dANwFXNzjMyOJCmV2jlKqrXiupC5o64pkz8ZZk9XU2dc2Pdccn+jRRmQMDsJyYD4vFlWEjKF//o/nk+vXBwt15X61eypOlU51huOepCDTD+87gwIqCTATQF3NwQRo=
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
Cc: sunpeng.li@amd.com, Michael Strauss <michael.strauss@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWljaGFlbCBTdHJhdXNzIDxtaWNoYWVsLnN0cmF1c3NAYW1kLmNvbT4KCltXSFldCmRw
cmVmY2xrIGlzIGltcHJvcGVybHkgcmVhZCBkdWUgdG8gaW5jb3JyZWN0IHVuaXRzIHVzZWQuCkNh
dXNlcyBhbiBhdWRpbyBjbG9jayB0byBiZSBpbXByb3Blcmx5IHNldCwgbWFraW5nIGF1ZGlvCm5v
bi1mdW5jdGlvbmFsIGFuZCB2aWRlb3MgcGxheSBiYWNrIHRvbyBmYXN0CgpbSE9XXQpTY2FsZSBk
cHJlZmNsayB2YWx1ZSBmcm9tIE1IeiB0byBLSHogKG11bHRpcGx5IGJ5IDEwMDApCnRvIGVuc3Vy
ZSB0aGF0IGRwcmVmY2xrX2toeiBpcyBpbiBjb3JyZWN0IHVuaXRzCgpTaWduZWQtb2ZmLWJ5OiBN
aWNoYWVsIFN0cmF1c3MgPG1pY2hhZWwuc3RyYXVzc0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2Fu
cHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogLi4uL2RybS9hbWQv
ZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYyB8IDE1ICsrKysrKystLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9j
bGtfbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9y
bl9jbGtfbWdyLmMKaW5kZXggOTNlNDZlMzc2YmIxLi5mYjhhYTk0MzZiZjAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3Iu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9j
bGtfbWdyLmMKQEAgLTM3Nyw3ICszNzcsNyBAQCB2b2lkIHJuX2dldF9jbGtfc3RhdGVzKHN0cnVj
dCBjbGtfbWdyICpjbGtfbWdyX2Jhc2UsIHN0cnVjdCBjbGtfc3RhdGVzICpzKQogCiAJcm5fZHVt
cF9jbGtfcmVnaXN0ZXJzKCZzYiwgY2xrX21ncl9iYXNlLCAmbG9nX2luZm8pOwogCi0Jcy0+ZHBy
ZWZjbGtfa2h6ID0gc2IuZHByZWZjbGs7CisJcy0+ZHByZWZjbGtfa2h6ID0gc2IuZHByZWZjbGsg
KiAxMDAwOwogfQogCiB2b2lkIHJuX2VuYWJsZV9wbWVfd2Eoc3RydWN0IGNsa19tZ3IgKmNsa19t
Z3JfYmFzZSkKQEAgLTYzMywxNiArNjMzLDE1IEBAIHZvaWQgcm5fY2xrX21ncl9jb25zdHJ1Y3Qo
CiAJCQljbGtfbWdyLT5kZW50aXN0X3Zjb19mcmVxX2toeiA9IDM2MDAwMDA7CiAKIAkJcm5fZHVt
cF9jbGtfcmVnaXN0ZXJzKCZzLCAmY2xrX21nci0+YmFzZSwgJmxvZ19pbmZvKTsKLQkJY2xrX21n
ci0+YmFzZS5kcHJlZmNsa19raHogPSBzLmRwcmVmY2xrOwotCi0JCWlmIChjbGtfbWdyLT5iYXNl
LmRwcmVmY2xrX2toeiAhPSA2MDAwMDApIHsKLQkJCWNsa19tZ3ItPmJhc2UuZHByZWZjbGtfa2h6
ID0gNjAwMDAwOwotCQkJQVNTRVJUKDEpOyAvL1RPRE86IFJlbm9pciBmb2xsb3cgdXAuCi0JCX0K
KwkJLyogQ29udmVydCBkcHJlZmNsayB1bml0cyBmcm9tIE1IeiB0byBLSHogKi8KKwkJLyogVmFs
dWUgYWxyZWFkeSBkaXZpZGVkIGJ5IDEwLCBzb21lIHJlc29sdXRpb24gbG9zdCAqLworCQljbGtf
bWdyLT5iYXNlLmRwcmVmY2xrX2toeiA9IHMuZHByZWZjbGsgKiAxMDAwOwogCiAJCS8qIGluIGNh
c2Ugd2UgZG9uJ3QgZ2V0IGEgdmFsdWUgZnJvbSB0aGUgcmVnaXN0ZXIsIHVzZSBkZWZhdWx0ICov
Ci0JCWlmIChjbGtfbWdyLT5iYXNlLmRwcmVmY2xrX2toeiA9PSAwKQorCQlpZiAoY2xrX21nci0+
YmFzZS5kcHJlZmNsa19raHogPT0gMCkgeworCQkJQVNTRVJUKGNsa19tZ3ItPmJhc2UuZHByZWZj
bGtfa2h6ID09IDYwMDAwMCk7CiAJCQljbGtfbWdyLT5iYXNlLmRwcmVmY2xrX2toeiA9IDYwMDAw
MDsKKwkJfQogCX0KIAogCWRjZV9jbG9ja19yZWFkX3NzX2luZm8oY2xrX21ncik7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
