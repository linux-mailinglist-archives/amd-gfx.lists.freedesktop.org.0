Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8585F6D
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 12:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ABC6E7EF;
	Thu,  8 Aug 2019 10:22:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720070.outbound.protection.outlook.com [40.107.72.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412456E7EF
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 10:22:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThOJYsLLnU9WjH4aKjg9rHU5D6w76flvcUzKqduKsgK5XBTXXwcxu1iJfwwYnInBIaCmmeM3tByabk0MuYak/ZmAAi0h+oPcIDz4mf4XWrfZBPXUkCEyKGB4c3pHu/clT4kFTfzy4yahI18soqFRUMm3BaJww4tbahgTod1PvlqHkx+Nfe0TYB64dawJuUHRor1LAfi9K+E3GFLevvsr4eKw2GSsZmlKUOmHGdB5OnPttGdSTIb+2taqhfcyXnQU+ZjVHChP2wAjK/k0+kqt07bpQauUYVNNWDXp+gDmevNPzxK1HW7EaF9EE/PEBtzt2vySnRmyAMf1Um41i5xQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeTix57WWC1gi9cjQwt+Sbj0vSnpqCTfZV78KsD0miA=;
 b=HnRmP8qHfyK4ojFuwT9YUZ8Fnn/XPCRy4ui+hnqmkpOKqSiqDbB/VN0zjuNzeeMuieUOH6c4NsRz3h4bRcvExvDPjtxnHWgwq62vdtLKVZfYy54NccKO7vCd90Bnm4aL03nfiAPUesCGfLeFVFHKIZ2fxsrCmO+or/1eDPPVziq9KW0+D0XvVaovy0XUnDkS5t985qJtu+7UCv6FPGaNq7aFt159iYNDjVPtvHS3gINEGwuXaHjTSflvjTj23JsdJnGBmnv8SeBxcezLv6SnFd1RllfOivvbtUFpL3bYTkLky6X2UsI1QJUnQt5Kn9dcynpcvlGM/NaAUeOhe6OW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0091.namprd12.prod.outlook.com (2603:10b6:0:55::11) by
 BN6PR12MB1521.namprd12.prod.outlook.com (2603:10b6:405:f::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 8 Aug 2019 10:22:02 +0000
Received: from CO1NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by DM3PR12CA0091.outlook.office365.com
 (2603:10b6:0:55::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Thu, 8 Aug 2019 10:22:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT016.mail.protection.outlook.com (10.152.80.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 10:22:01 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 05:22:00 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/9] drm/amdgpu: enable gfx clock gating for Arcturus
Date: Thu, 8 Aug 2019 18:21:49 +0800
Message-ID: <1565259714-30357-2-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565259714-30357-1-git-send-email-le.ma@amd.com>
References: <1565259714-30357-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(5660300002)(86362001)(4744005)(478600001)(316002)(53936002)(305945005)(50226002)(81166006)(426003)(81156014)(8676002)(8936002)(11346002)(16586007)(446003)(50466002)(70586007)(70206006)(4326008)(49486002)(51416003)(76176011)(14444005)(2351001)(48376002)(44832011)(486006)(476003)(2616005)(126002)(6666004)(186003)(336012)(26005)(356004)(36756003)(6916009)(2906002)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1521; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7f817b3-b0bf-4fc6-b304-08d71bea40bc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1521; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1521:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1521883FF7333CBF2AD3038BF6D70@BN6PR12MB1521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ows4z2DTmt/cbc2lioWnc5mUcL0SvFFkAbS6/zMCg9SDJfPQR9KvoY0x3sbS4mk8dV9wi70o8/uHxn8CDY1XXpYYT4IIY/uuPNTXLixe8bX2S/mifdlZ7dmvoZbhC4A2BrtWnq0V6+l4wvW9GsDNKRoHF7QEIxLpEHKOq6acZbIuILKtD7qIIA9brcnimHJIcAt9/GMjXcmnCP9Wfd8FgDx88TmPUUSR+XFaiNr9Eq4F6jdRUcJpUTW1IhFAP+Hc8qJPTFmZ5weESc0fWxRd76pvu+YyxPVAmINqQHhn9u5V/5mv6CWrLhi5pk8jV9jOEkHkbkjuqd0cAB1GW+yYjboSx9w6RtfWeqxY4ezr59HgZB9GTJovWTzkU8bacBDgW2SdxQrQ+U+0efRNKkP3ly2ZsHx3kgPqqIJqqmTpT28=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 10:22:01.6614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f817b3-b0bf-4fc6-b304-08d71bea40bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1521
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeTix57WWC1gi9cjQwt+Sbj0vSnpqCTfZV78KsD0miA=;
 b=T69UTGsiVi3uPVAYdlBe2kBdezvjGsekvWQx5Nkyl17zzyG/8z1heoky/bLOKLe8WHanaTQPU93tQs015joY8FH14tyOIVU8W+tVA9udVrjDEOMfvSuV+xxUCSoaxTHBPaJh1f6GSYZH3r9jmz7LOMMO8EoMJuzHOE8knO0dD9s=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW5pdCBnZnggTUdDRy9MUywgQ0dDRy9MUywgQ1BfTFMgZmxhZy4KCkNoYW5nZS1JZDogSTg4ZGI3
NmQxYjhmMmIyY2VjY2UxMDg0NmE0ZDIyZWVjNjM4ZWVhOGEKU2lnbmVkLW9mZi1ieTogTGUgTWEg
PGxlLm1hQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8
IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggMTVmNjM1Ni4uMDA3NThiZSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCkBAIC0xMDEzLDcgKzEwMTMsMTEgQEAgc3RhdGlj
IGludCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAJCWJyZWFrOwogCWNh
c2UgQ0hJUF9BUkNUVVJVUzoKIAkJYWRldi0+YXNpY19mdW5jcyA9ICZ2ZWdhMjBfYXNpY19mdW5j
czsKLQkJYWRldi0+Y2dfZmxhZ3MgPSAwOworCQlhZGV2LT5jZ19mbGFncyA9IEFNRF9DR19TVVBQ
T1JUX0dGWF9NR0NHIHwKKwkJCUFNRF9DR19TVVBQT1JUX0dGWF9NR0xTIHwKKwkJCUFNRF9DR19T
VVBQT1JUX0dGWF9DR0NHIHwKKwkJCUFNRF9DR19TVVBQT1JUX0dGWF9DR0xTIHwKKwkJCUFNRF9D
R19TVVBQT1JUX0dGWF9DUF9MUzsKIAkJYWRldi0+cGdfZmxhZ3MgPSAwOwogCQlhZGV2LT5leHRl
cm5hbF9yZXZfaWQgPSBhZGV2LT5yZXZfaWQgKyAweDMyOwogCQlicmVhazsKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
