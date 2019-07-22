Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923906F7D0
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 05:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B913899C4;
	Mon, 22 Jul 2019 03:16:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820045.outbound.protection.outlook.com [40.107.82.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDF4899BC
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 03:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQp4drlyuJUxT8o4pbGlLqCYj3OfCKYXjzkC748wsAUlII6cRTdV3id+K3BFWUoNELwlzjhcRZ1dRJmeC6tQThhVqKoQnQ/5teowXcHv/o4NgEgiNidYQw5CiY0R/JzHCrp9R3s1y4et4aQvGQMB+HOaQHmKaSMhVajlsmpUKZW1G/b5ticuJXcSE4K6LMHkp0A5hpvpmgt4xCnX1EadzjXcuImrFs2iPsnobB8ENb0hYyec7KNp08tmDyehQTJJZXDuNlt+6ITZV1sOFTHr1RkNE0XSQTlVJIW6/wdZ1j2GUVPnHIUgK7klIFmUTGfw++XtiOBvbOEvAacu2/yOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3B5tF2CE3XupGaL1s0fPYJ3rveQmEIERrVUfZX5fIE=;
 b=Xh1/syBoD0leEvwlJmSgWOoeV3Q2SrRmnaiIYIK0mRNCv0JRssNuf215en+y0uHA4Yr1XnmkmYlFdniQqsx434dRVbE9xqodfgKfYnqZrOI0eB7RA14e8h1Q6uSln09h9WznrQjLzX68Guq9QYdYUlMXpb3SG8BTIQsHOsje6XhhVoI2gvdsIgi9x9Yibe+zDVzdd4Xr1ecHSJgsfgTp+2HVg6uJbDDDQqA5yt8Em5ZxKrxkoIXEKdfpbZfw5X+Swf3psYlIC+cfMT2IRsHu2oV+h7jGNzmouh3AIn3NUw4b1UacQLA0BtRQBBO9qC6VpIBw0xMXxxDWuyMNERSQag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN6PR12CA0031.namprd12.prod.outlook.com (2603:10b6:405:70::17)
 by CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12; Mon, 22 Jul
 2019 03:15:56 +0000
Received: from DM3NAM03FT057.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by BN6PR12CA0031.outlook.office365.com
 (2603:10b6:405:70::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Mon, 22 Jul 2019 03:15:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT057.mail.protection.outlook.com (10.152.83.45) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 22 Jul 2019 03:15:55 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Sun, 21 Jul 2019
 22:15:55 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/amd/powerplay: support VCN powergate status retrieval
 on Raven
Date: Mon, 22 Jul 2019 11:15:28 +0800
Message-ID: <20190722031531.23437-3-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722031531.23437-1-evan.quan@amd.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(50466002)(26005)(8936002)(50226002)(68736007)(51416003)(8676002)(7696005)(86362001)(186003)(76176011)(47776003)(53416004)(356004)(6666004)(478600001)(426003)(81156014)(336012)(81166006)(2616005)(48376002)(1076003)(476003)(126002)(70586007)(305945005)(486006)(44832011)(11346002)(53936002)(2351001)(5660300002)(4326008)(2906002)(6916009)(316002)(36756003)(54906003)(70206006)(2870700001)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1576; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fd59fbe-24f7-4834-9f5a-08d70e52e94b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1576; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1576:
X-Microsoft-Antispam-PRVS: <CY4PR12MB157621D3B9651BB7EA1F701AE4C40@CY4PR12MB1576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: kl4QzLjoKF/9sbEDuBQnl1hdaN+G8jeMBtzxwmwSQdGNvZVxgD6QCZlb3MsKx7yY2p6FC2yeoeWrVrghR5cfU8lnClSG8VaIogAraqKrUIesUI8/zpO8UhNQS+aUTMUG36yioSUlZuan+IYrxnloLX/1H8WX/HIjwjXH6/F7ip8FMiL9Sg4t8RtXidaYcA688yj0vtyTghq3vsEET6913sXtgY3FUm2hKVq9tTv8vG9EDuYcI38f3CzDaaDEWVLY531k933E9Jlg4dDBEXNeglpXcu0feOvnIut3FEh8DJUDOEvITHfoqW91GJRzwzM+49DpuQXMOOw9gqWRrl6UETBh1a0shUJqa4iosjqd9zcFWGRI4F8+Koxjyu0/3TUaEUxrITVl2+pyteDEdYELUy+01pMf/mJYHNb3JWmpuyM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 03:15:55.9348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd59fbe-24f7-4834-9f5a-08d70e52e94b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1576
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3B5tF2CE3XupGaL1s0fPYJ3rveQmEIERrVUfZX5fIE=;
 b=lPsj1jlBffFLezXTKf/hxc8mM8VNqRhAMkwP0sPO37J0A5rBpM8tu2BaymX2h3/TFVDEdG51aeWWFhMAAcgw7+U6wUNFKmMJgiOM6iK9LAW6NhILsdShdWqGSMhCNsaZx2M2QpdtHDB9x7+xf/+uChvmxmfTL1C6qpmHFWTIEoA=
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
Cc: Alexander.Deucher@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RW5hYmxlIFZDTiBwb3dlcmdhdGUgc3RhdHVzIHJlcG9ydCBvbiBSYXZlbi4KCkNoYW5nZS1JZDog
STYwYzc5M2Y4MTg1Y2U2Nzk5YjQwYTBjYWJkOTdkOWM5ZmU1NDgzZmQKU2lnbmVkLW9mZi1ieTog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9od21nci9zbXUxMF9od21nci5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9od21nci9zbXUxMF9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aHdtZ3Ivc211MTBfaHdtZ3IuYwppbmRleCBlMzJhZTlkMzM3M2MuLjQ5MWEzY2M3NzZmYyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3Iu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5j
CkBAIC0xMTExLDYgKzExMTEsNyBAQCBzdGF0aWMgaW50IHNtdTEwX3RoZXJtYWxfZ2V0X3RlbXBl
cmF0dXJlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiBzdGF0aWMgaW50IHNtdTEwX3JlYWRfc2Vu
c29yKHN0cnVjdCBwcF9od21nciAqaHdtZ3IsIGludCBpZHgsCiAJCQkgIHZvaWQgKnZhbHVlLCBp
bnQgKnNpemUpCiB7CisJc3RydWN0IHNtdTEwX2h3bWdyICpzbXUxMF9kYXRhID0gKHN0cnVjdCBz
bXUxMF9od21nciAqKShod21nci0+YmFja2VuZCk7CiAJdWludDMyX3Qgc2NsaywgbWNsazsKIAlp
bnQgcmV0ID0gMDsKIApAQCAtMTEzMiw2ICsxMTMzLDEwIEBAIHN0YXRpYyBpbnQgc211MTBfcmVh
ZF9zZW5zb3Ioc3RydWN0IHBwX2h3bWdyICpod21nciwgaW50IGlkeCwKIAljYXNlIEFNREdQVV9Q
UF9TRU5TT1JfR1BVX1RFTVA6CiAJCSooKHVpbnQzMl90ICopdmFsdWUpID0gc211MTBfdGhlcm1h
bF9nZXRfdGVtcGVyYXR1cmUoaHdtZ3IpOwogCQlicmVhazsKKwljYXNlIEFNREdQVV9QUF9TRU5T
T1JfVkNOX1BPV0VSOgorCQkqKHVpbnQzMl90ICopdmFsdWUgPSAgc211MTBfZGF0YS0+dmNuX3Bv
d2VyX2dhdGVkID8gMCA6IDE7CisJCSpzaXplID0gNDsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJ
cmV0ID0gLUVJTlZBTDsKIAkJYnJlYWs7CkBAIC0xMTc1LDE4ICsxMTgwLDIyIEBAIHN0YXRpYyBp
bnQgc211MTBfcG93ZXJnYXRlX3NkbWEoc3RydWN0IHBwX2h3bWdyICpod21nciwgYm9vbCBnYXRl
KQogCiBzdGF0aWMgdm9pZCBzbXUxMF9wb3dlcmdhdGVfdmNuKHN0cnVjdCBwcF9od21nciAqaHdt
Z3IsIGJvb2wgYmdhdGUpCiB7CisJc3RydWN0IHNtdTEwX2h3bWdyICpzbXUxMF9kYXRhID0gKHN0
cnVjdCBzbXUxMF9od21nciAqKShod21nci0+YmFja2VuZCk7CisKIAlpZiAoYmdhdGUpIHsKIAkJ
YW1kZ3B1X2RldmljZV9pcF9zZXRfcG93ZXJnYXRpbmdfc3RhdGUoaHdtZ3ItPmFkZXYsCiAJCQkJ
CQlBTURfSVBfQkxPQ0tfVFlQRV9WQ04sCiAJCQkJCQlBTURfUEdfU1RBVEVfR0FURSk7CiAJCXNt
dW1fc2VuZF9tc2dfdG9fc21jX3dpdGhfcGFyYW1ldGVyKGh3bWdyLAogCQkJCQlQUFNNQ19NU0df
UG93ZXJEb3duVmNuLCAwKTsKKwkJc211MTBfZGF0YS0+dmNuX3Bvd2VyX2dhdGVkID0gdHJ1ZTsK
IAl9IGVsc2UgewogCQlzbXVtX3NlbmRfbXNnX3RvX3NtY193aXRoX3BhcmFtZXRlcihod21nciwK
IAkJCQkJCVBQU01DX01TR19Qb3dlclVwVmNuLCAwKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9zZXRf
cG93ZXJnYXRpbmdfc3RhdGUoaHdtZ3ItPmFkZXYsCiAJCQkJCQlBTURfSVBfQkxPQ0tfVFlQRV9W
Q04sCiAJCQkJCQlBTURfUEdfU1RBVEVfVU5HQVRFKTsKKwkJc211MTBfZGF0YS0+dmNuX3Bvd2Vy
X2dhdGVkID0gZmFsc2U7CiAJfQogfQogCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
