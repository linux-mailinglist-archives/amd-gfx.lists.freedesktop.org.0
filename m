Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2F685F6F
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 12:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5116E80E;
	Thu,  8 Aug 2019 10:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710043.outbound.protection.outlook.com [40.107.71.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149046E80E
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 10:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDjsUrv94rtgYR+WX+85knUIqZoDmCjd5pPiRAqA2NOp5u+5lfedIUf5Jf8w4bt8hzb0lIPQ+gQUhxeeTq/Kum72FNaGls2Gn/wlfoXDl4ktFmSinbpeYW+kTq/JAGthLqd7e3OjzKd4SYg/X2uxpUCinTRi2vJx7sUcwLrAPcs70q0d1+XiZqb/ibBQqLUz2s+EWFmxdvfv3iiznSn//l0GBC+k65o3ARaTbXL+wdetEQgapzm/cu9JIQgo7xirgPl/k9/g9uvdByk2rT8IpAdhXONWuO5vOgrFQpjxsygGnRBAQ/8WWJK5gKgHrxfXaP7aq2VNAo+WhlCiVqrgwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+OxBo866wkUeh2muxIbk2XRUEtaEoDuKxPWqdlC8tg=;
 b=GmHGJrDHjqApGQoPCV4/L2xtsWA4GUTTQge6XjubJCbKyGw2Ef114dZD/WdSo8vLlcZxQd5f5m7t+HFJC+m+RlMaRqmSsmBgwEKwWbb9Mxh/oyQwGbJVacHyyFbJ/lT7528ddDdtWYqAoIy1sLNKgNi8p3MSUwhU5S38nXWN2Y3+pyDWOCOZbxKQygm8v0/67Cm8MCiZsFNxQXH2p+PWxeWbl5ErdyFQcxJIhjKk14Z626gBVPBYIdEMjPx5xzDBr5sUymhW1jG6jvsECsQ5NdZ9r30L0d9Gd11ZKa7ZgYF0aBhR74clPEp9Aq3vI+v3vKjC0BmfPlCpEmgk6ALT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 MWHPR12MB1279.namprd12.prod.outlook.com (2603:10b6:300:d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Thu, 8 Aug 2019 10:22:06 +0000
Received: from CO1NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Thu, 8 Aug 2019 10:22:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT016.mail.protection.outlook.com (10.152.80.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 10:22:05 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 05:22:04 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/9] drm/amdgpu: enable hdp clock gating for Arcturus
Date: Thu, 8 Aug 2019 18:21:51 +0800
Message-ID: <1565259714-30357-4-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565259714-30357-1-git-send-email-le.ma@amd.com>
References: <1565259714-30357-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(428003)(199004)(189003)(81166006)(426003)(4744005)(86362001)(36756003)(186003)(70586007)(478600001)(49486002)(50226002)(51416003)(11346002)(446003)(6666004)(70206006)(356004)(2351001)(2616005)(8936002)(126002)(53936002)(316002)(2906002)(50466002)(4326008)(6916009)(8676002)(16586007)(305945005)(81156014)(76176011)(336012)(476003)(26005)(44832011)(47776003)(5660300002)(486006)(48376002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1279; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 091ad7a2-c726-4196-1658-08d71bea432a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1279; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB12797B72A1114D5B37FEC351F6D70@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: r+9PuHnhWNrXDUe9Pgr6otjN7JYthMyzfgsvcDVzi5bnHBJJiJiHYWh0aoJPETiInVVsYhwUYqLe//npeO3vhvdPvWoTmu42+L6BENbIe3I3YGNU4hqfOsbU1wgyU57SpT3Cn2//2gOdGucO2ZL412E1CoR2jjG+3HsiHbJ3sIwhXW8IIvr21TRInoxvcI9sEo1uqwZGirwY3jBH3nZgDQw5ZpQxhTfNkL8eKEmx0g7T3LPBGW5fuPJ/gaC9YqTX0UetiAdufmBzHhhf5/cV+V1ivsZ26SmCrohM11MNciLvmQVo1tsOzmH6l19IUbZgygMuY4f6I6Mluh4tD+A5Zvlt5vuwzLwkx3eMwXyqz84RSuKuXP83CaFrLtqBCr6r1If6qIEnKdpyt8Doq3wy/WQL94dfNVSCBJu5J8wECoc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 10:22:05.7351 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 091ad7a2-c726-4196-1658-08d71bea432a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+OxBo866wkUeh2muxIbk2XRUEtaEoDuKxPWqdlC8tg=;
 b=bcvfnz1PavuvA2BHXg72XrhoKMgulT74ltkrL7ZzyDX98ClTS6TJTrTb6is4X+w6Yke1Uqc70sFfoLqpvf7z5s9s9dQaPT2TUl6OATa7pKk8ldbTYN9w1Nu/7XDxyCfHi49GFGNJewtQ0Vb3Vd5Atf3KKrL+Kj1RPzebBF1JosA=
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

SW5pdCBoZHAgTUdDRy9MUyBmbGFnIGFzIFZlZ2EyMAoKQ2hhbmdlLUlkOiBJYTMzY2EwNjRmNzlh
YzQwOWM1M2QzYmViNmYwMWI2ZTgxNGE5MjA0MQpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgNCArKyst
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggNGZiYWNhMy4uNjAzOGRjZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jCkBAIC0xMDE3LDcgKzEwMTcsOSBAQCBzdGF0aWMgaW50IHNvYzE1
X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJCUFNRF9DR19TVVBQT1JUX0dGWF9N
R0xTIHwKIAkJCUFNRF9DR19TVVBQT1JUX0dGWF9DR0NHIHwKIAkJCUFNRF9DR19TVVBQT1JUX0dG
WF9DR0xTIHwKLQkJCUFNRF9DR19TVVBQT1JUX0dGWF9DUF9MUzsKKwkJCUFNRF9DR19TVVBQT1JU
X0dGWF9DUF9MUyB8CisJCQlBTURfQ0dfU1VQUE9SVF9IRFBfTUdDRyB8CisJCQlBTURfQ0dfU1VQ
UE9SVF9IRFBfTFM7CiAJCWFkZXYtPnBnX2ZsYWdzID0gMDsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2
X2lkID0gYWRldi0+cmV2X2lkICsgMHgzMjsKIAkJYnJlYWs7Ci0tIAoyLjcuNAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
