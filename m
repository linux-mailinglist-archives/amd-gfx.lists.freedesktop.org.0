Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 819B16B95A
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 11:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63BE89E05;
	Wed, 17 Jul 2019 09:34:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770072.outbound.protection.outlook.com [40.107.77.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B2789E05
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 09:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6Jke8/LWsEdbXV5E0k8GGhr6S47Pbw1Oe0WktLLiv/9xNpIKKsQ/vAaPwrmtZEilfUg/pORn21Y2hK1YdTyJyRYbduIw5rmE0HO3fVuUcl2y8N/LbVzW66nQqADXB17xsNqMcyAxeNYNUooBjMz7N+RW6NHp9YZUHmJ5Bs0HMSSgDiHOPbjCOjnJuSCEVn1GLAMTsJNLvdpWmA22fb4F3gZnFoAnXQMuor8wipjdrKa/NIK8JUsUFzaHARjmzz7NF3v8tR98BKnum8qps6vCV6HcqPDsVVxy3OwHMNP4vnumOBziALM7q0OT39CTqRBkV8bEfJ16u0C9Ce2SaqJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYLRakrgHHyflYtBnXY+chl3BYyT8pr4LbM2PSGTjtM=;
 b=O6h0u8KKNxPLKjoEyocbxVjDl1iGd+yEO5dj9tzLBHdw52AoHypXh4CZpYY3MzEtImDCbJDR4Hr1ivUosoEVgkn78SbUcGIHsGGHgjIvmddXt11aFhzsTodSZiS0DqE5qkyxEASJtDhTyw5Ey1gKRtCWng6uqUlJYFX6A+D5EWRByTo+X37ly2NHjqGZSaILo2a1vJiMQ90iTuh8PBv5JBy9kmCi7Y59DvQQ6oAKgo/xB6VRHTaZrvle1hyCiH9L55/Rdky/VRJCMgM35YMBUTqYVvi1zXL1wqRmZwTvykARFGUeLkHd6uoV/fm6HRJ1WkZLn8MG94rKznpkgMuHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:208:a8::32)
 by MN2PR12MB3103.namprd12.prod.outlook.com (2603:10b6:208:c5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Wed, 17 Jul
 2019 09:34:44 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by MN2PR12CA0019.outlook.office365.com
 (2603:10b6:208:a8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.19 via Frontend
 Transport; Wed, 17 Jul 2019 09:34:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 17 Jul 2019 09:34:43 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 17 Jul 2019
 04:34:42 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: report bootup clock as max supported on
 dpm disabled
Date: Wed, 17 Jul 2019 17:34:32 +0800
Message-ID: <20190717093432.25165-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(81166006)(48376002)(81156014)(50226002)(126002)(36756003)(86362001)(478600001)(356004)(70206006)(1076003)(70586007)(68736007)(6666004)(54906003)(50466002)(8936002)(8676002)(316002)(6916009)(476003)(53936002)(336012)(5660300002)(47776003)(53416004)(4326008)(14444005)(2870700001)(305945005)(2351001)(7696005)(486006)(44832011)(2906002)(186003)(26005)(51416003)(426003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3103; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1e96639-80a1-4771-dfc1-08d70a9a003b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3103; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3103:
X-Microsoft-Antispam-PRVS: <MN2PR12MB310335F40BABBE45DD79FB22E4C90@MN2PR12MB3103.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 01018CB5B3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 9/0bjJCkSdOuDWWAC6oVUheX5QkxT8qtakRgDO/WpvlpKSjeGkZV0Bn0XFgqlgouNFF48Ddha0ds4wLzNpCk999KTJhyPREs3fu1AY8lxXJRWl8USCPA8yb9RY9U3IzYNfc8PKoKpOYul4LsmLsMGDWKswVc/UJbyHbcoJtNtM0+ttKpGmg3wlvEYHhN34rxvMEYNUTSSPXbS96ApsZSpTiKSp1kMDRxM5c69CZT3C5OyWeDE0ZGWwlJk/YSbGOJR2OcXR5YjKVNDOFKD5u9AxN1ALxL9acVsF1PwzapUdgSK1aiOap1X8HK71R+InWUmlZTYSGZuvuKBPOWl74NrdNkJRwYtoHwjsUZl64BKnyP0ibGlSp8cL++J7WDUDcxwrBgeERKKC81qB4jA52sEHMuVWJQhgfdguUDZhGr7to=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2019 09:34:43.9257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e96639-80a1-4771-dfc1-08d70a9a003b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYLRakrgHHyflYtBnXY+chl3BYyT8pr4LbM2PSGTjtM=;
 b=KNrH8P18G/vIV7OQw+3IBreQiInVIw77udtb/P3KVLR8qgEtgsoaqKLuyFGwz6x1jiF/EPJVia6DT6QUmBLz08jBmJpO+gTUeFQuvbxicj8q7UW06CxkkvAguLPj0zBWxGJcF8DRe0ilmagEUdj7lcPqR/j07kWtbfVpw1Lfs2c=
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
Cc: Alexander.Deucher@amd.com, feifei.xu@amd.com, Evan
 Quan <evan.quan@amd.com>, le.ma@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aCBnZnhjbGsgb3IgdWNsayBkcG0gZGlzYWJsZWQsIGl0J3MgcmVhc29uYWJsZSB0byByZXBv
cnQgYm9vdHVwIGNsb2NrCmFzIHRoZSBtYXggc3VwcG9ydGVkLgoKQ2hhbmdlLUlkOiBJZjhhYTdh
OTEyZThhMzQ0MTRiMGU5YzJiNDZkZTliNmUzMTZmZDlkNwpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1
YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNo
YW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggNWQ1NjY0Zi4uZDM3MGIwOSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtMTM3LDEyICsxMzcs
MzcgQEAgaW50IHNtdV9nZXRfZHBtX2ZyZXFfcmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
IGVudW0gc211X2Nsa190eXBlIGNsa190eXBlLAogewogCWludCByZXQgPSAwLCBjbGtfaWQgPSAw
OwogCXVpbnQzMl90IHBhcmFtID0gMDsKKwl1aW50MzJfdCBjbG9ja19saW1pdDsKIAogCWlmICgh
bWluICYmICFtYXgpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JaWYgKCFzbXVfY2xrX2RwbV9pc19l
bmFibGVkKHNtdSwgY2xrX3R5cGUpKQorCWlmICghc211X2Nsa19kcG1faXNfZW5hYmxlZChzbXUs
IGNsa190eXBlKSkgeworCQlzd2l0Y2ggKGNsa190eXBlKSB7CisJCWNhc2UgU01VX01DTEs6CisJ
CWNhc2UgU01VX1VDTEs6CisJCQljbG9ja19saW1pdCA9IHNtdS0+c211X3RhYmxlLmJvb3RfdmFs
dWVzLnVjbGs7CisJCQlicmVhazsKKwkJY2FzZSBTTVVfR0ZYQ0xLOgorCQljYXNlIFNNVV9TQ0xL
OgorCQkJY2xvY2tfbGltaXQgPSBzbXUtPnNtdV90YWJsZS5ib290X3ZhbHVlcy5nZnhjbGs7CisJ
CQlicmVhazsKKwkJY2FzZSBTTVVfU09DQ0xLOgorCQkJY2xvY2tfbGltaXQgPSBzbXUtPnNtdV90
YWJsZS5ib290X3ZhbHVlcy5zb2NjbGs7CisJCQlicmVhazsKKwkJZGVmYXVsdDoKKwkJCWNsb2Nr
X2xpbWl0ID0gMDsKKwkJCWJyZWFrOworCQl9CisKKwkJLyogY2xvY2sgaW4gTWh6IHVuaXQgKi8K
KwkJaWYgKG1pbikKKwkJCSptaW4gPSBjbG9ja19saW1pdCAvIDEwMDsKKwkJaWYgKG1heCkKKwkJ
CSptYXggPSBjbG9ja19saW1pdCAvIDEwMDsKKwogCQlyZXR1cm4gMDsKKwl9CiAKIAltdXRleF9s
b2NrKCZzbXUtPm11dGV4KTsKIAljbGtfaWQgPSBzbXVfY2xrX2dldF9pbmRleChzbXUsIGNsa190
eXBlKTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
