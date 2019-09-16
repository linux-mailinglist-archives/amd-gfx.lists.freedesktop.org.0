Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E94B412D
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 21:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2846E6EA5B;
	Mon, 16 Sep 2019 19:35:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760083.outbound.protection.outlook.com [40.107.76.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2086EA5B
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 19:35:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDNA5jq+oHSjPvDzUoqSMGUjtnRgW8bnLYzS1DWMHnK5dvE8ngUoe/7jUuRJnCvMjBT2uS0Jej8Ke9qW0H4xMW0w67Bs9+jJ82XoriW5skjqqTf5DWZ0n/1lCiraoITSsM0IByD8KkwAI1oPuCibXl2x2u49Z5EQg8eMXXvzDJMxtnVwjg9+cWJZbRni0S80uH0jNJm39bUqVGpB4i1CQzRSvIOitvHJyjPFfNTQadIoFYvtXAcn4rQtXmQedGat5tZv6ar0Q8gifu1mscVKk3CFFBIxOtC0bXYrtbP942wp1GZ34+LqxFYSUlOEAR1jJ8uMg4NXlXMW2uoRNW6RKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2WXoHZ0JDOQo7qxP+/Zr4G9ZCQ+6jdRc7qLyc0tmVg=;
 b=O426JMQEIiwi8yALLvX4+Rl3C528Acy4HIh5CDjpjYFv/ziSopGPNAYQT5GPhv7e85kuVSELZjJcswsPUKxj0q9ly7EyYIVuzwce4uL4KbLTQygac9VzDQ41O6X50qzEGYzlMtgITNh2mt790ywPJ2vfFQ6XTPwsnBfOqZ6lnMsww8v0rUWwbpxQKCMBXnVr0NrT1Bg98ij3H5K8ag2WOZVTn+qjz7Hd+OOhPns6lMbo4gvP8tjlPsOMQSw2234/cgLd8TkQQ6T+PhXJQc18kQ5gYnq3Is6DuI+jhHhmMIWhsMC6yBqVEzPvuSs5RkNVdxAzm0MYi4el/tR1nU3V4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0011.namprd12.prod.outlook.com (2603:10b6:4:1::21) by
 DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Mon, 16 Sep 2019 19:35:39 +0000
Received: from CO1NAM03FT039.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM5PR12CA0011.outlook.office365.com
 (2603:10b6:4:1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.15 via Frontend
 Transport; Mon, 16 Sep 2019 19:35:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT039.mail.protection.outlook.com (10.152.81.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Mon, 16 Sep 2019 19:35:38 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 16 Sep 2019 14:35:37 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix regression crash on boot.
Date: Mon, 16 Sep 2019 15:35:36 -0400
Message-ID: <1568662536-12356-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(428003)(199004)(189003)(356004)(426003)(26005)(53936002)(54906003)(14444005)(476003)(126002)(5660300002)(486006)(70206006)(70586007)(44832011)(50226002)(86362001)(305945005)(6916009)(8936002)(53416004)(8676002)(336012)(2616005)(48376002)(478600001)(186003)(4744005)(81166006)(81156014)(16586007)(50466002)(2351001)(47776003)(316002)(2906002)(36756003)(4326008)(7696005)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4299; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fe23d7a-5151-4daa-8edc-08d73add0dd8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM6PR12MB4299; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB4299:
X-Microsoft-Antispam-PRVS: <DM6PR12MB42994D40EE43D7D51DCF8A60EA8C0@DM6PR12MB4299.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-Forefront-PRVS: 0162ACCC24
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: j7UOa+y/ksFhYDway5h2DDRYaPRnjxYXLbeq7E2ppXRYe334x4SmAMvxisrj0oC/Vya180fx4zELA/cVp4y0/Yix+HiKy5o0FE5vQMwJB7lbzYjMcLfDug/SyoS7Ru6fnqDogfMaoEHvkbCh0E/bMTSubVVII1UZto6vhMU/dHbbKM1R9WqzKJvD80gFQ5rjVgO98kS3TNlenY/Gg5j9EU/5cHWQX8TzUk3kAguXiEcPqtYTSD0AHP4bBQh52HCzzXxAsEkjybKQfASSGwjlcbkbf7QC7BMOyxss1mk3pJs5jqrBcKqyjJaPE+mQ1ux/aK+mRAQbjKQC7RrlKX0z/9pd+rIminA6w4iLkv3c2F48T4CGSm/Z9yNxiF0L1yYDnKRgYO4p1bh36fBVOmXnuiDYAQBhQzFc5ZtTU6nVcjg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2019 19:35:38.8702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe23d7a-5151-4daa-8edc-08d73add0dd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2WXoHZ0JDOQo7qxP+/Zr4G9ZCQ+6jdRc7qLyc0tmVg=;
 b=GxcGARtCR2Gk2damU7ajTNG9VWaTZjK/xACqm1wW9xWUOOptaJ8w2ZbNHbthFmgYYZA/c3ZDgci09c+vXIvBj0xMaptzgTCMMicrAzrB1H96BfpCKC7pqgWz3CQrcg5jgh2QKOdfixzlxunNuKeNIuFNMPcp98F6KGKP0u5aXmc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: ckoenig.leichtzumerken@gmail.com,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVncmVzc2lvbiBvbiBWZWdhMjAgY2F1c2VkIGJ5IDBkOWE4MDIxMzgyOWUwOTJjMWE4NTE2NmI2
NjBlYmYyYzdhZjU3M2UuCk5vdCBzZXR0aW5nIEJPIHB0ciB0byBudWxsIHdpbGwgY29uZnVzZSBh
bWRncHVfYm9fY3JlYXRlX3Jlc2VydmVkLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCmlu
ZGV4IDUxZDY0YTYuLjFkZmIxYmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmMKQEAgLTEzODcsNyArMTM4Nyw3IEBAIGludCBhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3Bh
Z2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXN0cnVjdCBhbWRncHVfcmFzICpjb24g
PSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYpOwogCXN0cnVjdCByYXNfZXJyX2hhbmRsZXJf
ZGF0YSAqZGF0YTsKIAl1aW50NjRfdCBicDsKLQlzdHJ1Y3QgYW1kZ3B1X2JvICpibzsKKwlzdHJ1
Y3QgYW1kZ3B1X2JvICpibyA9IE5VTEw7CiAJaW50IGksIHJldCA9IDA7CiAKIAlpZiAoIWNvbiB8
fCAhY29uLT5laF9kYXRhKQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
