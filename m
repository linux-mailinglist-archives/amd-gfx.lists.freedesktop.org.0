Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79AAB802F
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 19:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF62D6F385;
	Thu, 19 Sep 2019 17:43:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700057.outbound.protection.outlook.com [40.107.70.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BE76F385
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 17:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jc6DL4E5l4Gvs1Pajs9BT2BGC8zWh/F3Sdd4rvj2RCC2jPxgxkTdXeXi0FqgTWt5/WL+CQxCR2JNY1rWdf2akOE50R5GTCjzo7G9zGMYW8hQFs6Qbn5iZzkMqdVIg55XLB5l5hi0fkLyVUyE+Xru3gyYpEtEdQMHagf9v3uLY1OTVaVuBSzukDNJbz3ZBxwQVP3w0RNCKIw21zqRrf9EjhTy7bIt5fGd4T+k2mUBIqk8mV/7KFLBiUOV6HAwQsK3C8XS+55XMlKrcOisaWLbadp1eIfUikJMspPhuTnJ3ydE9/UeH8iovZCYl0J/JkTFzlDOWSeHhFEpXeMB9Azvcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgKAutN7yJIeYg8PYMzPvVRkh8ACiiz8bPLE/HogLHk=;
 b=KxGqDIl/tTxDqBKKdqhyHFeyhkuNZxytXCDtm9Lqpht+cXlx4vwVYuxam/8yaYOzWc9ilFpuMQ3/uN0GM/xNW8YO1fTVq5L6CB28qC/VjTQKNcZsO69caVBzERiwIwKY0krCadmgpTp0NnkI1qWtDC3uRXUdLn0VfQGhX8R+1b6kye2jrr/9sesC8BYBHh/a253LfWvXY++vNnhC0ANht3B4dW+R3Rgfu45N/oGf8Pkis6dbrKaLSMZwnktkqBBxZs0f4oWMb0QRNPvMp9UdrM0zfPauXib4lYOgJ27Q5DDhZffCkpDB7ixKuJjAGcMjZMownCSFWEMIBzgmkdnvpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0030.namprd12.prod.outlook.com (2603:10b6:610:57::40)
 by BN6PR12MB1460.namprd12.prod.outlook.com (2603:10b6:405:11::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.23; Thu, 19 Sep
 2019 17:43:09 +0000
Received: from CO1NAM03FT024.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by CH2PR12CA0030.outlook.office365.com
 (2603:10b6:610:57::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Thu, 19 Sep 2019 17:43:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT024.mail.protection.outlook.com (10.152.80.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 17:43:08 +0000
Received: from hwentlanhp.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 19 Sep 2019
 12:43:05 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display; Fix kernel doc warnings
Date: Thu, 19 Sep 2019 13:42:44 -0400
Message-ID: <20190919174244.30192-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(428003)(189003)(199004)(1076003)(5660300002)(6916009)(6666004)(48376002)(356004)(186003)(2870700001)(26005)(36756003)(2906002)(486006)(44832011)(14444005)(2351001)(53416004)(50226002)(316002)(51416003)(47776003)(4326008)(54906003)(81156014)(7696005)(336012)(305945005)(8676002)(81166006)(8936002)(478600001)(50466002)(426003)(70586007)(476003)(70206006)(2616005)(126002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1460; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac6942e6-fca8-484e-f3ae-08d73d28d58a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1460; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1460:
X-Microsoft-Antispam-PRVS: <BN6PR12MB14607476B07254911522160B8C890@BN6PR12MB1460.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 016572D96D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Dy2zzxPcifCHkjyT1iPp5Ra8hvj0cUXESX+Vw1HKuSkaH9OMLwe7T1kuyrLPE0a2ewwdKk5Axl53Yw1yOKHosKfErvFyqlzO56sh9ndNsibd5vlmJMGIrHNkmeuvZMNWoOQjMQK4SbW4cTXVsnexJHVj+aQVxx/eF1j9xvEXULRXIDU2JOL5NTduWiMamkpXCqpOGUBBYm2eO02AacQ/9LT2V6/q4Hg3i159LBYjgheiGTxcIxuEiyFRyttabwNfgGAW9jHZmxW1O0SR8LRJKTBVjtseMs3mnpwQCuoH8ZTHazDT+bnRGvbxfNY7zIaiMIfGdYRf2hbdaudK7vs5x4srKkLT+GFDUwlPQrAUXyhaOj2UkEfTfg39jCkPBj9HGTQwcyM9M4vVdthUEKmy/U2yaiMnpZqv6Q7ISArk04s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 17:43:08.4752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6942e6-fca8-484e-f3ae-08d73d28d58a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1460
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgKAutN7yJIeYg8PYMzPvVRkh8ACiiz8bPLE/HogLHk=;
 b=a/NkMLl6tZNZbqcN/ngTumBPlnvtIM/DyarBX6Y/0GHs+6Z1MyA8U8V4DS/8Hvbj1vrvjLLz3sWWQRUpFX9q24MUgQyOje6ftL6Tx+dUtKr94USBkQPMSa3g2SJdTLwDhY9sRimiuqV3uY1hBf0X0Fkn59B10hxXLkez7QW4Wa4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=permerror action=none header.from=amd.com;
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
Cc: Harry Wentland <harry.wentland@amd.com>, daniel@ffwll.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgaGFkIGEgY291cGxlIG9mIG1pc3NpbmcgZGVmaW5pdGlvbnMgYW5kIGZvcm1hdHRpbmcgZXJy
b3JzLgoKU2lnbmVkLW9mZi1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YyB8IDE0ICsrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5oIHwgMTAgKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggN2Q2MmI0ZTg2Mzg2Li45MjhhODdmODlm
MzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwpAQCAtMjYxLDYgKzI2MSwxMyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgYW1kZ3B1X2Rt
X3Zycl9hY3RpdmUoc3RydWN0IGRtX2NydGNfc3RhdGUgKmRtX3N0YXRlKQogCSAgICAgICBkbV9z
dGF0ZS0+ZnJlZXN5bmNfY29uZmlnLnN0YXRlID09IFZSUl9TVEFURV9BQ1RJVkVfRklYRUQ7CiB9
CiAKKy8qKgorICogZG1fcGZsaXBfaGlnaF9pcnEoKSAtIEhhbmRsZSBwYWdlZmxpcCBpbnRlcnJ1
cHQKKyAqIEBpbnRlcnJ1cHRfcGFyYW1zOiBpZ25vcmVkCisgKgorICogSGFuZGxlcyB0aGUgcGFn
ZWZsaXAgaW50ZXJydXB0IGJ5IG5vdGZ5aW5nIGFsbCBpbnRlcmVzdGVkIHBhcnRpZXMKKyAqIHRo
YXQgdGhlIHBhZ2VmbGlwIGhhcyBiZWVuIGNvbXBsZXRlZC4KKyAqLwogc3RhdGljIHZvaWQgZG1f
cGZsaXBfaGlnaF9pcnEodm9pZCAqaW50ZXJydXB0X3BhcmFtcykKIHsKIAlzdHJ1Y3QgYW1kZ3B1
X2NydGMgKmFtZGdwdV9jcnRjOwpAQCAtNDA1LDYgKzQxMiwxMyBAQCBzdGF0aWMgdm9pZCBkbV92
dXBkYXRlX2hpZ2hfaXJxKHZvaWQgKmludGVycnVwdF9wYXJhbXMpCiAJfQogfQogCisvKioKKyAq
IGRtX2NydGNfaGlnaF9pcnEoKSAtIEhhbmRsZXMgQ1JUQyBpbnRlcnJ1cHQKKyAqIEBpbnRlcnJ1
cHRfcGFyYW1zOiBpZ25vcmVkCisgKgorICogSGFuZGxlcyB0aGUgQ1JUQy9WU1lOQyBpbnRlcnJ1
cHQgYnkgbm90ZnlpbmcgRFJNJ3MgVkJMQU5LCisgKiBldmVudCBoYW5kbGVyLgorICovCiBzdGF0
aWMgdm9pZCBkbV9jcnRjX2hpZ2hfaXJxKHZvaWQgKmludGVycnVwdF9wYXJhbXMpCiB7CiAJc3Ry
dWN0IGNvbW1vbl9pcnFfcGFyYW1zICppcnFfcGFyYW1zID0gaW50ZXJydXB0X3BhcmFtczsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oCmlu
ZGV4IDE3YTM1YjUwNDU1Mi4uYWYyMDI1ZjNhYzFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgKQEAgLTEwNSw2ICsxMDUsMTIgQEAg
c3RydWN0IGFtZGdwdV9kbV9iYWNrbGlnaHRfY2FwcyB7CiAgKiBAZGlzcGxheV9pbmRleGVzX251
bTogTWF4IG51bWJlciBvZiBkaXNwbGF5IHN0cmVhbXMgc3VwcG9ydGVkCiAgKiBAaXJxX2hhbmRs
ZXJfbGlzdF90YWJsZV9sb2NrOiBTeW5jaHJvbml6ZXMgYWNjZXNzIHRvIElSUSB0YWJsZXMKICAq
IEBiYWNrbGlnaHRfZGV2OiBCYWNrbGlnaHQgY29udHJvbCBkZXZpY2UKKyAqIEBiYWNrbGlnaHRf
bGluazogTGluayBvbiB3aGljaCB0byBjb250cm9sIGJhY2tsaWdodAorICogQGJhY2tsaWdodF9j
YXBzOiBDYXBhYmlsaXRpZXMgb2YgdGhlIGJhY2tsaWdodCBkZXZpY2UKKyAqIEBmcmVlc3luY19t
b2R1bGU6IE1vZHVsZSBoYW5kbGluZyBmcmVlc3luYyBjYWxjdWxhdGlvbnMKKyAqIEBmd19kbWN1
OiBSZWZlcmVuY2UgdG8gRE1DVSBmaXJtd2FyZQorICogQGRtY3VfZndfdmVyc2lvbjogVmVyc2lv
biBvZiB0aGUgRE1DVSBmaXJtd2FyZQorICogQHNvY19ib3VuZGluZ19ib3g6IFNPQyBib3VuZGlu
ZyBib3ggdmFsdWVzIHByb3ZpZGVkIGJ5IGdwdV9pbmZvIEZXCiAgKiBAY2FjaGVkX3N0YXRlOiBD
YWNoZXMgZGV2aWNlIGF0b21pYyBzdGF0ZSBmb3Igc3VzcGVuZC9yZXN1bWUKICAqIEBjb21wcmVz
c29yOiBGcmFtZSBidWZmZXIgY29tcHJlc3Npb24gYnVmZmVyLiBTZWUgJnN0cnVjdCBkbV9jb21y
ZXNzb3JfaW5mbwogICovCkBAIC0xMjUsNyArMTMxLDcgQEAgc3RydWN0IGFtZGdwdV9kaXNwbGF5
X21hbmFnZXIgewogCXUxNiBkaXNwbGF5X2luZGV4ZXNfbnVtOwogCiAJLyoqCi0JICogQGF0b21p
Y19vYmoKKwkgKiBAYXRvbWljX29iajoKIAkgKgogCSAqIEluIGNvbWJpbmF0aW9uIHdpdGggJmRt
X2F0b21pY19zdGF0ZSBpdCBoZWxwcyBtYW5hZ2UKIAkgKiBnbG9iYWwgYXRvbWljIHN0YXRlIHRo
YXQgZG9lc24ndCBtYXAgY2xlYW5seSBpbnRvIGV4aXN0aW5nCkBAIC0yMzEsNiArMjM3LDggQEAg
c3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgewogCXVpbnQzMl90IGRtY3VfZndfdmVyc2lv
bjsKICNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzAKIAkvKioKKwkgKiBAc29jX2JvdW5k
aW5nX2JveDoKKwkgKgogCSAqIGdwdV9pbmZvIEZXIHByb3ZpZGVkIHNvYyBib3VuZGluZyBib3gg
c3RydWN0IG9yIDAgaWYgbm90CiAJICogYXZhaWxhYmxlIGluIEZXCiAJICovCi0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
