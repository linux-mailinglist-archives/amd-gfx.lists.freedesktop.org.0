Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFA0EEA3
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 03:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA3F89369;
	Tue, 30 Apr 2019 01:58:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690082.outbound.protection.outlook.com [40.107.69.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BA189369
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 01:58:45 +0000 (UTC)
Received: from BN8PR12CA0001.namprd12.prod.outlook.com (2603:10b6:408:60::14)
 by BY5PR12MB3745.namprd12.prod.outlook.com (2603:10b6:a03:1a7::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.15; Tue, 30 Apr
 2019 01:58:43 +0000
Received: from BY2NAM03FT037.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by BN8PR12CA0001.outlook.office365.com
 (2603:10b6:408:60::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 01:58:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT037.mail.protection.outlook.com (10.152.84.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 01:58:42 +0000
Received: from lnx-aaliu.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 29 Apr 2019
 20:58:40 -0500
From: Aaron Liu <aaron.liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: remove ATPX_DGPU_REQ_POWER_FOR_DISPLAYS check
 when hotplug-in
Date: Tue, 30 Apr 2019 09:58:36 +0800
Message-ID: <1556589516-20360-1-git-send-email-aaron.liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(50466002)(8936002)(2906002)(4326008)(44832011)(336012)(476003)(2616005)(486006)(4744005)(47776003)(81156014)(97736004)(81166006)(48376002)(8676002)(426003)(126002)(6916009)(53936002)(50226002)(305945005)(6666004)(356004)(70206006)(68736007)(70586007)(72206003)(186003)(316002)(478600001)(16586007)(86362001)(26005)(5660300002)(14444005)(77096007)(7696005)(53416004)(2351001)(51416003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3745; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 905d74b8-d908-4ca0-2914-08d6cd0f5f25
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BY5PR12MB3745; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3745:
X-Microsoft-Antispam-PRVS: <BY5PR12MB374515FD06075FE6489AF320F03A0@BY5PR12MB3745.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZSXOeuf6aVGf+nr+p3QLnLXFH+uc29wXv3gtT3qdasRJPSQW9uMOkSlPSYEcUQf2mgNj+GJceoIzeYfkScj2Nu7vbE2V1FRgVkLb35AroFHuY5ZveNowzdyo6QWTfvq2nlDg7xOuREc5N63EbosYfNvTWO28v+9O1keytl10lsC5bjLLsSzoUaO6qzNG0hicRTjb8M1y/bXpGG7H0ZceSfHxKDYeTdymhNCzj8fD7rPKGVmFokjI1YRsiMMHmqjCsBFnEa58VRYsMgr5SGPRgOzfZ/bZ7YL2JGcnRnQTIvetZA84hLvsFRp46MeLjRiZUmRNdK4eAwAJBM8jQz8hOo8teXtNcXe032cK8gAhDRmxI+ag+GQM0Gy8BpLRBLMr9jol7sfkUMyfw2r/Zxfvsz8SU14IwE0OZDJbAimW/Vk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 01:58:42.2126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 905d74b8-d908-4ca0-2914-08d6cd0f5f25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3745
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuKu6TnXy07y0V3QUoCgKKbsN5UllZubSsuD3uLepb8=;
 b=sbZ3YDm9lH/KNY2UT/5O4TzYGcpFEa+t+pxEjwiEGuIMnnbTeGHzJ47HzCKVfoYN9KVFPEfOnMEBk65DeWGK32v421qAP2Si6BX/bkWhJ/DoQknUTjm3J6PjFzIglkqC+zEHpT5fFOBYp7RS8ggVkDTleHagiIyaAF5sRHfEPa4=
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
Cc: Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gYW1kZ3B1X2F0aWZfaGFuZGxlciwgd2hlbiBob3RwbHVnIGV2ZW50IHJlY2VpdmVkLCByZW1v
dmUKQVRQWF9ER1BVX1JFUV9QT1dFUl9GT1JfRElTUExBWVMgY2hlY2suIFRoaXMgYml0J3MgY2hl
Y2sgd2lsbCBjYXVzZSBtaXNzaW5nCnN5c3RlbSByZXN1bWUuCgpDaGFuZ2UtSWQ6IEljOWE1NWZk
NDRiNzIxZTU5MzQ4YTc3NjhkYWViNDFkNDE0ZjIxMzY2ClNpZ25lZC1vZmYtYnk6IEFhcm9uIExp
dSA8YWFyb24ubGl1QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FjcGkuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FjcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3BpLmMKaW5kZXgg
NDM3NmIxNy4uNTZmOGNhMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FjcGkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNw
aS5jCkBAIC00NjQsOCArNDY0LDcgQEAgc3RhdGljIGludCBhbWRncHVfYXRpZl9oYW5kbGVyKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJfQogCQl9CiAJCWlmIChyZXEucGVuZGluZyAm
IEFUSUZfREdQVV9ESVNQTEFZX0VWRU5UKSB7Ci0JCQlpZiAoKGFkZXYtPmZsYWdzICYgQU1EX0lT
X1BYKSAmJgotCQkJICAgIGFtZGdwdV9hdHB4X2RncHVfcmVxX3Bvd2VyX2Zvcl9kaXNwbGF5cygp
KSB7CisJCQlpZiAoYWRldi0+ZmxhZ3MgJiBBTURfSVNfUFgpIHsKIAkJCQlwbV9ydW50aW1lX2dl
dF9zeW5jKGFkZXYtPmRkZXYtPmRldik7CiAJCQkJLyogSnVzdCBmaXJlIG9mZiBhIHVldmVudCBh
bmQgbGV0IHVzZXJzcGFjZSB0ZWxsIHVzIHdoYXQgdG8gZG8gKi8KIAkJCQlkcm1faGVscGVyX2hw
ZF9pcnFfZXZlbnQoYWRldi0+ZGRldik7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
