Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F980D1A96
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A516EA70;
	Wed,  9 Oct 2019 21:06:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750058.outbound.protection.outlook.com [40.107.75.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95E76EA67
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYJbPlreeZfzSALVsvkULjw7hQIcxTStNDEhBrXFjUg/KAbN3DqHh6f8GefeXIUW9kIC6WmLbE6A6ZZFjyReLBFemwhE8PQXwCP/0iYLY8MamaB8JH712YCdPGbIUuQ/GUY1aQkyOQ7fIc3K3QGEyt98g5D7Mntl+0jX620v3Lz3k0DDmTFyQejam10C9P0dRFL6KTfdjQ2qQWa/etJY6quFgW76cCE/FqkWT2jvEju43P591fUy0MyN/RETXnOH33YqsfnxGsF4MCjDFU+qBSiSi0fyncnn8qJi0COr9ad3Ajk09nUDaycoCxzIs1d3CnIoKEwHQtGGuXDTA1+/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwbgf5ItQ3540/XwjnfAr9GvVGwnKHrrp2r0t9dRyDs=;
 b=Ikg14/rm/4NLHAu/vCrSH6dB9XCa4GC/57r4OpAaxw+8RE10+gtUCC26Pyp6w0j48tqCSyW7oW8vkSJiyvqzLcEwX8nS6zur2kfJ9q0BsBwrfD3eCORCL9HFpKE1b2QTqE8VqRo1AI2z4HZwZqPYSIBrlHuuiJMUG1+wRFzRz5WDy/83i/OV0m8Gv8QEwhtV1GJChO2/GLcOMKe76KLBnp67b7oMrruSiGQ7HwfLyKZBamZ36fKO4M1o4VGN3D/L37NLFqBUKLH68tX/dk7SoDZ03uggV+G6DjLhJNbyAj8GL5amLA+OMS9AaZfClBCzNTsMY57g3txVNjE2IElyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:5:1c0::42)
 by CY4PR12MB1494.namprd12.prod.outlook.com (2603:10b6:910:f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 21:06:28 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM6PR12CA0029.outlook.office365.com
 (2603:10b6:5:1c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:28 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:28 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/26] drm/amd/display: add dummy functions to smu for Renoir
 Silicon Diags
Date: Wed, 9 Oct 2019 17:06:06 -0400
Message-ID: <20191009210613.17929-20-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(428003)(199004)(189003)(6916009)(7696005)(48376002)(305945005)(316002)(1076003)(336012)(8936002)(76176011)(426003)(6666004)(86362001)(5660300002)(51416003)(53416004)(2351001)(356004)(4326008)(26005)(2906002)(54906003)(70586007)(47776003)(36756003)(11346002)(16586007)(476003)(478600001)(446003)(2616005)(126002)(486006)(14444005)(81156014)(186003)(50466002)(70206006)(50226002)(81166006)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1494; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cbb89bf-820b-4b39-3a79-08d74cfc8d74
X-MS-TrafficTypeDiagnostic: CY4PR12MB1494:
X-Microsoft-Antispam-PRVS: <CY4PR12MB149467326E22439E3E94B316F9950@CY4PR12MB1494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: omLqJmLGKfVkKFZy0RCzSkX7F1NHLVzsII6MERm16FNQBhr4k44/guy39K2sMo1uaSeKDbqDRbQKKmJpfgjPpEdbsXrWn6B92VPH6plHCsiP9If6yg5Dgbs730RdQaY8LR9aJYHZ0O2/ZNv1iSBEze70mv37SEDGDJbjDvs4w9u2cS+1W7pQQ+u5LJvuwnUoEFNco0YyaAcqSOjj0DeIB56uvtXNMJ3yWtuKr66InZZcrDDlHbdGVOl2Vnv5GpLMIvsKVpnhmLRv8QHnSFEwgrniQzzxZceS+8wCzCyzHR+JTfnDgaZ8wk5tKm6gsK4Tq2re9F4x0TSfm/ZnJgyWM4NSsEVJliSESKk05IjN4KuhICE0rSTPUTUjWZTuKzLm4VEJvneBeikT/oEyY/aHKJzjVyf2WVGNp7xTh89NuI4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:28.3487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbb89bf-820b-4b39-3a79-08d74cfc8d74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1494
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwbgf5ItQ3540/XwjnfAr9GvVGwnKHrrp2r0t9dRyDs=;
 b=etvpgSDIgoVwzsmyRCsHk7S6vsj/xABetVaNdFYiHrz3hnQE4qH1hpEMN5IKmhp3CDj52jf8uCh5TeQXIwQOUMnTZxzEqAKQzZ1hoh5/ehIiTnbEvWcWJmqwRg3EalO4oYFOyct4w5Gt7Lmxe3A/jsVIpAU7HleAb95um4rTGjs=
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
Cc: sunpeng.li@amd.com, Sung Lee <sung.lee@amd.com>, harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU3VuZyBMZWUgPHN1bmcubGVlQGFtZC5jb20+CgpbV2h5XQpQcmV2aW91c2x5IG9ubHkg
ZHVtbXkgZnVuY3Rpb25zIHdlcmUgYWRkZWQgaW4gRGlhZ3MgZm9yIEZQR0EuCk9uIHNpbGljb24s
IHRoaXMgd291bGQgbGVhZCB0byBhIHNlZ21lbnRhdGlvbiBmYXVsdCBvbiBzaWxpY29uIGRpYWdz
LgoKW0hvd10KQ2hlY2sgaWYgZGlhZ3Mgc2lsaWNvbiBhbmQgaWYgc28sIGFkZCBkdW1teSBmdW5j
dGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBTdW5nIExlZSA8c3VuZy5sZWVAYW1kLmNvbT4KQWNrZWQt
Ynk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2Uu
YwppbmRleCAwMDJlN2ZiNjcwNjguLjI1ZjYyYTNmMmZmYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMKQEAgLTEzOTcs
NyArMTM5Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgcHBfc211X2Z1bmNzICpkY24yMV9wcF9zbXVfY3Jl
YXRlKHN0cnVjdCBkY19jb250ZXh0ICpjdHgpCiAJaWYgKCFwcF9zbXUpCiAJCXJldHVybiBwcF9z
bXU7CiAKLQlpZiAoSVNfRlBHQV9NQVhJTVVTX0RDKGN0eC0+ZGNlX2Vudmlyb25tZW50KSkgewor
CWlmIChJU19GUEdBX01BWElNVVNfREMoY3R4LT5kY2VfZW52aXJvbm1lbnQpIHx8IElTX0RJQUdf
REMoY3R4LT5kY2VfZW52aXJvbm1lbnQpKSB7CiAJCXBwX3NtdS0+Y3R4LnZlciA9IFBQX1NNVV9W
RVJfUk47CiAJCXBwX3NtdS0+cm5fZnVuY3MuZ2V0X2RwbV9jbG9ja190YWJsZSA9IGR1bW15X2dl
dF9kcG1fY2xvY2tfdGFibGU7CiAJCXBwX3NtdS0+cm5fZnVuY3Muc2V0X3dtX3JhbmdlcyA9IGR1
bW15X3NldF93bV9yYW5nZXM7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
