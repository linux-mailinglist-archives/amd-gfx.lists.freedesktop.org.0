Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD581018B
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAE289254;
	Tue, 30 Apr 2019 21:10:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730044.outbound.protection.outlook.com [40.107.73.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA4289244
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:02 +0000 (UTC)
Received: from DM3PR12CA0106.namprd12.prod.outlook.com (2603:10b6:0:55::26) by
 BY2PR12MB0647.namprd12.prod.outlook.com (2a01:111:e400:52e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.13; Tue, 30 Apr
 2019 21:10:00 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0106.outlook.office365.com
 (2603:10b6:0:55::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:59 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:50 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/20] drm/amd/display: Disable cursor when offscreen in
 negative direction
Date: Tue, 30 Apr 2019 17:09:17 -0400
Message-ID: <20190430210938.32335-20-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(428003)(199004)(189003)(48376002)(8936002)(53416004)(50466002)(72206003)(53936002)(478600001)(70586007)(476003)(1076003)(2616005)(11346002)(486006)(86362001)(47776003)(6666004)(126002)(446003)(81156014)(81166006)(8676002)(14444005)(356004)(2351001)(50226002)(68736007)(26005)(305945005)(336012)(186003)(426003)(70206006)(77096007)(4326008)(16586007)(6916009)(36756003)(76176011)(51416003)(2906002)(316002)(5660300002)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR12MB0647; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be0606d9-04b8-4f5a-213f-08d6cdb0349c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BY2PR12MB0647; 
X-MS-TrafficTypeDiagnostic: BY2PR12MB0647:
X-Microsoft-Antispam-PRVS: <BY2PR12MB064747F9FE4E859CCA809E85F93A0@BY2PR12MB0647.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: y1UozckkGFXVdujxepOgq95TqKZ7kyAv5jAAJNaqLdF3DTLHoSPIl59udT1BXGPGAoJ8fuXJOHqPGQkjYF/KjI9ncyIfDW5EsuQUp2TX+W1v6DKoM9sR92Fcmc+pSXmGt1pmCDMZXAgjmKsIALEGXytZGpwnVoFQNcgwnH1D665XQm/Vm3GIGC33B7zIHBYOnz4R9avvGSFz52e6CwF1WuzVut8z5ih50pAoJMUYYmk6SzzEw7H2+nJGjsLRZTAIl6HlQ/U3+PWGU6NZC3gVsP0Pa7nl1O1lxV8IVW/0902jPjpQShZfstv1wzZ5fjU3ZWE31wFOlkH0+QGL3cy4mqwn2hHKiYGg+u7YcDFuUSuvW+R4T9qWP4pbtcGpSLayqMEfKW+ImONFvisJVGcni5gKKR256AbtDqRh09vJAkQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:59.8408 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be0606d9-04b8-4f5a-213f-08d6cdb0349c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR12MB0647
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=617kCXPDFDXM2gRALX2aFgMkOxYrELwOpUwu5HK0v3I=;
 b=P9Oug3xy3BRg8RJgcSN2t/0fDLwMaGvXS2ZZobErx5M7RnmPo8KSY1k+GHiNmcmvFdDoQdgwpzrfaT5xEvOGivdfrZW8d7ZWyFmohN5R/e8Zi16EVZtqNL3PBX/sc6G2clc6gFEqAZRfhQi4/Nsa2qgZqRD+O62o+adfhPVLPOk=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KV2hlbiB4IG9yIHkgaXMgbmVnYXRpdmUgd2Ugc2V0IHRoZSB4IGFuZCB5IHZhbHVlcyB0
byAwIGFuZCBjb21wZW5zYXRlCndpdGggYSBwb3NpdGl2ZSBjdXJzb3IgaG90c3BvdCBpbiBETSBz
aW5jZSBEQyBleHBlY3RzIHBvc2l0aXZlIGN1cnNvcgp2YWx1ZXMuCgpXaGVuIHggb3IgeSBpcyBs
ZXNzIHRoYW4gb3IgZXF1YWwgdG8gdGhlIG1heGltdW0gY3Vyc29yIHdpZHRoIG9yIGhlaWdodAp0
aGUgY3Vyc29yIGhvdHNwb3QgaXMgY2xhbXBlZCBzbyB0aGUgaG90c3BvdCBkb2Vzbid0IGV4Y2Vl
ZCB0aGUKY3Vyc29yIHNpemU6CgppZiAoeCA8IDApIHsKICAgICAgICB4b3JpZ2luID0gbWluKC14
LCBhbWRncHVfY3J0Yy0+bWF4X2N1cnNvcl93aWR0aCAtIDEpOwogICAgICAgIHggPSAwOwp9Cgpp
ZiAoeSA8IDApIHsKICAgICAgICB5b3JpZ2luID0gbWluKC15LCBhbWRncHVfY3J0Yy0+bWF4X2N1
cnNvcl9oZWlnaHQgLSAxKTsKICAgICAgICB5ID0gMDsKfQoKVGhpcyBpbmNvcnJlY3RseSBmb3Jj
ZXMgdGhlIGN1cnNvciB0byBiZSBhdCBsZWFzdCAxIHBpeGVsIG9uIHRoZSBzY3JlZW4KaW4gZWl0
aGVyIGRpcmVjdGlvbiB3aGVuIHggb3IgeSBpcyBzdWZmaWNpZW50bHkgbmVnYXRpdmUuCgpbSG93
XQpKdXN0IGRpc2FibGUgdGhlIGN1cnNvciB3aGVuIGl0IGdvZXMgZmFyIGVub3VnaCBvZmYgdGhl
IHNjcmVlbiBpbiBvbmUKb2YgdGhlc2UgZGlyZWN0aW9ucy4KClRoaXMgZml4ZXMga21zX2N1cnNv
cl9jcmNAY3Vyc29yLTI1NngyNTYtb2Zmc2NyZWVuLgoKQ2hhbmdlLUlkOiBJYjZlOTY1ZDI1NGQx
MjkxNTRlMTM5ODE0MGNkYmVhZWM2Y2IwMDVlNQpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXps
YXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBTdW4gcGVu
ZyBMaSA8U3VucGVuZy5MaUBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJo
YXdhbnByZWV0IExha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDE0ICsrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGJlY2Q4Y2IzYWFiNi4u
ODY0MjMyNDRmZmMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTUwMzUsMTIgKzUwMzUsMTIgQEAgc3RhdGljIGludCBnZXRf
Y3Vyc29yX3Bvc2l0aW9uKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCBzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCiAJaW50IHgsIHk7CiAJaW50IHhvcmlnaW4gPSAwLCB5b3JpZ2luID0gMDsKIAotCWlm
ICghY3J0YyB8fCAhcGxhbmUtPnN0YXRlLT5mYikgewotCQlwb3NpdGlvbi0+ZW5hYmxlID0gZmFs
c2U7Ci0JCXBvc2l0aW9uLT54ID0gMDsKLQkJcG9zaXRpb24tPnkgPSAwOworCXBvc2l0aW9uLT5l
bmFibGUgPSBmYWxzZTsKKwlwb3NpdGlvbi0+eCA9IDA7CisJcG9zaXRpb24tPnkgPSAwOworCisJ
aWYgKCFjcnRjIHx8ICFwbGFuZS0+c3RhdGUtPmZiKQogCQlyZXR1cm4gMDsKLQl9CiAKIAlpZiAo
KHBsYW5lLT5zdGF0ZS0+Y3J0Y193ID4gYW1kZ3B1X2NydGMtPm1heF9jdXJzb3Jfd2lkdGgpIHx8
CiAJICAgIChwbGFuZS0+c3RhdGUtPmNydGNfaCA+IGFtZGdwdV9jcnRjLT5tYXhfY3Vyc29yX2hl
aWdodCkpIHsKQEAgLTUwNTQsNiArNTA1NCwxMCBAQCBzdGF0aWMgaW50IGdldF9jdXJzb3JfcG9z
aXRpb24oc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsIHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAl4
ID0gcGxhbmUtPnN0YXRlLT5jcnRjX3g7CiAJeSA9IHBsYW5lLT5zdGF0ZS0+Y3J0Y195OwogCisJ
aWYgKHggPD0gLWFtZGdwdV9jcnRjLT5tYXhfY3Vyc29yX3dpZHRoIHx8CisJICAgIHkgPD0gLWFt
ZGdwdV9jcnRjLT5tYXhfY3Vyc29yX2hlaWdodCkKKwkJcmV0dXJuIDA7CisKIAlpZiAoY3J0Yy0+
cHJpbWFyeS0+c3RhdGUpIHsKIAkJLyogYXZpdm8gY3Vyc29yIGFyZSBvZmZzZXQgaW50byB0aGUg
dG90YWwgc3VyZmFjZSAqLwogCQl4ICs9IGNydGMtPnByaW1hcnktPnN0YXRlLT5zcmNfeCA+PiAx
NjsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
