Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70901D455C
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 18:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117D96EC5D;
	Fri, 11 Oct 2019 16:26:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800042.outbound.protection.outlook.com [40.107.80.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042C36EC5D
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 16:26:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hiq4gZBbmfK3n/ZDAFAah9upQdPgmPL71lEGJiqoA+jsau9N/l7dkhX7/9gkCmoUy3tGgnqiPudc/16VadeX3Jl1eqhkUTWojXJuBL6X30uysdkYLM9M3hpNC7HFmNU7f4817NhbBQeNHuA1MhmF6MVvMXHMdsFrAyHHigfrS9bnpXlkU1/lK5zf3VIGRPzAw69MD79xvO2fgwBzJUzcozfVhDFwEawswVV67VIwJpuJPUjtZ3qrJWMoIVMFrQKCN5aEDamyi3F3Gs4IZmNbj7QO+r3VNEV0ZQT7hD08DN06UaG97AcW+bgU3y7cjhoFBlUT8cgyps1dtW3oO3BpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40j6hMI1rVEgz55Ji5y7D0HtF3CvyZm1/zBeTduFhgM=;
 b=PJqKjbwJWNo69kVlpygNaTmZUtsy463+q7N8tVKVBqNdOL2511Y8vEj/xIsShvT2PwgPDKw+zAyupHFdBe3J52dKUZry0QA6AuMFKeuPiBwfvUAke8OK+Oq+eksG6FsApr8w3UaP9nJ1YEzR4cQ4v+biGieeqbYViGNRgnSdHGbUtlf2dmg9LX3UZt+gKMkOLjPPO+eMMZ6AZ+n1q0tTbbeaDKTGlXzkHR6ZjQW0XI2jHZCyuCaxhbjPNRAkykjUzObOHqkuSDur3ybIjISywo3RFynCDAFoq6GvtxVWb+CI0IL/TlcsP3Z1CTl34jkNSkb+EyhKW5PFy8pWOKDOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0036.namprd12.prod.outlook.com (2603:10b6:903:129::22)
 by BN6PR12MB1377.namprd12.prod.outlook.com (2603:10b6:404:1c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 16:26:21 +0000
Received: from CO1NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by CY4PR12CA0036.outlook.office365.com
 (2603:10b6:903:129::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 16:26:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT021.mail.protection.outlook.com (10.152.80.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 16:26:20 +0000
Received: from kazvm.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 11:26:19 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Free gamma after calculating legacy transfer
 function
Date: Fri, 11 Oct 2019 12:26:10 -0400
Message-ID: <20191011162610.1112-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(428003)(199004)(189003)(44832011)(7696005)(51416003)(476003)(316002)(486006)(6666004)(356004)(2351001)(305945005)(50226002)(426003)(126002)(47776003)(478600001)(336012)(54906003)(186003)(26005)(2616005)(70206006)(4744005)(70586007)(53416004)(6916009)(5660300002)(86362001)(1076003)(48376002)(50466002)(4326008)(81166006)(81156014)(8676002)(8936002)(2870700001)(2906002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1377; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fdc52ed-d438-413d-82d5-08d74e67bffa
X-MS-TrafficTypeDiagnostic: BN6PR12MB1377:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1377DD18B3A12F7CC5030345EC970@BN6PR12MB1377.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JyYAslTl1JTttwm9fpL0HLoQiYd0CQecNmtG1WmYIfL3/6luMePfJUsF8KAiVUtew2/xgSrRs+5poHZ/InVEHRCcw4kJu/IDHbvbGPezW+2zlwkUDjYvQOKHa0G4i7kwwVccW9P7ghnxAbgbjOSIe0Uw0CeeRivBa7adegANu8euXUIYp+2BhfVVjlw1Eod6zN3YSNR7w0d4mgzFH9x/trkzi+cIAXLBUS0Q/l7s9xO25vt7kzKHaKL04eWE8TBMW/9nKpWc4Udk2Dl+WgoGpg37MpRHn5Qr7rn5VlvvCNEThBIFWAM/yQWxvHDRSAn14PESmPDqlY9p2DOhMD8Cjrt3malC21cifJXzJQB3erlZEIqGgitABjpqiYBrL8do1IBmkD4UAY/qv4uW+P7plq9N8PvsWKtHergp0wmJ3Mg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 16:26:20.3746 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdc52ed-d438-413d-82d5-08d74e67bffa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1377
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40j6hMI1rVEgz55Ji5y7D0HtF3CvyZm1/zBeTduFhgM=;
 b=XGy9uM7FJoYNTsQYPlytmYYdeBLGfqKsl1cvktCLZw5ftxUcKL+F8yx2kK1dwultNDqnmFGRFt3Ck7E7MxkgjN5+lsNx+4OPU/9loUlwntlyD6ECRgKnnaHGI0QJW9GbHDJXy5Mlzkv6qxsKbm5BGDqduBf5eOr/+Coqu7dg+kw=
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
Cc: Bhawanpreet
 Lakha <Bhawanpreet.Lakha@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2UncmUgbGVha2luZyBtZW1vcnkgYnkgbm90IGZyZWVpbmcgdGhlIGdhbW1hIHVzZWQg
dG8gY2FsY3VsYXRlIHRoZQp0cmFuc2ZlciBmdW5jdGlvbiBmb3IgbGVnYWN5IGdhbW1hLgoKW0hv
d10KUmVsZWFzZSB0aGUgZ2FtbWEgYWZ0ZXIgd2UncmUgZG9uZSB3aXRoIGl0LgoKQ2M6IFBoaWxp
cCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5Lndl
bnRsYW5kQGFtZC5jb20+CkNjOiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFA
YW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBO
aWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fY29sb3IuYyB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jb2xvci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fY29sb3IuYwppbmRleCBi
NDNiYjdmOTBlNGUuLjIyMzNkMjkzYTcwNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fY29sb3IuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jb2xvci5jCkBAIC0yMTAsNiArMjEw
LDggQEAgc3RhdGljIGludCBfX3NldF9sZWdhY3lfdGYoc3RydWN0IGRjX3RyYW5zZmVyX2Z1bmMg
KmZ1bmMsCiAJcmVzID0gbW9kX2NvbG9yX2NhbGN1bGF0ZV9yZWdhbW1hX3BhcmFtcyhmdW5jLCBn
YW1tYSwgdHJ1ZSwgaGFzX3JvbSwKIAkJCQkJCSBOVUxMKTsKIAorCWRjX2dhbW1hX3JlbGVhc2Uo
JmdhbW1hKTsKKwogCXJldHVybiByZXMgPyAwIDogLUVOT01FTTsKIH0KIAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
