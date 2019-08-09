Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB5188506
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C396EEB9;
	Fri,  9 Aug 2019 21:38:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730058.outbound.protection.outlook.com [40.107.73.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDA76EEBC
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXAYgLpVM7mWUHA7gHxeqRnnzl8t5ySTop8ufg1ScaVzO5oPdjFuVIGfSYASpdHzcpB+ruWjl/LIVNjf6tcMSDBlPE7VSkc/FNi61Mk8FB1n+B6SpPU7gKpxsQcV1K6LjmMOjALXlABjpT7Y5kIH9AsymIvUd8jVhZrpRUOlJF7xtAczA4gkK9d45lMrMJqS9Vozw1H4rpLGR8qrB8b77O/Fuk24rLclzHIkQF/mkYC9bcoDv298osGpgW4JOdOPVYECWuZoMfw4dY7gm01NTER5LcPMHB9whgK2JQYD+LWtwHlxY4wlVeuO9WR8lXb07HqRd1ZdfUEQd67gNht/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HuDPrN3Xi3pD3ClSZX9VvBHdhvyAfKRcdB4/6/g5ss=;
 b=Pll/1UkOhfdT2cuNLzatxEWny5lgfvcSObnymZhUgALtQTA2NWbuGygvk8qoutyFHIiUrO0Scsos0NeJ6+u1tYIdRBPf4Uyn1rUGa+YDpvmK2Zox9E8IAYFmoALeWFo6U9+zMaqj2RMbnRhUTdzHWitPR2sUxrxN48flb3PMJrOecUKX3H1TU+v/5w3HlcVWhhya5JUJoUfZrBfrs92K8SBsFLhfRmptXAP8ZBnRri2PrSrq/XxTL4cDh3zHQrJBvRCRUWjE+lEq0F0c4AGIsHOG+eST6GRW70eXTgbz8zrgCNIlHOw5cfaTc65uTAw0+4u1upBnuS33UwD+bMimLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:910:16::12) by MWHPR12MB1278.namprd12.prod.outlook.com
 (2603:10b6:300:10::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Fri, 9 Aug
 2019 21:38:41 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by CY4PR1201CA0002.outlook.office365.com
 (2603:10b6:910:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:40 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:32 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 28/49] drm/amd/display: HUBP/HUBBUB register programming fixes
Date: Fri, 9 Aug 2019 17:37:21 -0400
Message-ID: <20190809213742.30301-29-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(1496009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(51416003)(446003)(2870700001)(48376002)(11346002)(8936002)(4326008)(426003)(486006)(50466002)(86362001)(2906002)(50226002)(36756003)(53936002)(336012)(2351001)(305945005)(6916009)(54906003)(186003)(76176011)(316002)(2876002)(356004)(5660300002)(1076003)(81166006)(81156014)(8676002)(126002)(6666004)(478600001)(476003)(26005)(70206006)(70586007)(47776003)(49486002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be7ecd79-cfde-424e-7b0c-08d71d11f213
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1278B9327646F9291484F8AE82D60@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fmd4EVkXespZ3X5xrEw35rZQ4KzYGdYF4wV7ylazwUsO8raR9asFnCfm9jPrdsdOp/YlhbeRdp5RCELGGMUEUl1pL5G1z62cVeVZtRb4KqrM/3seKx0dxHd3CADiDinCHB1zVKJp62Ha8G0jec5BQ7hcTKVeqABPyJWD2V4n/8mmupjeaEccVLluTizWu9dPNAb0nW93jSZhpPsALoT3QQGSMDkaFgpXyVQ4Q8KnMmLztqg/cKKafb0QSTSK9J5aoh1ivZ4BU8YO1IizfMKIsRjYYxBSmTmx1Q+GZKKXbHmANjLlTDDCb5blfa3mKL6Zg8KAnBd+aRq7q93yUBemcvvBtUstunL2Vwb8I1DqfAZCoIrcYg4Xe+ZVUY7w8JvBUVIUp8ytvHZAuhUsNrYCN6dh6tbxHRk6iZxUxZwGItQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:40.8146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be7ecd79-cfde-424e-7b0c-08d71d11f213
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HuDPrN3Xi3pD3ClSZX9VvBHdhvyAfKRcdB4/6/g5ss=;
 b=Ic3g7rbOq99ZtZgyBcsrqULNt3lWzWwtYU68LCpI89XtV4VyV4r/C1sRl2ghFIboht2U0MrG23VXkwD3WGk2djIt9wa9iCl6rbEiY9FNURouDvbx6PEG4FecbV415C6T3w0Lqx+A/lMdLwsCTB/HYxX6BBdHYtZEHgAWuYTJvo8=
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKW1doeV0KLSBOZWVk
IHRvIGNoYW5nZSBpbnRlcmZhY2UgZnVuY3Rpb24gc2lnbmF0dXJlIC8gYWRkIGFuIGVudW0KICB0
byByZWZsZWN0IHRoZSBhdmFpbGFibGUgcmVnaXN0ZXIgZmllbGQgdmFsdWVzCgpbSG93XQotIEFk
ZCBhIG5ldyBlbnVtIGFuZCBtb2RpZnkgZXhpc3RpbmcgZnVuY3Rpb25zIHRvIHVzZSBpdCBpbnN0
ZWFkCiAgb2YgYm9vbAoKU2lnbmVkLW9mZi1ieTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxp
bkBhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxlbmUgTGl1IDxDaGFybGVuZS5MaXVAYW1kLmNv
bT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmMgfCAyICstCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5oIHwgMiArLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YnAuYyB8IDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJwLmggfCAyICstCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2h1YnAuaCAgICAgIHwgOCArKysrKysrLQog
NSBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5jCmluZGV4
IDAzZjVhYTEwYzRjNC4uMDAxZGI0OWU0YmIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmMKQEAgLTUwOSw3ICs1MDksNyBAQCBib29s
IGh1YnAxX3Byb2dyYW1fc3VyZmFjZV9mbGlwX2FuZF9hZGRyKAogfQogCiB2b2lkIGh1YnAxX2Rj
Y19jb250cm9sKHN0cnVjdCBodWJwICpodWJwLCBib29sIGVuYWJsZSwKLQkJYm9vbCBpbmRlcGVu
ZGVudF82NGJfYmxrcykKKwkJZW51bSBodWJwX2luZF9ibG9ja19zaXplIGluZGVwZW5kZW50XzY0
Yl9ibGtzKQogewogCXVpbnQzMl90IGRjY19lbiA9IGVuYWJsZSA/IDEgOiAwOwogCXVpbnQzMl90
IGRjY19pbmRfNjRiX2JsayA9IGluZGVwZW5kZW50XzY0Yl9ibGtzID8gMSA6IDA7CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1YnAuaAppbmRleCA5
MTExNmIzZDRiNDguLmNiMjBkMTAyODhjMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1YnAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5oCkBAIC02OTgsNyArNjk4LDcgQEAgdm9pZCBo
dWJwMV9wcm9ncmFtX3RpbGluZygKIAogdm9pZCBodWJwMV9kY2NfY29udHJvbChzdHJ1Y3QgaHVi
cCAqaHVicCwKIAkJYm9vbCBlbmFibGUsCi0JCWJvb2wgaW5kZXBlbmRlbnRfNjRiX2Jsa3MpOwor
CQllbnVtIGh1YnBfaW5kX2Jsb2NrX3NpemUgaW5kZXBlbmRlbnRfNjRiX2Jsa3MpOwogCiAjaWZk
ZWYgQ09ORklHX0RSTV9BTURfRENfRENOMl8wCiBib29sIGh1YnAxX3Byb2dyYW1fc3VyZmFjZV9m
bGlwX2FuZF9hZGRyKApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX2h1YnAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9odWJwLmMKaW5kZXggYWMwMWU2MzZhZTI3Li5iNGIzODRjN2ZhOWIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJwLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YnAuYwpAQCAt
Mzk3LDcgKzM5Nyw3IEBAIHZvaWQgaHVicDJfcHJvZ3JhbV9yb3RhdGlvbigKIH0KIAogdm9pZCBo
dWJwMl9kY2NfY29udHJvbChzdHJ1Y3QgaHVicCAqaHVicCwgYm9vbCBlbmFibGUsCi0JCWJvb2wg
aW5kZXBlbmRlbnRfNjRiX2Jsa3MpCisJCWVudW0gaHVicF9pbmRfYmxvY2tfc2l6ZSBpbmRlcGVu
ZGVudF82NGJfYmxrcykKIHsKIAl1aW50MzJfdCBkY2NfZW4gPSBlbmFibGUgPyAxIDogMDsKIAl1
aW50MzJfdCBkY2NfaW5kXzY0Yl9ibGsgPSBpbmRlcGVuZGVudF82NGJfYmxrcyA/IDEgOiAwOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1
YnAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJwLmgK
aW5kZXggOTI0Njk5ZTVmNDQzLi5jNGVkOGYxYjk0MjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJwLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YnAuaApAQCAtMjUyLDcgKzI1Miw3IEBA
IGJvb2wgaHVicDJfcHJvZ3JhbV9zdXJmYWNlX2ZsaXBfYW5kX2FkZHIoCiAJYm9vbCBmbGlwX2lt
bWVkaWF0ZSk7CiAKIHZvaWQgaHVicDJfZGNjX2NvbnRyb2woc3RydWN0IGh1YnAgKmh1YnAsIGJv
b2wgZW5hYmxlLAotCQlib29sIGluZGVwZW5kZW50XzY0Yl9ibGtzKTsKKwkJZW51bSBodWJwX2lu
ZF9ibG9ja19zaXplIGluZGVwZW5kZW50XzY0Yl9ibGtzKTsKIAogdm9pZCBodWJwMl9wcm9ncmFt
X3NpemUoCiAJc3RydWN0IGh1YnAgKmh1YnAsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2h1YnAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9pbmMvaHcvaHVicC5oCmluZGV4IDQ5OTNmMTM0ZTc0Ny4uODA5YjYyYjUxYTQzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2h1YnAuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2h1YnAuaApAQCAtNDcsNiAr
NDcsMTEgQEAgZW51bSBjdXJzb3JfbGluZXNfcGVyX2NodW5rIHsKIAlDVVJTT1JfTElORV9QRVJf
Q0hVTktfMTYKIH07CiAKK2VudW0gaHVicF9pbmRfYmxvY2tfc2l6ZSB7CisJaHVicF9pbmRfYmxv
Y2tfdW5jb25zdHJhaW5lZCA9IDAsCisJaHVicF9pbmRfYmxvY2tfNjRiLAorfTsKKwogc3RydWN0
IGh1YnAgewogCWNvbnN0IHN0cnVjdCBodWJwX2Z1bmNzICpmdW5jczsKIAlzdHJ1Y3QgZGNfY29u
dGV4dCAqY3R4OwpAQCAtNzQsNyArNzksOCBAQCBzdHJ1Y3QgaHVicF9mdW5jcyB7CiAJCQlzdHJ1
Y3QgX3Zjc19kcGlfZGlzcGxheV90dHVfcmVnc19zdCAqdHR1X3JlZ3MpOwogCiAJdm9pZCAoKmRj
Y19jb250cm9sKShzdHJ1Y3QgaHVicCAqaHVicCwgYm9vbCBlbmFibGUsCi0JCQlib29sIGluZGVw
ZW5kZW50XzY0Yl9ibGtzKTsKKwkJCWVudW0gaHVicF9pbmRfYmxvY2tfc2l6ZSBibGtfc2l6ZSk7
CisKIAl2b2lkICgqbWVtX3Byb2dyYW1fdmlld3BvcnQpKAogCQkJc3RydWN0IGh1YnAgKmh1YnAs
CiAJCQljb25zdCBzdHJ1Y3QgcmVjdCAqdmlld3BvcnQsCi0tIAoyLjIyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
