Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEAF69DC5
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05F289C98;
	Mon, 15 Jul 2019 21:21:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730086.outbound.protection.outlook.com [40.107.73.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAB989C98
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTo56yvXjSvdIYZaAWBjwWGG47QhvkzWvwNaG+exP468Sqg01CgsboWbWjabjjSedoD/xjNLpARvkdug+3je+pR+5t9CSFmmxa68O8GWJopq8A5EWKeDCDT8nio3Gb7kUKZxKKUMZLt09uYTJziXnPaEcHAQiZwcCiPV3KJF4vu/mkt8IENDogGGDS4N2DfZ64AReSEooK7Au4tgiQDUEDub92bx2PC+5WkisJWd3+0Ch6Nsaiqx8QQnFQCVLmqX1Pr7AD4LONeG8rEuY++vfuBzc1uMNlGailvg1AFzM/JLnRKkBenC3IwGyPFU0v6d337H3juO/x/I9P+95fGEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASW38/dmq3KQyNAc0n0R68sTWiM534J51wcriS8NpSY=;
 b=ia3fOeW45z9rXX1uhVsBtEzxd7i1mb0yUZwfrPvcAOZYAe5B7hZLvbz9RtKZZaPE4oF8D6MiQbqz72Sy5+gcOvdSOuEYK4BklLz994HAk5NZpcrrJNeDSpe7m38vx1917POWuK+WCzEHtYCEWMOTl+hNo+qGpdmkUDl4lXUG2mAzlwuRg02tzoi5tcP15ViEWWLBuSxAaGMTo/vnKzfGiK5QLUtDYZoCmYxZT30u3kcVvz+nhHopaPORzhBuTatFEFD+Oep2qqVO9Ccma70m+htAlZDnNn/gxqe8cyu7Ah5wBwvCpvCsMCuHRXXub7B96Mjc7DatgmVuJOD0QRlLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 DM5PR12MB1929.namprd12.prod.outlook.com (2603:10b6:3:106::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 21:21:45 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:45 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:29 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 51/87] drm/amd/display: put back front end initialization
 sequence
Date: Mon, 15 Jul 2019 17:20:13 -0400
Message-ID: <20190715212049.4584-52-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(336012)(305945005)(2870700001)(446003)(6666004)(356004)(6916009)(2906002)(186003)(4326008)(36756003)(26005)(53936002)(68736007)(48376002)(47776003)(5660300002)(2876002)(49486002)(486006)(1076003)(76176011)(478600001)(81166006)(81156014)(8936002)(50466002)(86362001)(51416003)(2351001)(426003)(11346002)(70206006)(54906003)(70586007)(476003)(50226002)(2616005)(126002)(316002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1929; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe10bd6b-ae9b-4b13-1b84-08d7096a707a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1929; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1929:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1929DCD09FC15B9C57CEF85B82CF0@DM5PR12MB1929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tGtjiQ4/tCzBSOSFRYyyV65jA0HQ5L62PtJCLVi+ZxalQqYV0dCmPzdpT3B1q6/zL9sbW638cXIkAwkqgh4HijcpTv3xp48jfJbKI2laj0wdS+8CKrgUaHk7NxgTmvj7e/m3jjxFS90/A1KabxE5k98VJQyAjQcy+7P/LUZcPURtWI7JcvZgMqIfeu4vQxYVD3whENV2ZX15IbrrghVGAovXtS59dh5CfQf8fVZRiOgZdhmbLcP7XLpGPykt3esE3LD0PA9Grt3H9mTvz2ciiCX/s9o4E1jzvpL2X6ggwM2ZzPy5tZJze1vQA/FUHJVi8P/2Ou+yurygTJ3Cy7sG3+VpRu49pG93RFXk3b4+KpgXvCME6pwxKn3mPCeMCgFV60AZTeNw8gvLmtYGk24yxzrGbol1lvUR9Kq5Kl7tEaA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:45.2486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe10bd6b-ae9b-4b13-1b84-08d7096a707a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1929
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASW38/dmq3KQyNAc0n0R68sTWiM534J51wcriS8NpSY=;
 b=AMs0KBxAelFYvOv/sSjOoG79IPGIQ+OO1rRJXuf2kb6xxTqx9vE9Wug8958WvYyWHe5ee3pPMebEKc+OnsDXaQuQhHhOD/K6K9y3/afQdXT5N0DQFy/1oZNzyfpIPh7PEGPPqHCEIFVUMcHXLwnQjcX/YRQUvkPVAqemHGsEx3Q=
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
Cc: Leo Li <sunpeng.li@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpTZWFtbGVzcyBib290
IG9wdGltaXphdGlvbiByZW1vdmVkIHByb3BlciBmcm9udCBlbmQgcG93ZXIgb2ZmIHNlcXVlbmNl
LgpJbiBkcml2ZXIgZGlzYWJsZSBlbmFibGUgY2FzZSwgdGhpcyBjYXVzZXMgZHJpdmVyIHRvIHBv
d2VyIGdhdGUgaHVicAphbmQgZHBwIHdoaWxlIHRoZXJlIGlzIHN0aWxsIG1lbW9yeSBmZXRjaGlu
ZyBnb2luZyBvbiwgdGhpcyBjYW4gY2F1c2UKaW52YWxpZCBtZW1vcnkgcmVxdWVzdHMgdG8gYmUg
Z2VuZXJhdGVkIHdoaWNoIHdpbGwgaGFuZyBkYXRhIGZhYnJpYy4KCltIb3ddClB1dCBiYWNrIHBy
b3BlciBmcm9udCBlbmQgcG93ZXIgb2ZmIHNlcXVlbmNlCgpTaWduZWQtb2ZmLWJ5OiBFcmljIFlh
bmcgPEVyaWMuWWFuZzJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkgS29vIDxBbnRob255
Lktvb0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkFja2Vk
LWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5nQGFtZC5jb20+Ci0tLQogLi4uL2RybS9hbWQvZGlz
cGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyB8IDE1ICstLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVu
Y2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2Vx
dWVuY2VyLmMKaW5kZXggOWYwOGJmYjdmMjM4Li40MGE4MTk4Y2U5MzQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVu
Y2VyLmMKQEAgLTExOTQsMTYgKzExOTQsNyBAQCBzdGF0aWMgdm9pZCBkY24xMF9pbml0X2h3KHN0
cnVjdCBkYyAqZGMpCiAJICogZXZlcnl0aGluZyBkb3duLgogCSAqLwogCWlmIChkY2ItPmZ1bmNz
LT5pc19hY2NlbGVyYXRlZF9tb2RlKGRjYikgfHwgZGMtPmNvbmZpZy5wb3dlcl9kb3duX2Rpc3Bs
YXlfb25fYm9vdCkgewotCQlmb3IgKGkgPSAwOyBpIDwgZGMtPnJlc19wb29sLT5waXBlX2NvdW50
OyBpKyspIHsKLQkJCXN0cnVjdCBodWJwICpodWJwID0gZGMtPnJlc19wb29sLT5odWJwc1tpXTsK
LQkJCXN0cnVjdCBkcHAgKmRwcCA9IGRjLT5yZXNfcG9vbC0+ZHBwc1tpXTsKLQotCQkJaHVicC0+
ZnVuY3MtPmh1YnBfaW5pdChodWJwKTsKLQkJCWRjLT5yZXNfcG9vbC0+b3Bwc1tpXS0+bXBjX3Ry
ZWVfcGFyYW1zLm9wcF9pZCA9IGRjLT5yZXNfcG9vbC0+b3Bwc1tpXS0+aW5zdDsKLQkJCXBsYW5l
X2F0b21pY19wb3dlcl9kb3duKGRjLCBkcHAsIGh1YnApOwotCQl9Ci0KLQkJYXBwbHlfREVHVklE
Q04xMF8yNTNfd2EoZGMpOworCQlkYy0+aHdzcy5pbml0X3BpcGVzKGRjLCBkYy0+Y3VycmVudF9z
dGF0ZSk7CiAJfQogCiAJZm9yIChpID0gMDsgaSA8IGRjLT5yZXNfcG9vbC0+YXVkaW9fY291bnQ7
IGkrKykgewpAQCAtMTM3NCwxMCArMTM2NSw2IEBAIHN0YXRpYyBib29sIGRjbjEwX3NldF9pbnB1
dF90cmFuc2Zlcl9mdW5jKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgsCiAJcmV0dXJuIHJlc3Vs
dDsKIH0KIAotCi0KLQotCiBzdGF0aWMgYm9vbAogZGNuMTBfc2V0X291dHB1dF90cmFuc2Zlcl9m
dW5jKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgsCiAJCQkgICAgICAgY29uc3Qgc3RydWN0IGRj
X3N0cmVhbV9zdGF0ZSAqc3RyZWFtKQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
