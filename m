Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C9D37F1A
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D07B895E7;
	Thu,  6 Jun 2019 20:55:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790071.outbound.protection.outlook.com [40.107.79.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA36A894FF
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:48 +0000 (UTC)
Received: from DM3PR12CA0055.namprd12.prod.outlook.com (2603:10b6:0:56::23) by
 BN7PR12MB2657.namprd12.prod.outlook.com (2603:10b6:408:29::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Thu, 6 Jun 2019 20:55:48 +0000
Received: from DM3NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by DM3PR12CA0055.outlook.office365.com
 (2603:10b6:0:56::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT010.mail.protection.outlook.com (10.152.82.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:47 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:13 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 24/24] drm/amd/display: set link->dongle_max_pix_clk to 0 on a
 disconnect
Date: Thu, 6 Jun 2019 16:55:01 -0400
Message-ID: <20190606205501.16505-25-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(346002)(396003)(136003)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(68736007)(2616005)(26005)(446003)(11346002)(426003)(86362001)(1076003)(76176011)(305945005)(8676002)(486006)(77096007)(336012)(51416003)(126002)(476003)(6916009)(47776003)(186003)(7696005)(70206006)(70586007)(5660300002)(4326008)(36756003)(81166006)(81156014)(53416004)(2906002)(8936002)(478600001)(50466002)(356004)(53936002)(48376002)(16586007)(6666004)(50226002)(316002)(2351001)(14444005)(72206003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2657; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f86bba39-77cb-4212-02dc-08d6eac15a13
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2657; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2657:
X-Microsoft-Antispam-PRVS: <BN7PR12MB265776544CE9D93A05AEB8A8F9170@BN7PR12MB2657.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LQ+G+3Glc991XbEDomYr9XoABCJd2eNkq/tAdktqlq81MbtV/FhdliYK23rvuWQfcskoDkXRyrP7Dn0XJAYPgR0JO4zJHFv4PmwW24QHt2B7zYS8UO0Cf3G9ZL2qF5WV2dgz0zGbchobnW1957i52R878jqBT3KNuilqbOEJCQ5keELj8nyPOM0idZRfkj3yQZAXcc3asEJHa23J5T01gZM7kMa92wGau0zbqpdq3+iybwyGFDA2CyrUp1D0uRwOM1XO2qYDmji6L8DbOZb7QizMeiJ7016EaVu9G44Afd1nPWj+dxAB/uZNFMdvTC6Pb4KPq27i+B77pokzk58YHvNutYaZOrK4Qif10u1dke530Iiu1RBUBdGQpMDJX6RDVfJc9jhNOSjlj/xSlOFkCv4yLaX1q2SirjdQEpWTj8Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:47.9186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f86bba39-77cb-4212-02dc-08d6eac15a13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2657
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSwto9mV/3Br4fBKbOmpbRIHjl/bk8pzVU7dRteUzZs=;
 b=ISEq1V2fHW9c5SzCpDMEr1TfsUrds0KcEbOA5epKjh8AW7ut4/DVZF2Ob3ECYp1IT6n8Eg//eRxT3toQgzFYWeDCv3rEm4YX1i+gTa1Q+5smujas4PFH7NZty3XUptHOkU1xG3pRJ6+bQ5qAdLbtsYSbjdbfkpEnEy4efbYS7mU=
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
Cc: Samson Tam <Samson.Tam@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2Ftc29uIFRhbSA8U2Ftc29uLlRhbUBhbWQuY29tPgoKW1doeV0KRm91bmQgaXNzdWUg
aW4gRURJRCBFbXVsYXRpb24gd2hlcmUgaWYgd2UgY29ubmVjdCBhIGRpc3BsYXkgdXNpbmcKIGEg
cGFzc2l2ZSBIRE1JLURQIGRvbmdsZSwgZGlzY29ubmVjdCBpdCBhbmQgdGhlbiB0cnkgdG8gZW11
bGF0ZQogYSBkaXNwbGF5IHVzaW5nIERQLCB3ZSBjb3VsZCBub3Qgc2VlIDRLIG1vZGVzLiAgVGhp
cyB3YXMgYmVjYXVzZQogb24gYSBkaXNjb25uZWN0LCBkb25nbGVfbWF4X3BpeF9jbGsgd2FzIHN0
aWxsIHNldCBzbyB3aGVuIHdlCiBlbXVsYXRlIHVzaW5nIERQLCBpbiBkY19saW5rX3ZhbGlkYXRl
X21vZGVfdGltaW5nKCksIGl0IHdvdWxkCiB0aGluayB3ZSB3ZXJlIHN0aWxsIHVzaW5nIGEgZG9u
Z2xlIGFuZCBsaW1pdCB0aGUgbW9kZXMgd2Ugc3VwcG9ydC4KCltIb3ddCkluIGRjX2xpbmtfZGV0
ZWN0KCksIHNldCBkb25nbGVfbWF4X3BpeF9jbGsgdG8gMCB3aGVuIHdlIGRldGVjdAogYSBob3Rw
bHVnIG91dCAoIGlmIG5ld19jb25uZWN0aW9uX3R5cGUgPSBkY19jb25uZWN0aW9uX25vbmUgKS4K
ClNpZ25lZC1vZmYtYnk6IFNhbXNvbiBUYW0gPFNhbXNvbi5UYW1AYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hh
IDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX2xpbmsuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlu
ay5jCmluZGV4IDEwODA3ZmE0NmFkNi4uMjAyZTA5MmY4ZWNmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCkBAIC05ODQsNiArOTg0LDEyIEBAIGJv
b2wgZGNfbGlua19kZXRlY3Qoc3RydWN0IGRjX2xpbmsgKmxpbmssIGVudW0gZGNfZGV0ZWN0X3Jl
YXNvbiByZWFzb24pCiAKIAkJbGluay0+dHlwZSA9IGRjX2Nvbm5lY3Rpb25fbm9uZTsKIAkJc2lu
a19jYXBzLnNpZ25hbCA9IFNJR05BTF9UWVBFX05PTkU7CisJCS8qIFdoZW4gd2UgdW5wbHVnIGEg
cGFzc2l2ZSBEUC1IRE1JIGRvbmdsZSBjb25uZWN0aW9uLCBkb25nbGVfbWF4X3BpeF9jbGsKKwkJ
ICogIGlzIG5vdCBjbGVhcmVkLiBJZiB3ZSBlbXVsYXRlIGEgRFAgc2lnbmFsIG9uIHRoaXMgY29u
bmVjdGlvbiwgaXQgdGhpbmtzCisJCSAqICB0aGUgZG9uZ2xlIGlzIHN0aWxsIHRoZXJlIGFuZCBs
aW1pdHMgdGhlIG51bWJlciBvZiBtb2RlcyB3ZSBjYW4gZW11bGF0ZS4KKwkJICogIENsZWFyIGRv
bmdsZV9tYXhfcGl4X2NsayBvbiBkaXNjb25uZWN0IHRvIGZpeCB0aGlzCisJCSAqLworCQlsaW5r
LT5kb25nbGVfbWF4X3BpeF9jbGsgPSAwOwogCX0KIAogCUxJTktfSU5GTygibGluaz0lZCwgZGNf
c2lua19pbj0lcCBpcyBub3cgJXMgcHJldl9zaW5rPSVwIGRwY2Qgc2FtZT0lZCBlZGlkIHNhbWU9
JWRcbiIsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
