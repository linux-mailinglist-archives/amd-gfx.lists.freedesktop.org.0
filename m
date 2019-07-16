Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E35D6A43D
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 10:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2AA6E0D0;
	Tue, 16 Jul 2019 08:51:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810072.outbound.protection.outlook.com [40.107.81.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F5A6E0D1
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 08:51:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYH1DB2kXm1be6bJqnB2UAh/JWxROt1735ck6G4ZsoCETpgZ2yut9H99QV/YdB3Qjs4QJyGphx9RwFHEgevbXJcHUIvBFOwHDmZJ7xhUehsd2sqj/qQeizTbVUlpsqGOcRr6fr+/xdCXO2WgqgypzVLcY3jkKCEHL/EZgTLE9CnJQL/FiQ+2wen6lk4sO+zTYYnbye/aLzZVxZdoN3YZl45KFr5xNVkyuzbGh2lxPTl2bMvb1KrZfVMcS26+7ol/lRRb00m5SkYZCCYTNaB7OskRf67UszXu/YsB3o+ha48lWLopnhaEXjc/cyx+Z4B8jNaEjSpvntMfdEDauij2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp42gng6t3LcvZRUfb5EbK6pQb1KcbJiQ3iNByyLIsY=;
 b=lyAgpOekhy+PfWbRPWB1LmjdGcMMPPmBzhVZKaVfWmkcliLOaPsQwuIj2sijoAUzWeNTF6IxXfcF560SuS3u7DkZti5JVmHuKKHjoXeq1ftraXj2CiXsMwz/4rknuMmWvHLuE0HDBLxzujQyj1q68QOifRBK7kdE2r1NosBx9tm1o47OlW6sBsWYE8p70IagHbNnn0eLDyXDIgxOvfT2qjZDfY0C3gplX9OM+GUPqb94M825C5wyJqwlTIp8tGYDSTmmL/aofbEFdHznUfTF8upVE0c1yn+FIhx52JirS1DQ7IX7lgVDQcCyxO96kNJ3uuybQcN3qNijfS7Uvz/bMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR1201CA0015.namprd12.prod.outlook.com
 (2603:10b6:301:4a::25) by CH2PR12MB3925.namprd12.prod.outlook.com
 (2603:10b6:610:2d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Tue, 16 Jul
 2019 08:51:13 +0000
Received: from BY2NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by MWHPR1201CA0015.outlook.office365.com
 (2603:10b6:301:4a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Tue, 16 Jul 2019 08:51:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT027.mail.protection.outlook.com (10.152.84.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 16 Jul 2019 08:51:12 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 16 Jul 2019
 03:51:09 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: update vega20 driver if to fit latest
 SMU firmware
Date: Tue, 16 Jul 2019 16:50:49 +0800
Message-ID: <20190716085049.4613-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190716085049.4613-1-evan.quan@amd.com>
References: <20190716085049.4613-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(2980300002)(428003)(199004)(189003)(47776003)(2351001)(8676002)(476003)(126002)(11346002)(2616005)(6916009)(446003)(486006)(53416004)(2906002)(2870700001)(44832011)(426003)(7696005)(51416003)(76176011)(336012)(36756003)(14444005)(26005)(186003)(356004)(6666004)(50226002)(48376002)(50466002)(54906003)(316002)(68736007)(81156014)(5660300002)(81166006)(53936002)(478600001)(86362001)(8936002)(70206006)(4326008)(70586007)(305945005)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3925; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e4c878f-24ee-492e-dbbb-08d709cac112
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CH2PR12MB3925; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3925:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3925436BC1FBA7BF1AF639A8E4CE0@CH2PR12MB3925.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0100732B76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Q7UL4h/6UV22zt4xUaNXCrPSed8V0m6qo57dmSnMS7V/o2zP3Lhmb2FLdciClbMpZzhQwb36JWAYQ1YUXnkR3RyXZlPukx5L02iutASfDQTL3gphdwqheoeXZe4FF9Z/O7y9XTUzKnrxPH/jNJABzXBCrS4zrVS46xSA5NTmh3M2yuJPq2iU3b66gT/+ZuDvSO0JrY7gvzu/GmgJvr807q4DrFGBPn4EORRY7WhRbIuFeDz2DSeNRAAu00MgFRROLfG+thapNzhf2PK66DNMmUqVqqBzCdmp6GyZfmAcHy7bHik6zUpAlx6T9lQOWKsqA8nTWPiodRFrnLhs2EInoMJ2BP4/cDTqsHsZYAo+IZuRuFKarsNITthoxkabtMQ9rL/ajht9uJiwECaJqxmXak7XDKsNFf/+gcwABZiV1DU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2019 08:51:12.1895 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4c878f-24ee-492e-dbbb-08d709cac112
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3925
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp42gng6t3LcvZRUfb5EbK6pQb1KcbJiQ3iNByyLIsY=;
 b=2BNUxNQm+r6H51V7SQ9Dpy8ELrMA3mxBZvjCXWha2HHJDYjxx15a+S6URci9UWIt8aTnYeGGH7L9nlfbN6NFjdol8nRP8QQdZj1lpyDnoyezH4ygjJnFmNJOlOQfisWmqAv/J+vT5Y555FvsJ2qWZFd/fUS6krAmTP0gcuJzQ2Q=
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

T3B0aW1pemF0aW9uIGZvciB0aGUgc29ja2V0IHBvd2VyIGNhbGN1bGF0aW9uIGlzIGludHJvZHVj
ZWQuCgpDaGFuZ2UtSWQ6IEljYzhhNjg3MzU3YmE0NmFlMWQxOTlkODljYjIwMDBjNjFiNGRlNzAz
ClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZi5oIHwgNiArKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZi5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZi5oCmlu
ZGV4IDE5NWM0YWU2NzA1OC4uNzU1ZDUxZjljNmE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZi5oCkBAIC0yNyw3ICsyNyw3IEBA
CiAvLyAqKiogSU1QT1JUQU5UICoqKgogLy8gU01VIFRFQU06IEFsd2F5cyBpbmNyZW1lbnQgdGhl
IGludGVyZmFjZSB2ZXJzaW9uIGlmCiAvLyBhbnkgc3RydWN0dXJlIGlzIGNoYW5nZWQgaW4gdGhp
cyBmaWxlCi0jZGVmaW5lIFNNVTExX0RSSVZFUl9JRl9WRVJTSU9OIDB4MTIKKyNkZWZpbmUgU01V
MTFfRFJJVkVSX0lGX1ZFUlNJT04gMHgxMwogCiAjZGVmaW5lIFBQVEFCTEVfVjIwX1NNVV9WRVJT
SU9OIDMKIApAQCAtNjE1LDYgKzYxNSw3IEBAIHR5cGVkZWYgc3RydWN0IHsKICAgdWludDE2X3Qg
ICAgIFVjbGtBdmVyYWdlTHBmVGF1OwogICB1aW50MTZfdCAgICAgR2Z4QWN0aXZpdHlMcGZUYXU7
CiAgIHVpbnQxNl90ICAgICBVY2xrQWN0aXZpdHlMcGZUYXU7CisgIHVpbnQxNl90ICAgICBTb2Nr
ZXRQb3dlckxwZlRhdTsKIAogCiAgIHVpbnQzMl90ICAgICBNbUh1YlBhZGRpbmdbOF07CkBAIC02
NjUsNyArNjY2LDggQEAgdHlwZWRlZiBzdHJ1Y3QgewogICB1aW50MzJfdCBUaHJvdHRsZXJTdGF0
dXMgICAgICAgOwogCiAgIHVpbnQ4X3QgIExpbmtEcG1MZXZlbDsKLSAgdWludDhfdCAgUGFkZGlu
Z1szXTsKKyAgdWludDE2X3QgQXZlcmFnZVNvY2tldFBvd2VyOworICB1aW50OF90ICBQYWRkaW5n
OwogCiAKICAgdWludDMyX3QgICAgIE1tSHViUGFkZGluZ1s3XTsKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
