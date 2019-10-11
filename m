Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A3D48BF
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593C46ECA9;
	Fri, 11 Oct 2019 19:54:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800075.outbound.protection.outlook.com [40.107.80.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4036EC9F
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnt1xagXZ9p9PhI799iKg58PS+A6vfIZAc9NUF2kz68CmJ0Y13QPIap/DZLLjUGkt0olFBsqU/BwO6NYQjel9QDMJg2aSOBsc48uWMNJIrDv/15Qju385nCZgKo6HcrzOmRL5uwoT+76K1eRz6je9eQhu5e9J4B/8RnBvwksgnqaMU/tfz7MHqPlq59d6owmPAW02AGKJZANwm1P0jXbpcqI0XTGujnqEVrkcR62432Nmg4GaWiK2A2Z2AphagsnK8SF643PoHCypOpqfql/vvt8OPuf7do7i18z3VkvlVMTgkORMgqBtIqCDgdeP8mD90+1ySOGuYAYLPh7BqDvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqKotz6XhmfGwINQxhWkdjDPEf2chsPXhCmHsPQKABs=;
 b=deqPoDZjrG5/dATTFo+dC60bvjso6KPKr1MvDHU97K08N4xJVeJuZD10YP4qU/B/1or0w15RuiSTPzJhvQhj5FGxEXT20mDXz7Mzvzlcm19NBJ9khpVqBKQXohbZ41iMsmAFAGqb65HgDuDxVC+7itt1CYaMHLcieiWPRJj3g/vuDnin8EHUFmeUZuKBxEuv+MEKyPuGLVqS2vBI1o2kqF3Kr1ntLoj2AdinQ8JCkzjFL4XcgtgAd/g0FVialadr0/YU306DZVcwpNoQQODtfPUQif1j8YIuJywxRUi3e3rIBnQ4K9FmOFtqxBQ6ek/qFR/iEjUANxWdxI039S2Bkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0018.namprd12.prod.outlook.com (2603:10b6:5:1c0::31)
 by MN2PR12MB3774.namprd12.prod.outlook.com (2603:10b6:208:16a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 19:53:55 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM6PR12CA0018.outlook.office365.com
 (2603:10b6:5:1c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:54 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:49 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 25/29] drm/amd/display: fix header for RN clk mgr
Date: Fri, 11 Oct 2019 15:53:20 -0400
Message-ID: <20191011195324.16268-26-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(428003)(199004)(189003)(126002)(478600001)(2616005)(50226002)(5660300002)(476003)(47776003)(486006)(1076003)(426003)(316002)(4326008)(336012)(11346002)(446003)(2351001)(76176011)(6666004)(356004)(7696005)(23676004)(14444005)(50466002)(8936002)(53416004)(26005)(70586007)(70206006)(305945005)(2906002)(2870700001)(186003)(8676002)(81166006)(81156014)(6916009)(86362001)(5820100001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3774; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1255fd4-ecf1-4215-e80b-08d74e84bf7d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3774:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3774EBEC241A72E686DC2C40F9970@MN2PR12MB3774.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /FWHLisvnKynU0h3IB54YQ7GcF8J5nTSnJ2sEkJHLcoT5veln3pyega9d+mlYfE60FllCmTCkqDrolpMwBnC6w3ND5mv8b2e8EE6p6ni3zpejoRJINCW+BINsXD2Jf+mvhLdoTWIk2CYq6KFUfGPpY2gl07uQ2fRhvEjhS/jWMrcT7+q39Ymu+6PPVOPrw9kf99ylRHha21COGo6zbYwj6MJ7iUFvwmRNl4z3jHuMRLVIzoLTbwLzWl7TDMtV4dzYHhPIGuA6VS4GyuI12AX+jgNNZIYD+YdRtV6qt/g6Sb4feOc+DSZ+rSaAlVcBLIht6T+VftNodhmZCsipyvQsu1u3LLdo21hWvuOM7f1d7Jc6sP5bqdaSEvKA6vJKqLvJ6op+JEH2/eTm3NP3PMMxlGbIYCENLdsd5v96gYdros=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:54.9792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1255fd4-ecf1-4215-e80b-08d74e84bf7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3774
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqKotz6XhmfGwINQxhWkdjDPEf2chsPXhCmHsPQKABs=;
 b=s00HdYKEWMAOkoVcUaE7ywken9q/kjxERi5J1jVtx2D1U0FkInoK8ZEXyiyMydy5NUI4M/MZQTkQq9yDBAHXJb4VT8fWz7TVbPCyJbkH7coOGHApli5FPdAZZCSoy02Oj3DsgICTzjEWBG4gh8+mz0djJngi6DNCg8XO0LmmlNA=
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
Cc: joseph gravenor <joseph.gravenor@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogam9zZXBoIGdyYXZlbm9yIDxqb3NlcGguZ3JhdmVub3JAYW1kLmNvbT4KClt3aHldClNo
b3VsZCBhbHdheXMgTVAwX0JBU0UgZm9yIGFueSByZWdpc3RlciBkZWZpbml0aW9uIGZyb20gTVAg
cGVyLUlQIGhlYWRlciBmaWxlcy4KSSBiZWxpdmUgdGhlIHJlYXNvbiB0aGUgbGludXggdmVyc2lv
biBvZiBNUDFfQkFTRSB3b3JrcyBpcyBUaGUgMHRowqBlbGVtZW50IG9mIHRoZSAwdGjCoHRhYmxl
Cm9mIHRoYXQgaXMgaWRlbnRpY2FsIHRvIHRoZSBjb3JyaXNwb25kaW5nIHZhbHVlIG9mIE1QMF9C
QVNFIGluIHRoZSByZW5vaXIgb2Zmc2V0IGhlYWRlciBmaWxlLgpUaGUgcmVhc29uIHdlIHNob3Vs
ZCBvbmx5IHVzZSBNUDBfQkFTRSBpcyBUaGVyZSBpcyBvbmx5IG9uZSBzZXQgb2YgcGVyLUlQIGhl
YWRlcnMgTVAKdGhhdCBpbmNsdWRlcyBhbGwgcmVnaXN0ZXIgZGVmaW5pdGlvbnMgcmVsYXRlZCB0
byBTTVUgSVAgYmxvY2suIFRoaXMgSVAgaW5jbHVkZXMgTVAwLCBNUDEsIE1QMgphbmQgIGFuIGVj
cnlwdGlvbiBlbmdpbmUgdGhhdCBjYW4gYmUgdXNlZCBvbmx5IGJ5IE1QMC4gQXMgYSByZXN1bHQg
YWxsIHJlZ2lzdGVyIGRlZmluaXRpb25zIGZyb20KTVAgZmlsZSBzaG91bGQgYmUgYmFzZWQgb25s
eSBvbiBNUDBfQkFTRSBkYXRhLgoKW0hvd10KQ2hhbmdlIE1QMV9CQVNFIHRvIE1QMF9CQVNFCgpT
aWduZWQtb2ZmLWJ5OiBqb3NlcGggZ3JhdmVub3IgPGpvc2VwaC5ncmF2ZW5vckBhbWQuY29tPgpB
Y2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0t
LQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyX3Zi
aW9zX3NtdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19t
Z3IvZGNuMjEvcm5fY2xrX21ncl92Ymlvc19zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMKaW5kZXggOGU4NjBm
NTY3ZDVjLi5kYjI4ZTkxYWRiM2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21ncl92Ymlvc19z
bXUuYwpAQCAtMzMsNyArMzMsNyBAQAogI2luY2x1ZGUgIm1wL21wXzEyXzBfMF9zaF9tYXNrLmgi
CiAKICNkZWZpbmUgUkVHKHJlZ19uYW1lKSBcCi0JKE1QMV9CQVNFLmluc3RhbmNlWzBdLnNlZ21l
bnRbbW0gIyMgcmVnX25hbWUgIyMgX0JBU0VfSURYXSArIG1tICMjIHJlZ19uYW1lKQorCShNUDBf
QkFTRS5pbnN0YW5jZVswXS5zZWdtZW50W21tICMjIHJlZ19uYW1lICMjIF9CQVNFX0lEWF0gKyBt
bSAjIyByZWdfbmFtZSkKIAogI2RlZmluZSBGTihyZWdfbmFtZSwgZmllbGQpIFwKIAlGRChyZWdf
bmFtZSMjX18jI2ZpZWxkKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
