Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9877DAB8
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 13:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578206E55A;
	Thu,  1 Aug 2019 11:55:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680058.outbound.protection.outlook.com [40.107.68.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019816E55A
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 11:55:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LU8c4jwmy8uRILOwYBnh4SbYwXIJCds5Pw3KtL33CC2NWD34n98WzDJjE8TgI2Ioq3qkajp666KtiZnrU9EQKvBOBZYxoYMZYXxO7NO/qwOmJaQQi6Hfx6xmEDpIhagUUl4/0PATsSRyko8afUYB9F+qA6pvxgX4xZHIUNeI6U02cWedUbfWXv2v3jiw9NekOCOAlmSKJ57c/8GU6zDP1IOGhty5j/HcFNgUwbioWbB0+C89YrpAyBST4UkIFxv3cicABQeodFr8zek0bPGsw8JMx3yWUyuXrpdY0LovBjlYJRrpOuNH5cnBMx9sRPkOjstt2h+IfxptjVelCJi9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m71/RDKx0owHJTNBxeYlSqjZmGfVHLIoBSiqWwsvF9s=;
 b=FDm0FdCK3ggmt30RZNeRcg/d3bZ5IR7f6pge4UEKFdSwVCYq0hJ05gOgBTh7deE01+yNpu7J0ZlSUGIIM0P0HxZ2igOnd7VXrk3Uoqk3PUvGelL97c6xa71ANMsJWot+TMlb5o1CB/nQc+1to7ice4SnIUc/e5B1c5PKOmW+ljEyyEprtNZRlnqcUcXP+/9/9guGLBZFe0klwbxhUWyw3z8TX2XthTfJ/d9tTxoav5vzwLjsJpkbjJZpqhFdmzOK3JAEYsuK4qArNp85ne6JkXpNb78I9LSX0CBVJUf1s61lezvtbLJNiocBVKS8JHslBMBoOKua/hfpaj4lxSM5Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CH2PR12CA0017.namprd12.prod.outlook.com (2603:10b6:610:57::27)
 by DM5PR12MB2421.namprd12.prod.outlook.com (2603:10b6:4:b4::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14; Thu, 1 Aug
 2019 11:55:36 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by CH2PR12CA0017.outlook.office365.com
 (2603:10b6:610:57::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.15 via Frontend
 Transport; Thu, 1 Aug 2019 11:55:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 11:55:36 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 06:55:34 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 2/5] drm/amdgpu: implement umc ras init function
Date: Thu, 1 Aug 2019 19:54:51 +0800
Message-ID: <20190801115454.21867-3-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801115454.21867-1-tao.zhou1@amd.com>
References: <20190801115454.21867-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(53936002)(86362001)(70586007)(6636002)(36756003)(51416003)(68736007)(48376002)(2906002)(50466002)(70206006)(7696005)(5660300002)(81166006)(76176011)(81156014)(8676002)(8936002)(478600001)(26005)(446003)(316002)(426003)(2201001)(50226002)(486006)(126002)(476003)(16586007)(11346002)(2616005)(1076003)(110136005)(336012)(6666004)(4326008)(53416004)(47776003)(186003)(356004)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2421; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be212eae-897e-4b44-d25c-08d716772a51
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB2421; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2421:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2421C407E663755F46A2993DB0DE0@DM5PR12MB2421.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: J0EsBUO7DF3L8FyqXMSM1m7NYaZeWAn7qXtypmTnJLhMc0xihl7N+H+cBFrDVh5brFly1dhxeX7Z2qBStVdPeyFRJyE1EciCY/wmjhbjuEFyut0yG5EXbtZMLv6qKiW2dX0XEd0lS2P7Ip4n9bu0iWHdT9jwqpb5QMfgMd1Cph7EamrmoaNAz96xHhl22H3Q9ndRDes7KlVWF0sF3k7GxCgHqZ7L+WJ69GOW5JmFN1Rz3YoWTsi3NCjx5hugiHwXN+hknVlS6Ru9IMwlTbb5vI0Qx6BEWzthznLcmmTzefHtNYgovoFxo66BoHNx/BBtbNUyOsX4G/jxaKsIRmob8dCVIbuBbqoMCxDdFLRhdGbEuLheQLcI7W43QHXwZHNpn1LEBaJKcLecMZ9ulPgmhusQZXR17KUbWUnKS6PpQNk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 11:55:36.1577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be212eae-897e-4b44-d25c-08d716772a51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m71/RDKx0owHJTNBxeYlSqjZmGfVHLIoBSiqWwsvF9s=;
 b=LVdclH0VjtilmXov9bAlpdqGwckTV+xpaUg1BUL93lstpGbZnYaSBtJ+Ovvu/72p1i5rcRk+QzbDMzZp0FT4Kr/N+KivtHmiWTMOmrYBjjRRpXzCOReyYQuiWqg0o6A5d0dhDddxBN9Y4/ac1jY9UjMKeBaFQCtwAZz6MFbm1tU=
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

ZW5hYmxlIHVtYyBjZSBpbnRlcnJ1cHQgYW5kIGluaXRpYWxpemUgZWNjIGVycm9yIGNvdW50CgpT
aWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuaCB8ICA3ICsrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3VtY192Nl8xLmMKaW5kZXggNTc0N2EwMjUyNjI0Li4wYWIyZTk2YjRmNzcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYwpAQCAtMjA3LDkgKzIwNyw0MSBAQCBzdGF0aWMgdm9p
ZCB1bWNfdjZfMV9xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKIAlhbWRncHVfdW1jX2Zvcl9lYWNoX2NoYW5uZWwodW1jX3Y2XzFfcXVlcnlfZXJyb3Jf
YWRkcmVzcyk7CiB9CiAKK3N0YXRpYyB2b2lkIHVtY192Nl8xX3Jhc19pbml0X3Blcl9jaGFubmVs
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJCQkgc3RydWN0IHJhc19lcnJfZGF0YSAq
ZXJyX2RhdGEsCisJCQkJCSB1aW50MzJfdCB1bWNfcmVnX29mZnNldCwgdWludDMyX3QgY2hhbm5l
bF9pbmRleCkKK3sKKwl1aW50MzJfdCBlY2NfZXJyX2NudF9zZWwsIGVjY19lcnJfY250X3NlbF9h
ZGRyOworCXVpbnQzMl90IGVjY19lcnJfY250X2FkZHI7CisKKwllY2NfZXJyX2NudF9zZWxfYWRk
ciA9CisJCVNPQzE1X1JFR19PRkZTRVQoVU1DLCAwLCBtbVVNQ0NIMF8wX0VjY0VyckNudFNlbCk7
CisJZWNjX2Vycl9jbnRfYWRkciA9CisJCVNPQzE1X1JFR19PRkZTRVQoVU1DLCAwLCBtbVVNQ0NI
MF8wX0VjY0VyckNudCk7CisKKwkvKiBzZWxlY3QgdGhlIGxvd2VyIGNoaXAgYW5kIGNoZWNrIHRo
ZSBlcnJvciBjb3VudCAqLworCWVjY19lcnJfY250X3NlbCA9IFJSRUczMihlY2NfZXJyX2NudF9z
ZWxfYWRkciArIHVtY19yZWdfb2Zmc2V0KTsKKwllY2NfZXJyX2NudF9zZWwgPSBSRUdfU0VUX0ZJ
RUxEKGVjY19lcnJfY250X3NlbCwgVU1DQ0gwXzBfRWNjRXJyQ250U2VsLAorCQkJCQlFY2NFcnJD
bnRDc1NlbCwgMCk7CisJLyogc2V0IGNlIGVycm9yIGludGVycnVwdCB0eXBlIHRvIEFQSUMgYmFz
ZWQgaW50ZXJydXB0ICovCisJZWNjX2Vycl9jbnRfc2VsID0gUkVHX1NFVF9GSUVMRChlY2NfZXJy
X2NudF9zZWwsIFVNQ0NIMF8wX0VjY0VyckNudFNlbCwKKwkJCQkJRWNjRXJySW50LCAweDEpOwor
CVdSRUczMihlY2NfZXJyX2NudF9zZWxfYWRkciArIHVtY19yZWdfb2Zmc2V0LCBlY2NfZXJyX2Nu
dF9zZWwpOworCS8qIHNldCBlcnJvciBjb3VudCB0byBpbml0aWFsIHZhbHVlICovCisJV1JFRzMy
KGVjY19lcnJfY250X2FkZHIgKyB1bWNfcmVnX29mZnNldCwgVU1DX1Y2XzFfQ0VfQ05UX0lOSVQp
OworCisJLyogc2VsZWN0IHRoZSBoaWdoZXIgY2hpcCBhbmQgY2hlY2sgdGhlIGVyciBjb3VudGVy
ICovCisJZWNjX2Vycl9jbnRfc2VsID0gUkVHX1NFVF9GSUVMRChlY2NfZXJyX2NudF9zZWwsIFVN
Q0NIMF8wX0VjY0VyckNudFNlbCwKKwkJCQkJRWNjRXJyQ250Q3NTZWwsIDEpOworCVdSRUczMihl
Y2NfZXJyX2NudF9zZWxfYWRkciArIHVtY19yZWdfb2Zmc2V0LCBlY2NfZXJyX2NudF9zZWwpOwor
CVdSRUczMihlY2NfZXJyX2NudF9hZGRyICsgdW1jX3JlZ19vZmZzZXQsIFVNQ19WNl8xX0NFX0NO
VF9JTklUKTsKK30KKwogc3RhdGljIHZvaWQgdW1jX3Y2XzFfcmFzX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiB7CisJdm9pZCAqcmFzX2Vycm9yX3N0YXR1cyA9IE5VTEw7CiAKKwlh
bWRncHVfdW1jX2Zvcl9lYWNoX2NoYW5uZWwodW1jX3Y2XzFfcmFzX2luaXRfcGVyX2NoYW5uZWwp
OwogfQogCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3VtY19mdW5jcyB1bWNfdjZfMV9mdW5jcyA9IHsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5oCmluZGV4IGFkNDU5OGMwZTQ5NS4uZGFi
OWNiZDI5MmM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZf
MS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmgKQEAgLTM3LDYg
KzM3LDEzIEBACiAvKiBVTUMgcmVnaXNlciBwZXIgY2hhbm5lbCBvZmZzZXQgKi8KICNkZWZpbmUg
VU1DX1Y2XzFfUEVSX0NIQU5ORUxfT0ZGU0VUCQkweDgwMAogCisvKiBFY2NFcnJDbnQgbWF4IHZh
bHVlICovCisjZGVmaW5lIFVNQ19WNl8xX0NFX0NOVF9NQVgJCTB4ZmZmZgorLyogdW1jIGNlIGlu
dGVycnVwdCB0aHJlc2hvbGQgKi8KKyNkZWZpbmUgVU1DX1Y2XzFfQ0VfSU5UX1RIUkVTSE9MRAkw
eGZmZmYKKy8qIHVtYyBjZSBjb3VudCBpbml0aWFsIHZhbHVlICovCisjZGVmaW5lIFVNQ19WNl8x
X0NFX0NOVF9JTklUCShVTUNfVjZfMV9DRV9DTlRfTUFYIC0gVU1DX1Y2XzFfQ0VfSU5UX1RIUkVT
SE9MRCkKKwogZXh0ZXJuIGNvbnN0IHN0cnVjdCBhbWRncHVfdW1jX2Z1bmNzIHVtY192Nl8xX2Z1
bmNzOwogZXh0ZXJuIGNvbnN0IHVpbnQzMl90CiAJdW1jX3Y2XzFfY2hhbm5lbF9pZHhfdGJsW1VN
Q19WNl8xX1VNQ19JTlNUQU5DRV9OVU1dW1VNQ19WNl8xX0NIQU5ORUxfSU5TVEFOQ0VfTlVNXTsK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
