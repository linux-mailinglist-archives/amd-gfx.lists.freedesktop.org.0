Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B6BA36BF
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 14:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF9E6E2BD;
	Fri, 30 Aug 2019 12:26:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4a::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DB96E313
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 12:25:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chxWE0VBLn+jcX0lYtVKI3a6HHu8cAiIFAqZRBuc2s0qnq1CzPpMyLyRwyjtga/VHGusGG3YfKA/TD22Gd86KM6KwhhUhKzIOZ3XMbvagLbx99o8UF6OKfkVPE+7fo4uCUSFDNqW+0scEGQtHwSkxm2sqnk0rWXWgVfXtKzKDvYbhEuphZnd9Ay9mUZitvrgN7XzIltg60ZbOvie1rcZOjKQh2WVvqbTeV6JP43ZfoUOhTuvliRSUEqCO9cObMlxO00IWGWmSVBpj+wnAfnYXr1FlxTYQaJEHzvUvUqAfC7aX4m50J+QBEFcoId+fGpbhcMWE2kakxkgp0EaBHECVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFF8hlCDT1WRnFi3et2W7S1b7DX15qLnp8608bqPVq0=;
 b=ciSCAjv6VE3UuKRVwc+0AKxjOASgqJo+c0qu0U9MIZArSZDyaYCZUiLW6qQlF0irNRiD3H4XeTQnBlRJfo+KKVOaco+VEE0lh987EdEGCGrW6X/LaWhaEkVuxHjW6y+ok7+L25dF3TTiySu4udk9haZfumVVMaaYk2FVS8RlT60XRUiVPQEfd3CW66leW/J1mRS6ELdHnODOBN5yiPVECFK56p+I1j9I0F4a3oKDgwrBf/loSL/rZ/zVN/YkINmPclf+X8HuB2+Wh0SzZ0PK+1NZ7E5ZP/oIuqpsXyE+jrGDdiUAmdVEg2qVdJTs/AThiEyXqegaccpA7EHR6gD9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0056.namprd12.prod.outlook.com (2603:10b6:300:103::18)
 by BN7PR12MB2724.namprd12.prod.outlook.com (2603:10b6:408:31::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Fri, 30 Aug
 2019 12:25:52 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR12CA0056.outlook.office365.com
 (2603:10b6:300:103::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via Frontend
 Transport; Fri, 30 Aug 2019 12:25:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 12:25:52 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 30 Aug 2019
 07:25:51 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <andrey.grodzovsky@amd.com>,
 <guchun.chen@amd.com>, <dennis.li@amd.com>, <hawking.zhang@amd.com>
Subject: [PATCH 4/4] drm/amdgpu: move the call of ras recovery_init and bad
 page reserve to proper place
Date: Fri, 30 Aug 2019 20:24:53 +0800
Message-ID: <20190830122453.19703-5-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830122453.19703-1-tao.zhou1@amd.com>
References: <20190830122453.19703-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(2980300002)(428003)(199004)(189003)(426003)(336012)(36756003)(186003)(70586007)(6636002)(26005)(5660300002)(110136005)(305945005)(47776003)(16586007)(14444005)(70206006)(86362001)(446003)(476003)(2616005)(11346002)(2201001)(126002)(486006)(478600001)(76176011)(316002)(53936002)(50466002)(53416004)(51416003)(7696005)(8676002)(4326008)(81156014)(356004)(81166006)(50226002)(1076003)(8936002)(2906002)(48376002)(79990200002)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2724; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac427541-d778-42a1-730e-08d72d4532de
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2724; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2724:
X-Microsoft-Antispam-PRVS: <BN7PR12MB27247D2E6D490333EB32307CB0BD0@BN7PR12MB2724.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 55E9P7j6HcnWDoxeqY4fNFXIRtzbaqzKJs/5hwkZbqcDflqCzMil0qmsJKO5bEdg6m3gDdBLGWak8rmvKsQPkeP/rnNFYW3oNiJaXkClAbKTgUIuKjBGG+vSzpce8tR7q/ZxM0mciOQ2CNuVAxl7mqKUKEzlqANCXNPeJSlD5IjTxa+HoCDI9IiQQHKIoqyi6wa0mG2o8qQyIqNeEtKUMWZMYkZP92IvRVSOGYBY2/w+jfgliIWx6XnOcF1cVNjRpaEu1DKLYc+ruR8Kx/UxIpIX6NAaZqInKHr+c4fia8VxRsIL3nJeeAzaQtNREfJwWVpHjyWl+t8202lVm6howJVJ7DjFbQj7dxNtPhI40RdA0gEeWwBDaxyqGderkurA3FOpN7CKTRg0am9FuHbsWeDc5IprRTCyGQseCwTUiQPDCevjP5a5uzmgJX8x+ZqJTBXAykHLPMT1HiGyh4akwQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 12:25:52.3695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac427541-d778-42a1-730e-08d72d4532de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2724
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFF8hlCDT1WRnFi3et2W7S1b7DX15qLnp8608bqPVq0=;
 b=T0pbi+GIcVmhILH5CZ4qKadDY7N2AoXfX3uhT4DaSZHTZ/cO2oOcHzsSiQMzcCd8mLxhTyCfa5RWX6dDt071CD/lRrvCEEvzu8O+fyqeySGIOtHD6jvry2TYX3Qo8X//BRAzQwdXcWInlD8MEKKydcL3SmyTICWraGdF9+PrXco=
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

cmFzIHJlY292ZXJ5X2luaXQgc2hvdWxkIGJlIGNhbGxlZCBhZnRlciB0dG0gYW5kIHNtdSBpbml0
LApiYWQgcGFnZSByZXNlcnZlIHNob3VsZCBiZSBwdXQgaW4gZnJvbnQgb2YgZ3B1IHJlc2V0IHNp
bmNlIGkyYwptYXkgYmUgdW5zdGFibGUgZHVyaW5nIGdwdSByZXNldAphZGQgY2xlYW51cCBmb3Ig
cmVjb3ZlcnlfaW5pdCBhbmQgcmVjb3ZlcnlfZmluaQoKU2lnbmVkLW9mZi1ieTogVGFvIFpob3Ug
PHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYyB8IDE2ICsrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYyAgICB8IDI4ICsrKysrKysrKysrKystLS0tLS0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCAgICB8ICA1ICsrKysKIDMgZmlsZXMgY2hhbmdl
ZCwgMzMgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDY3YjA5Y2IyYTllMi4uNGU0ODk1YWM5MjZk
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBAIC0yODk0
LDYgKzI4OTQsMTcgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAkJZ290byBmYWlsZWQ7CiAJfQogCisJLyogcmV0aXJlZCBwYWdlcyB3aWxsIGJl
IGxvYWRlZCBmcm9tIGVlcHJvbSBhbmQgcmVzZXJ2ZWQgaGVyZSwKKwkgKiBuZXcgYm8gbWF5IGJl
IGNyZWF0ZWQsIGl0IHNob3VsZCBiZSBjYWxsZWQgYWZ0ZXIgdHRtIGluaXQsCisJICogYWNjZXNz
aW5nIGVlcHJvbSBhbHNvIHJlbGllcyBvbiBzbXUgKHVubG9jayBpMmMgYnVzKSBhbmQgaXQKKwkg
KiBzaG91bGQgYmUgY2FsbGVkIGFmdGVyIHNtdSBpbml0CisJICoKKwkgKiBOb3RlOiB0aGVvcmV0
aWNhbGx5LCB0aGlzIHNob3VsZCBiZSBjYWxsZWQgYmVmb3JlIGFsbCB2cmFtIGFsbG9jYXRpb25z
CisJICogdG8gcHJvdGVjdCByZXRpcmVkIHBhZ2UgZnJvbSBhYnVzaW5nLCBidXQgdGhlcmUgYXJl
IHNvbWUgYWxsb2NhdGlvbnMKKwkgKiBpbiBmcm9udCBvZiBzbXUgZncgbG9hZGluZworCSAqLwor
CWFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdChhZGV2KTsKKwogCS8qIG11c3Qgc3VjY2VlZC4gKi8K
IAlhbWRncHVfcmFzX3Jlc3VtZShhZGV2KTsKIApAQCAtMzYyNywxMSArMzYzOCw2IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X2RvX2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9oaXZlX2luZm8gKmhpdmUs
CiAJCQkJCQlicmVhazsKIAkJCQl9CiAJCQl9Ci0KLQkJCWxpc3RfZm9yX2VhY2hfZW50cnkodG1w
X2FkZXYsIGRldmljZV9saXN0X2hhbmRsZSwKLQkJCQkJZ21jLnhnbWkuaGVhZCkgewotCQkJCWFt
ZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXModG1wX2FkZXYpOwotCQkJfQogCQl9CiAJfQogCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggMDIxMjBhYTNjYjVkLi5h
ZDY3YTEwOTEyMmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAg
LTE0NzcsMTQgKzE0NzcsMTMgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX3JlbGVhc2VfYmFkX3Bh
Z2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMg
aW50IGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
K2ludCBhbWRncHVfcmFzX3JlY292ZXJ5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiB7CiAJc3RydWN0IGFtZGdwdV9yYXMgKmNvbiA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRl
dik7CiAJc3RydWN0IHJhc19lcnJfaGFuZGxlcl9kYXRhICoqZGF0YSA9ICZjb24tPmVoX2RhdGE7
CiAJaW50IHJldDsKIAotCSpkYXRhID0ga21hbGxvYyhzaXplb2YoKipkYXRhKSwKLQkJCUdGUF9L
RVJORUx8X19HRlBfWkVSTyk7CisJKmRhdGEgPSBrbWFsbG9jKHNpemVvZigqKmRhdGEpLCBHRlBf
S0VSTkVMIHwgX19HRlBfWkVSTyk7CiAJaWYgKCEqZGF0YSkKIAkJcmV0dXJuIC1FTk9NRU07CiAK
QEAgLTE0OTUsMTggKzE0OTQsMjkgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX3JlY292ZXJ5X2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAlyZXQgPSBhbWRncHVfcmFzX2VlcHJv
bV9pbml0KCZhZGV2LT5wc3AucmFzLnJhcy0+ZWVwcm9tX2NvbnRyb2wpOwogCWlmIChyZXQpCi0J
CXJldHVybiByZXQ7CisJCWdvdG8gY2FuY2VsX3dvcms7CiAKIAlpZiAoYWRldi0+cHNwLnJhcy5y
YXMtPmVlcHJvbV9jb250cm9sLm51bV9yZWNzKSB7CiAJCXJldCA9IGFtZGdwdV9yYXNfbG9hZF9i
YWRfcGFnZXMoYWRldik7CiAJCWlmIChyZXQpCi0JCQlyZXR1cm4gcmV0OworCQkJZ290byBjYW5j
ZWxfd29yazsKIAkJcmV0ID0gYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyhhZGV2KTsKIAkJ
aWYgKHJldCkKLQkJCXJldHVybiByZXQ7CisJCQlnb3RvIHJlbGVhc2U7CiAJfQogCiAJcmV0dXJu
IDA7CisKK3JlbGVhc2U6CisJYW1kZ3B1X3Jhc19yZWxlYXNlX2JhZF9wYWdlcyhhZGV2KTsKK2Nh
bmNlbF93b3JrOgorCWNhbmNlbF93b3JrX3N5bmMoJmNvbi0+cmVjb3Zlcnlfd29yayk7CisJY29u
LT5laF9kYXRhID0gTlVMTDsKKwlrZnJlZSgoKmRhdGEpLT5icHMpOworCWtmcmVlKCgqZGF0YSkt
PmJwc19ibyk7CisJa2ZyZWUoKmRhdGEpOworCisJcmV0dXJuIHJldDsKIH0KIAogc3RhdGljIGlu
dCBhbWRncHVfcmFzX3JlY292ZXJ5X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCkBA
IC0xNTIwLDYgKzE1MzAsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfcmVjb3ZlcnlfZmluaShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAltdXRleF9sb2NrKCZjb24tPnJlY292ZXJ5X2xv
Y2spOwogCWNvbi0+ZWhfZGF0YSA9IE5VTEw7CiAJa2ZyZWUoZGF0YS0+YnBzKTsKKwlrZnJlZShk
YXRhLT5icHNfYm8pOwogCWtmcmVlKGRhdGEpOwogCW11dGV4X3VubG9jaygmY29uLT5yZWNvdmVy
eV9sb2NrKTsKIApAQCAtMTYxMSw5ICsxNjIyLDYgQEAgaW50IGFtZGdwdV9yYXNfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCXJldHVybiByOwogCX0KIAotCWlmIChhbWRncHVf
cmFzX3JlY292ZXJ5X2luaXQoYWRldikpCi0JCWdvdG8gcmVjb3Zlcnlfb3V0OwotCiAJYW1kZ3B1
X3Jhc19tYXNrICY9IEFNREdQVV9SQVNfQkxPQ0tfTUFTSzsKIAogCWlmIChhbWRncHVfcmFzX2Zz
X2luaXQoYWRldikpCkBAIC0xNjI4LDggKzE2MzYsNiBAQCBpbnQgYW1kZ3B1X3Jhc19pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJY29uLT5od19zdXBwb3J0ZWQsIGNvbi0+c3Vw
cG9ydGVkKTsKIAlyZXR1cm4gMDsKIGZzX291dDoKLQlhbWRncHVfcmFzX3JlY292ZXJ5X2Zpbmko
YWRldik7Ci1yZWNvdmVyeV9vdXQ6CiAJYW1kZ3B1X3Jhc19zZXRfY29udGV4dChhZGV2LCBOVUxM
KTsKIAlrZnJlZShjb24pOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgK
aW5kZXggNDJlMWQzNzllMjFjLi42ZDAwZjc5YjYxMmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmgKQEAgLTQ4MCw2ICs0ODAsNyBAQCBzdGF0aWMgaW5saW5lIGludCBh
bWRncHVfcmFzX2lzX3N1cHBvcnRlZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlyZXR1
cm4gcmFzICYmIChyYXMtPnN1cHBvcnRlZCAmICgxIDw8IGJsb2NrKSk7CiB9CiAKK2ludCBhbWRn
cHVfcmFzX3JlY292ZXJ5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50IGFt
ZGdwdV9yYXNfcmVxdWVzdF9yZXNldF9vbl9ib290KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAogCQl1bnNpZ25lZCBpbnQgYmxvY2spOwogCkBAIC01MDAsNiArNTAxLDEwIEBAIHN0YXRpYyBp
bmxpbmUgaW50IGFtZGdwdV9yYXNfcmVzZXRfZ3B1KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAogewogCXN0cnVjdCBhbWRncHVfcmFzICpyYXMgPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFk
ZXYpOwogCisJLyogc2F2ZSBiYWQgcGFnZSB0byBlZXByb20gYmVmb3JlIGdwdSByZXNldCwKKwkg
KiBpMmMgbWF5IGJlIHVuc3RhYmxlIGluIGdwdSByZXNldAorCSAqLworCWFtZGdwdV9yYXNfcmVz
ZXJ2ZV9iYWRfcGFnZXMoYWRldik7CiAJaWYgKGF0b21pY19jbXB4Y2hnKCZyYXMtPmluX3JlY292
ZXJ5LCAwLCAxKSA9PSAwKQogCQlzY2hlZHVsZV93b3JrKCZyYXMtPnJlY292ZXJ5X3dvcmspOwog
CXJldHVybiAwOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
