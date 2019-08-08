Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7C885F6E
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 12:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F2C6E80A;
	Thu,  8 Aug 2019 10:22:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CE86E80A
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 10:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHOJkWRo8z7dIpW/yxZKtnO/w+YwTZm8NZfOdlOcrbaIO2rHAcD6dlPy3Rvc10cbeyg77kzj2rKu6+O+ky8sCbKLpA2qVmeU4tckujz8Y6lfQXeOkL5WXjXKIqTAyzEiV7JyExb5nqqcTDixVq5Nn/TADohoWjI0eR/g+f0+DyR/VRdm0fj/IepG3pDivt0j+KVX2Loc+yC2P8ikA6jfDC91gyGPFeMwoYCcdvsbfyRK0nX7esDyvxjmwzZlqFXlqh4HWApQmuKTPpYHqh0spSS8J61IlIfZoX0pfU4jfB1iR6iJx9oqxdBWpf2ZRCKeXSScPLY9soh3qtJvvkbR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZo/cdoKYkqE1ruS6RrM43SA5aL1QlR7aLhAEsWXPl0=;
 b=IwUTE1Dkx/WPsy6wbxdgX2Z49aTkax8zRY+2yt2tqKLYkRboDWWTrxikHDm22pUGFC/Dz7oICpRbnzqxMlIzeNsHECPB5CP6pCacMrlcLzAvoVKsU5AlbWkgcAfD4csYQ+x24YzOAEgv5hUaE4FEnqlcngFNQ4QmBJUmMPW/qowRSu2Le/aVk5goBgDKtVuWxXMqm2o4NGvFaDgIZvdPYlsTXrEe2/QfD4qGuSz5ngTUfydsK+gVFc+hMhp2gz1XtKlOLf4XnX8wyEDNzp1t9I7ffopok3EBXV9Kfj6xYIErtAUVrfQEtBkNOpMA7wtrdHyqNEHb2eL1FrvEbSFfXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 SN6PR12MB2719.namprd12.prod.outlook.com (2603:10b6:805:70::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 8 Aug 2019 10:22:03 +0000
Received: from CO1NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16 via Frontend
 Transport; Thu, 8 Aug 2019 10:22:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT016.mail.protection.outlook.com (10.152.80.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 10:22:03 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 05:22:02 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/9] drm/amdgpu: add hdp clock gating for Arcturus
Date: Thu, 8 Aug 2019 18:21:50 +0800
Message-ID: <1565259714-30357-3-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565259714-30357-1-git-send-email-le.ma@amd.com>
References: <1565259714-30357-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(428003)(199004)(189003)(49486002)(86362001)(76176011)(316002)(336012)(51416003)(186003)(446003)(16586007)(81166006)(44832011)(8936002)(50226002)(81156014)(11346002)(486006)(426003)(70206006)(70586007)(14444005)(2906002)(26005)(6916009)(50466002)(48376002)(478600001)(5660300002)(2351001)(126002)(305945005)(4326008)(2616005)(6666004)(356004)(476003)(53936002)(36756003)(47776003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2719; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d113e43-bc63-4cff-5351-08d71bea41ab
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN6PR12MB2719; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2719:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2719807C674E733A99FD35ECF6D70@SN6PR12MB2719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ybNM08Nd8dyXWpWoLRO3TLHv1sk/YrInYWekRcVjQ+uHqAkFX9UBGw/So5kfr8Faukq6thCl4VNhRWTjmYo92byhZAgPSQei5b8A8cOpCFO555hBhQT/7OKVb7zT+VPA2ux94AGAWCc9IGa2ssVYT0e5FrX1cVFFA1r/4BnVcVY96AFzkIffqp4aiRORaEZkhnR/w1UIoUnym9DKvaXxVDKGYJ63dbvSEoDfjnlUwc7rs4vjfMtSdDp8zOi1uzkub/NOusYnl04OuWfgiBTeLXmz6eAOHZa8NSLlNJA/+LOrR7Xt8XEfeYA6UxKH9ptYJqh9QVPT7qsnbNWykloyaPZUyB+C5TBvXuUpqsMWpVW3isH+YpmS8zsnUQRxpW35MLjyoEIksLbdjbiyBa7SKNgkpQ/J8P3eIzbjM4q4hDg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 10:22:03.2197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d113e43-bc63-4cff-5351-08d71bea41ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2719
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZo/cdoKYkqE1ruS6RrM43SA5aL1QlR7aLhAEsWXPl0=;
 b=OaCDgUCEqdRejPMjWwCzHgc/BzRvFn0x2oEnNE45BCo7Np0+9d3HscvZG6+7IQNN5mHv8Mtpt1s2D3RA1pwSChpCcagu6nWLH6yAjZDArQRd+yYfbAsnuXKgQkufSZcPomFzBiLBsikyAOqtbqOtkE1oZc4xIOx27dTjHsMXNo0=
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

QWRkIGhkcCBDR0xTIGZvciBBcmN0dXJ1cyBpbiBzZXQgY29tbW9uIGNsb2NrZ2F0aW5nIGZ1bmN0
aW9uCgpDaGFuZ2UtSWQ6IEk0NGUzOTJmYTVmNzY1MzkwOGIzNmIwOTAyZTcyMWQ1NmVlZDNlYjky
ClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwppbmRl
eCAwMDc1OGJlLi40ZmJhY2EzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTEx
NTcsNyArMTE1Nyw4IEBAIHN0YXRpYyB2b2lkIHNvYzE1X3VwZGF0ZV9oZHBfbGlnaHRfc2xlZXAo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgZW5hYmxlCiB7CiAJdWludDMyX3QgZGVm
LCBkYXRhOwogCi0JaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1ZFR0EyMCkgeworCWlmIChh
ZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjAgfHwKKwkJYWRldi0+YXNpY190eXBlID09IENI
SVBfQVJDVFVSVVMpIHsKIAkJZGVmID0gZGF0YSA9IFJSRUczMihTT0MxNV9SRUdfT0ZGU0VUKEhE
UCwgMCwgbW1IRFBfTUVNX1BPV0VSX0NUUkwpKTsKIAogCQlpZiAoZW5hYmxlICYmIChhZGV2LT5j
Z19mbGFncyAmIEFNRF9DR19TVVBQT1JUX0hEUF9MUykpCkBAIC0xMjg5LDYgKzEyOTAsMTAgQEAg
c3RhdGljIGludCBzb2MxNV9jb21tb25fc2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKHZvaWQgKmhhbmRs
ZSwKIAkJc29jMTVfdXBkYXRlX3JvbV9tZWRpdW1fZ3JhaW5fY2xvY2tfZ2F0aW5nKGFkZXYsCiAJ
CQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDogZmFsc2UpOwogCQlicmVhazsK
KwljYXNlIENISVBfQVJDVFVSVVM6CisJCXNvYzE1X3VwZGF0ZV9oZHBfbGlnaHRfc2xlZXAoYWRl
diwKKwkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUgOiBmYWxzZSk7CisJCWJy
ZWFrOwogCWRlZmF1bHQ6CiAJCWJyZWFrOwogCX0KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
