Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8859C814
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 05:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800446E172;
	Mon, 26 Aug 2019 03:55:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790048.outbound.protection.outlook.com [40.107.79.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324EF6E172
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 03:55:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRx/z8f1Z8fwwbvFmL+b9en+4sAuyX9uAHn/SknCbzZdLYztKze2lOLeCJvT7XSxsicy7xTK3nvNQGYl/oAbBjQ1yJAt9V6snVEapSTMj0F4MzbzAlXRXWVyW7THqM9NyqTWCMagdTKh3ijtiNdCLuxN9HKZUTbOhPvvHFl70H5Yw7jymLuLpmscXF4wpJWkMuIB/rdOLfUtrnh7hlW/71EFJD/QsgHnHxjgkyiwqz6jBlJBS4RQHSs8pXu8SG9ob1YFN6Mj734mQk8Ns8fvSoDinxezrjcaI50yw0ijcP7VyD0bmvkv0odxmPgfljtWR6xIfdGG1PHoMTgVTvSkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvsdRbexDH1LlWeflLf12oUeUGfqno1WzEB30IUDZGI=;
 b=Cm/vknoh4e/sx60HDJPJKJ1WjGjEF//bWeMYGhTlbb8K1bmTHCJasf8wH1Aw4GIHq8z2hww4T53fK6TS1LXGZC9PJkOeT6s0EG5fqtlbSm1URFy4AT6vG2wDo1qZ5Qcyoqs0+LXFErRx15Sr1V9QQTdtR+b/rTsldaAmaQkX1xoeYMEhMkzArqm23O3ByNXy3zaMWBJvEV50zHb4XhWQS0p1AfATzHchy6n7nphaavSuHiPse2pxVYWfHpoVzkAl+MLzuS2grFkO1kvxlfOIqv5n55938koQpd43RBePUdckbo9FkPL0xltpu5qaBVp6gR1su2a0QcKfB7MFGzxCIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0133.namprd12.prod.outlook.com (2603:10b6:0:51::29) by
 DM5PR12MB1275.namprd12.prod.outlook.com (2603:10b6:3:75::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 26 Aug 2019 03:55:34 +0000
Received: from DM3NAM03FT054.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by DM3PR12CA0133.outlook.office365.com
 (2603:10b6:0:51::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Mon, 26 Aug 2019 03:55:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT054.mail.protection.outlook.com (10.152.83.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 03:55:34 +0000
Received: from hawzhang-All-Series.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Sun, 25 Aug 2019 22:55:32 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 6/8] drm/amdgpu: add ras_controller and err_event_athub
 interrupt support
Date: Mon, 26 Aug 2019 11:54:58 +0800
Message-ID: <1566791700-1912-7-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
References: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(14444005)(4326008)(53936002)(186003)(26005)(6666004)(356004)(426003)(478600001)(446003)(81166006)(81156014)(8676002)(336012)(476003)(126002)(2616005)(11346002)(86362001)(47776003)(316002)(486006)(5660300002)(53416004)(50466002)(51416003)(7696005)(16586007)(48376002)(50226002)(8936002)(36756003)(2906002)(110136005)(6636002)(70586007)(70206006)(76176011)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1275; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0df078d-588b-416f-ca9d-08d729d93f5b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1275; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1275:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12758AF9B83675A50CFDB4D8FCA10@DM5PR12MB1275.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: XSbIW5PiNLPexGpt5AMQvgSvdI6jTGcazoUzVyLVIhu7Y3lWn9Lx5Apu1Qkt+ga3XLphB9kBtlCbF2czwAAcPDBuZIMCvjYiYj83U4ypszakB8VQMTspF+4ll0CL+Lu7Vw7HHx08fiT+ruCkNl7RtsjzjcyKjpX3DbnUgv7rbYhDJ+4kYBPko6T6coYmVfK2EnL2g3WAX6AdUfnxbxwq2xDaWqmvlyJBVTIHlsFOZZavGJqZzhxyHplxT/Abg1TOJ7aEuspDClQ2+WCVDeYL3maa7KRgO6T1yFajQBV3YVyjb742EmaCxguf6a+txHvPZsDthJDmh9VBB9lkBmqlxGWhmd1t7Z2dKIi8bWaeDMHT5zLiRIUVfpYzpEusA1YOBUch4OHgLGOS3320V0GkPp2HV205zAZXqhk5bJI+Vow=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 03:55:34.1465 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0df078d-588b-416f-ca9d-08d729d93f5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1275
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvsdRbexDH1LlWeflLf12oUeUGfqno1WzEB30IUDZGI=;
 b=3AeLH95uoOm2CjAvT91eDiNUdfYHXIV2+knRq3xrmIzuezKv5Y9KSIp8CWqzfwhPrEqTBhEFa67OVlUmolNJ3kbSF7kSCsaw5td6ihdftKd1i8hLbekSqOg6ClsdjOTJ/DBHvV376DSbgkTLfxL1zngSdsrx69/YcnZk4XonbkY=
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
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmFzIGNvbnRyb2xsZXIgaW50ZXJydXB0IGFuZCBSYXMgZXJyIGV2ZW50IGF0aHViIGludGVycnVw
dCBhcmUgdHdvIGRlZGljYXRlZAppbnRlcnJ1cHRzIGZvciBSQVMgc3VwcG9ydC4KClNpZ25lZC1v
ZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5oIHwgICA0ICsKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyAgfCAgMTQgKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbmJpb192N180LmMgICB8IDEyNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiAzIGZpbGVzIGNoYW5nZWQsIDE0MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9uYmlvLmgKaW5kZXggMjg0MTdlNC4uYTA0YzVlYSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5oCkBAIC03OSwxMCArNzksMTQgQEAgc3RydWN0
IGFtZGdwdV9uYmlvX2Z1bmNzIHsKIAl2b2lkICgqcmVtYXBfaGRwX3JlZ2lzdGVycykoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogCXZvaWQgKCpoYW5kbGVfcmFzX2NvbnRyb2xsZXJfaW50
cl9ub19iaWZyaW5nKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAJdm9pZCAoKmhhbmRs
ZV9yYXNfZXJyX2V2ZW50X2F0aHViX2ludHJfbm9fYmlmcmluZykoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpOworCWludCAoKmluaXRfcmFzX2NvbnRyb2xsZXJfaW50ZXJydXB0KShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldik7CisJaW50ICgqaW5pdF9yYXNfZXJyX2V2ZW50X2F0aHViX2lu
dGVycnVwdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogfTsKIAogc3RydWN0IGFtZGdw
dV9uYmlvIHsKIAljb25zdCBzdHJ1Y3QgbmJpb19oZHBfZmx1c2hfcmVnICpoZHBfZmx1c2hfcmVn
OworCXN0cnVjdCBhbWRncHVfaXJxX3NyYyByYXNfY29udHJvbGxlcl9pcnE7CisJc3RydWN0IGFt
ZGdwdV9pcnFfc3JjIHJhc19lcnJfZXZlbnRfYXRodWJfaXJxOwogCWNvbnN0IHN0cnVjdCBhbWRn
cHVfbmJpb19mdW5jcyAqZnVuY3M7CiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmMKaW5kZXggZGY0YjlhZS4uMjMwZjdlNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYwpAQCAtMjcsNiArMjcsNyBAQAogI2luY2x1ZGUgImFtZGdwdS5oIgog
I2luY2x1ZGUgImFtZGdwdV9yYXMuaCIKICNpbmNsdWRlICJhbWRncHVfYXRvbWZpcm13YXJlLmgi
CisjaW5jbHVkZSAiaXZzcmNpZC9uYmlvL2lycXNyY3NfbmJpZl83XzQuaCIKIAogY29uc3QgY2hh
ciAqcmFzX2Vycm9yX3N0cmluZ1tdID0gewogCSJub25lIiwKQEAgLTE0OTgsNiArMTQ5OSw3IEBA
IHN0YXRpYyB2b2lkIGFtZGdwdV9yYXNfY2hlY2tfc3VwcG9ydGVkKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LAogaW50IGFtZGdwdV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIHsKIAlzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jhc19nZXRfY29udGV4dChh
ZGV2KTsKKwlpbnQgcjsKIAogCWlmIChjb24pCiAJCXJldHVybiAwOwpAQCAtMTUyNSw2ICsxNTI3
LDE4IEBAIGludCBhbWRncHVfcmFzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJ
LyogTWlnaHQgbmVlZCBnZXQgdGhpcyBmbGFnIGZyb20gdmJpb3MuICovCiAJY29uLT5mbGFncyA9
IFJBU19ERUZBVUxUX0ZMQUdTOwogCisJaWYgKGFkZXYtPm5iaW8uZnVuY3MtPmluaXRfcmFzX2Nv
bnRyb2xsZXJfaW50ZXJydXB0KSB7CisJCXIgPSBhZGV2LT5uYmlvLmZ1bmNzLT5pbml0X3Jhc19j
b250cm9sbGVyX2ludGVycnVwdChhZGV2KTsKKwkJaWYgKHIpCisJCQlyZXR1cm4gcjsKKwl9CisK
KwlpZiAoYWRldi0+bmJpby5mdW5jcy0+aW5pdF9yYXNfZXJyX2V2ZW50X2F0aHViX2ludGVycnVw
dCkgeworCQlyID0gYWRldi0+bmJpby5mdW5jcy0+aW5pdF9yYXNfZXJyX2V2ZW50X2F0aHViX2lu
dGVycnVwdChhZGV2KTsKKwkJaWYgKHIpCisJCQlyZXR1cm4gcjsKKwl9CisKIAlpZiAoYW1kZ3B1
X3Jhc19yZWNvdmVyeV9pbml0KGFkZXYpKQogCQlnb3RvIHJlY292ZXJ5X291dDsKIApkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYwppbmRleCA2ZWNkZDVlLi5mYWY5MzAwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYwpAQCAtMjcsNiArMjcsNyBAQAogI2lu
Y2x1ZGUgIm5iaW8vbmJpb183XzRfb2Zmc2V0LmgiCiAjaW5jbHVkZSAibmJpby9uYmlvXzdfNF9z
aF9tYXNrLmgiCiAjaW5jbHVkZSAibmJpby9uYmlvXzdfNF8wX3Ntbi5oIgorI2luY2x1ZGUgIml2
c3JjaWQvbmJpby9pcnFzcmNzX25iaWZfN180LmgiCiAjaW5jbHVkZSA8dWFwaS9saW51eC9rZmRf
aW9jdGwuaD4KIAogI2RlZmluZSBzbW5OQklGX01HQ0dfQ1RSTF9MQ0xLCTB4MTAxM2EyMWMKQEAg
LTM0NSw2ICszNDYsMTI4IEBAIHN0YXRpYyB2b2lkIG5iaW9fdjdfNF9oYW5kbGVfcmFzX2Vycl9l
dmVudF9hdGh1Yl9pbnRyX25vX2JpZnJpbmcoc3RydWN0IGFtZGdwdV9kCiAJfQogfQogCisKK3N0
YXRpYyBpbnQgbmJpb192N180X3NldF9yYXNfY29udHJvbGxlcl9pcnFfc3RhdGUoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCisJCQkJCQkgIHN0cnVjdCBhbWRncHVfaXJxX3NyYyAqc3JjLAor
CQkJCQkJICB1bnNpZ25lZCB0eXBlLAorCQkJCQkJICBlbnVtIGFtZGdwdV9pbnRlcnJ1cHRfc3Rh
dGUgc3RhdGUpCit7CisJLyogVGhlIHJhc19jb250cm9sbGVyX2lycSBlbmFibGVtZW50IHNob3Vs
ZCBiZSBkb25lIGluIHBzcCBibCB3aGVuIGl0CisJICogdHJpZXMgdG8gZW5hYmxlIHJhcyBmZWF0
dXJlLiBEcml2ZXIgb25seSBuZWVkIHRvIHNldCB0aGUgY29ycmVjdCBpbnRlcnJ1cHQKKwkgKiB2
ZWN0b3IgZm9yIGJhcmUtbWV0YWwgYW5kIHNyaW92IHVzZSBjYXNlIHJlc3BlY3RpdmVseQorCSAq
LworCXVpbnQzMl90IGJpZl9pbnRyX2NudGw7CisKKwliaWZfaW50cl9jbnRsID0gUlJFRzMyX1NP
QzE1KE5CSU8sIDAsIG1tQklGX0lOVFJfQ05UTCk7CisJaWYgKHN0YXRlID09IEFNREdQVV9JUlFf
U1RBVEVfRU5BQkxFKSB7CisJCS8qIHNldCBpbnRlcnJ1cHQgdmVjdG9yIHNlbGVjdCBiaXQgdG8g
MCB0byBzZWxlY3QKKwkJICogdmV0Y29yIDEgZm9yIGJhcmUgbWV0YWwgY2FzZSAqLworCQliaWZf
aW50cl9jbnRsID0gUkVHX1NFVF9GSUVMRChiaWZfaW50cl9jbnRsLAorCQkJCQkgICAgICBCSUZf
SU5UUl9DTlRMLAorCQkJCQkgICAgICBSQVNfSU5UUl9WRUNfU0VMLCAwKTsKKwkJV1JFRzMyX1NP
QzE1KE5CSU8sIDAsIG1tQklGX0lOVFJfQ05UTCwgYmlmX2ludHJfY250bCk7CisJfQorCisJcmV0
dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgbmJpb192N180X3Byb2Nlc3NfcmFzX2NvbnRyb2xsZXJf
aXJxKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJCQkJc3RydWN0IGFtZGdwdV9pcnFf
c3JjICpzb3VyY2UsCisJCQkJCQlzdHJ1Y3QgYW1kZ3B1X2l2X2VudHJ5ICplbnRyeSkKK3sKKwkv
KiBCeSBkZXNpZ24sIHRoZSBpaCBjb29raWUgZm9yIHJhc19jb250cm9sbGVyX2lycSBzaG91bGQg
YmUgd3JpdHRlbgorCSAqIHRvIEJJRnJpbmcgaW5zdGVhZCBvZiBnZW5lcmFsIGl2IHJpbmcuIEhv
d2V2ZXIsIGR1ZSB0byBrbm93biBiaWYgcmluZworCSAqIGh3IGJ1ZywgaXQgaGFzIHRvIGJlIGRp
c2FibGVkLiBUaGVyZSBpcyBubyBjaGFuY2UgdGhlIHByb2Nlc3MgZnVuY3Rpb24KKwkgKiB3aWxs
IGJlIGludm9sa2VkLiBKdXN0IGxlZnQgaXQgYXMgYSBkdW1teSBvbmUuCisJICovCisJcmV0dXJu
IDA7Cit9CisKK3N0YXRpYyBpbnQgbmJpb192N180X3NldF9yYXNfZXJyX2V2ZW50X2F0aHViX2ly
cV9zdGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQkJCSAgICAgICBzdHJ1Y3Qg
YW1kZ3B1X2lycV9zcmMgKnNyYywKKwkJCQkJCSAgICAgICB1bnNpZ25lZCB0eXBlLAorCQkJCQkJ
ICAgICAgIGVudW0gYW1kZ3B1X2ludGVycnVwdF9zdGF0ZSBzdGF0ZSkKK3sKKwkvKiBUaGUgcmFz
X2NvbnRyb2xsZXJfaXJxIGVuYWJsZW1lbnQgc2hvdWxkIGJlIGRvbmUgaW4gcHNwIGJsIHdoZW4g
aXQKKwkgKiB0cmllcyB0byBlbmFibGUgcmFzIGZlYXR1cmUuIERyaXZlciBvbmx5IG5lZWQgdG8g
c2V0IHRoZSBjb3JyZWN0IGludGVycnVwdAorCSAqIHZlY3RvciBmb3IgYmFyZS1tZXRhbCBhbmQg
c3Jpb3YgdXNlIGNhc2UgcmVzcGVjdGl2ZWx5CisJICovCisJdWludDMyX3QgYmlmX2ludHJfY250
bDsKKworCWJpZl9pbnRyX2NudGwgPSBSUkVHMzJfU09DMTUoTkJJTywgMCwgbW1CSUZfSU5UUl9D
TlRMKTsKKwlpZiAoc3RhdGUgPT0gQU1ER1BVX0lSUV9TVEFURV9FTkFCTEUpIHsKKwkJLyogc2V0
IGludGVycnVwdCB2ZWN0b3Igc2VsZWN0IGJpdCB0byAwIHRvIHNlbGVjdAorCQkgKiB2ZXRjb3Ig
MSBmb3IgYmFyZSBtZXRhbCBjYXNlICovCisJCWJpZl9pbnRyX2NudGwgPSBSRUdfU0VUX0ZJRUxE
KGJpZl9pbnRyX2NudGwsCisJCQkJCSAgICAgIEJJRl9JTlRSX0NOVEwsCisJCQkJCSAgICAgIFJB
U19JTlRSX1ZFQ19TRUwsIDApOworCQlXUkVHMzJfU09DMTUoTkJJTywgMCwgbW1CSUZfSU5UUl9D
TlRMLCBiaWZfaW50cl9jbnRsKTsKKwl9CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGludCBu
YmlvX3Y3XzRfcHJvY2Vzc19lcnJfZXZlbnRfYXRodWJfaXJxKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAorCQkJCQkJIHN0cnVjdCBhbWRncHVfaXJxX3NyYyAqc291cmNlLAorCQkJCQkJIHN0
cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KQoreworCS8qIEJ5IGRlc2lnbiwgdGhlIGloIGNv
b2tpZSBmb3IgZXJyX2V2ZW50X2F0aHViX2lycSBzaG91bGQgYmUgd3JpdHRlbgorCSAqIHRvIEJJ
RnJpbmcgaW5zdGVhZCBvZiBnZW5lcmFsIGl2IHJpbmcuIEhvd2V2ZXIsIGR1ZSB0byBrbm93biBi
aWYgcmluZworCSAqIGh3IGJ1ZywgaXQgaGFzIHRvIGJlIGRpc2FibGVkLiBUaGVyZSBpcyBubyBj
aGFuY2UgdGhlIHByb2Nlc3MgZnVuY3Rpb24KKwkgKiB3aWxsIGJlIGludm9sa2VkLiBKdXN0IGxl
ZnQgaXQgYXMgYSBkdW1teSBvbmUuCisJICovCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3MgbmJpb192N180X3Jhc19jb250cm9sbGVyX2ly
cV9mdW5jcyA9IHsKKwkuc2V0ID0gbmJpb192N180X3NldF9yYXNfY29udHJvbGxlcl9pcnFfc3Rh
dGUsCisJLnByb2Nlc3MgPSBuYmlvX3Y3XzRfcHJvY2Vzc19yYXNfY29udHJvbGxlcl9pcnEsCit9
OworCitzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9pcnFfc3JjX2Z1bmNzIG5iaW9fdjdfNF9y
YXNfZXJyX2V2ZW50X2F0aHViX2lycV9mdW5jcyA9IHsKKwkuc2V0ID0gbmJpb192N180X3NldF9y
YXNfZXJyX2V2ZW50X2F0aHViX2lycV9zdGF0ZSwKKwkucHJvY2VzcyA9IG5iaW9fdjdfNF9wcm9j
ZXNzX2Vycl9ldmVudF9hdGh1Yl9pcnEsCit9OworCitzdGF0aWMgaW50IG5iaW9fdjdfNF9pbml0
X3Jhc19jb250cm9sbGVyX2ludGVycnVwdCAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7
CisJaW50IHI7CisKKwkvKiBpbml0IHRoZSBpcnEgZnVuY3MgKi8KKwlhZGV2LT5uYmlvLnJhc19j
b250cm9sbGVyX2lycS5mdW5jcyA9CisJCSZuYmlvX3Y3XzRfcmFzX2NvbnRyb2xsZXJfaXJxX2Z1
bmNzOworCWFkZXYtPm5iaW8ucmFzX2NvbnRyb2xsZXJfaXJxLm51bV90eXBlcyA9IDE7CisKKwkv
KiByZWdpc3RlciByYXMgY29udHJvbGxlciBpbnRlcnJ1cHQgKi8KKwlyID0gYW1kZ3B1X2lycV9h
ZGRfaWQoYWRldiwgU09DMTVfSUhfQ0xJRU5USURfQklGLAorCQkJICAgICAgTkJJRl83XzRfX1NS
Q0lEX19SQVNfQ09OVFJPTExFUl9JTlRFUlJVUFQsCisJCQkgICAgICAmYWRldi0+bmJpby5yYXNf
Y29udHJvbGxlcl9pcnEpOworCWlmIChyKQorCQlyZXR1cm4gcjsKKworCXJldHVybiAwOworfQor
CitzdGF0aWMgaW50IG5iaW9fdjdfNF9pbml0X3Jhc19lcnJfZXZlbnRfYXRodWJfaW50ZXJydXB0
IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKworCWludCByOworCisJLyogaW5pdCB0
aGUgaXJxIGZ1bmNzICovCisJYWRldi0+bmJpby5yYXNfZXJyX2V2ZW50X2F0aHViX2lycS5mdW5j
cyA9CisJCSZuYmlvX3Y3XzRfcmFzX2Vycl9ldmVudF9hdGh1Yl9pcnFfZnVuY3M7CisJYWRldi0+
bmJpby5yYXNfZXJyX2V2ZW50X2F0aHViX2lycS5udW1fdHlwZXMgPSAxOworCisJLyogcmVnaXN0
ZXIgcmFzIGVyciBldmVudCBhdGh1YiBpbnRlcnJ1cHQgKi8KKwlyID0gYW1kZ3B1X2lycV9hZGRf
aWQoYWRldiwgU09DMTVfSUhfQ0xJRU5USURfQklGLAorCQkJICAgICAgTkJJRl83XzRfX1NSQ0lE
X19FUlJFVkVOVF9BVEhVQl9JTlRFUlJVUFQsCisJCQkgICAgICAmYWRldi0+bmJpby5yYXNfZXJy
X2V2ZW50X2F0aHViX2lycSk7CisJaWYgKHIpCisJCXJldHVybiByOworCisJcmV0dXJuIDA7Cit9
CisKIGNvbnN0IHN0cnVjdCBhbWRncHVfbmJpb19mdW5jcyBuYmlvX3Y3XzRfZnVuY3MgPSB7CiAJ
LmdldF9oZHBfZmx1c2hfcmVxX29mZnNldCA9IG5iaW9fdjdfNF9nZXRfaGRwX2ZsdXNoX3JlcV9v
ZmZzZXQsCiAJLmdldF9oZHBfZmx1c2hfZG9uZV9vZmZzZXQgPSBuYmlvX3Y3XzRfZ2V0X2hkcF9m
bHVzaF9kb25lX29mZnNldCwKQEAgLTM2OCw0ICs0OTEsNiBAQCBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X25iaW9fZnVuY3MgbmJpb192N180X2Z1bmNzID0gewogCS5yZW1hcF9oZHBfcmVnaXN0ZXJzID0g
bmJpb192N180X3JlbWFwX2hkcF9yZWdpc3RlcnMsCiAJLmhhbmRsZV9yYXNfY29udHJvbGxlcl9p
bnRyX25vX2JpZnJpbmcgPSBuYmlvX3Y3XzRfaGFuZGxlX3Jhc19jb250cm9sbGVyX2ludHJfbm9f
YmlmcmluZywKIAkuaGFuZGxlX3Jhc19lcnJfZXZlbnRfYXRodWJfaW50cl9ub19iaWZyaW5nID0g
bmJpb192N180X2hhbmRsZV9yYXNfZXJyX2V2ZW50X2F0aHViX2ludHJfbm9fYmlmcmluZywKKwku
aW5pdF9yYXNfY29udHJvbGxlcl9pbnRlcnJ1cHQgPSBuYmlvX3Y3XzRfaW5pdF9yYXNfY29udHJv
bGxlcl9pbnRlcnJ1cHQsCisJLmluaXRfcmFzX2Vycl9ldmVudF9hdGh1Yl9pbnRlcnJ1cHQgPSBu
YmlvX3Y3XzRfaW5pdF9yYXNfZXJyX2V2ZW50X2F0aHViX2ludGVycnVwdCwKIH07Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
