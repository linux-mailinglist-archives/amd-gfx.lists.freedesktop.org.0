Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2592707
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4DB6E176;
	Mon, 19 Aug 2019 14:36:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740047.outbound.protection.outlook.com [40.107.74.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A3C6E171
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:36:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A79SecY93sTFEmx8tRKaujSzv5GjSK9nxlZ6W06voM3v75zO//IpgS0SESmhq89mFGjJSLBOkpuLEjO9wO/40Zd83KTASFnc5o2j9DwCDTMUjQiSm/bmdkFyggGmiph0yrM4atf9slQq+XpBtbOQdtj9LPdAc6fbTCddYY6T6t8aDdwHvvePVdzg53tBcPChcFp+J3JFDHEMNjSSXjFgGG19QN7Y8/ZwRGm0EN5Lt/CSzllAUO+IReViwkIHyw+fgblY0WCOrV9WOTGkmpfw6NH2OZFSdUjPEsFWb3gici1/sqHy+I2kvAeZdEIMv2kyCFf00eUHpmoAarjmFVey+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmBYbifTCZWQRqWtDUFxBegNnmpiUSnkCwzrvJFAEdI=;
 b=H92gOj8Bnk53RirW/NX5iC+3eWz7RgHGdpp5AiuGC4NUVXy69frovnIYoM4c+CbBLiHgwsCYHzDDC6P8OPfYrPeT05RhNjjzGYPUpCNb5TT3WM40to6jBy/vhBOORI2fdDimleL3RW7NJ0+XjCtgo5i4I7/lasipuKSEM8QNHB65d8E5FBEYQ9P4DJhS0qvQYLdIj05jZtUdgM5J9Lf7nCSpHy4sWZ9D1iTQUgURLsIkDbPH/7KrRQoao+hD4d6dOhhnitc6z+0f1uw9NHWWlcKd8A4+vntmjjG1MKAIVxng/U+wX/h3/W3e3HUhN9qItyzFH1veK7EnZvCKrjfeJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:405:70::15)
 by BYAPR12MB2712.namprd12.prod.outlook.com (2603:10b6:a03:68::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Mon, 19 Aug
 2019 14:36:03 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by BN6PR12CA0029.outlook.office365.com
 (2603:10b6:405:70::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:36:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:36:02 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:49 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 29/36] drm/amd/display: MST topology debugfs
Date: Mon, 19 Aug 2019 10:35:08 -0400
Message-ID: <20190819143515.21653-30-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(2980300002)(428003)(189003)(199004)(478600001)(2906002)(305945005)(426003)(2616005)(476003)(70206006)(126002)(446003)(70586007)(53416004)(336012)(11346002)(6916009)(8676002)(50226002)(6666004)(356004)(8936002)(36756003)(81166006)(81156014)(186003)(7696005)(316002)(486006)(76176011)(4326008)(48376002)(50466002)(16586007)(53936002)(51416003)(5660300002)(86362001)(1076003)(47776003)(2351001)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2712; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd0f1389-7bd6-4084-4046-08d724b28f90
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2712; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2712:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27127FB4E80F75A6ED655D6CF9A80@BYAPR12MB2712.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YmXNqRq9iuYSDNpymrYlrYZtIzLXhbYaAq6+uPyP/Qg41DGtaZjOoXNc9fJ7IEpeUxjQUqioQRAdfk2J1/2EXj/V4qJ1h1xhlbgKCc/5MTbN/8rEiFYOG6h1b8/Msrov7pmEyNy2Msh0jP18jNgpOP+eeg00O1fLUt3jaXvIwVBSI58q7B/KiEQR0KA1sq+Ja5PuN1vvY8W0KLw71dHYEl6/sjxwaAasUmFGSH2Pm5nLnsMMx9cN6x6JS6iF58FlsiN+2vG6i3ey6dXQE1bi/oxMsofFn/880I61FHIZBHuJyNhDca4UpLMwr2JCBKFMouq6+dPQU/U20rdw4kRDiupYbnC5NVvvcFS6XRkVSvnFzs8Nt92c+VF/vxT9NjyF/rTm/kxs4kO8TD6CJWU9nnVRDGR01Sr9Aipc/egEcq0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:36:02.6057 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0f1389-7bd6-4084-4046-08d724b28f90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmBYbifTCZWQRqWtDUFxBegNnmpiUSnkCwzrvJFAEdI=;
 b=tMaHQrGi7SJaJgkLQYBwqik6iS4yp1loRVgtPPXcoRb7udaC6ZlZNu+PYAbx4mCco8mSvMS/Q9PCQexl1e06trUa7TuWWK0+/TNw0bs1n6rtfxkEYHhAxkI4bq5q3fcPyA/KSry/ws7ezRG18aqH5zVzzR0YGw4GujH+Nw0B1aQ=
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKRFJNIHByb3ZpZGVz
IGRybV9kcF9tc3RfZHVtcF90b3BvbG9neSwgd2hpY2ggcHJpbnRzCnVzZWZ1bCBpbmZvcm1hdGlv
biBhYm91dCBNU1QgZGV2aWNlcwoKSG9vayB0aGlzIHVwIHRvIGEgZGVidWdmcyBmaWxlIG5hbWVk
IGFtZGdwdV9tc3RfdG9wb2xvZ3kKClNpZ25lZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlk
LkZyYW5jaXNAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVl
dC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X2RlYnVnZnMuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jCmluZGV4IDQwNjEyOWU2N2U3OS4uOTdiYmI5
MzRjYzA0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbV9kZWJ1Z2ZzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fZGVidWdmcy5jCkBAIC0xMDUxLDkgKzEwNTEsMzMgQEAgc3RhdGlj
IGludCB0YXJnZXRfYmFja2xpZ2h0X3JlYWQoc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRh
KQogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IG1zdF90b3BvKHN0cnVjdCBzZXFfZmlsZSAq
bSwgdm9pZCAqdW51c2VkKQoreworCXN0cnVjdCBkcm1faW5mb19ub2RlICpub2RlID0gKHN0cnVj
dCBkcm1faW5mb19ub2RlICopbS0+cHJpdmF0ZTsKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0g
bm9kZS0+bWlub3ItPmRldjsKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOworCXN0
cnVjdCBkcm1fY29ubmVjdG9yX2xpc3RfaXRlciBjb25uX2l0ZXI7CisJc3RydWN0IGFtZGdwdV9k
bV9jb25uZWN0b3IgKmFjb25uZWN0b3I7CisKKwlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9iZWdp
bihkZXYsICZjb25uX2l0ZXIpOworCWRybV9mb3JfZWFjaF9jb25uZWN0b3JfaXRlcihjb25uZWN0
b3IsICZjb25uX2l0ZXIpIHsKKwkJaWYgKGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgIT0gRFJN
X01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0KQorCQkJY29udGludWU7CisKKwkJYWNvbm5lY3Rv
ciA9IHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsKKworCQlzZXFfcHJpbnRmKG0s
ICJcbk1TVCB0b3BvbG9neSBmb3IgY29ubmVjdG9yICVkXG4iLCBhY29ubmVjdG9yLT5jb25uZWN0
b3JfaWQpOworCQlkcm1fZHBfbXN0X2R1bXBfdG9wb2xvZ3kobSwgJmFjb25uZWN0b3ItPm1zdF9t
Z3IpOworCX0KKwlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9lbmQoJmNvbm5faXRlcik7CisKKwly
ZXR1cm4gMDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0IGFtZGdwdV9k
bV9kZWJ1Z2ZzX2xpc3RbXSA9IHsKIAl7ImFtZGdwdV9jdXJyZW50X2JhY2tsaWdodF9wd20iLCAm
Y3VycmVudF9iYWNrbGlnaHRfcmVhZH0sCiAJeyJhbWRncHVfdGFyZ2V0X2JhY2tsaWdodF9wd20i
LCAmdGFyZ2V0X2JhY2tsaWdodF9yZWFkfSwKKwl7ImFtZGdwdV9tc3RfdG9wb2xvZ3kiLCAmbXN0
X3RvcG99LAogfTsKIAogLyoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
