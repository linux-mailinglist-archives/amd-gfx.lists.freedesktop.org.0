Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD155AEC7B
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286E86E900;
	Tue, 10 Sep 2019 13:55:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750042.outbound.protection.outlook.com [40.107.75.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58526E8F8
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcBaEVNYBQ+Z58EgUH8aqaqbT2axqVzfcP5yJ+IOKodSX0Rsr3nMzlPXURwU6BFZ/jVKrn18orZFhCVbpIusorEg8GKIVmbDc6M2VCZMpxgAO/jkvSZFHy2qGmS3yTdQ2wYS0hJJ64jJflPeXxqAgffW/8wnugUGiFEYs2ouxGz9AC++UrIq8upJMsrk4B/sAHDLJtGgAAkwU41raXRO3vbb1T3HNRroi+w2BWOVVi7iaZnRVT+DkpwzKB5wusVsXclenwv+pgSWJRhQBphsSV+bt+KKDe6siKVjh0UIS9L/O+Sha5zZ18YzErOGlT+bemn94dT0gyBwGSDLp3ybOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m20ODIO3f/mnDvaulZqpp27GKCWFSS+RYYh+Rf7BTsE=;
 b=WZBGAF/k5/spx5OeGDq4MLRkJClqGsUKXQWFwGLau6Uw7rGX/9a1IPGqe5CgC+uvIxusZ8+l4kHEHa7NT0gJNAgju5TMtr3MVkp5rsyFXO5prkYC1DJmEYwV07GDxc3vg3vwJCuWmWVzS39W3LNlvKy883Rvs8iQx3PGFbeKHVbzSB9DyQ/50L//g/XAviRG4UVlyxE7FBEiLkHTD8nVZB8Sg0SugqGYlRFbvo8P1KLdyGcirW2jWn9FL3FqhDpK98IEZabzyKAyQRJRh2hUcwnOHkqeaQUuJHgQz5zEBN82hk52VM/+WuoOmVdnAJltGtGkxR1rBElO20z70HK37g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0025.namprd12.prod.outlook.com (2603:10b6:5:1c0::38)
 by CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 13:55:09 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM6PR12CA0025.outlook.office365.com
 (2603:10b6:5:1c0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.18 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:09 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:55:03 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 24/25] drm/amd/display: Add detile buffer size for DCN20
Date: Tue, 10 Sep 2019 09:54:44 -0400
Message-ID: <20190910135445.18300-25-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(2980300002)(428003)(199004)(189003)(305945005)(8936002)(86362001)(48376002)(426003)(70586007)(476003)(186003)(70206006)(2616005)(36756003)(478600001)(2906002)(11346002)(81156014)(446003)(51416003)(26005)(81166006)(76176011)(126002)(486006)(2876002)(336012)(50226002)(2870700001)(2351001)(316002)(4326008)(5660300002)(14444005)(49486002)(47776003)(6666004)(356004)(53936002)(54906003)(8676002)(50466002)(6916009)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4120; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f2b07a5-30e7-489c-ec29-08d735f67e5d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CH2PR12MB4120; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB4120:
X-Microsoft-Antispam-PRVS: <CH2PR12MB41209491E7F5DBD5AFB06B8D82B60@CH2PR12MB4120.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: OAOtVPRKqwoSFPQL+r60tnhzXAjvn1UnQ0ztWAstKq15FOBCNN2nXh+emjGj+QMJeRHGbX8GHYitSFeioQSARvZwqD8+PZbLDgc3d6jt4XDkDwxl6IMgroYiKQ++cFr3/TQQDDT5ec/RX3CgtLXXjHLrwN2H+QOBlJcDwW/eivNU5NxgZBAzK1N6OZf/z7JAFqmUzutghH/C2OGRtk8TDuXB5RhhTOvjUtIx4d1+S24UFmYA20pX9MA2P0MbQMFJOjSoLa5W/xlt0uxu//+x4IfsjuF9x+qtv9UesjUF1sEuseN/4sACLX7v8shVf8mwc+IyRo7ivm8bZzFrOJrNus818nUe0QMUlNSyC1OLJrJSlu304SSZ82XQ6CuSzpVdM2H9kJfO1w+mZK3wVYv9vhAVA5aTJ1gQprmkYSx6eHs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:09.2023 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2b07a5-30e7-489c-ec29-08d735f67e5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m20ODIO3f/mnDvaulZqpp27GKCWFSS+RYYh+Rf7BTsE=;
 b=HAuUeXNojGoBPuvgiMf6cPf/JQculnD9sJZa6eunmCRIEf+oORyLVKhh1v/kXRypKqL67i+nxiy0V46gGI+7e63PZk/hpcCMSD/aJSrybaKedt74nX02oFXz0UoFGv9fgw5Tw+YVk0hX4s1iZ+ZqAcezjApJqAUcbQ7DbSE7et8=
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Chris Park <Chris.Park@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkRl
dGlsZSBidWZmZXIgc2l6ZSBhZmZlY3RzIGRjYyBjYXBzIGFuZCB0aGVyZWZvcmUgbmVlZHMgdG8g
YmUKY29ycmVjdGVkIGZvciBlYWNoIGlwLgoKU2lnbmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNo
a2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzIFBhcmsg
PENocmlzLlBhcmtAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJidWIu
YyB8IDcgKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2h1YmJ1Yi5oIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfaHViYnViLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAv
ZGNuMjBfaHViYnViLmMKaW5kZXggZTBhNmUzMGFjM2UxLi44Yjg0Mzg1NjYxMDEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJidWIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHViYnViLmMK
QEAgLTE4NiwxNCArMTg2LDEzIEBAIHN0YXRpYyB2b2lkIGh1YmJ1YjJfZ2V0X2JsazI1Nl9zaXpl
KHVuc2lnbmVkIGludCAqYmxrMjU2X3dpZHRoLCB1bnNpZ25lZCBpbnQgKmJsCiB9CiAKIHN0YXRp
YyB2b2lkIGh1YmJ1YjJfZGV0X3JlcXVlc3Rfc2l6ZSgKKwkJdW5zaWduZWQgaW50IGRldGlsZV9i
dWZfc2l6ZSwKIAkJdW5zaWduZWQgaW50IGhlaWdodCwKIAkJdW5zaWduZWQgaW50IHdpZHRoLAog
CQl1bnNpZ25lZCBpbnQgYnBlLAogCQlib29sICpyZXExMjhfaG9yel93YywKIAkJYm9vbCAqcmVx
MTI4X3ZlcnRfd2MpCiB7Ci0JdW5zaWduZWQgaW50IGRldGlsZV9idWZfc2l6ZSA9IDE2NCAqIDEw
MjQ7ICAvKiAxNjRLQiBmb3IgRENOMS4wICovCi0KIAl1bnNpZ25lZCBpbnQgYmxrMjU2X2hlaWdo
dCA9IDA7CiAJdW5zaWduZWQgaW50IGJsazI1Nl93aWR0aCA9IDA7CiAJdW5zaWduZWQgaW50IHN3
YXRoX2J5dGVzX2hvcnpfd2MsIHN3YXRoX2J5dGVzX3ZlcnRfd2M7CkBAIC0yMzYsNyArMjM1LDgg
QEAgYm9vbCBodWJidWIyX2dldF9kY2NfY29tcHJlc3Npb25fY2FwKHN0cnVjdCBodWJidWIgKmh1
YmJ1YiwKIAkJCSZzZWdtZW50X29yZGVyX2hvcnosICZzZWdtZW50X29yZGVyX3ZlcnQpKQogCQly
ZXR1cm4gZmFsc2U7CiAKLQlodWJidWIyX2RldF9yZXF1ZXN0X3NpemUoaW5wdXQtPnN1cmZhY2Vf
c2l6ZS5oZWlnaHQsICBpbnB1dC0+c3VyZmFjZV9zaXplLndpZHRoLAorCWh1YmJ1YjJfZGV0X3Jl
cXVlc3Rfc2l6ZShUT19EQ04yMF9IVUJCVUIoaHViYnViKS0+ZGV0aWxlX2J1Zl9zaXplLAorCQkJ
aW5wdXQtPnN1cmZhY2Vfc2l6ZS5oZWlnaHQsICBpbnB1dC0+c3VyZmFjZV9zaXplLndpZHRoLAog
CQkJYnBlLCAmcmVxMTI4X2hvcnpfd2MsICZyZXExMjhfdmVydF93Yyk7CiAKIAlpZiAoIXJlcTEy
OF9ob3J6X3djICYmICFyZXExMjhfdmVydF93YykgewpAQCAtNjE5LDQgKzYxOSw1IEBAIHZvaWQg
aHViYnViMl9jb25zdHJ1Y3Qoc3RydWN0IGRjbjIwX2h1YmJ1YiAqaHViYnViLAogCWh1YmJ1Yi0+
bWFza3MgPSBodWJidWJfbWFzazsKIAogCWh1YmJ1Yi0+ZGVidWdfdGVzdF9pbmRleF9wc3RhdGUg
PSAweEI7CisJaHViYnViLT5kZXRpbGVfYnVmX3NpemUgPSAxNjQgKiAxMDI0OyAvKiAxNjRLQiBm
b3IgRENOMi4wICovCiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfaHViYnViLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfaHViYnViLmgKaW5kZXggNjI2MTE3ZDNiNGU5Li41MDE1MzJkZDUyM2EgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJi
dWIuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHVi
YnViLmgKQEAgLTgxLDYgKzgxLDcgQEAgc3RydWN0IGRjbjIwX2h1YmJ1YiB7CiAJdW5zaWduZWQg
aW50IGRlYnVnX3Rlc3RfaW5kZXhfcHN0YXRlOwogCXN0cnVjdCBkY25fd2F0ZXJtYXJrX3NldCB3
YXRlcm1hcmtzOwogCXN0cnVjdCBkY24yMF92bWlkIHZtaWRbMTZdOworCXVuc2lnbmVkIGludCBk
ZXRpbGVfYnVmX3NpemU7CiB9OwogCiB2b2lkIGh1YmJ1YjJfY29uc3RydWN0KHN0cnVjdCBkY24y
MF9odWJidWIgKmh1YmJ1YiwKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
