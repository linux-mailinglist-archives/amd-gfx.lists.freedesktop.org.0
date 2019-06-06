Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B5F374CB
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 15:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592AB89798;
	Thu,  6 Jun 2019 13:03:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820071.outbound.protection.outlook.com [40.107.82.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651AB89798
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 13:03:06 +0000 (UTC)
Received: from CY4PR1201CA0021.namprd12.prod.outlook.com
 (2603:10b6:910:16::31) by DM5PR1201MB0058.namprd12.prod.outlook.com
 (2603:10b6:4:50::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Thu, 6 Jun
 2019 13:03:04 +0000
Received: from DM3NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by CY4PR1201CA0021.outlook.office365.com
 (2603:10b6:910:16::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 13:03:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT028.mail.protection.outlook.com (10.152.82.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 13:03:04 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 08:03:03 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/display: Set default ABM level to module parameter
Date: Thu, 6 Jun 2019 09:02:13 -0400
Message-ID: <20190606130213.29249-2-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606130213.29249-1-nicholas.kazlauskas@amd.com>
References: <20190606130213.29249-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(396003)(376002)(136003)(2980300002)(428003)(199004)(189003)(1076003)(446003)(16586007)(44832011)(72206003)(6916009)(5660300002)(2616005)(4326008)(305945005)(8676002)(50466002)(47776003)(14444005)(426003)(11346002)(53936002)(77096007)(26005)(486006)(48376002)(2906002)(50226002)(336012)(51416003)(186003)(7696005)(70206006)(76176011)(70586007)(478600001)(316002)(476003)(81166006)(86362001)(81156014)(8936002)(6666004)(356004)(36756003)(53416004)(126002)(54906003)(2351001)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0058; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7087ce23-6d23-4860-f4bc-08d6ea7f500d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0058; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB00580F8F58F6343ACE7087B1EC170@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: O32oVbPDEDARSMAHgQoTk4AvunyMDRggl3C+Z2E6FW9HLnqG3TXT5Vsb/0Qi5DZUxd9jaYO7OxMYu/Tx8orAiSIMZ6L1YV9Q5mnXapQYkosF2DiLdJd6ol4g/730nFaShAz27+F8BEkaLYYeDsXvEbXloYLBMeRMJe0noCp3UMJPZoskhrPYdslMHJNNby6JyLGMydPGgO25Ba14P3B6cyeB8jlg+MPWJoHXkR/3/t2Gz1CpnJB6ztWccBrouoBD/o1IMKY8uUomQ+CEabCJr7rJzSvYs1me22AvWas1cCPLUX4BWKNZklmnjwpMbKQCuw1e2ZUOxNW9vbvt4n277a0q0f25NHuNx8bTqAvDFSJ8T/a4jMWxKX/PdUU0VZIHek82DDSGZ2h90i5DRwfXs5+6JzkO5HcYDYAEXorUDY0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 13:03:04.3160 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7087ce23-6d23-4860-f4bc-08d6ea7f500d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSRlFmoxKVSlkGGY/5C3D2xpLkARkh2cQZigvnkkwNA=;
 b=UFYTi1l8yRFFycvhlFIKP6DCJKfaAedmhuSYbcp6vxj32iH0v3aAdUOM6D6L7uY27sKD1z/BkdSeRaGBwebrS5etfQq5EblvAmE1u8G+exVr93uQ/7Tsbb9YfKmxjK67zmrytqQeDi0AYT92SeMNyIHPCkBMvdwoGSUo/6VDhyo=
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
Cc: David Francis <david.francis@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KVGhlIG1vZHVsZSBwYXJhbWV0ZXIgdG8gc3BlY2lmeSB0aGUgZGVmYXVsdCBBQk0gbGV2
ZWwgaXMgbm93IGRlZmluZWQsCnNvIGhvb2sgaXQgdXAgaW4gRE0uCgpbSG93XQpPbiBjb25uZWN0
b3IgcmVzZXQgc3BlY2lmeSB0aGUgZGVmYXVsdCBsZXZlbC4gREMgd2lsbCBwcm9ncmFtIHRoaXMg
YXMKcGFydCBvZiB0aGUgbW9kZXNldCBzaW5jZSBpdCBnZXRzIHBhc3NlZCBvbnRvIHRoZSBzdHJl
YW0gaW4KZG1fdXBkYXRlX2NydGNfc3RhdGUuCgpJdCdzIG9ubHkgc2V0IGZvciBlRFAgY29ubmVj
dG9ycywgYnV0IGl0IGRvZXNuJ3QgbWF0dGVyIGlmIHRoaXMgaXMKc3BlY2lmaWVkIGZvciBjb25u
ZWN0b3JzIG9yIGhhcmR3YXJlIHRoYXQgZG9lc24ndCBzdXBwb3J0IEFCTS4KCkl0J3MgREMncyBy
ZXNwb25zaWJpbGl0eSB0byBjaGVjayB0aGF0IEFCTSBjYW4gYmUgc2V0IG9yIGFkanVzdGVkLCBh
bmQKREMgZG9lcyBjaGVjayB0aGF0IHRoZSBETUNVIGZpcm13YXJlIGlzIHJ1bm5pbmcgYW5kIGlm
IHRoZXJlJ3MgYmFja2xpZ2h0CmNvbnRyb2wgYXZhaWxhYmxlLgoKQ2M6IEhhcnJ5IFdlbnRsYW5k
IDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogRGF2aWQgRnJhbmNpcyA8ZGF2aWQuZnJhbmNp
c0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5r
YXpsYXVza2FzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKaW5kZXggYTY5OGM4ZjI3MmVkLi5mMGMyMTZkNzhhMDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMzgyMSw2ICszODIx
LDkgQEAgdm9pZCBhbWRncHVfZG1fY29ubmVjdG9yX2Z1bmNzX3Jlc2V0KHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IpCiAJCXN0YXRlLT51bmRlcnNjYW5faGJvcmRlciA9IDA7CiAJCXN0
YXRlLT51bmRlcnNjYW5fdmJvcmRlciA9IDA7CiAKKwkJaWYgKGNvbm5lY3Rvci0+Y29ubmVjdG9y
X3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCkKKwkJCXN0YXRlLT5hYm1fbGV2ZWwgPSBh
bWRncHVfZG1fYWJtX2xldmVsOworCiAJCV9fZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jl
c2V0KGNvbm5lY3RvciwgJnN0YXRlLT5iYXNlKTsKIAl9CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
