Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8158910198
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C620789312;
	Tue, 30 Apr 2019 21:10:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820055.outbound.protection.outlook.com [40.107.82.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EE189295
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:09 +0000 (UTC)
Received: from DM3PR12CA0108.namprd12.prod.outlook.com (2603:10b6:0:55::28) by
 BLUPR12MB0644.namprd12.prod.outlook.com (2a01:111:e400:594e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.12; Tue, 30 Apr
 2019 21:10:06 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by DM3PR12CA0108.outlook.office365.com
 (2603:10b6:0:55::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:05 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:54 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/20] drm/amd/display: move signal type out of otg dlg params
Date: Tue, 30 Apr 2019 17:09:27 -0400
Message-ID: <20190430210938.32335-30-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(426003)(72206003)(26005)(50226002)(50466002)(8936002)(316002)(16586007)(48376002)(81156014)(305945005)(8676002)(6916009)(53936002)(4326008)(36756003)(81166006)(478600001)(53416004)(47776003)(186003)(51416003)(7696005)(5660300002)(2351001)(2616005)(11346002)(76176011)(1076003)(486006)(476003)(68736007)(86362001)(126002)(70586007)(77096007)(336012)(446003)(70206006)(356004)(6666004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR12MB0644; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b35bcc1-19e9-460f-8df5-08d6cdb0383f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BLUPR12MB0644; 
X-MS-TrafficTypeDiagnostic: BLUPR12MB0644:
X-Microsoft-Antispam-PRVS: <BLUPR12MB0644C7CCCDC39E726AB36049F93A0@BLUPR12MB0644.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xhZOIFy0+gF2d4Mw4RvyI/X6hAHiE8SpGOgkx3Javr/8wHGcXOkTS9p8KM2nUkc2LbY/w8BAo0O+Ex+9AVGmPugKMcOTyU784rAVlmf1LZziO87R5E1Upy2f2I735Nhuglh91BVASGPCNfT8sdVJNY8c10vPgSXDNIGpAIfnj9uWkTxnmaB6agKxLlC9JzUcmLxUQymwTMdHiItOndXu3EcjiPHvY8nSq7sm3WhGCsihmgnZTwu8clqV3OlXLuPTdwLWqjB6tOX4kyFMm/mq8SP67fDVIRKpkNGpknNNdg/OdZSgzrJQLXVPJQbGcM6UlKm5p0V3DFe35L4eOJuGz0LBf8EuTr5OntKQ3arIu71H8sH01SUN48HF+DuWDoxnYvjzc7OAjts8wLk+ukGNqd/eDb4DwdZPrOt6tJB/s/k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:05.9296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b35bcc1-19e9-460f-8df5-08d6cdb0383f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR12MB0644
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pj0ztTmIsRch+Frq9aHYlXqQSwzHRsueZ6zHXFgVK4s=;
 b=dhSPwdyrSoRIFvWF+FdbDDwPRbIX/+d2vyZ1LpUoq5ol3rg4HdL3C77vY+bVtl4+PGa1lhVv2zRVGrkL/mpFC2rAEFmc6Sa6yNG13UD6eg05dDIHaOKIs9z0iNRFFKFbieA4VIJ9UOi3A2pmqauAQ8P76EoII1oYxT2oQIH9sf8=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkl0
IG1ha2VzIG5vIGxvZ2ljYWwgc2Vuc2UgYmVpbmcgdGhlcmUKCkNoYW5nZS1JZDogSTU1ZmU4ZWNh
NzYxM2JlODExMzI2ODBhMmE1OGJkNThkODc0ZWIyYjYKU2lnbmVkLW9mZi1ieTogRG15dHJvIExh
a3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEVyaWMg
QmVybnN0ZWluIDxFcmljLkJlcm5zdGVpbkBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQg
TGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIHwgMyArLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9vcHRjLmMgICAgICAgICB8IDYgKysr
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L3RpbWluZ19nZW5lcmF0
b3IuaCAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAv
ZGNuMTBfaHdfc2VxdWVuY2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMKaW5kZXggMzNkMzExY2VhMjhjLi5jNjc5NDJhZTE5MjAg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9o
d19zZXF1ZW5jZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAv
ZGNuMTBfaHdfc2VxdWVuY2VyLmMKQEAgLTY2Myw3ICs2NjMsNyBAQCBzdGF0aWMgZW51bSBkY19z
dGF0dXMgZGNuMTBfZW5hYmxlX3N0cmVhbV90aW1pbmcoCiAJcGlwZV9jdHgtPnN0cmVhbV9yZXMu
dGctPmRsZ19vdGdfcGFyYW0udnVwZGF0ZV9vZmZzZXQgPSBwaXBlX2N0eC0+cGlwZV9kbGdfcGFy
YW0udnVwZGF0ZV9vZmZzZXQ7CiAJcGlwZV9jdHgtPnN0cmVhbV9yZXMudGctPmRsZ19vdGdfcGFy
YW0udnVwZGF0ZV93aWR0aCA9IHBpcGVfY3R4LT5waXBlX2RsZ19wYXJhbS52dXBkYXRlX3dpZHRo
OwogCi0JcGlwZV9jdHgtPnN0cmVhbV9yZXMudGctPmRsZ19vdGdfcGFyYW0uc2lnbmFsID0gIHBp
cGVfY3R4LT5zdHJlYW0tPnNpZ25hbDsKKwlwaXBlX2N0eC0+c3RyZWFtX3Jlcy50Zy0+c2lnbmFs
ID0gIHBpcGVfY3R4LT5zdHJlYW0tPnNpZ25hbDsKIAogCXBpcGVfY3R4LT5zdHJlYW1fcmVzLnRn
LT5mdW5jcy0+cHJvZ3JhbV90aW1pbmcoCiAJCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy50ZywKQEAg
LTIyODMsNyArMjI4Myw2IEBAIHN0YXRpYyB2b2lkIHByb2dyYW1fYWxsX3BpcGVfaW5fdHJlZSgK
IAkJcGlwZV9jdHgtPnN0cmVhbV9yZXMudGctPmRsZ19vdGdfcGFyYW0udnN0YXJ0dXBfc3RhcnQg
PSBwaXBlX2N0eC0+cGlwZV9kbGdfcGFyYW0udnN0YXJ0dXBfc3RhcnQ7CiAJCXBpcGVfY3R4LT5z
dHJlYW1fcmVzLnRnLT5kbGdfb3RnX3BhcmFtLnZ1cGRhdGVfb2Zmc2V0ID0gcGlwZV9jdHgtPnBp
cGVfZGxnX3BhcmFtLnZ1cGRhdGVfb2Zmc2V0OwogCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy50Zy0+
ZGxnX290Z19wYXJhbS52dXBkYXRlX3dpZHRoID0gcGlwZV9jdHgtPnBpcGVfZGxnX3BhcmFtLnZ1
cGRhdGVfd2lkdGg7Ci0JCXBpcGVfY3R4LT5zdHJlYW1fcmVzLnRnLT5kbGdfb3RnX3BhcmFtLnNp
Z25hbCA9ICBwaXBlX2N0eC0+c3RyZWFtLT5zaWduYWw7CiAKIAkJcGlwZV9jdHgtPnN0cmVhbV9y
ZXMudGctPmZ1bmNzLT5wcm9ncmFtX2dsb2JhbF9zeW5jKAogCQkJCXBpcGVfY3R4LT5zdHJlYW1f
cmVzLnRnKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9vcHRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNu
MTBfb3B0Yy5jCmluZGV4IGMzZTMyMDUxMDg1Yi4uNWJjNWFiMGI0OGI5IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3B0Yy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9vcHRjLmMKQEAgLTI0Myw5
ICsyNDMsOSBAQCB2b2lkIG9wdGMxX3Byb2dyYW1fdGltaW5nKAogCQlPVEdfVl9TWU5DX0FfUE9M
LCB2X3N5bmNfcG9sYXJpdHkpOwogCiAJdl9pbml0ID0gYXNpY19ibGFua19zdGFydDsKLQlpZiAo
b3B0Yy0+ZGxnX290Z19wYXJhbS5zaWduYWwgPT0gU0lHTkFMX1RZUEVfRElTUExBWV9QT1JUIHx8
Ci0JCW9wdGMtPmRsZ19vdGdfcGFyYW0uc2lnbmFsID09IFNJR05BTF9UWVBFX0RJU1BMQVlfUE9S
VF9NU1QgfHwKLQkJb3B0Yy0+ZGxnX290Z19wYXJhbS5zaWduYWwgPT0gU0lHTkFMX1RZUEVfRURQ
KSB7CisJaWYgKG9wdGMtPnNpZ25hbCA9PSBTSUdOQUxfVFlQRV9ESVNQTEFZX1BPUlQgfHwKKwkJ
b3B0Yy0+c2lnbmFsID09IFNJR05BTF9UWVBFX0RJU1BMQVlfUE9SVF9NU1QgfHwKKwkJb3B0Yy0+
c2lnbmFsID09IFNJR05BTF9UWVBFX0VEUCkgewogCQlzdGFydF9wb2ludCA9IDE7CiAJCWlmIChw
YXRjaGVkX2NydGNfdGltaW5nLmZsYWdzLklOVEVSTEFDRSA9PSAxKQogCQkJZmllbGRfbnVtID0g
MTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvdGlt
aW5nX2dlbmVyYXRvci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody90
aW1pbmdfZ2VuZXJhdG9yLmgKaW5kZXggMDY3ZDUzY2FmMjhhLi40ZWVlMWFkZDhlNjQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvdGltaW5nX2dlbmVy
YXRvci5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvdGltaW5n
X2dlbmVyYXRvci5oCkBAIC03NSw3ICs3NSw2IEBAIHN0cnVjdCBfZGxnX290Z19wYXJhbSB7CiAJ
aW50IHZ1cGRhdGVfb2Zmc2V0OwogCWludCB2dXBkYXRlX3dpZHRoOwogCWludCB2cmVhZHlfb2Zm
c2V0OwotCWVudW0gc2lnbmFsX3R5cGUgc2lnbmFsOwogfTsKIAogc3RydWN0IHZ1cGRhdGVfa2Vl
cG91dF9wYXJhbXMgewpAQCAtMTI3LDYgKzEyNiw3IEBAIHN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9y
IHsKIAlzdHJ1Y3QgZGNfYmlvcyAqYnA7CiAJc3RydWN0IGRjX2NvbnRleHQgKmN0eDsKIAlzdHJ1
Y3QgX2RsZ19vdGdfcGFyYW0gZGxnX290Z19wYXJhbTsKKwllbnVtIHNpZ25hbF90eXBlIHNpZ25h
bDsKIAlpbnQgaW5zdDsKIH07CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
