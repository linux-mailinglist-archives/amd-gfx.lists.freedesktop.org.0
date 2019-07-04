Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 956F45FB80
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2B16E38A;
	Thu,  4 Jul 2019 16:06:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680069.outbound.protection.outlook.com [40.107.68.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BDE6E379
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:21 +0000 (UTC)
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by BN6PR12MB1187.namprd12.prod.outlook.com (2603:10b6:404:1b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Thu, 4 Jul
 2019 16:06:19 +0000
Received: from BY2NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT029.mail.protection.outlook.com (10.152.84.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:18 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:59 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/17] drm/amdgpu: add AMDGPU_HW_IP_VCN_JPEG_ENC for jpeg enc
Date: Thu, 4 Jul 2019 12:04:26 -0400
Message-ID: <20190704160429.14758-14-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(2980300002)(428003)(189003)(199004)(4744005)(26005)(11346002)(16586007)(316002)(68736007)(126002)(336012)(70206006)(70586007)(486006)(7696005)(3846002)(6116002)(72206003)(51416003)(36756003)(2616005)(476003)(2351001)(426003)(48376002)(50466002)(7736002)(50226002)(16526019)(6916009)(446003)(81166006)(81156014)(4326008)(2906002)(14444005)(53416004)(8676002)(2876002)(356004)(1076003)(8936002)(6666004)(305945005)(478600001)(186003)(76176011)(77096007)(86362001)(47776003)(5660300002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1187; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52c4f653-25d9-49c5-d131-08d700998cc6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR12MB1187; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1187:
X-Microsoft-Antispam-PRVS: <BN6PR12MB11871424723670CBCC32E46B87FA0@BN6PR12MB1187.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: F153S7ba/nj4mHG+Opbi78MSFPt6/+cQcbNhf4tCJHm6Nm7w5iWWSNepO6wQ87wxAQHiqObZiApz3Ntnd74N8lY/Ml5M5ZNG1iuwxgjK3kY+AwTn3LoW1IAOdPA+sdBxzgTO46HJEbnQz9euwB930mZjW4fSRGPH24QRlQ8oG+3aQy03Vk4EUg3BPlbKeBjt1meGaO3aRlS2YifCn7zgrQQ6LOUE/mAlT5V+8/jZkQnM87J0502S8ZUOEIZClPHQSB8h4nlQZ6uC55mekcjykLtYgEGZ0axmcM9MxhEP+iiVDDq+ZtscmS1aKpbDS4JM+qs7lR/7RrqEqSiQf5UYi2RqlAeXYyeS1xo1NnXw7kL2wPcDNA0gTP7JDEEn/jVvNW/xU6560jr+9NoPbG0UUzN/AydsAujB1TtLSOwzw6c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:18.6579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c4f653-25d9-49c5-d131-08d700998cc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1187
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z16reJJQO8un6rQLWd49LYx1PR9fNMnBBv6p8S1dXVU=;
 b=yrfMig9292HHKYRO+WGJ5I0sFq7Oj/3K0ZuYtJ/KkZlDcc0wmpzi/lWfkHwO0ErtYyYdRnq7tipWK1zp1woTODtEKxNrv4jCH3g7orFJJvIP3k20sy3YKHudcNUQDsFEfutMJtrbrRUUMS0v2X8q41YCUupSpp0xegdxoujqZJw=
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
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBBTURHUFVfSFdf
SVBfVkNOX0pQRUdfRU5DIHR5cGUgZm9yIGpwZWcgZW5jb2RlIENTIGluIGRybSBoZWFkZXIKClNp
Z25lZC1vZmYtYnk6IEJveXVhbiBaaGFuZyA8Ym95dWFuLnpoYW5nQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogaW5jbHVk
ZS91YXBpL2RybS9hbWRncHVfZHJtLmggfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vYW1k
Z3B1X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKaW5kZXggNGVmNDQzNGE2
YmUyLi5jOWJlMWM3MGJmNTIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2Ry
bS5oCisrKyBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCkBAIC01NzYsNyArNTc2LDgg
QEAgc3RydWN0IGRybV9hbWRncHVfZ2VtX3ZhIHsKICNkZWZpbmUgQU1ER1BVX0hXX0lQX1ZDTl9E
RUMgICAgICA2CiAjZGVmaW5lIEFNREdQVV9IV19JUF9WQ05fRU5DICAgICAgNwogI2RlZmluZSBB
TURHUFVfSFdfSVBfVkNOX0pQRUcgICAgIDgKLSNkZWZpbmUgQU1ER1BVX0hXX0lQX05VTSAgICAg
ICAgICA5CisjZGVmaW5lIEFNREdQVV9IV19JUF9WQ05fSlBFR19FTkMgOQorI2RlZmluZSBBTURH
UFVfSFdfSVBfTlVNICAgICAgICAgIDEwCiAKICNkZWZpbmUgQU1ER1BVX0hXX0lQX0lOU1RBTkNF
X01BWF9DT1VOVCAxCiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
