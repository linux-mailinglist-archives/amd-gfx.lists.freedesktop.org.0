Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967FAAF179
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128966E978;
	Tue, 10 Sep 2019 19:04:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F7D6E95B
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:04:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gP8ZPuu05ZzOc+kP4LHueIkK52x6mcxKkjhDRnmmOUy9DiCWEv38zkqZ/cmLhTHr4gCrzETiKOeUZeCuNNMDJSQcX8JefdpzumTZHjc1iEyP/7TfdROHyIybiRXc+/7TnwP2Tz4riFhpddFry19y6uoBFc4yEqWU5NRilLGcB3d41GrXyWwOfyOihsO+u8rkjiupVUqYMZP9Ml6bjeZt2jgrNPY+InsYFoCFmYMI1OUV/etveLbkqWLnP9S6MnZyXCyi+GNID9Ld745UfKjLwxZB2VyLr40wG6gC07cuCN4Cwr8FhoHK8/AE3RlvIPrNA+OTF+sy5ykpsLEo4L1Aeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNG1MvHuhhcLw0Ayy9Tx8cPO3RWbjPDY5/2vIhFrEiA=;
 b=i0xGOT0BZ73gQNGGKmKLzep72ZnpGRktA7bgGjc2XAWhGQziyNWsLXLCU6InBeGZQSQx+sFjrHk4QDuUHCIp/g1I/L2r+XsX2TSfKaKmnaYkglB6FlOKBG+kEB57cLZWZjHIQJ1OzNHsDiPCltpkEntXYkMUfuUb43VmHmn35wNk2ae1Nsh7gWb+NvHK3Kk+dpyHp38Br0UTQ5iXoB3moYPnYcP+obKnBer5+P/EtQHHtNtAhDCjVLj6VVxbZMBeJnr3M4LGd5cbD55zEqmHmmynL2UONAetnjPg9W+zQrIv4CQUl/79rWWsHBCAwxOJHLygo19DK0932KjYrRt4aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:301:4a::34) by BY5PR12MB4146.namprd12.prod.outlook.com
 (2603:10b6:a03:20d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14; Tue, 10 Sep
 2019 19:04:38 +0000
Received: from DM3NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by MWHPR1201CA0024.outlook.office365.com
 (2603:10b6:301:4a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14 via Frontend
 Transport; Tue, 10 Sep 2019 19:04:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT048.mail.protection.outlook.com (10.152.83.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:04:38 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:04:33 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/20] drm/amd/display: Create dpcd and i2c packing functions
Date: Tue, 10 Sep 2019 15:04:16 -0400
Message-ID: <20190910190422.794-15-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
References: <eb83ae25-7635-45de-72dc-db24571066d2@amd.com>
 <20190910190422.794-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(2980300002)(428003)(199004)(189003)(336012)(305945005)(26005)(48376002)(51416003)(50226002)(70586007)(7696005)(53416004)(70206006)(8676002)(81156014)(6916009)(81166006)(8936002)(1076003)(86362001)(2351001)(5660300002)(186003)(53936002)(4326008)(50466002)(356004)(6666004)(47776003)(11346002)(446003)(478600001)(486006)(426003)(2906002)(76176011)(476003)(14444005)(2616005)(36756003)(16586007)(316002)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4146; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb1745f0-3130-41aa-b2a5-08d73621ba39
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BY5PR12MB4146; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB4146:
X-Microsoft-Antispam-PRVS: <BY5PR12MB41467456C5ADD6F20806B10FF9B60@BY5PR12MB4146.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tVXGko0TJZDMLfir2837yuRHGREBuYLebImaWygsln3c/AEvntOBH0HPLLJH9unmXLrEjUn1iM8otwwhLw0O6tq3Ho6RE/fK7JIfT63ka0yw5mkwOTwXhAKfNHw0rG9gai5YGmt3uJFkZII0PqUwupDMrxJR6yOBe0VPqeCuKriG6SQTmq2EN/LOsCveE1q5pc5YEqwyFAHHAokSe1arUA9msS0Fa72unt95cKkmXIWa+oqM5xRoYnYiVAbHFiMYrMJDKGcTvG3kAGunEJJ7VQyD8+CIGRZAx+dYOr3qoKb4k0g0B/KZ70R+JGgK4w2LqYEcsbKxeexb7zdltSvgjie6r32O/4f1aMfLtAahL/nv3AGcA7tSdHsZ4L0RA9eIeNLSvFmuOgcpTV7qAeKrH8YoCyIa7pecOAXc38Uf5yo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:04:38.1437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1745f0-3130-41aa-b2a5-08d73621ba39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4146
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNG1MvHuhhcLw0Ayy9Tx8cPO3RWbjPDY5/2vIhFrEiA=;
 b=nr0a346CErTYTrma0pEaeEMNGQGcGBgDA4gYJJx830u4+exRWQ2W0wf2CH+yo303ze/a2n1UeGooxC4STSwDoP51h1chr9UWtmuotX0ZQyfE611benrLzCiiFHdOZVlUfbd1yG5WMP3G4VaFY3xyOhLOBqDzhm3DoqkSH6oSEIY=
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
