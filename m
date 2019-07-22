Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694296F7D2
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 05:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C02899DC;
	Mon, 22 Jul 2019 03:16:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A64899DC
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 03:16:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPUK50Zmg33Xv3QYbnTiJ7ZiHTuWZyYbhvTMVwdyeudkfh5j+tvAEppgQ4kcsnq1HjufjpSA64mzDcuz0XoHyClgpi7KAaONmiKI9Dz9rpxFKd7F2ZSO4L+KCOYPl76Injd3UeeYMbFAEzYOCHDnjcUR/ZZKm1YfW+MID1isCCLLAiid4lbQ8DcnSQQPo3bXG3QprXD8bUYawyDcW4+9oHE90OjJAaqR/aSNDv45qM/o81uI+u2U6PZHV2j1tbIgQxNppoW9dhieTXDDbXhxmolDCFswGIOL+0A2B380wAWe/hfgQ/pZrfEmjn+QGuhfot3hjXHG07nTQZOGT/Z4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOlUnI6uJgQImsIfjIPDFoNCsNdUZ9U7IBTIyX/ZuB0=;
 b=CYIfOgCeIipYFu4W7HIOeuAZx/F+H/ovwi0jYK4x5uOg6SaZ1ln1GomeOhI8NV4VVNjJIeqVwww1IBywg6oEOmBZ598mbgIwQoSQmEqpHEquTaXFW8sw5lQ8NBFpMnEWMjKQqWdNcgMIdKZL9e/PXAIAnHkBsEnH4YhMhVKuNv0ZRfwt4JxxyiQhfucHUM16T3n+A3b03KqHcy1Rpd0esY8Vj/EyBEXIupdGsSOaex0BbZ1xmTTDKi6T+tcwVUcBRI5mK4XjFp9eFIAmkGYz29RcSQeOgspI2zsSbSE2/Fsnt1Hp4XMmXH7CoofifIcURN8lA/V6ZAyO9B7Dz6ktKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN4PR12CA0006.namprd12.prod.outlook.com (2603:10b6:403:2::16)
 by CY4PR12MB1303.namprd12.prod.outlook.com (2603:10b6:903:40::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Mon, 22 Jul
 2019 03:16:03 +0000
Received: from DM3NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by BN4PR12CA0006.outlook.office365.com
 (2603:10b6:403:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Mon, 22 Jul 2019 03:16:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT061.mail.protection.outlook.com (10.152.83.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 22 Jul 2019 03:16:01 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Sun, 21 Jul 2019
 22:15:58 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/5] drm/amd/powerplay: support VCN powergate status retrieval
 for SW SMU
Date: Mon, 22 Jul 2019 11:15:29 +0800
Message-ID: <20190722031531.23437-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722031531.23437-1-evan.quan@amd.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(54906003)(316002)(36756003)(2906002)(50466002)(356004)(305945005)(86362001)(44832011)(4744005)(76176011)(6666004)(2351001)(7696005)(51416003)(26005)(6916009)(486006)(186003)(478600001)(126002)(476003)(2616005)(1076003)(47776003)(11346002)(446003)(2870700001)(336012)(426003)(53416004)(8676002)(8936002)(48376002)(4326008)(70206006)(81166006)(81156014)(5660300002)(70586007)(53936002)(68736007)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1303; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2301963c-5df0-49e8-ecdb-08d70e52ecf2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1303; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1303:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1303F4F013855E346C8711B8E4C40@CY4PR12MB1303.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hc1xS2ZitWmgTfI/KHM0WhcRYhCtbXFNCzUQqj67ClG3l/4yKHEDHf05uMFJFNIavH41e1/IHbsPtnJxx6ygTn+xpZ6we5PNuc18BHr3MDpZ8BPUuBYR/JO7SjX4H4dfhvEOfPS/k3eIbVMDXJUUiBy/U/Fm9D3UQx4ThHO3d4xXK1ZMSBk8gbheHzqCa7zfCf/cKb5WULbszHdYcrUntpvN23ttMsNd6cG22d0mYKnViFx6jM9bIT3OSC6fRAJpUVCGFljBY+imx2/YaUygo+MpirgL8RmUvMVsCX1X/3xIJ4EF+CKoVvSeL796lwkspyWcq+G/MCGZYZE2Ako0JOM06JzdKRi4PkdZKcCuHKD934VaD7Fyphlp7QGgTz1eTjkq9GduyJxZTqO/5vFKcAzsPsS0sVdXqB1WXquiMls=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 03:16:01.7656 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2301963c-5df0-49e8-ecdb-08d70e52ecf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1303
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOlUnI6uJgQImsIfjIPDFoNCsNdUZ9U7IBTIyX/ZuB0=;
 b=m9Yr3VuaK854JqcI2a9LQj8Xy1vyAGwqEQ8WkUDaU0A/4pRi9p27XQYZQk9+QCTqLAZFGBTJ/ExFCJ5dvklfcOM5Dc/0xy4+zqjFMq31n9QSzSrPqBwbOIwjn1qtGCXKDGp7N8JapVCDGBSFnwFTBvMU6SNsMaXgAilLtMrU90E=
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
Cc: Alexander.Deucher@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q29tbW9ubHkgdXNlZCBmb3IgVkNOIHBvd2VyZ2F0ZSBzdGF0dXMgcmV0cmlldmFsIGZvciBTVyBT
TVUuCgpDaGFuZ2UtSWQ6IEliYzJmNDk4ODQ4ZjcyOGViNzcyN2NkM2ZhODg5ZTkxYTJiMDlkMDdi
ClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgNCArKysrCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jCmluZGV4IDQxNmY5YTgzN2ZhOC4uNGUxOGYzM2ExYmFiIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC0zMzYsNiArMzM2LDEwIEBAIGlu
dCBzbXVfY29tbW9uX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIGFt
ZF9wcF9zZW5zb3JzIHNlbnNvciwKIAkJKih1aW50MzJfdCAqKWRhdGEgPSBzbXVfZmVhdHVyZV9p
c19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfRFBNX1ZDRV9CSVQpID8gMSA6IDA7CiAJCSpzaXpl
ID0gNDsKIAkJYnJlYWs7CisJY2FzZSBBTURHUFVfUFBfU0VOU09SX1ZDTl9QT1dFUjoKKwkJKih1
aW50MzJfdCAqKWRhdGEgPSBzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVf
VkNOX1BHX0JJVCkgPyAxIDogMDsKKwkJKnNpemUgPSA0OworCQlicmVhazsKIAlkZWZhdWx0Ogog
CQlyZXQgPSAtRUlOVkFMOwogCQlicmVhazsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
