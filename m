Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C75FB79
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA49E6E378;
	Thu,  4 Jul 2019 16:06:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740088.outbound.protection.outlook.com [40.107.74.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88936E377
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:18 +0000 (UTC)
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by MWHPR12MB1199.namprd12.prod.outlook.com (2603:10b6:300:10::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Thu, 4 Jul
 2019 16:06:17 +0000
Received: from BY2NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:16 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT029.mail.protection.outlook.com (10.152.84.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:16 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:58 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/17] drm/amdgpu: add jpeg enc scratch0 for ring test
Date: Thu, 4 Jul 2019 12:04:22 -0400
Message-ID: <20190704160429.14758-10-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(2980300002)(428003)(199004)(189003)(476003)(16586007)(426003)(126002)(316002)(2616005)(86362001)(53416004)(6666004)(305945005)(11346002)(6116002)(356004)(1076003)(486006)(50466002)(48376002)(5660300002)(4326008)(2351001)(3846002)(7736002)(72206003)(446003)(478600001)(70586007)(70206006)(2906002)(76176011)(186003)(26005)(6916009)(77096007)(81166006)(2876002)(81156014)(53936002)(8676002)(50226002)(36756003)(16526019)(47776003)(336012)(8936002)(68736007)(51416003)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1199; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b99448ab-5577-4e61-6aaa-08d700998b6b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR12MB1199; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1199:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1199D3B73BB4054EDB2FAF2287FA0@MWHPR12MB1199.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6OjLewoGHbwaWrFIiU1Vr7+wKE/yYB4zx1ATHvF28lRQd0ckw/MxJF84V4nC4tpDL3OXfViUlmpbjkk/4F5JFO/A4u8Sm2ZzKse/5oUuDtrHcw81hvnO0O797SyCz1rmmYuWcpx6HDfLIkmjqD+ZFSJokfjtIA+3MdXP23a/MAfXXGDcJBtTUeUzsrkOEsaf/qnai57ZBDnL+MvyBAxiJ0nHEWhNYCVWyidQCIC9s55ebMO+HGFagPOYBe+T5FgZ7L1aQckiUU+nc87b5O20NzHkmk4NxZjMTN8/taI5cShTwTp7Em7L6o0Bgqsy1OaaNi7x/OsSaQU9FWrkD3DC3DEfMk+ukAfv/Uo+7rZcnwEAZvMUESmQyxPOYf2tDmF4uPzXV1kxkIdaTuIWSlHw9ncFYp/yEygXrD/M2FwqWjs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:16.3794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b99448ab-5577-4e61-6aaa-08d700998b6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1199
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4c7w11mTbSYW4LVWvitBBK1EMCTu4pwpggYgI9cpSI=;
 b=kNnqZCoyKkUDaNZXbt9yDCTaokDk5pUNDnyU2pdQBDhpa4JvxbLudp1HVjFXE7uoqFMuObgSMuEYP+lzol7Uzr9mebVdmJVFPco4Tstf/aiyPdSw5sIuSAef+2UdN6+G02+6RhKb14qazokCeHc5ewV6Jw9hrjwdxaXfrBfDjIE=
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

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBhbmQgc2V0IGlu
dGVybmFsIGFuZCBleHRlcm5hbCBvZmZzZXRzIG9mIGpwZWdfZW5jX3NjcmF0Y2gwIGZvciByaW5n
IHRlc3QKClNpZ25lZC1vZmYtYnk6IEJveXVhbiBaaGFuZyA8Ym95dWFuLnpoYW5nQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oIHwgMSArCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jICAgfCAzICsrKwogMiBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdmNuLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmgK
aW5kZXggYTQ0NTUwYWYxYjhhLi44YjM0NGQ2YTFhY2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdmNuLmgKQEAgLTc0LDYgKzc0LDcgQEAgc3RydWN0IGFtZGdwdV92Y25fcmVn
ewogCXVuc2lnbmVkCW5vcDsKIAl1bnNpZ25lZAlzY3JhdGNoOTsKIAl1bnNpZ25lZAlqcGVnX3Bp
dGNoOworCXVuc2lnbmVkCWpwZWdfZW5jX3NjcmF0Y2gwOwogfTsKIAogc3RydWN0IGFtZGdwdV92
Y24gewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKaW5kZXggM2NhYTFiOThiMTVh
Li41ZGFiMTdlNDIyYzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zj
bl92Ml8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwpAQCAt
MjI3LDYgKzIyNyw5IEBAIHN0YXRpYyBpbnQgdmNuX3YyXzBfc3dfaW5pdCh2b2lkICpoYW5kbGUp
CiAJaWYgKHIpCiAJCXJldHVybiByOwogCisJYWRldi0+dmNuLmludGVybmFsLmpwZWdfZW5jX3Nj
cmF0Y2gwID0gbW1VVkRfSlBFR19FTkNfU0NSQVRDSDBfSU5URVJOQUxfT0ZGU0VUOworCWFkZXYt
PnZjbi5leHRlcm5hbC5qcGVnX2VuY19zY3JhdGNoMCA9IFNPQzE1X1JFR19PRkZTRVQoVVZELCAw
LCBtbVVWRF9KUEVHX0VOQ19TQ1JBVENIMCk7CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
