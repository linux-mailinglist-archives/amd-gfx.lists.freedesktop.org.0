Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08951FB43
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 16:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98263891B4;
	Tue, 30 Apr 2019 14:18:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720065.outbound.protection.outlook.com [40.107.72.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2462891B4
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 14:18:39 +0000 (UTC)
Received: from DM3PR12CA0054.namprd12.prod.outlook.com (2603:10b6:0:56::22) by
 BLUPR12MB0643.namprd12.prod.outlook.com (2a01:111:e400:594e::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.13; Tue, 30 Apr
 2019 14:18:38 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM3PR12CA0054.outlook.office365.com
 (2603:10b6:0:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 14:18:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 14:18:37 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 09:18:36 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix VM clean check method
Date: Tue, 30 Apr 2019 22:18:32 +0800
Message-ID: <1556633912-27698-1-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39860400002)(136003)(376002)(2980300002)(428003)(199004)(189003)(16586007)(70206006)(2906002)(316002)(486006)(426003)(476003)(336012)(70586007)(6666004)(36756003)(356004)(48376002)(5660300002)(2616005)(50466002)(126002)(53936002)(72206003)(478600001)(186003)(14444005)(68736007)(97736004)(7696005)(4326008)(26005)(53416004)(6916009)(81156014)(51416003)(2351001)(47776003)(86362001)(50226002)(81166006)(8936002)(77096007)(8676002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR12MB0643; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54fd4a95-ed27-4dbe-a033-08d6cd76bce4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BLUPR12MB0643; 
X-MS-TrafficTypeDiagnostic: BLUPR12MB0643:
X-Microsoft-Antispam-PRVS: <BLUPR12MB0643EF7819D530884D0A7A7BFE3A0@BLUPR12MB0643.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Aq3fDZpxPBjTYvhHRTbjShhi3md9bnDyzBUOcsixVtVc4VX4vbkaSk3IGFT8oTYOz/mpmFWNsHpS2taPRW5z2uxr5Nla7Z614YKfv6+mFnUnzIwfhLxxGGmlUCYJkgr2jYSdMRx0qJnc4VkUbuRVAOhm5XopCnA8RrdA4PXZq+BRyKAnqC0ITk8An2QbQxvqEm2ZGpTSigCpJN/QMacY8u2bgZ+MBETyrR+WYiwB50ZMeq9gnM5O9kUnMuC2EgfO6d6PorST5pnygHUsJSFcAIyfGGaK68BONNGmw7qcA1RUNRWgDFS7fqISz46WbYITTXuxjjGmxtYfeHn/u/t+58WF9nhYVRBE7z57MPXcUzIuSXkSf3dohPEji0iCio8z4wD6r2JKI2AZQacsgccH/OTEFtq8v7u1wCy7imdS1/0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 14:18:37.6336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fd4a95-ed27-4dbe-a033-08d6cd76bce4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR12MB0643
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRl9su/VIeMT/n4ZFG1dUEKacJc4GNaRKUZoQNLAlOI=;
 b=kKgMoKHpB3yHZYm+i5JRYvxGCOfrvvE4DpQX4iZ6jsthlKEPPbcEJTO+vTyiWsVuL+C21fdMiVhv77iWhGT9NsagUhkwegyKCQKE0vINVbQzxoahdc+7HR1mVFXVNjM2mMDvyb5N+ZTLSwwwLT2euCejk+v9TkTv4ISNsXpfgUA=
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
Cc: Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YW1kZ3B1X3ZtX21ha2VfY29tcHV0ZSBpcyB1c2VkIHRvIHR1cm4gYSBHRlggVk0gaW50byBhIGNv
bXB1dGUgVk0sCnRoZSBwcmVyZXF1aXNpdGUgaXMgdGhpcyBWTSBpcyBjbGVhbi4gTGV0J3MgY2hl
Y2sgaWYgc29tZSBwYWdlIHRhYmxlcwphcmUgYWxyZWFkeSBmaWxsZWQgLCB3aGlsZSBub3QgY2hl
Y2sgaWYgc29tZSBtYXBwaW5nIGlzIGFscmVhZHkgbWFkZS4KClNpZ25lZC1vZmYtYnk6IFRyaWdn
ZXIgSHVhbmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdm0uYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwppbmRleCA1NmQ4MzhmLi42NzUyZDRjIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwpAQCAtMjc1NSw2ICsyNzU1LDQw
IEBAIGludCBhbWRncHVfdm1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0
IGFtZGdwdV92bSAqdm0sCiB9CiAKIC8qKgorICogYW1kZ3B1X3ZtX2NoZWNrX2NsZWFuX3Jlc2Vy
dmVkIC0gY2hlY2sgaWYgYSBWTSBpcyBjbGVhbgorICoKKyAqIEBhZGV2OiBhbWRncHVfZGV2aWNl
IHBvaW50ZXIKKyAqIEB2bTogdGhlIFZNIHRvIGNoZWNrCisgKgorICogY2hlY2sgYWxsIGVudHJp
ZXMgb2YgdGhlIHJvb3QgUEQsIGlmIGFueSBzdWJzZXF1ZW50IFBEcyBhcmUgYWxsb2NhdGVkLAor
ICogaXQgbWVhbnMgdGhlcmUgYXJlIHBhZ2UgdGFibGUgY3JlYXRpbmcgYW5kIGZpbGxpbmcsIGFu
ZCBpcyBubyBhIGNsZWFuCisgKiBWTQorICoKKyAqIFJldHVybnM6CisgKgkwIGlmIHRoaXMgVk0g
aXMgY2xlYW4KKyAqLworc3RhdGljIGludCBhbWRncHVfdm1fY2hlY2tfY2xlYW5fcmVzZXJ2ZWQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCisJc3RydWN0IGFtZGdwdV92bSAqdm0pCit7CisJ
aW50IHJldCA9IDA7CisKKwlpZiAodm0tPnJvb3QuZW50cmllcykgeworCQl1bnNpZ25lZCBpbnQg
aSA9IDA7CisJCWVudW0gYW1kZ3B1X3ZtX2xldmVsIGwgPSBhZGV2LT52bV9tYW5hZ2VyLnJvb3Rf
bGV2ZWw7CisJCXVuc2lnbmVkIGludCBlbnRyaWVzID0gYW1kZ3B1X3ZtX251bV9lbnRyaWVzKGFk
ZXYsIGwpOworCisJCWZvciAoaSA9IDA7IGkgPCBlbnRyaWVzOyBpKyspIHsKKwkJCWlmICh2bS0+
cm9vdC5lbnRyaWVzW2ldLmJhc2UuYm8pIHsKKwkJCQlyZXQgPSAtRUlOVkFMOworCQkJCWJyZWFr
OworCQkJfQorCQl9CisJfQorCisJcmV0dXJuIHJldDsKK30KKworLyoqCiAgKiBhbWRncHVfdm1f
bWFrZV9jb21wdXRlIC0gVHVybiBhIEdGWCBWTSBpbnRvIGEgY29tcHV0ZSBWTQogICoKICAqIEBh
ZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKQEAgLTI3ODQsNyArMjgxOCw3IEBAIGludCBhbWRn
cHVfdm1fbWFrZV9jb21wdXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1k
Z3B1X3ZtICp2bSwgdW5zCiAJCXJldHVybiByOwogCiAJLyogU2FuaXR5IGNoZWNrcyAqLwotCWlm
ICghUkJfRU1QVFlfUk9PVCgmdm0tPnZhLnJiX3Jvb3QpIHx8IHZtLT5yb290LmVudHJpZXMpIHsK
KwlpZiAoYW1kZ3B1X3ZtX2NoZWNrX2NsZWFuX3Jlc2VydmVkKGFkZXYsIHZtKSkgewogCQlyID0g
LUVJTlZBTDsKIAkJZ290byB1bnJlc2VydmVfYm87CiAJfQotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
