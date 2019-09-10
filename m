Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAA5AF1A5
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8586E988;
	Tue, 10 Sep 2019 19:06:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750072.outbound.protection.outlook.com [40.107.75.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9126E985
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:06:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnz4MgeM6fsHRqY2UdNQGMCHGYae0rWEdU/04Cb6MYIdu2kPKsofSvPO+qUFbKCwAbevrC9v9MimBhTEABi5D2LgLaEvkQ06oI4eOXFG6320MvP0DBp7KL98bZXbNijqSJvUJ/gaCQksWKkoPH30oYSJP9qRHpuQwykKdnEhwhCQbXIWvghjuas9ZG62sZyZx7gydfot3//GILiZgcTKPHwYgrEYhk7jW5epocDqKRq2cCBHR81WcjKgvuAYOkZ9erwlDY5wpK+OvbZ6Dg2cQr7jMl6PMKp2VvfntKVpmTl6/CfoIep2KR/KdjsKXGWmV3tCpjldGShnRoOaNQ8sqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNG1MvHuhhcLw0Ayy9Tx8cPO3RWbjPDY5/2vIhFrEiA=;
 b=dRt1dYAn6hg33Y00X7b9zdKPYJM0weCKbT42txx9vPUg+fUxud2/UcrVo1Y2YZjmhPoFJS1ANPIMdo1Re0asn3VxOChODfCig+PAZAtfXlu6E+l0T00Cj0IdVkqLgCXMSZnNZwtgG4VcqG1pP+D9ovgaqi78V27AVxKH3KI9tGkITNP96r9M9Y5RKhPXPP1LzOft/BXKZAUUrZ9hn3ciBXZjg/dWOCTMeCcVsHh3XbzUi8pq7wDhA8s/Wb82JNSwcn0rMlyxDYgUkzfNB18D3NGfP802eDK8Z2+c0yK8PItvDS+pdMFOPmQu1NidqK3A+6ReyVr7pS3XeVtVMwMZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0011.namprd12.prod.outlook.com
 (2603:10b6:301:4a::21) by BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13; Tue, 10 Sep
 2019 19:06:25 +0000
Received: from DM3NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by MWHPR1201CA0011.outlook.office365.com
 (2603:10b6:301:4a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.13 via Frontend
 Transport; Tue, 10 Sep 2019 19:06:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT020.mail.protection.outlook.com (10.152.82.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:06:24 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:06:19 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/20] drm/amd/display: Create dpcd and i2c packing functions
Date: Tue, 10 Sep 2019 15:05:48 -0400
Message-ID: <20190910190554.1539-15-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-10-Bhawanpreet.Lakha@amd.com>
 <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(1076003)(53936002)(47776003)(14444005)(305945005)(7696005)(8936002)(81156014)(81166006)(8676002)(50226002)(50466002)(6916009)(36756003)(48376002)(6666004)(2351001)(356004)(4326008)(53416004)(86362001)(76176011)(51416003)(70206006)(70586007)(316002)(16586007)(11346002)(336012)(426003)(476003)(446003)(2616005)(126002)(2906002)(5660300002)(186003)(478600001)(26005)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0004; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2922d849-e677-4243-b002-08d73621f9c3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR1201MB0004; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0004:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0004726401F7C1BFE4B39879F9B60@BN6PR1201MB0004.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xXhO39yLhdDtHp7qXDWrfSQxMieQg7o8O9QJMqKEokiZoeK785HQDpEJF5tU+AgrBDc2TPqw1K7iEh7MosDdGMUuj0Ouf2nPJKpZSb5g8QElcJEV8x10dXzfdX/+mPT9de6lsftbBI8WaVdn7zBvCdseiPCvx3mdO1ceETk9S46AWduCLo2jOF82uTlOSjLaIeZGPTx59awAMx7BWEpDqYfxiYE0dhZEOBVmCkSjoWLHX2vRI5nlrSqqPlfBMAM75QvAY6c1rwNDEQ+eddtOepvXHrgyh0ZazlVlBwjuCV4u22Ec3ms2g++TcQRq3swKjLdiarMdjUw9ihdJii9xeOHaTWYTn7gLrmK0yb2qb/XVke+tFWHzcQSYDm9fgz4kfH3ulC3duGjN15totg3st6nH15IyI6ySiYETPoAEey8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:06:24.7335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2922d849-e677-4243-b002-08d73621f9c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0004
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNG1MvHuhhcLw0Ayy9Tx8cPO3RWbjPDY5/2vIhFrEiA=;
 b=az9pfPIPul343YvcV9Oa+oD3764EMnav0exOq8RgK+rcaL3XV+V4PuTo/2/BgTiNXNllDfgk/m1GmUS+2t/9ExQvRNSLnd+VQpc0fQoRfOpo6zBcOBeQFEEJbxrWVPnkEXKlfa+yepjtV9ROwPOfTjlPG94rXpUlMSTlFJVmiSA=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2UgbmVlZCB0byByZWFkIGFuZCB3cml0ZSBzcGVjaWZpYyBpMmMgYW5kIGRwY2QgbWVz
c2FnZXMuCgpbSG93XQpDcmVhdGVkIHN0YXRpYyBmdW5jdGlvbnMgZm9yIHBhY2tpbmcgdGhlIGRw
Y2QgYW5kIGkyYyBtZXNzYWdlcyBmb3IgaGRjcC4KClNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0
IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGFycnkgV2Vu
dGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Ci0tLQogLi4uL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1faGRjcC5jICAgIHwgNDAgKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMKaW5k
ZXggMDA0YjZlOGU5ZWQ1Li45ZDExZDc2OTU1MDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hkY3AuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmMKQEAgLTI2LDYgKzI2
LDQxIEBACiAjaW5jbHVkZSAiYW1kZ3B1X2RtX2hkY3AuaCIKICNpbmNsdWRlICJhbWRncHUuaCIK
ICNpbmNsdWRlICJhbWRncHVfZG0uaCIKKyNpbmNsdWRlICJkbV9oZWxwZXJzLmgiCisKK2Jvb2wg
bHBfd3JpdGVfaTJjKHZvaWQgKmhhbmRsZSwgdWludDMyX3QgYWRkcmVzcywgY29uc3QgdWludDhf
dCAqZGF0YSwgdWludDMyX3Qgc2l6ZSkKK3sKKworCXN0cnVjdCBkY19saW5rICpsaW5rID0gaGFu
ZGxlOworCXN0cnVjdCBpMmNfcGF5bG9hZCBpMmNfcGF5bG9hZHNbXSA9IHt7dHJ1ZSwgYWRkcmVz
cywgc2l6ZSwgKHZvaWQgKilkYXRhfSB9OworCXN0cnVjdCBpMmNfY29tbWFuZCBjbWQgPSB7aTJj
X3BheWxvYWRzLCAxLCBJMkNfQ09NTUFORF9FTkdJTkVfSFcsIGxpbmstPmRjLT5jYXBzLmkyY19z
cGVlZF9pbl9raHp9OworCisJcmV0dXJuIGRtX2hlbHBlcnNfc3VibWl0X2kyYyhsaW5rLT5jdHgs
IGxpbmssICZjbWQpOworfQorCitib29sIGxwX3JlYWRfaTJjKHZvaWQgKmhhbmRsZSwgdWludDMy
X3QgYWRkcmVzcywgdWludDhfdCBvZmZzZXQsIHVpbnQ4X3QgKmRhdGEsIHVpbnQzMl90IHNpemUp
Cit7CisJc3RydWN0IGRjX2xpbmsgKmxpbmsgPSBoYW5kbGU7CisKKwlzdHJ1Y3QgaTJjX3BheWxv
YWQgaTJjX3BheWxvYWRzW10gPSB7e3RydWUsIGFkZHJlc3MsIDEsICZvZmZzZXR9LCB7ZmFsc2Us
IGFkZHJlc3MsIHNpemUsIGRhdGF9IH07CisJc3RydWN0IGkyY19jb21tYW5kIGNtZCA9IHtpMmNf
cGF5bG9hZHMsIDIsIEkyQ19DT01NQU5EX0VOR0lORV9IVywgbGluay0+ZGMtPmNhcHMuaTJjX3Nw
ZWVkX2luX2toen07CisKKwlyZXR1cm4gZG1faGVscGVyc19zdWJtaXRfaTJjKGxpbmstPmN0eCwg
bGluaywgJmNtZCk7Cit9CisKK2Jvb2wgbHBfd3JpdGVfZHBjZCh2b2lkICpoYW5kbGUsIHVpbnQz
Ml90IGFkZHJlc3MsIGNvbnN0IHVpbnQ4X3QgKmRhdGEsIHVpbnQzMl90IHNpemUpCit7CisJc3Ry
dWN0IGRjX2xpbmsgKmxpbmsgPSBoYW5kbGU7CisKKwlyZXR1cm4gZG1faGVscGVyc19kcF93cml0
ZV9kcGNkKGxpbmstPmN0eCwgbGluaywgYWRkcmVzcywgZGF0YSwgc2l6ZSk7Cit9CisKK2Jvb2wg
bHBfcmVhZF9kcGNkKHZvaWQgKmhhbmRsZSwgdWludDMyX3QgYWRkcmVzcywgdWludDhfdCAqZGF0
YSwgdWludDMyX3Qgc2l6ZSkKK3sKKwlzdHJ1Y3QgZGNfbGluayAqbGluayA9IGhhbmRsZTsKKwor
CXJldHVybiBkbV9oZWxwZXJzX2RwX3JlYWRfZHBjZChsaW5rLT5jdHgsIGxpbmssIGFkZHJlc3Ms
IGRhdGEsIHNpemUpOworfQogCiBzdGF0aWMgdm9pZCBwcm9jZXNzX291dHB1dChzdHJ1Y3QgaGRj
cF93b3JrcXVldWUgKmhkY3Bfd29yaykKIHsKQEAgLTIyMCw3ICsyNTUsMTAgQEAgc3RydWN0IGhk
Y3Bfd29ya3F1ZXVlICpoZGNwX2NyZWF0ZV93b3JrcXVldWUodm9pZCAqcHNwX2NvbnRleHQsIHN0
cnVjdCBjcF9wc3AgKmMKIAogCQloZGNwX3dvcmtbaV0uaGRjcC5jb25maWcucHNwLmhhbmRsZSA9
ICBwc3BfY29udGV4dDsKIAkJaGRjcF93b3JrW2ldLmhkY3AuY29uZmlnLmRkYy5oYW5kbGUgPSBk
Y19nZXRfbGlua19hdF9pbmRleChkYywgaSk7Ci0KKwkJaGRjcF93b3JrW2ldLmhkY3AuY29uZmln
LmRkYy5mdW5jcy53cml0ZV9pMmMgPSBscF93cml0ZV9pMmM7CisJCWhkY3Bfd29ya1tpXS5oZGNw
LmNvbmZpZy5kZGMuZnVuY3MucmVhZF9pMmMgPSBscF9yZWFkX2kyYzsKKwkJaGRjcF93b3JrW2ld
LmhkY3AuY29uZmlnLmRkYy5mdW5jcy53cml0ZV9kcGNkID0gbHBfd3JpdGVfZHBjZDsKKwkJaGRj
cF93b3JrW2ldLmhkY3AuY29uZmlnLmRkYy5mdW5jcy5yZWFkX2RwY2QgPSBscF9yZWFkX2RwY2Q7
CiAJfQogCiAJY3BfcHNwLT5mdW5jcy51cGRhdGVfc3RyZWFtX2NvbmZpZyA9IHVwZGF0ZV9jb25m
aWc7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
