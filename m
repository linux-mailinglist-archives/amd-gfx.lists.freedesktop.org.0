Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C519844D7
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 08:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A7C6E583;
	Wed,  7 Aug 2019 06:52:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780054.outbound.protection.outlook.com [40.107.78.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77CE6E583
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 06:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YS7CGpgsNaz4iUzC2j1GOx85ABUYDssu7YcCndGFAh45UUJCeCIjZB78myFGwrGAQ2UoRpCVM+4UPMhIOQ+O9PQOR2XYjW/1uXoKNquLFN1ZHxHeb+wP0vLtoX93squhNaO3HWD6GGk6v87vJhXaI7Me94Bl9ysC8a4TkQVtDmRa7i0t0fKEfKiw03Aecon4TYf70NPS8MUbDI/nMrJtHClNGxGhRHoln7WnsrVev3HoAJWTXYgWe6USp603FDVBWiRW2pfzlGo/mWvhmlP7DIasoCONMdsk31zRIOAyxK1Gb/fxeWaCJYVlez/LCaESdFiHpxqpXrFNE7S4sjgyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kKStlFa1/14x8OrZb+78I4kQhNP01GAVCvc7LLC3B0=;
 b=mzyM9xsydph28ydoSyHE0tbFSKJYdwkExESynicBblNAFt4zAfLgHv0qwbBHGcLVK843K8UXObBGm6YrQTw9HBLeKiTLh1gFMKW2v5rH/ecJ/iDnRHVXV+IPxn0lVfIWHUwXKETJZkpg3tfKbcYIhKnmaA/IPUlke8ygjGehDvoSc6o3/4EPoW+DxGAnd9/QChbepNgoIudNmBQTzrH9/2dua3CRV97dnpKNr8X9Ar0elmEifn06AwKce/FEo1mBHCDJY0tq/TN7hT6jW+HSs3+yQl8pQ4/RA1vJLjPMO7tTO4wnj1pBi4zIMc+pr2tdZZ+6jzzgP4PwhNJUykRcFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR12CA0040.namprd12.prod.outlook.com (2603:10b6:903:129::26)
 by BYAPR12MB2711.namprd12.prod.outlook.com (2603:10b6:a03:68::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.20; Wed, 7 Aug
 2019 06:52:20 +0000
Received: from DM3NAM03FT055.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by CY4PR12CA0040.outlook.office365.com
 (2603:10b6:903:129::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14 via Frontend
 Transport; Wed, 7 Aug 2019 06:52:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT055.mail.protection.outlook.com (10.152.83.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Wed, 7 Aug 2019 06:52:19 +0000
Received: from guchchen-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server (TLS) id
 14.3.389.1; Wed, 7 Aug 2019 01:52:18 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Dennis.Li@amd.com>, <Xinhui.Pan@amd.com>, <Tao.Zhou1@amd.com>
Subject: [PATCH v2 libdrm 0/3] add ras inject test for gfx and umc module
Date: Wed, 7 Aug 2019 14:51:59 +0800
Message-ID: <20190807065202.30023-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(2980300002)(428003)(199004)(189003)(126002)(476003)(2616005)(426003)(86362001)(4326008)(486006)(70206006)(305945005)(44832011)(2201001)(50466002)(356004)(47776003)(70586007)(6666004)(5660300002)(48376002)(4744005)(1076003)(53416004)(316002)(336012)(81156014)(53936002)(478600001)(7696005)(16586007)(50226002)(51416003)(8676002)(26005)(68736007)(8936002)(6636002)(36756003)(81166006)(186003)(110136005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2711; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a90b38a8-e035-4c24-ec3e-08d71b03caf3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BYAPR12MB2711; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2711:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2711961C707C87D88FFC5213F1D40@BYAPR12MB2711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 01221E3973
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rI/NYIc+ju9neMkwoUJXG801mb+If3yWm1A8ik5Pzs4Hzy7w38YvlsV2COR4w27lsh1oAH4G0dKG3s+4CHVhPoDKCmMoLjuCnW6ykUmbWCs+4qidkyPiLgNQconSfCaaCWjAKKrm/aKHJUrrZOM7l8dz3rcNotkLhXILmIqy6K0kfTlYn0Y/dmWcrgN25PPUoNvDnCOpsNAVCg3m5uB0YVyrbJZIM93OhITHmbJrVEDJzcxqMRlv0AdBM7N+tB1RJbL9at+XeQ2QRpPkVwwJkaxaCNw2wdqZfH2YOJUOuauHyFvJVpVju3PDbXLSezdBZxAvv8SMdNaOJkOT9lV0Ksq5rz5ejQZmnd/7qDzZ4NA45xf0EDeloRGCfZJI7HpzZCfv/s4D8EgvaA1n/OzXDwvUD71723ZQGIqA8iQJdUw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2019 06:52:19.8908 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a90b38a8-e035-4c24-ec3e-08d71b03caf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kKStlFa1/14x8OrZb+78I4kQhNP01GAVCvc7LLC3B0=;
 b=u6WtRYIGdWAhnIyOmXvo0aPhVQxam+aNoJpCYRJhvWCNCp78fm0pUpZNpDYzYatiFtsExxFYTZOzNHN2hWGH+bOoJS3jjHW6WUXxWjdxdvEfP8rM/h3L9UF5XJxS06YHpdBMwvxUlx3TUj0oPdHH5KKwkhmc6u5NJYpwtWszGI0=
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
Cc: Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlc2UgcGF0Y2hlcyBhcmUgdG8gc3VwcG9ydCByYXMgaW5qZWN0IHRlc3QgZm9yIGdmeCBhbmQg
dW1jIG1vZHVsZXMuCgpQYXRjaCB2MjoKQ29ycmVjdCAiZWplY3QiIGluIGFsbCBjb21taXRzIHRv
ICJpbmplY3QiLgpBZGQgbW9yZSBlcnJvciBjaGVja3MgYW5kIHByaW50IHdoZW4gcGFyc2luZyBj
b25maWd1cmF0aW9uIGZpbGUuCkFkZCB1bWMgbXVsdGlfdW5jb3JyZWN0YWJsZSB0ZXN0IGluIGRl
ZmF1bHQgY29uZmlndXJhdGlvbiBmaWxlLgoKR3VjaHVuIENoZW4gKDMpOgogIGFtZGdwdTogYWRk
IGdmeCByYXMgaW5qZWN0IGNvbmZpZ3VyYXRpb24gZmlsZQogIHRlc3RzL2FtZGdwdS9yYXM6IHJl
ZmluZSByYXMgaW5qZWN0IHRlc3QKICBhbWRncHU6IGFkZCB1bWMgcmFzIGluamVjdCB0ZXN0IGNv
bmZpZ3VyYXRpb24KCiBjb25maWd1cmUuYWMgICAgICAgICAgICAgfCAgMTggKysKIGRhdGEvYW1k
Z3B1X3Jhcy5qc29uICAgICB8IDI2NyArKysrKysrKysrKysrKysrKysrKwogbWVzb24uYnVpbGQg
ICAgICAgICAgICAgIHwgICAxICsKIHRlc3RzL2FtZGdwdS9NYWtlZmlsZS5hbSB8ICAgNSArLQog
dGVzdHMvYW1kZ3B1L21lc29uLmJ1aWxkIHwgIDE2ICstCiB0ZXN0cy9hbWRncHUvcmFzX3Rlc3Rz
LmMgfCA1MjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCiA2IGZpbGVz
IGNoYW5nZWQsIDc4MyBpbnNlcnRpb25zKCspLCA1MSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkYXRhL2FtZGdwdV9yYXMuanNvbgoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
