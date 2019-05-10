Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A3D1A234
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 19:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A11489FD7;
	Fri, 10 May 2019 17:20:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780047.outbound.protection.outlook.com [40.107.78.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB9889FA7
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 17:20:23 +0000 (UTC)
Received: from DM3PR12CA0061.namprd12.prod.outlook.com (2603:10b6:0:56::29) by
 DM5PR1201MB0058.namprd12.prod.outlook.com (2603:10b6:4:50::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.15; Fri, 10 May 2019 17:20:22 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM3PR12CA0061.outlook.office365.com
 (2603:10b6:0:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Fri, 10 May 2019 17:20:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Fri, 10 May 2019 17:20:22 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 10 May 2019
 12:20:12 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/16] drm/amd/display: enabling stream after HPD low to high
 happened
Date: Fri, 10 May 2019 13:19:27 -0400
Message-ID: <20190510171935.19792-9-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
References: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(136003)(376002)(2980300002)(428003)(199004)(189003)(36756003)(68736007)(53936002)(81156014)(86362001)(50226002)(426003)(70586007)(446003)(14444005)(2616005)(11346002)(486006)(70206006)(76176011)(4326008)(336012)(186003)(126002)(476003)(48376002)(7696005)(26005)(47776003)(72206003)(305945005)(316002)(53416004)(77096007)(81166006)(2351001)(5660300002)(8936002)(16586007)(8676002)(2906002)(51416003)(54906003)(6916009)(1076003)(478600001)(6666004)(356004)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0058; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 557cefb6-cd32-4290-e576-08d6d56bc8a5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR1201MB0058; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0058572FBBE2CFE9B9C88DC8F90C0@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0hqdQv0WeNoncP52gF7hcxUsxJe9Uy5sqlQZV6Rs5fl+VybJgT6nNWWGEneZL13/URQiVMb8HTqlcgudZHeXSW/XeIxa5um9BNa9Lz5xHjsjezVsTZB3la0TmOmb8H5nxIs9XtUSkN/gnwp/rJ+yi00LBLwmFBnu0kHEg3a18QMDW2A9TpEU0cJvCb/KFqmJeB5To7nmJtsSaBj5Xy8yIpctUqqgzhr9Bc2fKdrxHK4WH/0KXFF9M+JqygpsUvIrF4atvmfNgFE/WOWBtHHI9JtRvW1Z/S+I56h238m37JgcnaTtxPq0UqKu5wZTs85Dex3EmCzKMcmehQW0W+PQTBKPJh6t/bs3AzTgRUsod4ekRGAoHqzDs/f8Ju8KPbORkCfG+qaYeZ6kcABSZ8rAjFO0mGOq49zySujtvuRFpbQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 17:20:22.0631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 557cefb6-cd32-4290-e576-08d6d56bc8a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjoTiClkGz169CLxA2KNRyXL1cT410z3CCNQMc7cCGg=;
 b=NETdZUyofgv0BpA1EaFqUnqNX4DQavUlXX9Sj41AuksYiuFNpFBAnK3VihQyvl/G1bfNvEMs/UrGwOzlm/XjdfjI86n6M7PnXuG6zQPL2fHJeY9ndtWF8/c9v+aKzXjMGpAdk+z7I4DuXcpD//Sn1/JETOrzZGfF936OWpfc4qg=
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
Cc: Charlene Liu <charlene.liu@amd.com>, Chiawen Huang <chiawen.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCltXaHldCjEuIE5vIHJl
YWwgSFBEIHBsdWcgaW4vb3V0IGJ1dCBIUEQgaGFwcGVucywKIHRoZSBkcml2ZXIgbm90aWZpZXMg
T1MgY29ubmVjdGlvbiBjaGFuZ2VkLgoyLiBObyBkaXNwbGF5IGluIHRhcmdldC4KCldoZW4gSFBE
IGdvZXMgbG93IHRvIGhpZ2gsCnRoZSBkcml2ZXIgc2hvdWxkIHJlZ2FyZCBhcyBIUEQgYW5kIGVu
dGVyIHNldG1vZGUgZmxvdy4KCltIb3ddCkluIHRoaXMgY2FzZSwgZXZlbiBzdHJlYW0gZGlkbid0
IGNoYW5nZSBidXQgc3RpbGwgcmV0cmFpbi4KClNpZ25lZC1vZmYtYnk6IENoaWF3ZW4gSHVhbmcg
PGNoaWF3ZW4uaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcgPFRvbnkuQ2hl
bmdAYW1kLmNvbT4KQWNrZWQtYnk6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgpB
Y2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jICAgICAgICAg
ICAgICAgfCAzICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVz
b3VyY2UuYyAgICAgICAgICAgfCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY19saW5rLmggICAgICAgICAgICAgICAgICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYyB8IDQgKysrLQogNCBmaWxl
cyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCmluZGV4IDlmYmY5MjZkNWJmOS4u
NmI4ZGM3MmE3ODYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGluay5jCkBAIC03MDQsNiArNzA0LDcgQEAgYm9vbCBkY19saW5rX2RldGVjdChzdHJ1Y3Qg
ZGNfbGluayAqbGluaywgZW51bSBkY19kZXRlY3RfcmVhc29uIHJlYXNvbikKIAogCWlmIChuZXdf
Y29ubmVjdGlvbl90eXBlICE9IGRjX2Nvbm5lY3Rpb25fbm9uZSkgewogCQlsaW5rLT50eXBlID0g
bmV3X2Nvbm5lY3Rpb25fdHlwZTsKKwkJbGluay0+bGlua19zdGF0ZV92YWxpZCA9IGZhbHNlOwog
CiAJCS8qIEZyb20gRGlzY29ubmVjdGVkLXRvLUNvbm5lY3RlZC4gKi8KIAkJc3dpdGNoIChsaW5r
LT5jb25uZWN0b3Jfc2lnbmFsKSB7CkBAIC0yNjMxLDYgKzI2MzIsOCBAQCB2b2lkIGNvcmVfbGlu
a19lbmFibGVfc3RyZWFtKAogCQkJc3RyZWFtLT5waHlfcGl4X2NsaywKIAkJCXBpcGVfY3R4LT5z
dHJlYW1fcmVzLmF1ZGlvICE9IE5VTEwpOwogCisJcGlwZV9jdHgtPnN0cmVhbS0+bGluay0+bGlu
a19zdGF0ZV92YWxpZCA9IHRydWU7CisKIAlpZiAoZGNfaXNfZHZpX3NpZ25hbChwaXBlX2N0eC0+
c3RyZWFtLT5zaWduYWwpKQogCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy5zdHJlYW1fZW5jLT5mdW5j
cy0+ZHZpX3NldF9zdHJlYW1fYXR0cmlidXRlKAogCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMuc3Ry
ZWFtX2VuYywKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19y
ZXNvdXJjZS5jCmluZGV4IDM2MzQ2ZjZjZWI5YS4uM2JiMTk4OTBjOWI3IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKQEAgLTI2NDYs
NiArMjY0NiwxMCBAQCBib29sIHBpcGVfbmVlZF9yZXByb2dyYW0oCiAJaWYgKGlzX3ZzY19pbmZv
X3BhY2tldF9jaGFuZ2VkKHBpcGVfY3R4X29sZC0+c3RyZWFtLCBwaXBlX2N0eC0+c3RyZWFtKSkK
IAkJcmV0dXJuIHRydWU7CiAKKwlpZiAoZmFsc2UgPT0gcGlwZV9jdHhfb2xkLT5zdHJlYW0tPmxp
bmstPmxpbmtfc3RhdGVfdmFsaWQgJiYKKwkJZmFsc2UgPT0gcGlwZV9jdHhfb2xkLT5zdHJlYW0t
PmRwbXNfb2ZmKQorCQlyZXR1cm4gdHJ1ZTsKKwogCXJldHVybiBmYWxzZTsKIH0KIApkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2xpbmsuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19saW5rLmgKaW5kZXggN2I5NDI5ZTMwZDgyLi4wOTQw
MDkxMjdlMjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19s
aW5rLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2xpbmsuaApAQCAt
NzUsNiArNzUsNyBAQCBzdHJ1Y3QgZGNfbGluayB7CiAJZW51bSBkY19pcnFfc291cmNlIGlycV9z
b3VyY2VfaHBkX3J4Oy8qIGFrYSBEUCBTaG9ydCBQdWxzZSAgKi8KIAlib29sIGlzX2hwZF9maWx0
ZXJfZGlzYWJsZWQ7CiAJYm9vbCBkcF9zc19vZmY7CisJYm9vbCBsaW5rX3N0YXRlX3ZhbGlkOwog
CiAJLyogY2FwcyBpcyB0aGUgc2FtZSBhcyByZXBvcnRlZF9saW5rX2NhcC4gbGlua190cmFpbmcg
dXNlCiAJICogcmVwb3J0ZWRfbGlua19jYXAuIFdpbGwgY2xlYW4gdXAuICBUT0RPCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1
ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3
X3NlcXVlbmNlci5jCmluZGV4IGQzYzgyMWYzODk5Yi4uNjlmMjE1OTY3YWYzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5j
ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9o
d19zZXF1ZW5jZXIuYwpAQCAtMjAyMyw4ICsyMDIzLDEwIEBAIGVudW0gZGNfc3RhdHVzIGRjZTEx
MF9hcHBseV9jdHhfdG9faHcoCiAJCWlmIChwaXBlX2N0eC0+c3RyZWFtID09IE5VTEwpCiAJCQlj
b250aW51ZTsKIAotCQlpZiAocGlwZV9jdHgtPnN0cmVhbSA9PSBwaXBlX2N0eF9vbGQtPnN0cmVh
bSkKKwkJaWYgKHBpcGVfY3R4LT5zdHJlYW0gPT0gcGlwZV9jdHhfb2xkLT5zdHJlYW0gJiYKKwkJ
CXBpcGVfY3R4LT5zdHJlYW0tPmxpbmstPmxpbmtfc3RhdGVfdmFsaWQpIHsKIAkJCWNvbnRpbnVl
OworCQl9CiAKIAkJaWYgKHBpcGVfY3R4X29sZC0+c3RyZWFtICYmICFwaXBlX25lZWRfcmVwcm9n
cmFtKHBpcGVfY3R4X29sZCwgcGlwZV9jdHgpKQogCQkJY29udGludWU7Ci0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
