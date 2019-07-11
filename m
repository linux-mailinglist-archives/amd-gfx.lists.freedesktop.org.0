Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F0C6529D
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 09:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6806E150;
	Thu, 11 Jul 2019 07:45:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710068.outbound.protection.outlook.com [40.107.71.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA426E150
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 07:45:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=da5YILeS4A4VDAuo1hBFLpRu44PgwinH5Jtttv0GiMpHLrgMF0d1u+4cQ2fzvkdbVAiWrkvpg3itpjFJBvg0y6bIWgOLvw3ZaJSDSyjrfkLEM68T8j6M7Mpqp4Wy8iwHEOgKQFRR2FzffRVUruGTpxS8Wz4kevZYAepNBJrB+fV6rV3oRdXM2hsgK1ODd9G5azG94vfMiPlNIInSfDQZIUpkgp+N/VLfYJTDVTmz/Pe7bd8o4WPVGNH9KrBF02q3h+DAxyRGoeRS9Ez1NmMAzAKzl1+tIyc5p9CynYzTXWbw/agvkw+JT6r1/++p7TXnPwm6Hmdt6/o4oqrEUOVz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V58LAbK3gDACSJnY3AWcZdbJru9u0pjS6A34ezgo34=;
 b=ZhTHF9NzMmtE8yHE2+K1PO3E4ZYQkbx5bKL6VtKJqtfC6aGIO6sIsgIrOKenfj4NYbTzSQNUr7CM3C0j+pOoh0M7w6iewj52HNxAGv7dAQ4mpogPnj/+X+EV6WjfV0CsyxtJDIPXW/+P/vv/FNcwkAZJ0Q1QAznbaQ9ngPp4H7hiNKrFaqp0hDZFVeqYEbc50et9p0OzINeoZKwohVirMrz7hMW//LdoRGvjwMF0lI/whopz1kF7/k3/V4o0QAfpzUffsw5bVTT/EuZepjPXRgBdeLuZsYNJRhXNVvXhOvogxBlytoeJ2ZwXpdFpu+kOJvzAmF3h/kUgpKq/JZBRug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR1201CA0001.namprd12.prod.outlook.com
 (2603:10b6:301:4a::11) by CY4PR12MB1848.namprd12.prod.outlook.com
 (2603:10b6:903:11d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Thu, 11 Jul
 2019 07:45:06 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by MWHPR1201CA0001.outlook.office365.com
 (2603:10b6:301:4a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Thu, 11 Jul 2019 07:45:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 11 Jul 2019 07:45:06 +0000
Received: from lnx-kenneth.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 11 Jul 2019
 02:45:05 -0500
From: Kenneth Feng <kenneth.feng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: bug fix for sysfs
Date: Thu, 11 Jul 2019 15:45:00 +0800
Message-ID: <1562831100-4555-1-git-send-email-kenneth.feng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(4326008)(26005)(51416003)(7696005)(305945005)(186003)(16586007)(53936002)(8936002)(50226002)(316002)(6666004)(44832011)(426003)(81156014)(68736007)(81166006)(356004)(86362001)(336012)(478600001)(486006)(2351001)(36756003)(70206006)(70586007)(6916009)(126002)(48376002)(53416004)(50466002)(476003)(2906002)(5660300002)(4744005)(47776003)(2616005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1848; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0ba2d2a-bc5a-453e-fa05-08d705d3b129
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1848; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1848:
X-Microsoft-Antispam-PRVS: <CY4PR12MB184839AF8B6FF6437D6792738EF30@CY4PR12MB1848.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-Forefront-PRVS: 0095BCF226
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: PGY9EykoeepfrMjZJ7+3Dzjx7cyoKVf1d/FOqoTD1cTgLqLbRdGWp9uY1dR8jnZCTDNt9+r363gWsJHnlGGg/AZUTWTpUpur886px3sqUcyUKDaqZ90u2E02gjjdJmlf6dLOC6kdw+ZAN2qC14MYNVnkZsuWTUYC8g1erKjHGExLbx2EoyP9TWd7IZluBRRZesHftIYkIKUtfmPAKq9UAOnp0EksL7jsXr5MVfLUmBIOZpF0rkEogoqeOC5DLKgx+BrcQyBFilI4eckByLbW878qYbzAnMoA7Wntd2uCIiFqKSEdSkjT0l9VmLLCzHOJ3ocFDz574NIRthqDYKZHE5q631YXHj/I/tXGgf1Q4wao2gDBArzNUj+4EWBhQRe3qnnI6eEcFzz7nmo8IalFu6rX4HhLgKr7//PoWL/yWbo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2019 07:45:06.3209 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ba2d2a-bc5a-453e-fa05-08d705d3b129
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1848
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V58LAbK3gDACSJnY3AWcZdbJru9u0pjS6A34ezgo34=;
 b=ez0LacvAU5+tTyUMc3R3zmCo9joOax73Yc6T3Ps/K2eP1LNVMAonmiEvGKSnDDaUqC1Wg6VZv7FbdmzEwIQNaQwS9ibDWgy8Tuk4YVn6qK+8xY8bMhsSst4otFF2yQVAAPVm09cYXiTDnipu8nmjgJAeStcDiLOVCEevupAuhk0=
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
Cc: Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

d2hlbiB3ZSBzZXQgcHJvZmlsZV9wZWFrIHRvIHN5c2ZzOnBvd2VyX2RwbV9mb3JjZV9wZXJmb3Jt
YW5jZV9sZXZlbCwKd2UgZ2V0cyB0aGUgd3Jvbmcgc29jY2xrIGxldmVsIGFuZCBtY2xrIGxldmVs
LnRoaXMgcGF0Y2ggZml4IHRoaXMgaXNzdWUuCgpTaWduZWQtb2ZmLWJ5OiBLZW5uZXRoIEZlbmcg
PGtlbm5ldGguZmVuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0
LmMKaW5kZXggNWVlNjUwOC4uY2QzMmIyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYwpAQCAtMTE1NywxNCArMTE1NywxNCBAQCBzdGF0aWMgaW50IG5hdmkx
MF9nZXRfcHJvZmlsaW5nX2Nsa19tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJcmV0
ID0gc211X2dldF9kcG1fbGV2ZWxfY291bnQoc211LCBTTVVfTUNMSywgJmxldmVsX2NvdW50KTsK
IAkJCWlmIChyZXQpCiAJCQkJcmV0dXJuIHJldDsKLQkJCSpzY2xrX21hc2sgPSBsZXZlbF9jb3Vu
dCAtIDE7CisJCQkqbWNsa19tYXNrID0gbGV2ZWxfY291bnQgLSAxOwogCQl9CiAKIAkJaWYoc29j
X21hc2spIHsKIAkJCXJldCA9IHNtdV9nZXRfZHBtX2xldmVsX2NvdW50KHNtdSwgU01VX1NPQ0NM
SywgJmxldmVsX2NvdW50KTsKIAkJCWlmIChyZXQpCiAJCQkJcmV0dXJuIHJldDsKLQkJCSpzY2xr
X21hc2sgPSBsZXZlbF9jb3VudCAtIDE7CisJCQkqc29jX21hc2sgPSBsZXZlbF9jb3VudCAtIDE7
CiAJCX0KIAl9CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
