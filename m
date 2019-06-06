Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF5D37F15
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F08D8991C;
	Thu,  6 Jun 2019 20:55:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710052.outbound.protection.outlook.com [40.107.71.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F7989911
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:29 +0000 (UTC)
Received: from CY4PR12CA0034.namprd12.prod.outlook.com (2603:10b6:903:129::20)
 by MWHPR1201MB0064.namprd12.prod.outlook.com (2603:10b6:301:58::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.14; Thu, 6 Jun
 2019 20:55:27 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR12CA0034.outlook.office365.com
 (2603:10b6:903:129::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:26 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:10 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/24] drm/amd/display: Gamma logic limitations causing
 unintended use of RAM over ROM.
Date: Thu, 6 Jun 2019 16:54:56 -0400
Message-ID: <20190606205501.16505-20-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(14444005)(16586007)(2351001)(6916009)(70206006)(1076003)(5660300002)(50466002)(70586007)(305945005)(86362001)(48376002)(2906002)(47776003)(6666004)(356004)(4326008)(8936002)(478600001)(50226002)(53936002)(53416004)(316002)(72206003)(36756003)(8676002)(81156014)(81166006)(126002)(77096007)(11346002)(186003)(486006)(26005)(2616005)(446003)(51416003)(7696005)(68736007)(426003)(476003)(76176011)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0064; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13486ce9-a2ef-4f05-7a08-08d6eac14d8c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB0064; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0064:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB00640B2A960CB12A970F387CF9170@MWHPR1201MB0064.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bJQZzaNrV/iB+pu+B8Ix2Q8OBbrTnNoOfY6mAiNJSb2f9ur8jzoXqWGsVQSo0TwLVCimnWftUorp5EhDC/AyS0D2BgRAJzLAXR+ogwqHHh18gbbYq0KS6A7umRxEWLFGke1iNpZo04czC+qBpswz2xdMuST7UsY0lNsK36fr9UG4gjDfXIo2ljFArRZKzFVYmNPaByL+eAo7bbz7ylI9tnZHbpslJEeVCvu8P4tYKhuxsrEr3BcGfixKkTScSDo9O6r/dUph7PD0gHoDSR4aWWDnjZEa8wSTjVM7u9dvYyKKK6ewYLpFDgrtINZrjsMQFK+mCKc5N7NiiXpJdba6vE9daXRiZVWkBi7mdaNjz+Xgsp4QM3mVaIeRbamU9qIIF4GnqWpCFcdYM7rnMCW206371SM1gIPq0GcbFyU3Dn8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:26.8787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13486ce9-a2ef-4f05-7a08-08d6eac14d8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0064
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWAPok6UHyOhEEG9c3zbJ8w7N5aYO/2lIhnPwnS8lGY=;
 b=1KTUS8TnL0mO8RIhEOYt76cyI2GMUdJLQzkvX340a5VcY7HBi1t7ZMN/BAVf9/CwNucOmBCAjH6DC+N+gx7loKTi0l6iytnqZN+AI4jFcLAPGlWKQtpmq685skKtDJ03tRPWwnnYQgHZVutYylsmYEgGKCUQLh67PzKT9hoyjHs=
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
Cc: Harmanprit Tatla <harmanprit.tatla@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGFybWFucHJpdCBUYXRsYSA8aGFybWFucHJpdC50YXRsYUBhbWQuY29tPgoKW1doeV0K
T3VyIGV4aXN0aW5nIGxvZ2ljIGluIGRlY2lkaW5nIHdoZXRoZXIgdG8gdXNlIFJBTSBvciBST00K
ZGVwZW5kcyBvbiB3aGV0aGVyIHdlIGFyZSBkZWFsaW5nIHdpdGggYW4gaWRlbnRpdHkgZ2FtbWEg
cmFtcC4KCltIb3ddCkluIGFkZGl0aW9uIHRvIHRoZSBpc19pZGVudGl0eSBmbGFnCmEgbmV3IGlz
X2xvZ2ljYWxfaWRlbnRpdHkgZmxhZyBoYXMgYmVlbgphZGRlZC4gVGhlIGlzX2lkZW50aXR5IGZs
YWcgbm93IGRlbm90ZXMKd2hldGhlciB0aGUgT1MgZ2FtbWEgaXMgYW4gUkdCMjU2IGlkZW50aXR5
CmFuZCB0aGUgbmV3IGxvZ2ljYWwgaWRlbnRpdHkgd2lsbCBpbmlkaWNhdGUKdGhhdCB0aGUgZ2l2
ZW4gZ2FtbWEgcmFtcCByZWdhcmRsZXNzIG9mIGl0cwp0eXBlIGlzIGlkZW50aXR5LgoKU2lnbmVk
LW9mZi1ieTogSGFybWFucHJpdCBUYXRsYSA8aGFybWFucHJpdC50YXRsYUBhbWQuY29tPgpSZXZp
ZXdlZC1ieTogS3J1bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4KQWNrZWQt
Ynk6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJl
ZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjX2h3X3R5cGVzLmggICAgICAgICAgICB8IDQgKysrKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYyB8IDMgKyst
CiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19od190eXBlcy5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2h3X3R5cGVzLmgKaW5kZXggNDc5YzVmODM1
MmY5Li44MjFkNGYyNjA3NjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY19od190eXBlcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y19od190eXBlcy5oCkBAIC00NTMsNyArNDUzLDExIEBAIHN0cnVjdCBkY19nYW1tYSB7CiAJLyog
cHJpdmF0ZSB0byBEQyBjb3JlICovCiAJc3RydWN0IGRjX2NvbnRleHQgKmN0eDsKIAorCS8qIGlz
X2lkZW50aXR5IGlzIHVzZWQgZm9yIFJHQjI1NiBnYW1tYSBpZGVudGl0eSB3aGljaCBjYW4gYWxz
byBiZSBwcm9ncmFtbWVkIGluIElOUFVUX0xVVC4KKwkgKiBpc19sb2dpY2FsX2lkZW50aXR5IGlu
ZGljYXRlcyB0aGUgZ2l2ZW4gZ2FtbWEgcmFtcCByZWdhcmRsZXNzIG9mIHR5cGUgaXMgaWRlbnRp
dHkuCisJICovCiAJYm9vbCBpc19pZGVudGl0eTsKKwlib29sIGlzX2xvZ2ljYWxfaWRlbnRpdHk7
CiB9OwogCiAvKiBVc2VkIGJ5IGJvdGggaXBwIGFtZCBvcHAgZnVuY3Rpb25zKi8KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1h
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1t
YS5jCmluZGV4IDg2MDFkMzcxNzc2ZS4uM2Y0MTNmYjlmMmNlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMKQEAg
LTE1NjksNyArMTU2OSw4IEBAIGJvb2wgbW9kX2NvbG9yX2NhbGN1bGF0ZV9yZWdhbW1hX3BhcmFt
cyhzdHJ1Y3QgZGNfdHJhbnNmZXJfZnVuYyAqb3V0cHV0X3RmLAogCQkJb3V0cHV0X3RmLT50ZiA9
PSBUUkFOU0ZFUl9GVU5DVElPTl9TUkdCKSB7CiAJCWlmIChyYW1wID09IE5VTEwpCiAJCQlyZXR1
cm4gdHJ1ZTsKLQkJaWYgKHJhbXAtPmlzX2lkZW50aXR5IHx8ICghbWFwVXNlclJhbXAgJiYgcmFt
cC0+dHlwZSA9PSBHQU1NQV9SR0JfMjU2KSkKKwkJaWYgKChyYW1wLT5pc19sb2dpY2FsX2lkZW50
aXR5KSB8fAorCQkJCSghbWFwVXNlclJhbXAgJiYgcmFtcC0+dHlwZSA9PSBHQU1NQV9SR0JfMjU2
KSkKIAkJCXJldHVybiB0cnVlOwogCX0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
