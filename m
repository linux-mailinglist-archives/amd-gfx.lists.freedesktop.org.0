Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EDC8DF0A
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 22:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94316E842;
	Wed, 14 Aug 2019 20:40:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740043.outbound.protection.outlook.com [40.107.74.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3496E841
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 20:40:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zk+XEX5IXsxCNVezy/yMJ/njSAU16ddrhl1bv8h1vdNqIbvAgd73mTnixbOZQfDTptDfQzF+TH2Tvd1vkX/KMUQEhWkNi/eKTcq+ag+67fPA8bCmQHtUICRlj/kX5ksZgge/ccoU2QD2hIqFpctAqQGQi42V0D76FqlSFPmJCLnZb5epmJe+1XMd9P/jb9Tpw8i2e8H8ZuC9+Aydk9c3Mf3C7u73EuJwhC7UxTbI4Rh6cpnq9BauUtWkkCU4UZGR1Dcfs+ZwIYHPRsETOo3xrZnI9yV4gc1+ug2PECYexO7WLRYrHltcmtONVbrFVi0VUWSZDQQyCkTSbeuyo/zrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49134oSNwxpeuT/YPnKz/IJ3m+bhEMtu6XtuOuokNOA=;
 b=ZX55bILNDxNjgA2huQSRdI+cuAGZ+MvfShOgnPSvZLw/PZuCsxgUdA2GAvgYuPuRRigBX1W8vuNZS7EhiE9g7VeQuDxzDYCW1fVNXL8BaffdM8MwG2Blq4zDAeN6XO9h+Waw0dSFpCioVjjcZmv4lzQK7/xWjMiSYSCKLlVanUScn4oiaPHVq1CMMT0P++pHXceCHQeTnshoT4gHFowIoDs8/28T1UNm2Dr9WvFs9qAIw2bZFyS/fuKysD+gKIxOpKZsItba6JmNKFBo5oeaE+izuTXDCbWWnsnBzcuDwm9/Pfqumb9evvkKy+B/z0BiUtEz8qiLm1hTDwO/OzE3Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0079.namprd12.prod.outlook.com (2603:10b6:0:57::23) by
 BYAPR12MB2712.namprd12.prod.outlook.com (2603:10b6:a03:68::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Wed, 14 Aug 2019 20:40:50 +0000
Received: from CO1NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM3PR12CA0079.outlook.office365.com
 (2603:10b6:0:57::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.14 via Frontend
 Transport; Wed, 14 Aug 2019 20:40:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT036.mail.protection.outlook.com (10.152.80.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 14 Aug 2019 20:40:49 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 14 Aug 2019 15:40:47 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 5/5] drm/amdgpu: Use new mode2 reset interface for RV.
Date: Wed, 14 Aug 2019 16:40:17 -0400
Message-ID: <1565815217-9533-6-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(2980300002)(428003)(199004)(189003)(16586007)(50226002)(7696005)(54906003)(186003)(316002)(26005)(8676002)(2351001)(48376002)(6916009)(81166006)(81156014)(2906002)(76176011)(50466002)(53416004)(8936002)(70206006)(70586007)(51416003)(336012)(47776003)(305945005)(14444005)(53936002)(6666004)(86362001)(4326008)(356004)(11346002)(486006)(126002)(446003)(5660300002)(478600001)(36756003)(2616005)(476003)(44832011)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2712; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 759bc676-9ebe-4c56-13c7-08d720f7b10f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2712; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2712:
X-Microsoft-Antispam-PRVS: <BYAPR12MB271273663146579A1A82DDC7EAAD0@BYAPR12MB2712.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 01294F875B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: UXcCDMD9xVeLZc/OTifGhxu/ct2N9gJlbnhUmny02Y2CHf08OcdwECqn8Q/sIbVY/pPRPuJYwu07LdklxP1ucmHVwzaj8bqjjcfBZa2bplt2+awFrf+qspIVsQtqxddmY6EMlrxiSRLe2+cHyU/rCbYrIJn8vNjCkOOr2djKIKCgaub8Fn4uqBhaZoJtZHqEF92LFam4joWpVhxT3GGQWSZE3PkoZV5owl3JsB5DPlhpg+zVr9SwSmcgs8bc9EID8eK9rJ8kAKX5Id5vJt4HICLI05PnjxpZhJPP19Q5GUKRSbHpCT2px8iiRa3raiHG+YUrp+aF/n0HHys6Em7hRB+bkzQq0UuGk7pUDRdvfw0ZWDETLsCKaNTpOxuCRgAdcPZb6OBzS11X45toVqPIzH8v/KpmKA2sigIstNT91tM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 20:40:49.3699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 759bc676-9ebe-4c56-13c7-08d720f7b10f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49134oSNwxpeuT/YPnKz/IJ3m+bhEMtu6XtuOuokNOA=;
 b=1wFyXXomfckdlmZ94UB/63UM3vKClXZB11iWEte0h5clpTzCQzTxHMap2WTnQQamCePXO5z/clLnyDfU+SUgFF/K4H7IT5ai0qOeWkHoYBAkF8YGFxCb4a4pcW+Xov4mEyy6hnIz99J/h35FeCJwd4n93UYMo/1nS2vUXptUpJ4=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 evan.quan@amd.com, Shirish.S@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

djI6CkNoZWNrIHBwZnVuY3MgcG9pbnRlciBmb3IgTlVMTAoKU2lnbmVkLW9mZi1ieTogQW5kcmV5
IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYyAgICAgICAgIHwgMjUgKysrKysrKysrKysrKysrKystLS0tLS0tLQog
MiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCAyNzUyNzczLi4wMmIz
ZTdkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBAIC0z
NTI0LDYgKzM1MjQsNyBAQCBib29sIGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3JlY292ZXJfZ3B1KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQljYXNlIENISVBfVkVHQTIwOgogCQljYXNlIENI
SVBfVkVHQTEwOgogCQljYXNlIENISVBfVkVHQTEyOgorCQljYXNlIENISVBfUkFWRU46CiAJCQli
cmVhazsKIAkJZGVmYXVsdDoKIAkJCWdvdG8gZGlzYWJsZWQ7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c29jMTUuYwppbmRleCBjMmQzMjRkLi43N2U2Nzk5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMKQEAgLTUwOCw2ICs1MDgsMTUgQEAgc3RhdGljIGludCBzb2MxNV9hc2ljX2JhY29fcmVz
ZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBp
bnQgc29jMTVfbW9kZTJfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJaWYg
KCFhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MgfHwKKwkgICAgIWFkZXYtPnBvd2VycGxheS5wcF9m
dW5jcy0+YXNpY19yZXNldF9tb2RlXzIpCisJCXJldHVybiAtRU5PRU5UOworCisJcmV0dXJuIGFk
ZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+YXNpY19yZXNldF9tb2RlXzIoYWRldi0+cG93ZXJwbGF5
LnBwX2hhbmRsZSk7Cit9CisKIHN0YXRpYyBlbnVtIGFtZF9yZXNldF9tZXRob2QKIHNvYzE1X2Fz
aWNfcmVzZXRfbWV0aG9kKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewpAQCAtNTQ2LDE0
ICs1NTUsMTQgQEAgc29jMTVfYXNpY19yZXNldF9tZXRob2Qoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiAKIHN0YXRpYyBpbnQgc29jMTVfYXNpY19yZXNldChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIHsKLQlpbnQgcmV0OwotCi0JaWYgKHNvYzE1X2FzaWNfcmVzZXRfbWV0aG9kKGFk
ZXYpID09IEFNRF9SRVNFVF9NRVRIT0RfQkFDTykKLQkJcmV0ID0gc29jMTVfYXNpY19iYWNvX3Jl
c2V0KGFkZXYpOwotCWVsc2UKLQkJcmV0ID0gc29jMTVfYXNpY19tb2RlMV9yZXNldChhZGV2KTsK
LQotCXJldHVybiByZXQ7CisJc3dpdGNoIChzb2MxNV9hc2ljX3Jlc2V0X21ldGhvZChhZGV2KSkg
eworCQljYXNlIEFNRF9SRVNFVF9NRVRIT0RfQkFDTzoKKwkJCXJldHVybiBzb2MxNV9hc2ljX2Jh
Y29fcmVzZXQoYWRldik7CisJCWNhc2UgQU1EX1JFU0VUX01FVEhPRF9NT0RFMjoKKwkJCXJldHVy
biBzb2MxNV9tb2RlMl9yZXNldChhZGV2KTsKKwkJZGVmYXVsdDoKKwkJCXJldHVybiBzb2MxNV9h
c2ljX21vZGUxX3Jlc2V0KGFkZXYpOworCX0KIH0KIAogLypzdGF0aWMgaW50IHNvYzE1X3NldF91
dmRfY2xvY2soc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiBjbG9jaywKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
