Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A13C7DABB
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 13:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A786E560;
	Thu,  1 Aug 2019 11:55:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38E06E560
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 11:55:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyBopkXiqkenXRBAZTU66NWblLGL6nH4WjRbvI33twCPDcTeYu55q9XIgOjnR2X5irok3On7r6xnWehxf57C3xrK0idrfOQ6ukb6k+n/1X0+ulI7v+5QZE3RRvwsygh7SGI3W7aqdPZXa8b+jn79XV1O9L+lm26Qojz+7yOeYkusz9OtAnuT/tPLQJz9LSQAm0BzqccwOXw9IMqVcn2yW43IbJLEc8e0xX8GGCKpAXB7Soq3NOJAG93x83bkFUNTCRBcLW3cXd9nwKGBRzwnuelwVAdKiPdpDFgQnhGD+JApUBAnO43jUkBjAfmjvvupZQ5RAT3U127f/ODZTZhjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCx7tuQOdGXX15eAg5OXLEjpf5+lM80p+kQA5J/cjts=;
 b=KHKvlNjqGgFR86RHvd7Wom1LtFezteijX4fG0qczSqkoq2JQ+0+qilmuOcnXufcGH0BvRD7rr9elX+iR1w2imQ0nUbfdD4kyDwSU+YruLo5nLOgBz6EJSbt8F9JfTFAe+PkDZs+xA0t1ioVERoJg94XjxpBhC/fLRcSIlBdQTJZ2dmVrE123d2zIw1RantCczmah3dMi66mFMvW/sHbg229KFL9Ph/g3GdPS3yFknmGiVN/3rcazNT2AVDZigk4+dc57nX7w0j+3MNOD1G1rBCRxCtAQrCbAYtAq17XFdXU5vUd0N/tkR8a8livM3sU9I5kjvrFib8vX77BpxrTLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0075.namprd12.prod.outlook.com (2603:10b6:802:20::46)
 by DM6PR12MB3514.namprd12.prod.outlook.com (2603:10b6:5:18a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14; Thu, 1 Aug
 2019 11:55:52 +0000
Received: from CO1NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by SN1PR12CA0075.outlook.office365.com
 (2603:10b6:802:20::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.15 via Frontend
 Transport; Thu, 1 Aug 2019 11:55:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT052.mail.protection.outlook.com (10.152.81.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 11:55:51 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 06:55:49 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 5/5] drm/amdgpu: replace AMDGPU_RAS_UE with AMDGPU_RAS_SUCCESS
Date: Thu, 1 Aug 2019 19:54:54 +0800
Message-ID: <20190801115454.21867-6-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801115454.21867-1-tao.zhou1@amd.com>
References: <20190801115454.21867-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(7696005)(51416003)(476003)(446003)(6636002)(336012)(70206006)(478600001)(8676002)(126002)(8936002)(426003)(5660300002)(81166006)(305945005)(186003)(86362001)(11346002)(81156014)(2616005)(1076003)(486006)(50226002)(26005)(356004)(4326008)(68736007)(53936002)(316002)(70586007)(110136005)(6666004)(2201001)(16586007)(36756003)(76176011)(47776003)(50466002)(53416004)(48376002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3514; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 561a5918-1a82-4ae0-e64c-08d71677334e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB3514; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3514:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3514C3EB54E70C5EDFE4ECB8B0DE0@DM6PR12MB3514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: m1Kw7TnDaibOOlUliKl/6i5ct/v+OwGdBSwk2U2V7X3FBt/PyU1KDLVKfeM7dxaAxFxA2aQFiXhySjEOJbf5qvjgmtvyln5PlsJNLH/xI21gu4Nl1fLkWudt4jI3zbCSlo21L2DIi1JNiMWdHjYjDi0rbiKx8cLuMzvSg3DjN7l3O+GILlOIk6IClnLpio8wdrVK0A5mo/BOoHdtfQFacTIcW35inXNE5b7Z7Q75ZESWtbOR/GZlhroYRmkoTpXvdYznGcRxRcCNNVtrZKmtrOv29TWlqNVRPBdS0SDefY6oKjip09GVrlaawwQV3U4nU/XlzyEFVUULzQQFTQTIl24m4/BsdcJGzwF1SrSoEk2DqSeOMjLv/aZTD5AAlXra9XbBh2z2EXQhnmlMV9Sbq6tqgwb8QarJr/LZhuL2HJo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 11:55:51.1975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 561a5918-1a82-4ae0-e64c-08d71677334e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3514
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCx7tuQOdGXX15eAg5OXLEjpf5+lM80p+kQA5J/cjts=;
 b=0I/uZBLuLc/Y6e0YXmTd43LrF9fejKbMdb23fU82ZL669CktwcTlCIiRFfWlnFMd6asZ218U/12EEn9O+6zJabRNqdjtx6fUfzv32H+E3JOEnZeqSTtJQAJTY7xS8rtvJQHptHBHPQVUFxhrSCvg7NPU6JL7O9qShLKKDHM+7EY=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y2UgY2FuIGFsc28gdHJpZ2dlciBpbnRlcnJ1cHQsIGFuZCBldmVuIGJvdGggY2UgYW5kIHVlIGVy
cm9yIGNhbiBiZQpmb3VuZCBpbiBvbmUgcmFzIHF1ZXJ5LCBkaXN0aW5ndWlzaGluZyBiZXR3ZWVu
IGNlIGFuZCB1ZSBpbiBpbnRlcnJ1cHQKaGFuZGxlciBpcyB1bmNlc3NhcnkuCgpTaWduZWQtb2Zm
LWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y5XzAuYyAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAu
YyAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgIHwgMiAr
LQogNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCmluZGV4IDRhMGRjNTI2OWRkZi4uZDJl
OGE4NWY2ZTM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC0x
MDQ2LDcgKzEwNDYsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfcmFzX2ludGVycnVwdF9oYW5kbGVy
KHN0cnVjdCByYXNfbWFuYWdlciAqb2JqKQogCQkJICogQnV0IGxlYXZlIElQIGRvIHRoYXQgcmVj
b3ZlcnksIGhlcmUgd2UganVzdCBkaXNwYXRjaAogCQkJICogdGhlIGVycm9yLgogCQkJICovCi0J
CQlpZiAocmV0ID09IEFNREdQVV9SQVNfVUUpIHsKKwkJCWlmIChyZXQgPT0gQU1ER1BVX1JBU19T
VUNDRVNTKSB7CiAJCQkJLyogdGhlc2UgY291bnRzIGNvdWxkIGJlIGxlZnQgYXMgMCBpZgogCQkJ
CSAqIHNvbWUgYmxvY2tzIGRvIG5vdCBjb3VudCBlcnJvciBudW1iZXIKIAkJCQkgKi8KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IGJjZDAzMDFlZWUxZS4uZTYwOTIwZDU3
YjhmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTU2NDcsNyArNTY0
Nyw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfcHJvY2Vzc19yYXNfZGF0YV9jYihzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKIAlpZiAoYWRldi0+Z2Z4LmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3Jf
Y291bnQpCiAJCWFkZXYtPmdmeC5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50KGFkZXYsIGVy
cl9kYXRhKTsKIAlhbWRncHVfcmFzX3Jlc2V0X2dwdShhZGV2LCAwKTsKLQlyZXR1cm4gQU1ER1BV
X1JBU19VRTsKKwlyZXR1cm4gQU1ER1BVX1JBU19TVUNDRVNTOwogfQogCiBzdGF0aWMgY29uc3Qg
c3RydWN0IHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCmluZGV4IGI2ZWRhZDhi
YjMxYy4uYTIxOWJhYjgyMzEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMK
QEAgLTI1NSw3ICsyNTUsNyBAQCBzdGF0aWMgaW50IGdtY192OV8wX3Byb2Nlc3NfcmFzX2RhdGFf
Y2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJaWYgKGVycl9kYXRhLT51ZV9jb3VudCkK
IAkJYW1kZ3B1X3Jhc19yZXNldF9ncHUoYWRldiwgMCk7CiAKLQlyZXR1cm4gQU1ER1BVX1JBU19V
RTsKKwlyZXR1cm4gQU1ER1BVX1JBU19TVUNDRVNTOwogfQogCiBzdGF0aWMgaW50IGdtY192OV8w
X3Byb2Nlc3NfZWNjX2lycShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvc2RtYV92NF8wLmMKaW5kZXggMmZmYzlhNDFkOGIxLi43YWNiODU0YTI5Nzkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCkBAIC0xOTgyLDcgKzE5ODIs
NyBAQCBzdGF0aWMgaW50IHNkbWFfdjRfMF9wcm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAogCiAJYW1kZ3B1X3Jhc19yZXNldF9ncHUoYWRldiwgMCk7CiAKLQly
ZXR1cm4gQU1ER1BVX1JBU19VRTsKKwlyZXR1cm4gQU1ER1BVX1JBU19TVUNDRVNTOwogfQogCiBz
dGF0aWMgaW50IHNkbWFfdjRfMF9wcm9jZXNzX2VjY19pcnEoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
