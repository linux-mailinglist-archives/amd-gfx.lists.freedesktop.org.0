Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B069FE6C
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 11:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0820B894E0;
	Wed, 28 Aug 2019 09:25:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740052.outbound.protection.outlook.com [40.107.74.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04675894E0
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 09:25:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZdNSyGRfmE4tWIqflOKLWl/W+hyyjyPyDNf0/jTH6jhg9247i8JYBGafWCTJ0nYdB5IRpkmTdRIAEIGBH6h7paDBvQLREnprUM37BRkA1nJehTYOG1UkyJZinqwgL+g0RVb8TROVnao0FRxjO6L3yg7jM/h5EmFB8hvSggrKUKM0qw/OCy+482MBlAgs5lHGzxgKWt0XVumowxBcA/dDS/EYLYdl1XDl2hZd3xMxmmr16PVXjHtzZ9eZfvumIXKEJRZqqJHc9kM4+Zs7+ik8fARKli3XgqV9vmXVqRbOCgznF9mNL0GGJXqXMcgq+zq/LBAJnfHtwfO076JTt7ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5LbO0lzXEwRusb/qPPzw0dID0BXzEEOJ0Te1Ajh3XI=;
 b=ffpa4/Htx0tBHroxmSG6ZYoBmT1TzKzHA35Mos04om9Bq8r8kUF1u86pgmmjedOUskjXpfX3LEENuc86saK5NZD52JSQPAVPp9G3GekNJl/22/McHr0TmXmBJM0xyoIaIxzb2ZfRa9q/Q3SkGmHKrULOPb7w+zLMBb9NnoLTapQc1jtpRAaGePZn2SLcndcpq32ECiHx1GuKqPIeG3MFwh7xCBwFLDGLq2V5+uL79jHX45N2x298jVtJCuW5h2kn/YlRHJmCpkHGNpg29PdpAClwhUSPBIZPdqkJI9DTd+wO69dD1lSJH58ljb+eeTryxrJMeFYvmaSV3PYi65c2tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0003.namprd12.prod.outlook.com
 (2603:10b6:301:4a::13) by BN7PR12MB2706.namprd12.prod.outlook.com
 (2603:10b6:408:2a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Wed, 28 Aug
 2019 09:25:43 +0000
Received: from DM3NAM03FT062.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by MWHPR1201CA0003.outlook.office365.com
 (2603:10b6:301:4a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16 via Frontend
 Transport; Wed, 28 Aug 2019 09:25:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT062.mail.protection.outlook.com (10.152.83.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 28 Aug 2019 09:25:41 +0000
Received: from rico-code.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 04:25:40 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Date: Wed, 28 Aug 2019 17:25:35 +0800
Message-ID: <1566984335-14830-1-git-send-email-tianci.yin@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(2980300002)(428003)(199004)(189003)(2351001)(53416004)(48376002)(54906003)(8936002)(478600001)(36756003)(16586007)(86362001)(305945005)(50466002)(4326008)(316002)(6916009)(81156014)(70206006)(2616005)(336012)(426003)(126002)(476003)(486006)(14444005)(26005)(81166006)(44832011)(70586007)(53936002)(186003)(6666004)(356004)(47776003)(51416003)(7696005)(8676002)(2906002)(5660300002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2706; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7aa14dbf-df20-4183-5f52-08d72b99b27d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2706; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2706:
X-Microsoft-Antispam-PRVS: <BN7PR12MB270664A9B6CFCEF5ED5AA37A95A30@BN7PR12MB2706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: l/UR0VlRGv+hWIR/AyM1tw5tIOkXXDnwbl5LuoEr1dFhTKgENjwe60g9ii0AAr42ESdGm/TUip5KL+kpNjmvzd8TA0x6Yi50XB9bKkEUNFTrU8WUCap768IlSdkbcGMr2N8hb5ftdXsnIjDmB+aayclWq3h6iceYiR9juY+qpRLnfh0bcv6zmLG7WRNFLWW9bHSm8Thb9pshx5fAE3VOLIdJHH5GeKxzLe2DEbalQQhOZbxMmuSuy0KNKQZeYI6gk83M9YL1AZJue3+VaNpAf2KJoZh6A0JGohsfuffGKMlmBmQn5HeqK2/WPUGpy1U5NXX1EQJDG9+DvYF1kkCchE2dLvmQtcFmfwJ/poantXijpKNoLBu5kaI23aPRieSMZ0e0JGRbsAbPWarwixzLcT7Xlz00YQdyXFruwvpcgLM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 09:25:41.9294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa14dbf-df20-4183-5f52-08d72b99b27d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2706
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5LbO0lzXEwRusb/qPPzw0dID0BXzEEOJ0Te1Ajh3XI=;
 b=Mh9cPrwXkc+U/lass5Wgj+7BmoSy1UN+5lXRyBV6V3KFJQM4YaunPha+n0WaoyxFq3Qyhk+zy1ZGSHUgkpSd33h/nxlgACTzQntxoNAk3jxbvCn2qid9Qew1Zf4wX21XbwkeR56MaLi4UCKX13tzXZqCiCYzSgcBRcr5cCCebFQ=
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, "Le
 . Ma" <Le.Ma@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tianci Yin <tianci.yin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgpGaXggY29tcHV0ZSByaW5n
IHRlc3QgZmFpbHVyZSBpbiBzcmlvdiBzY2VuYXJpby4KClNpZ25lZC1vZmYtYnk6IFRpYW5jaS5Z
aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcHNwLmMgfCAxNCArKysrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BzcC5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwpp
bmRleCA5ZjdjYzViLi45MmM2OGM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BzcC5jCkBAIC0yNjEsOSArMjYxLDE1IEBAIHN0YXRpYyBpbnQgcHNwX3Rtcl9pbml0KHN0cnVj
dCBwc3BfY29udGV4dCAqcHNwKQogCQl9CiAJfQogCi0JcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9r
ZXJuZWwocHNwLT5hZGV2LCB0bXJfc2l6ZSwgUFNQX1RNUl9TSVpFLAotCQkJCSAgICAgIEFNREdQ
VV9HRU1fRE9NQUlOX1ZSQU0sCi0JCQkJICAgICAgJnBzcC0+dG1yX2JvLCAmcHNwLT50bXJfbWNf
YWRkciwgTlVMTCk7CisJcHNwLT50bXJfYnVmID0gTlVMTDsKKwlpZiAoIWFtZGdwdV9zcmlvdl92
Zihwc3AtPmFkZXYpKQorCQlyZXQgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChwc3AtPmFkZXYs
IHRtcl9zaXplLCBQU1BfVE1SX1NJWkUsCisJCQkJCSAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZS
QU0sCisJCQkJCSAgICAgICZwc3AtPnRtcl9ibywgJnBzcC0+dG1yX21jX2FkZHIsIE5VTEwpOwor
CWVsc2UKKwkJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwocHNwLT5hZGV2LCB0bXJfc2l6
ZSwgUFNQX1RNUl9TSVpFLAorCQkJCQkgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAorCQkJ
CQkgICAgICAmcHNwLT50bXJfYm8sICZwc3AtPnRtcl9tY19hZGRyLCAmcHNwLT50bXJfYnVmKTsK
IAogCXJldHVybiByZXQ7CiB9CkBAIC0xMjE2LDcgKzEyMjIsNyBAQCBzdGF0aWMgaW50IHBzcF9o
d19maW5pKHZvaWQgKmhhbmRsZSkKIAogCXBzcF9yaW5nX2Rlc3Ryb3kocHNwLCBQU1BfUklOR19U
WVBFX19LTSk7CiAKLQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJnBzcC0+dG1yX2JvLCAmcHNwLT50
bXJfbWNfYWRkciwgTlVMTCk7CisJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPnRtcl9ibywg
JnBzcC0+dG1yX21jX2FkZHIsICZwc3AtPnRtcl9idWYpOwogCWFtZGdwdV9ib19mcmVlX2tlcm5l
bCgmcHNwLT5md19wcmlfYm8sCiAJCQkgICAgICAmcHNwLT5md19wcmlfbWNfYWRkciwgJnBzcC0+
ZndfcHJpX2J1Zik7CiAJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZwc3AtPmZlbmNlX2J1Zl9ibywK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaAppbmRleCBiYzA5NDdmLi5iNzNk
NGFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oCkBAIC0xNzEsNiAr
MTcxLDcgQEAgc3RydWN0IHBzcF9jb250ZXh0CiAJLyogdG1yIGJ1ZmZlciAqLwogCXN0cnVjdCBh
bWRncHVfYm8JCSp0bXJfYm87CiAJdWludDY0X3QJCQl0bXJfbWNfYWRkcjsKKwl2b2lkCQkJCSp0
bXJfYnVmOwogCiAJLyogYXNkIGZpcm13YXJlIGFuZCBidWZmZXIgKi8KIAljb25zdCBzdHJ1Y3Qg
ZmlybXdhcmUJCSphc2RfZnc7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
