Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D322137F0B
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B55F8989F;
	Thu,  6 Jun 2019 20:55:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800041.outbound.protection.outlook.com [40.107.80.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149788989E
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:21 +0000 (UTC)
Received: from CY4PR12CA0034.namprd12.prod.outlook.com (2603:10b6:903:129::20)
 by DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:4a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12; Thu, 6 Jun
 2019 20:55:19 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR12CA0034.outlook.office365.com
 (2603:10b6:903:129::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:19 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:06 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/24] drm/amd/display: Use macro for invalid OPP ID
Date: Thu, 6 Jun 2019 16:54:46 -0400
Message-ID: <20190606205501.16505-10-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(396003)(346002)(2980300002)(428003)(189003)(199004)(7696005)(8936002)(426003)(6916009)(81156014)(8676002)(2906002)(2616005)(86362001)(4326008)(76176011)(486006)(476003)(11346002)(126002)(446003)(53936002)(336012)(478600001)(51416003)(356004)(6666004)(1076003)(70206006)(68736007)(72206003)(36756003)(50466002)(47776003)(2351001)(50226002)(48376002)(186003)(16586007)(77096007)(81166006)(53416004)(26005)(305945005)(5660300002)(316002)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2667; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f5c7bf8-9a55-46f1-d048-08d6eac148dc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2667; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:
X-Microsoft-Antispam-PRVS: <DM6PR12MB26672F333EC1B6C2134DEDA2F9170@DM6PR12MB2667.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: MOKAkwJfpMkpNxz2U0uGX5k1PB9VE7m76Od7nviJZBhhD9l33oqnTbFWUT2zGT9KcmJGh5Ys1CBH0tNxMuA3mpj2pG9HS2/BMMuB+G920oMBcuZaC9/l2mX+SBB27qUg1/PbwqeGR3XsK6krRDUJ2XVLEjnF7/9CGi9ihy7r1E8ysfyn75vld4Lzs2W3hiLprn3G3T/FHD4rGhLp4D72pcloH8ATebIRZRfSXPu1Ka76vciFkMM/uaVAV5MvzMgQWUqJQ8g+ED4aN7vFamgAjrs7QP/2Zff57ktJgF/zWBXut7SFlIfim2f0Y+fTrs0Za2uMW2XIjHoHdAasSw4jQQh3/uS5OG1Juur3sab1Ne0IPcClBEhtPjiLYRSgIkp41AjrjBMWhnz3zacmympt6XlynYyIFAZd0v7TTx+c45Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:19.0121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5c7bf8-9a55-46f1-d048-08d6eac148dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNk92TUCYZy/uCPcPkFl2C2uRJQIcEfQiyQnIxWSkaU=;
 b=Hl1qdcQiei3vTmtZzuJI+8Out+o2iTslfmwiaxrQzw5vO5lVaen9Kwh7pWmdTapnPgHKQpOwb1GEwye5/2i3KZs4zNAflFgNVwRhnGfyTsX+TnagyaoQb4fA5o+g1IB76TPDP0Nwztp29Vh+ZGW/sMWcPYFBTC+iu25k1yprt0s=
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
Cc: Wesley Chalmers <Wesley.Chalmers@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VzbGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KCltXSFldClRo
aXMgaXMgbWVhbnQgdG8gbWFrZSBpdCBjbGVhcmVyIHRoYXQgMHhmIGlzIG5vdCBhIHZhbGlkIE9Q
UCBJRCwgYW5kCnRoYXQgY29kZSBtYWtpbmcgdXNlIG9mIE9QUCBJRHMgc2hvdWxkIG5vdCBhY2Nl
cHQgdGhpcyB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IFdlc2xleSBDaGFsbWVycyA8V2VzbGV5LkNo
YWxtZXJzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaGFybGVuZSBMaXUgPENoYXJsZW5lLkxpdUBh
bWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1
YnAuYyAgICAgICAgIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9pbmMvaHcvaHVicC5oICAgICAgICAgICAgICB8IDIgKysKIDMgZmlsZXMgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5jCmluZGV4IDU0YjIxOWE3MTBkOC4u
YWVhMmI2M2RiMTM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMTAvZGNuMTBfaHVicC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24xMC9kY24xMF9odWJwLmMKQEAgLTYzLDcgKzYzLDcgQEAgdm9pZCBodWJwMV9zZXRfYmxhbmso
c3RydWN0IGh1YnAgKmh1YnAsIGJvb2wgYmxhbmspCiAJCX0KIAogCQlodWJwLT5tcGNjX2lkID0g
MHhmOwotCQlodWJwLT5vcHBfaWQgPSAweGY7CisJCWh1YnAtPm9wcF9pZCA9IE9QUF9JRF9JTlZB
TElEOwogCX0KIH0KIApAQCAtMTIyNiw3ICsxMjI2LDcgQEAgdm9pZCBkY24xMF9odWJwX2NvbnN0
cnVjdCgKIAlodWJwMS0+aHVicF9zaGlmdCA9IGh1YnBfc2hpZnQ7CiAJaHVicDEtPmh1YnBfbWFz
ayA9IGh1YnBfbWFzazsKIAlodWJwMS0+YmFzZS5pbnN0ID0gaW5zdDsKLQlodWJwMS0+YmFzZS5v
cHBfaWQgPSAweGY7CisJaHVicDEtPmJhc2Uub3BwX2lkID0gT1BQX0lEX0lOVkFMSUQ7CiAJaHVi
cDEtPmJhc2UubXBjY19pZCA9IDB4ZjsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCmluZGV4IDgyMWEy
ODBlYjQ4MS4uZDllZGY3Zjg0Y2ZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCkBAIC0xMDI1LDcgKzEw
MjUsNyBAQCBzdGF0aWMgdm9pZCBkY24xMF9pbml0X3BpcGVzKHN0cnVjdCBkYyAqZGMsIHN0cnVj
dCBkY19zdGF0ZSAqY29udGV4dCkKIAkJcGlwZV9jdHgtPnBsYW5lX3Jlcy5kcHAgPSBkcHA7CiAJ
CXBpcGVfY3R4LT5wbGFuZV9yZXMubXBjY19pbnN0ID0gZHBwLT5pbnN0OwogCQlodWJwLT5tcGNj
X2lkID0gZHBwLT5pbnN0OwotCQlodWJwLT5vcHBfaWQgPSAweGY7CisJCWh1YnAtPm9wcF9pZCA9
IE9QUF9JRF9JTlZBTElEOwogCQlodWJwLT5wb3dlcl9nYXRlZCA9IGZhbHNlOwogCiAJCWRjLT5y
ZXNfcG9vbC0+b3Bwc1tpXS0+bXBjX3RyZWVfcGFyYW1zLm9wcF9pZCA9IGRjLT5yZXNfcG9vbC0+
b3Bwc1tpXS0+aW5zdDsKQEAgLTIzNzEsNyArMjM3MSw3IEBAIHN0YXRpYyB2b2lkIGRjbjEwX2Fw
cGx5X2N0eF9mb3Jfc3VyZmFjZSgKIAkJaWYgKHBpcGVfY3R4LT5wbGFuZV9zdGF0ZSAmJiAhb2xk
X3BpcGVfY3R4LT5wbGFuZV9zdGF0ZSkgewogCQkJaWYgKG9sZF9waXBlX2N0eC0+c3RyZWFtX3Jl
cy50ZyA9PSB0ZyAmJgogCQkJICAgIG9sZF9waXBlX2N0eC0+cGxhbmVfcmVzLmh1YnAgJiYKLQkJ
CSAgICBvbGRfcGlwZV9jdHgtPnBsYW5lX3Jlcy5odWJwLT5vcHBfaWQgIT0gMHhmKQorCQkJICAg
IG9sZF9waXBlX2N0eC0+cGxhbmVfcmVzLmh1YnAtPm9wcF9pZCAhPSBPUFBfSURfSU5WQUxJRCkK
IAkJCQlkY24xMF9kaXNhYmxlX3BsYW5lKGRjLCBvbGRfcGlwZV9jdHgpOwogCQl9CiAKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvaHVicC5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9odWJwLmgKaW5kZXggNDU1ZGY0OTk5
Nzk3Li41NDIwYWQyZGE5NmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9pbmMvaHcvaHVicC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9p
bmMvaHcvaHVicC5oCkBAIC0yOCw2ICsyOCw4IEBACiAKICNpbmNsdWRlICJtZW1faW5wdXQuaCIK
IAorI2RlZmluZSBPUFBfSURfSU5WQUxJRCAweGYKKwogCiBlbnVtIGN1cnNvcl9waXRjaCB7CiAJ
Q1VSU09SX1BJVENIXzY0X1BJWEVMUyA9IDAsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
