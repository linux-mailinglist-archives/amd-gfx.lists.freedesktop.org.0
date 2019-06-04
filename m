Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C59034936
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 15:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7610898A7;
	Tue,  4 Jun 2019 13:43:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690074.outbound.protection.outlook.com [40.107.69.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C81898A7
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 13:43:25 +0000 (UTC)
Received: from CY4PR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:910:16::33) by BYAPR12MB2661.namprd12.prod.outlook.com
 (2603:10b6:a03:69::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.20; Tue, 4 Jun
 2019 13:43:24 +0000
Received: from BY2NAM03FT013.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by CY4PR1201CA0023.outlook.office365.com
 (2603:10b6:910:16::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.17 via Frontend
 Transport; Tue, 4 Jun 2019 13:43:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT013.mail.protection.outlook.com (10.152.84.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1943.19 via Frontend Transport; Tue, 4 Jun 2019 13:43:23 +0000
Received: from yttao-code-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 4 Jun 2019 08:43:22 -0500
From: Yintian Tao <yttao@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: no need fbcon under sriov
Date: Tue, 4 Jun 2019 21:43:05 +0800
Message-ID: <1559655785-30379-1-git-send-email-yttao@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(428003)(199004)(189003)(4326008)(47776003)(6916009)(53936002)(8936002)(50226002)(16586007)(5660300002)(68736007)(26005)(186003)(70586007)(356004)(336012)(8676002)(14444005)(70206006)(7696005)(305945005)(77096007)(81166006)(81156014)(316002)(51416003)(48376002)(50466002)(4744005)(2616005)(426003)(6666004)(476003)(126002)(2351001)(2906002)(53416004)(486006)(36756003)(72206003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2661; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 050b4315-4bed-4f83-11cd-08d6e8f29d47
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2661; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2661:
X-Microsoft-Antispam-PRVS: <BYAPR12MB266194161CB69136B10B92A5E5150@BYAPR12MB2661.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0058ABBBC7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KCRvIn761fUDkZnmklFIPs/CMEbJv7n9VdZWA42UGcgU8qfdcnq/RR4yqD4VJ+DajOHmlrHc7fSy8EhO+HLkeZc1X3iJc8sUyTBBhXVwhXzyqmQ0kWQZJwzCpIAK3lhv9PuQsLmTySKw87a/2aWp0EBNUWxwsX2/LGvRCq73bzmF9DyrmEykuzS9pnY34T99FwjsXcxptUW8PgO5P+uQ/XEAl/CJ/GF41J5r2bsvkUw0KxMPszQLiVxgDCF58b6VW4Sx0mHLAJO1tWi0HiVNdY++rhISUMHeT4oGv0hwiPaCXCYKCqKtqtXj5PVaL/MH5N8s2P0GylCg95Zgmvc2isR9Wb5gq3OFBM0imBPaL7pvkuGD4YOmunCPlmVM+KAr8cARLM1NuPtqh3KEp/Ms8D1Bj6/mxZD4yNup0fDKuVQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2019 13:43:23.5452 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 050b4315-4bed-4f83-11cd-08d6e8f29d47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2661
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOdsuJfCuk1fS74w6sRN1QQohxjHiB/ZgLOQIl+k2tw=;
 b=JjUydkOXG5GqP/DKGGG5/rCPxhwgufyfPgqTmA5jYl+pL8cHJ6OqO06vsIlyC956SzmJaZ0g4FLhhnFN1RTkzOf1W8++gLAOZsSgN5VHkQ8Xk2Dp3jBfG4WoD0niisZykljJ1wqeNYjx41dQ/FDdV1+uRg5M/PHjb8OYboVF44w=
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
Cc: Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VW5kZXIgU3Jpb3YsIHRoZXJlIGlzIG5vIG5lZWQgb2YgdGhlIHN1cHBvcnQgZm9yIGZiY29uLgoK
U2lnbmVkLW9mZi1ieTogWWludGlhbiBUYW8gPHl0dGFvQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMKaW5kZXggMWYzOGQ2Zi4uMjhkMDk1YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMTAxMiw3ICsxMDEyLDggQEAgYW1kZ3B1X3BjaV9yZW1v
dmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCiB7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHBj
aV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAotCURSTV9FUlJPUigiRGV2aWNlIHJlbW92YWwgaXMgY3Vy
cmVudGx5IG5vdCBzdXBwb3J0ZWQgb3V0c2lkZSBvZiBmYmNvblxuIik7CisJaWYgKCFhbWRncHVf
c3Jpb3ZfdmYoYWRldikpCisJCURSTV9FUlJPUigiRGV2aWNlIHJlbW92YWwgaXMgY3VycmVudGx5
IG5vdCBzdXBwb3J0ZWQgb3V0c2lkZSBvZiBmYmNvblxuIik7CiAJZHJtX2Rldl91bnBsdWcoZGV2
KTsKIAlkcm1fZGV2X3B1dChkZXYpOwogCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
