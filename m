Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2506F3AF0B
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 08:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1ADD890FF;
	Mon, 10 Jun 2019 06:38:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820049.outbound.protection.outlook.com [40.107.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7A0890FF
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 06:38:11 +0000 (UTC)
Received: from CY4PR12CA0047.namprd12.prod.outlook.com (2603:10b6:903:129::33)
 by MWHPR12MB1279.namprd12.prod.outlook.com (2603:10b6:300:d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12; Mon, 10 Jun
 2019 06:38:10 +0000
Received: from BY2NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by CY4PR12CA0047.outlook.office365.com
 (2603:10b6:903:129::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.14 via Frontend
 Transport; Mon, 10 Jun 2019 06:38:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT045.mail.protection.outlook.com (10.152.85.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Mon, 10 Jun 2019 06:38:09 +0000
Received: from monk-build.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 10 Jun 2019
 01:37:51 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: drop the incorrect soft_reset for SRIOV
Date: Mon, 10 Jun 2019 14:37:46 +0800
Message-ID: <1560148666-6338-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(428003)(199004)(189003)(478600001)(6666004)(4744005)(2351001)(86362001)(14444005)(356004)(72206003)(36756003)(68736007)(48376002)(50466002)(305945005)(4326008)(6916009)(70586007)(70206006)(81156014)(77096007)(26005)(81166006)(50226002)(8676002)(476003)(126002)(5660300002)(426003)(16586007)(316002)(336012)(53936002)(486006)(2906002)(47776003)(53416004)(186003)(8936002)(2616005)(51416003)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1279; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaa5fe42-6fed-4246-a9c1-08d6ed6e3434
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1279; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12797BEC39E63602D1B45A1284130@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0064B3273C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZT8AapeCDdOoGpL1hqLqARbytdfgLP6ooo7Z714yPMaU0rcr2R6dXaZeZzPAO0zKpdDaqScqfZKUQVaFSaYxNPHcEsGEU8WMlOq6HCTIl9qq74HrcVzlANn7ZxKGk6Db1HCzE9M/QxUe8Tmic3Zp8jmmTmqztV607z8Ouq6vnMB/6UgQBr+50AfL7pNjpsXMS1i08kQwPxgNzd+HxclrL86kQr96YaXdPi266DJrYhBhO4/8Wuz6CZeS8aUNdI2CRWSUdnSvqgPuxkiFadqyzI9pRqPU0GJwfuREqYiPLG3J0LRkoKx3psozhgxnZZ/hm2w5z+u2D0F9JXEPC4hbSStJQ7nWkNc3Fj+KoVFv96OdBuk5O9WISzfFKIxhNHi5F5ctvKGj1Xhg67ibfsT1qGS/XlU8F7E2h6U5InppVKI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2019 06:38:09.5394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa5fe42-6fed-4246-a9c1-08d6ed6e3434
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvAXxct2FS5XRilKBsCOKBn6GWZXX6fzHVHfKtiODZ4=;
 b=hBiacUr6i/SgD9d/i9M6lVHV6YwY8c3kkgqTqAAWZhLccp5EMnUZ7hUlL9rig4RStjwh7Nzck0hWC6LMBGQWnnJMVSqRFtA5mScEIkc2HQICV0a5bWyia0PdA4qmx8evG2jUeoa3ymXKLFnyLzESUr/HfkSs6wHcsFXkay+4POo=
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
Cc: Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQncyBpbmNvcnJlY3QgdG8gZG8gc29mdCByZXNldCBmb3IgU1JJT1YsIHdoZW4gR0ZYCmhhbmcg
dGhlIFdSRUcgd291bGQgc3R1Y2sgdGhlcmUgYmVjdWFzZSBpdCBnb2VzIEtJUSB3YXkuCgp0aGUg
R1BVIHJlc2V0IGNvdW50ZXIgaXMgaW5jb3JyZWN0OiBhbHdheXMgaW5jcmVhc2UgdHdpY2UKZm9y
IGVhY2ggdGltZWRvdXQKClNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuYwppbmRleCA4ZjUwMjZjLi5mZjY5NzZlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMKQEAgLTM5OSw3ICszOTksNyBA
QCBib29sIGFtZGdwdV9yaW5nX3NvZnRfcmVjb3Zlcnkoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
LCB1bnNpZ25lZCBpbnQgdm1pZCwKIHsKIAlrdGltZV90IGRlYWRsaW5lID0ga3RpbWVfYWRkX3Vz
KGt0aW1lX2dldCgpLCAxMDAwMCk7CiAKLQlpZiAoIXJpbmctPmZ1bmNzLT5zb2Z0X3JlY292ZXJ5
IHx8ICFmZW5jZSkKKwlpZiAoYW1kZ3B1X3NyaW92X3ZmKHJpbmctPmFkZXYpIHx8ICFyaW5nLT5m
dW5jcy0+c29mdF9yZWNvdmVyeSB8fCAhZmVuY2UpCiAJCXJldHVybiBmYWxzZTsKIAogCWF0b21p
Y19pbmMoJnJpbmctPmFkZXYtPmdwdV9yZXNldF9jb3VudGVyKTsKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
