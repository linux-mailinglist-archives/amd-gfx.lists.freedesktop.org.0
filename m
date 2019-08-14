Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE678DE1D
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 21:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3DF6E824;
	Wed, 14 Aug 2019 19:54:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810084.outbound.protection.outlook.com [40.107.81.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DE86E824
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 19:54:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tnh1tfzc+mtP6mI7fP8PpWwQEVY25r5987uWaviOIh2BvRzxoINhrPPEM5csddwP1Ycgof9F9rJ8R9QLSMasijzV70VVpADriZGPQLnsXPwrVVAM7e9qZwKzjhSc7zgFesobxCHtzVq5/sAmpllP1DzlUGiBy/bEd2nhkQcwWANM+9+d2KUI8O0y1MlDo2ODFhpTstraPXnTzN/GS47siJ/2Qp2VhAZA4VFHR81Pr/thIFedVK7cd3U6cQw+9P61idC/PrHpi5XDzXFiMWPhAWGjZ9IW6L1asxIrOxE2nTiAjhoQuqyZJXePOl0xaOOWCzo4FrUKWwq33XTjEu3Cdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+xBgpF7Qr79RJKdJfSsgXAQiEME41X09WjerrGmJ0M=;
 b=QeZunqkxLzyQeuoCNXsXei2vvIMoOOBcOAp02IrneuE/XvDuQr/qh6fggcOomULyd8hC/HexMl9ohx1YY1B/exX0b7tgJMowJ8T0U4E1tUuGtSNQ//rXlMj6RO/TtS5/SVykjgWDfR1/17kvwWnJz8oaxMc+ql7oMcmeqa/RQ5AWVuSCg+r8VskKx0gxMsgdKQ98gc1lxh16Jv7iChIyVciGv+eDkxVUE4gcbX66UeqSXQek4F5Xs922jrfTpD3XCG4cUG8tfsk8GR68dQU2Hyf5ZiJDEogpzGatgwA1swVcfzQAszQmtdaa+SA7uFx3HSj8VbV8f8ozUsxAaBAQkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0045.namprd12.prod.outlook.com (2603:10b6:405:70::31)
 by DM5PR12MB1275.namprd12.prod.outlook.com (2603:10b6:3:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.20; Wed, 14 Aug
 2019 19:54:02 +0000
Received: from BY2NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by BN6PR12CA0045.outlook.office365.com
 (2603:10b6:405:70::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.18 via Frontend
 Transport; Wed, 14 Aug 2019 19:54:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT032.mail.protection.outlook.com (10.152.84.228) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Wed, 14 Aug 2019 19:54:01 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 14 Aug 2019 14:54:00 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdgpu: Use new mode2 reset interface for RV.
Date: Wed, 14 Aug 2019 15:53:34 -0400
Message-ID: <1565812414-26117-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565812414-26117-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1565812414-26117-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(336012)(2351001)(16586007)(8936002)(316002)(478600001)(86362001)(6916009)(70586007)(53416004)(70206006)(6666004)(356004)(4326008)(44832011)(48376002)(50466002)(50226002)(81156014)(36756003)(81166006)(486006)(2616005)(14444005)(47776003)(446003)(76176011)(126002)(53936002)(426003)(11346002)(476003)(7696005)(51416003)(2906002)(54906003)(305945005)(5660300002)(8676002)(186003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1275; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77e39341-68d7-4bc4-396a-08d720f1279c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1275; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1275:
X-Microsoft-Antispam-PRVS: <DM5PR12MB127565D894C6912B737ADD2CEAAD0@DM5PR12MB1275.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 01294F875B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: AykFnaM4PTFaHd88hKjWZnMHYuOMfj9UmGXb1JLRXmkNQJG4L9Uq544yEgibjI2jPIY13EcvgtNjSNsbOKiVYYk5ATPD4ONRnv8YIjvG7SxVL1uk0llCscwVA8Z141a7YN/ilJHyO77xi6dlN8e2sg9r9D/nOEh1APIor/MdgQ+f9YAVVkurZHbetnLSn5eehiFzzDdwAJpATJ2RF+sFve7Ro2H/ifgSV6uW62NJOatWFHmrxdDLML4Oqk3ucxy9AD4s8nBR7SNJNhtvPvXFo0bwRN9RQ5iRHtgSsFTf4LnHoERayRJ7yExPE8LCfkU607l172ovqFxBTfF6Eu+d81VmLVlW7LhZikjhRFc/Vqh23muU/rhc6Y71KkfH7f2YN1BDnF1Ts5gs0WVIg3RffAPZ8oXE0mq1No1AL+NMGwc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 19:54:01.8360 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e39341-68d7-4bc4-396a-08d720f1279c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1275
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+xBgpF7Qr79RJKdJfSsgXAQiEME41X09WjerrGmJ0M=;
 b=qPXxGAo0oKwEQ56O9+x9RW/S9gHbZ0NeUFzrHvRhUu3o1jPEgvZe4SEn73Wa/a41QElZKrGnLr/2Jn0HrS37NKiZSxReKEXNTUkkfX++9X7XOxjgJTzGnTgrqLxHMRBbCr4enwf9B7lle9Kf3XnufV9UjuHVigM/U19do8Hhitg=
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

U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgIDEg
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyAgICAgICAgIHwgMjEgKysrKysr
KysrKysrKy0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmlu
ZGV4IDI3NTI3NzMuLjAyYjNlN2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMKQEAgLTM1MjQsNiArMzUyNCw3IEBAIGJvb2wgYW1kZ3B1X2RldmljZV9zaG91
bGRfcmVjb3Zlcl9ncHUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWNhc2UgQ0hJUF9W
RUdBMjA6CiAJCWNhc2UgQ0hJUF9WRUdBMTA6CiAJCWNhc2UgQ0hJUF9WRUdBMTI6CisJCWNhc2Ug
Q0hJUF9SQVZFTjoKIAkJCWJyZWFrOwogCQlkZWZhdWx0OgogCQkJZ290byBkaXNhYmxlZDsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IGMyZDMyNGQuLjdhOWI4OWQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtNTA4LDYgKzUwOCwxMSBAQCBzdGF0aWMgaW50IHNv
YzE1X2FzaWNfYmFjb19yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlyZXR1cm4g
MDsKIH0KIAorc3RhdGljIGludCBzb2MxNV9tb2RlMl9yZXNldChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKK3sKKwlyZXR1cm4gYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5hc2ljX3Jlc2V0
X21vZF8yKGFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGUpOworfQorCiBzdGF0aWMgZW51bSBhbWRf
cmVzZXRfbWV0aG9kCiBzb2MxNV9hc2ljX3Jlc2V0X21ldGhvZChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIHsKQEAgLTU0NiwxNCArNTUxLDE0IEBAIHNvYzE1X2FzaWNfcmVzZXRfbWV0aG9k
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiBzdGF0aWMgaW50IHNvYzE1X2FzaWNfcmVz
ZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7Ci0JaW50IHJldDsKLQotCWlmIChzb2Mx
NV9hc2ljX3Jlc2V0X21ldGhvZChhZGV2KSA9PSBBTURfUkVTRVRfTUVUSE9EX0JBQ08pCi0JCXJl
dCA9IHNvYzE1X2FzaWNfYmFjb19yZXNldChhZGV2KTsKLQllbHNlCi0JCXJldCA9IHNvYzE1X2Fz
aWNfbW9kZTFfcmVzZXQoYWRldik7Ci0KLQlyZXR1cm4gcmV0OworCXN3aXRjaCAoc29jMTVfYXNp
Y19yZXNldF9tZXRob2QoYWRldikpIHsKKwkJY2FzZSBBTURfUkVTRVRfTUVUSE9EX0JBQ086CisJ
CQlyZXR1cm4gc29jMTVfYXNpY19iYWNvX3Jlc2V0KGFkZXYpOworCQljYXNlIEFNRF9SRVNFVF9N
RVRIT0RfTU9ERTI6CisJCQlyZXR1cm4gc29jMTVfbW9kZTJfcmVzZXQoYWRldik7CisJCWRlZmF1
bHQ6CisJCQlyZXR1cm4gc29jMTVfYXNpY19tb2RlMV9yZXNldChhZGV2KTsKKwl9CiB9CiAKIC8q
c3RhdGljIGludCBzb2MxNV9zZXRfdXZkX2Nsb2NrKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCB1MzIgY2xvY2ssCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
