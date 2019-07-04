Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F7D5FB77
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06CE6E373;
	Thu,  4 Jul 2019 16:06:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720065.outbound.protection.outlook.com [40.107.72.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE21A6E373
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:17 +0000 (UTC)
Received: from SN1PR12CA0065.namprd12.prod.outlook.com (2603:10b6:802:20::36)
 by DM5PR12MB1849.namprd12.prod.outlook.com (2603:10b6:3:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.20; Thu, 4 Jul
 2019 16:06:16 +0000
Received: from BY2NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by SN1PR12CA0065.outlook.office365.com
 (2603:10b6:802:20::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:16 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT052.mail.protection.outlook.com (10.152.85.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:15 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:58 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/17] drm/amdgpu: add jpeg enc sw and hw finish
Date: Thu, 4 Jul 2019 12:04:21 -0400
Message-ID: <20190704160429.14758-9-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(26005)(478600001)(16526019)(486006)(426003)(186003)(356004)(2616005)(446003)(126002)(5660300002)(72206003)(47776003)(76176011)(336012)(70206006)(2351001)(1076003)(48376002)(70586007)(77096007)(6916009)(36756003)(476003)(11346002)(6666004)(53936002)(53416004)(8676002)(8936002)(2876002)(316002)(51416003)(50226002)(6116002)(7736002)(305945005)(81156014)(81166006)(7696005)(3846002)(2906002)(16586007)(86362001)(68736007)(4326008)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1849; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca3d5d14-2972-4373-a29a-08d700998b21
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR12MB1849; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1849:
X-Microsoft-Antispam-PRVS: <DM5PR12MB184992A9F70EEDECF775B6A287FA0@DM5PR12MB1849.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: y+3aNzMiPihdk8n3Vq7yVtLG0u3lJntiQOU9Xj5+QVdeyjsp8xM0LAnn6IPAs/sRUW+3BMkwvIRU3/MakLyjRVYKDKaWrMqafEVwb8vd5G99ohKH0+oRMPCVZtEylEEuqka/pu+po8MeA+vEg5fdwG3kgvIEr/PhWmdNllf0Ykv0kC35FG3z+ezuCmRNH84AC8lLSHAD+cawTTwcmieaBub/Tbu7Z22Y7db9AYNpsAGHzlT9yocCCoRCdGhKm2LDj0Lw4DmhRfjySzj/rJHFl2j2EYSx1bA9gG77sk4om9gcGKcs0VkLz6iT4mt4PBGa9YBg8ZAvhR/Au7lHp8aXXJabQP6KvEf8xFPp+MKzOJxhmRizLqGfKRVq7syE3ey8ySFvg4R1GB0k7rVwatPx7vGojMt9TI5eCG+2UgSG5R0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:15.8936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3d5d14-2972-4373-a29a-08d700998b21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foBWykcWb0IUktTZxDlNj6Rv6Z9wd4zxKeFiSmh1ul8=;
 b=dbTPwCLJ6DeLn4BZRWvyE7/qEWFuTM6fOR0gB4DpvOROLPxfjWcVHDHlTVl+BkWV33R7uPBJLSGDCvYPSq3H8bb8WJ9Lh1klSG2NddPK/bwWD8yCZzbJbQAT46g66sxasuxMX/q71mIhsk4bUaXbJKITwaG4FDL3UoPvUpihrf8=
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

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBzb2Z0d2FyZSBh
bmQgaGFyZHdhcmUgZmluaSBmb3IganBlZyBlbmNvZGUgcmluZy4KClNpZ25lZC1vZmYtYnk6IEJv
eXVhbiBaaGFuZyA8Ym95dWFuLnpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Zjbi5jIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YyXzAuYyAgIHwgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCmluZGV4IGYzYjQzMmVmNjJlZi4uZjlh
ZjQ2NWEwMGUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmNuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCkBAIC0x
NTcsNiArMTU3LDggQEAgaW50IGFtZGdwdV92Y25fc3dfZmluaShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAogCWFtZGdwdV9yaW5nX2ZpbmkoJmFkZXYtPnZjbi5yaW5nX2pwZWcpOwogCisJ
YW1kZ3B1X3JpbmdfZmluaSgmYWRldi0+dmNuLnJpbmdfanBlZ19lbmMpOworCiAJcmVsZWFzZV9m
aXJtd2FyZShhZGV2LT52Y24uZncpOwogCiAJcmV0dXJuIDA7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3YyXzAuYwppbmRleCA4ZTI1ZjgzMzMzZjEuLjNjYWExYjk4YjE1YSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCkBAIC0zMzMsNiArMzMzLDkgQEAgc3RhdGljIGlu
dCB2Y25fdjJfMF9od19maW5pKHZvaWQgKmhhbmRsZSkKIAlyaW5nID0gJmFkZXYtPnZjbi5yaW5n
X2pwZWc7CiAJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKIAorCXJpbmcgPSAmYWRldi0+dmNu
LnJpbmdfanBlZ19lbmM7CisJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKKwogCXJldHVybiAw
OwogfQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
