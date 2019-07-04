Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 097E35FB7E
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 18:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498246E384;
	Thu,  4 Jul 2019 16:06:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C216E377
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 16:06:19 +0000 (UTC)
Received: from SN1PR12CA0065.namprd12.prod.outlook.com (2603:10b6:802:20::36)
 by MWHPR12MB1856.namprd12.prod.outlook.com (2603:10b6:300:108::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.17; Thu, 4 Jul
 2019 16:06:18 +0000
Received: from BY2NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by SN1PR12CA0065.outlook.office365.com
 (2603:10b6:802:20::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18 via Frontend
 Transport; Thu, 4 Jul 2019 16:06:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT052.mail.protection.outlook.com (10.152.85.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 16:06:18 +0000
Received: from navi10-uefi.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 4 Jul
 2019 11:05:59 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/17] drm/amdgpu: enable vcn jpeg enc ib test
Date: Thu, 4 Jul 2019 12:04:25 -0400
Message-ID: <20190704160429.14758-13-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704160429.14758-1-boyuan.zhang@amd.com>
References: <20190704160429.14758-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(189003)(199004)(486006)(36756003)(16526019)(4744005)(186003)(76176011)(53936002)(50466002)(2876002)(48376002)(6916009)(126002)(8936002)(476003)(356004)(6666004)(14444005)(2906002)(478600001)(68736007)(2351001)(426003)(2616005)(11346002)(72206003)(446003)(53416004)(3846002)(6116002)(70206006)(1076003)(50226002)(5660300002)(7696005)(4326008)(51416003)(86362001)(16586007)(336012)(26005)(77096007)(8676002)(81166006)(81156014)(305945005)(70586007)(47776003)(316002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1856; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c05c852e-c94f-4f0b-915a-08d700998c6c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR12MB1856; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1856:
X-Microsoft-Antispam-PRVS: <MWHPR12MB18569898843EFF4BE05E556087FA0@MWHPR12MB1856.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DPVrLEFIqEIKr804aQX1bV19JqZ0n/Skz/e5NTIvUPfglxkEGlIeg00ZiM+EOoQN5s7P7ypl+aCCVi12NwFYb3L85Zfeez3yFzJ5gndI6d3rOX/EKU/OhdXhdVPv2vlHj/Sm6oufmteYOlyfH3aur4E0WJoydKD7rGoBrxe0y5fG8l7YczgXHw02zvzdz9b2l3gZ4kDLCeMXBsE/2w41Q49+rKjBm+YfdLeVPg4q7UsEvoWONKY87HYJVutjVYkHwRdHrF78NQpo+8m6Ci8WTUsUnavWTxV3mvGWJbUJLTe1zb1jea2iX2MtStVsLJYiRvQhKJLYHJb4yGsN/WGIkf80SLazgbQJFvBTrRHEKUF8Eg5dn77m9I875pdl8NcalnR0MyBDdrg/PEghAWirUsb3LNq/Db7nKh32BJ9nBjw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 16:06:18.0474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c05c852e-c94f-4f0b-915a-08d700998c6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1856
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdDBX2gFD/1ED0zVFggDqVI/Be+8OEDrtXHEH5jV/n4=;
 b=O+GjFgoxMmgWXqCcRHLl7f5UYAWhaZdfWqWPMz8RZKUU3HW3hAAYgjbPtug7776zEew9nTmvJ5gszfzb/+pktlZ9k29tLx3h5SuJQZsUsda1G1xuSIZeNLgjAZ8X6mGMQrHFPHRLd8rtMtZAtVBgq7seIAwWy7n/9SniVx0RNdQ=
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

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkVuYWJsZSB0aGUganBl
ZyBlbmNvZGUgSUIgdGVzdC4KClNpZ25lZC1vZmYtYnk6IEJveXVhbiBaaGFuZyA8Ym95dWFuLnpo
YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMgfCAz
ICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKaW5kZXggYmMzOWZiNTliZTM4Li5lY2M5
YzI4MmFhMGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9p
Yi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jCkBAIC0zNzEs
NyArMzcxLDggQEAgaW50IGFtZGdwdV9pYl9yaW5nX3Rlc3RzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCQkJcmluZy0+ZnVuY3MtPnR5cGUgPT0gQU1ER1BVX1JJTkdfVFlQRV9VVkRfRU5D
IHx8CiAJCQlyaW5nLT5mdW5jcy0+dHlwZSA9PSBBTURHUFVfUklOR19UWVBFX1ZDTl9ERUMgfHwK
IAkJCXJpbmctPmZ1bmNzLT50eXBlID09IEFNREdQVV9SSU5HX1RZUEVfVkNOX0VOQyB8fAotCQkJ
cmluZy0+ZnVuY3MtPnR5cGUgPT0gQU1ER1BVX1JJTkdfVFlQRV9WQ05fSlBFRykKKwkJCXJpbmct
PmZ1bmNzLT50eXBlID09IEFNREdQVV9SSU5HX1RZUEVfVkNOX0pQRUcgfHwKKwkJCXJpbmctPmZ1
bmNzLT50eXBlID09IEFNREdQVV9SSU5HX1RZUEVfVkNOX0pQRUdfRU5DKQogCQkJdG1vID0gdG1v
X21tOwogCQllbHNlCiAJCQl0bW8gPSB0bW9fZ2Z4OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
