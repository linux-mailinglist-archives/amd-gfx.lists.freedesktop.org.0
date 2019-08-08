Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE5D85F72
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 12:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FD16E818;
	Thu,  8 Aug 2019 10:22:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730048.outbound.protection.outlook.com [40.107.73.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6306E812
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 10:22:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQASshuQvwtSh6AhoyjlTMR9SHRaDiOw236LXn5wMQcEove7EDrAx1GTnvqxqeqeerduM6qRnfZgfzsuzJ7ZucbsXaBRfFDowWHlJjsXRn5Pd6Di4CBnp4yusYR3uaYvzx9B0iItO84ItZwl8aNsshFOkY2Ey7KhOjMAzO6PWfPcfaO+7UCZFGM5CESrXrq7S3K21/OENNHdij9Pd+CjbApKgzQRQY8x1oKn5fLqVBid4ETd4ngaNVOJXIuggOPjlNxzfLmERUf2T9+vvYwUwTo/CiN64/Oq4fuoXAz7lGLvc2z9oZZfSqXSQ+Y2U709LuziWUyPgEALoAr/CYtTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV6ZXzOOju+YhkAZTsBoRtk3D20WhWikw0IerELCgYw=;
 b=ZPsemjCoUbJnpnUKvZmxTi6P3fl+aXCeFi3eMaWkqnPP9ZpmWqj6owyerY5cJnigp8ZntOPcJGvXXJxYdWqkw27aCX+cgafzmX5KYS+o6GBm+DopWSRTWJ/n8JWFlhbi6GFR+E7g3Q0VT922M5Jli3YxMOfBUfEjrhgsf/hyun6O5OQwVn/AwXTTAObUJ9Q0Oi8qTX1lBJsf5Hg8nBaAvdPE56v+0rek6weW9HsahPbyfH80AQm1WnJWTzGhLv/HPTLSavOoalObAVjElqQ4rIcMz6epFWwqjqch+NQi3EnI/XaXYcm8YftKb+A+htti/EpXTi7vKwlyVCrz84TEWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0104.namprd12.prod.outlook.com (2603:10b6:0:55::24) by
 MWHPR12MB1535.namprd12.prod.outlook.com (2603:10b6:301:5::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Thu, 8 Aug 2019 10:22:11 +0000
Received: from CO1NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM3PR12CA0104.outlook.office365.com
 (2603:10b6:0:55::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.15 via Frontend
 Transport; Thu, 8 Aug 2019 10:22:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT030.mail.protection.outlook.com (10.152.80.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 10:22:11 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 05:22:10 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 7/9] drm/amdgpu: enable sdma clock gating for Arcturus
Date: Thu, 8 Aug 2019 18:21:54 +0800
Message-ID: <1565259714-30357-7-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565259714-30357-1-git-send-email-le.ma@amd.com>
References: <1565259714-30357-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(478600001)(50226002)(2351001)(6916009)(53936002)(4326008)(4744005)(5660300002)(8676002)(81156014)(48376002)(81166006)(70586007)(70206006)(50466002)(14444005)(6666004)(356004)(8936002)(26005)(336012)(316002)(16586007)(76176011)(51416003)(186003)(49486002)(486006)(426003)(126002)(476003)(2906002)(446003)(2616005)(11346002)(47776003)(305945005)(44832011)(36756003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1535; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c49d03d-14c5-4d1e-9530-08d71bea4657
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1535; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1535:
X-Microsoft-Antispam-PRVS: <MWHPR12MB15355C60CD2795981807D48AF6D70@MWHPR12MB1535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hxLAxBubiPL0pU9ZxxTCe/9WoB7opGT+uEBZGhq2iioYe1g++itSY9w/dDCDD6ILGXckL7TzS9CPkhXsGdeBLccYyNAaQF6P8oam12p01HCOJmN91cnTQvDL7abUNt8ZkY9POxvyH250Advnx3bWzqxnHGJLJ4QBzI90g+33mfFLRGfaWxmxryvKyr+2hdHVmiSorn/Tg9vjyAqKysORMyuNG8NpBuKgvFXbcc6VkbGZqHAXOtn+anXcrDr37NXBcJhOtnrlDyHI36nzm70JqGIcnOEcQ9SWNDiey+ZZh/oFgxWgLjQzc4aFLK09yh/nuhhCgubdgpLYrSX2HHTUHM+dC4vbRkUnNzuQ/8KPgE9Ec8uP1uNVtrX1RMIC7j8RCfO3iDo+nXf2+wEiQ0XhP+Y6Usr7zbaJvdde1looEds=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 10:22:11.0675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c49d03d-14c5-4d1e-9530-08d71bea4657
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV6ZXzOOju+YhkAZTsBoRtk3D20WhWikw0IerELCgYw=;
 b=KmVW2q3f5PE7nxN7xc7R7vVq8ku9gEfvQyFQQBKFV7eQ5sf0rM3AYFsRKXgz3JuSV/+p8QIGvnP/Svo8BT+t39b5kzAqGC/Fm2RtZ0XUD0j5/sqfy0eO0uN+Tkue71dDJDvRvA8LnkEsa+zzW/jOxwGOVkWTcBKvTjqpL5lbtb4=
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

SW5pdCBzZG1hIE1HQ0cvTFMgZmxhZwoKQ2hhbmdlLUlkOiBJNjAwYjhjNjdiMWRmYTc0MjQwMjY5
ZjJmMDI4OTYwYjJjOTNhMGVjMgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgNCArKystCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NvYzE1LmMKaW5kZXggNjAzOGRjZS4uYWQ2NDk3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jCkBAIC0xMDE5LDcgKzEwMTksOSBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9l
YXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJCUFNRF9DR19TVVBQT1JUX0dGWF9DR0xTIHwKIAkJ
CUFNRF9DR19TVVBQT1JUX0dGWF9DUF9MUyB8CiAJCQlBTURfQ0dfU1VQUE9SVF9IRFBfTUdDRyB8
Ci0JCQlBTURfQ0dfU1VQUE9SVF9IRFBfTFM7CisJCQlBTURfQ0dfU1VQUE9SVF9IRFBfTFMgfAor
CQkJQU1EX0NHX1NVUFBPUlRfU0RNQV9NR0NHIHwKKwkJCUFNRF9DR19TVVBQT1JUX1NETUFfTFM7
CiAJCWFkZXYtPnBnX2ZsYWdzID0gMDsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRldi0+
cmV2X2lkICsgMHgzMjsKIAkJYnJlYWs7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
