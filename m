Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3521A30897
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 08:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D5D89231;
	Fri, 31 May 2019 06:37:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740044.outbound.protection.outlook.com [40.107.74.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A51089231
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 06:37:02 +0000 (UTC)
Received: from MWHPR12CA0048.namprd12.prod.outlook.com (2603:10b6:301:2::34)
 by MWHPR1201MB0062.namprd12.prod.outlook.com (2603:10b6:301:54::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.16; Fri, 31 May
 2019 06:37:00 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by MWHPR12CA0048.outlook.office365.com
 (2603:10b6:301:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.16 via Frontend
 Transport; Fri, 31 May 2019 06:37:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Fri, 31 May 2019 06:36:59 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 31 May 2019
 01:36:58 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/sriov: Correct some register program method
Date: Fri, 31 May 2019 14:36:54 +0800
Message-ID: <1559284614-20932-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(478600001)(6666004)(356004)(48376002)(14444005)(68736007)(50466002)(2351001)(53416004)(4326008)(70586007)(70206006)(8936002)(47776003)(72206003)(486006)(81156014)(36756003)(50226002)(5660300002)(336012)(426003)(77096007)(26005)(86362001)(81166006)(53936002)(126002)(476003)(2616005)(8676002)(186003)(7696005)(316002)(51416003)(16586007)(305945005)(2906002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0062; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38697b6d-4d04-4495-78b4-08d6e5926275
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB0062; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0062:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB00629E67FFC931B2A13D505D8F190@MWHPR1201MB0062.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 00540983E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: dDvZsQs24OEHXhHVrF3N0oAc+G9RxVet2me2zq9mTmBJz9aUUY53joAR+j279Be0BB164oqihPE+1o1AVa6v5jAW3ihMmiKP/C/b/KqTjEJjDbCDipWzvyqfA713tBRdVQWx7zXLsiCMNGtzUeX3TRiG2SRBG8O5jtp3Z0S6D5Qx8+ngi5nZrHRzHKohrCg5CFEQtuLXSREL1Sn+iSrtDgyi0NbT5Nc4i78CfJ7PvVwBQWX+AsIRoS0AZnO4DE35ofJq8v1kXKRS+jHpdYhjb3NP9YC+lDx0drOuEMJEQ8Vl+LmyOkA9dRjAV36a4jQjIVpFg43G0Sf+L6/mPSHoKq/RZo096TsnB8p1/gZ44izF3ojzI12z6g4ZA8NozaOixd6nEUQlK3QHCgChrhRqjj71+K4UV02m9ewbJOmoBlA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2019 06:36:59.8094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38697b6d-4d04-4495-78b4-08d6e5926275
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0062
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCSwCgfD2x8rvlB9w30PiKby6Fd9N1UEbPnRjCmpHug=;
 b=xQ3/hf3AzavKFekD9sgjDw+hBgA0aOQ6hU1wUYbxEZZTWpu0gBd2Jq7mfxhQWhviYSnsqPKmeNB4oKhB3KWwQlM9bmEJ0TaGkLeNRTn5c4fWhOhkgqTfM5tWwSTs+6vcwQ6CEV5HzOTMLElYr84zb8pSTX5psq/ov0nCTo2O1f4=
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIHRoZSBWRiwgc29tZSByZWdpc3RlcnMgb25seSBjb3VsZCBiZSBwcm9ncmFtbWVkIHdpdGgg
UkxDLgoKU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgICAgfCAxMCArKysrKy0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjFfMC5jIHwgIDggKysrKy0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IGNjNWEzODIuLjJlOWNhYzEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtMTkyNywxNyArMTkyNywxNyBAQCBz
dGF0aWMgdm9pZCBnZnhfdjlfMF9jb25zdGFudHNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIAkJaWYgKGkgPT0gMCkgewogCQkJdG1wID0gUkVHX1NFVF9GSUVMRCgwLCBTSF9NRU1f
Q09ORklHLCBBTElHTk1FTlRfTU9ERSwKIAkJCQkJICAgIFNIX01FTV9BTElHTk1FTlRfTU9ERV9V
TkFMSUdORUQpOwotCQkJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVNIX01FTV9DT05GSUcsIHRtcCk7
Ci0JCQlXUkVHMzJfU09DMTUoR0MsIDAsIG1tU0hfTUVNX0JBU0VTLCAwKTsKKwkJCVdSRUczMl9T
T0MxNV9STEMoR0MsIDAsIG1tU0hfTUVNX0NPTkZJRywgdG1wKTsKKwkJCVdSRUczMl9TT0MxNV9S
TEMoR0MsIDAsIG1tU0hfTUVNX0JBU0VTLCAwKTsKIAkJfSBlbHNlIHsKIAkJCXRtcCA9IFJFR19T
RVRfRklFTEQoMCwgU0hfTUVNX0NPTkZJRywgQUxJR05NRU5UX01PREUsCiAJCQkJCSAgICBTSF9N
RU1fQUxJR05NRU5UX01PREVfVU5BTElHTkVEKTsKLQkJCVdSRUczMl9TT0MxNShHQywgMCwgbW1T
SF9NRU1fQ09ORklHLCB0bXApOworCQkJV1JFRzMyX1NPQzE1X1JMQyhHQywgMCwgbW1TSF9NRU1f
Q09ORklHLCB0bXApOwogCQkJdG1wID0gUkVHX1NFVF9GSUVMRCgwLCBTSF9NRU1fQkFTRVMsIFBS
SVZBVEVfQkFTRSwKIAkJCQkoYWRldi0+Z21jLnByaXZhdGVfYXBlcnR1cmVfc3RhcnQgPj4gNDgp
KTsKIAkJCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBTSF9NRU1fQkFTRVMsIFNIQVJFRF9CQVNF
LAogCQkJCShhZGV2LT5nbWMuc2hhcmVkX2FwZXJ0dXJlX3N0YXJ0ID4+IDQ4KSk7Ci0JCQlXUkVH
MzJfU09DMTUoR0MsIDAsIG1tU0hfTUVNX0JBU0VTLCB0bXApOworCQkJV1JFRzMyX1NPQzE1X1JM
QyhHQywgMCwgbW1TSF9NRU1fQkFTRVMsIHRtcCk7CiAJCX0KIAl9CiAJc29jMTVfZ3JibV9zZWxl
Y3QoYWRldiwgMCwgMCwgMCwgMCk7CkBAIC0zMDQ2LDcgKzMwNDYsNyBAQCBzdGF0aWMgaW50IGdm
eF92OV8wX2tpcV9pbml0X3JlZ2lzdGVyKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAkJCQkJ
KGFkZXYtPmRvb3JiZWxsX2luZGV4LnVzZXJxdWV1ZV9lbmQgKiAyKSA8PCAyKTsKIAl9CiAKLQlX
UkVHMzJfU09DMTUoR0MsIDAsIG1tQ1BfSFFEX1BRX0RPT1JCRUxMX0NPTlRST0wsCisJV1JFRzMy
X1NPQzE1X1JMQyhHQywgMCwgbW1DUF9IUURfUFFfRE9PUkJFTExfQ09OVFJPTCwKIAkgICAgICAg
bXFkLT5jcF9ocWRfcHFfZG9vcmJlbGxfY29udHJvbCk7CiAKIAkvKiByZXNldCByZWFkIGFuZCB3
cml0ZSBwb2ludGVycywgc2ltaWxhciB0byBDUF9SQjBfV1BUUi9fUlBUUiAqLwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YxXzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92MV8wLmMKaW5kZXggMGRjODkyNi4uOWYwZjE4OSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YxXzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjFfMC5jCkBAIC0xNDYsMTIgKzE0Niwx
MiBAQCBzdGF0aWMgdm9pZCBnZnhodWJfdjFfMF9pbml0X2NhY2hlX3JlZ3Moc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFZNX0wyX0NOVEwsIFBE
RV9GQVVMVF9DTEFTU0lGSUNBVElPTiwgMCk7CiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFZN
X0wyX0NOVEwsIENPTlRFWFQxX0lERU5USVRZX0FDQ0VTU19NT0RFLCAxKTsKIAl0bXAgPSBSRUdf
U0VUX0ZJRUxEKHRtcCwgVk1fTDJfQ05UTCwgSURFTlRJVFlfTU9ERV9GUkFHTUVOVF9TSVpFLCAw
KTsKLQlXUkVHMzJfU09DMTUoR0MsIDAsIG1tVk1fTDJfQ05UTCwgdG1wKTsKKwlXUkVHMzJfU09D
MTVfUkxDKEdDLCAwLCBtbVZNX0wyX0NOVEwsIHRtcCk7CiAKIAl0bXAgPSBSUkVHMzJfU09DMTUo
R0MsIDAsIG1tVk1fTDJfQ05UTDIpOwogCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBWTV9MMl9D
TlRMMiwgSU5WQUxJREFURV9BTExfTDFfVExCUywgMSk7CiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0
bXAsIFZNX0wyX0NOVEwyLCBJTlZBTElEQVRFX0wyX0NBQ0hFLCAxKTsKLQlXUkVHMzJfU09DMTUo
R0MsIDAsIG1tVk1fTDJfQ05UTDIsIHRtcCk7CisJV1JFRzMyX1NPQzE1X1JMQyhHQywgMCwgbW1W
TV9MMl9DTlRMMiwgdG1wKTsKIAogCXRtcCA9IG1tVk1fTDJfQ05UTDNfREVGQVVMVDsKIAlpZiAo
YWRldi0+Z21jLnRyYW5zbGF0ZV9mdXJ0aGVyKSB7CkBAIC0xNjMsMTIgKzE2MywxMiBAQCBzdGF0
aWMgdm9pZCBnZnhodWJfdjFfMF9pbml0X2NhY2hlX3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiAJCXRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBWTV9MMl9DTlRMMywKIAkJCQkgICAg
TDJfQ0FDSEVfQklHS19GUkFHTUVOVF9TSVpFLCA2KTsKIAl9Ci0JV1JFRzMyX1NPQzE1KEdDLCAw
LCBtbVZNX0wyX0NOVEwzLCB0bXApOworCVdSRUczMl9TT0MxNV9STEMoR0MsIDAsIG1tVk1fTDJf
Q05UTDMsIHRtcCk7CiAKIAl0bXAgPSBtbVZNX0wyX0NOVEw0X0RFRkFVTFQ7CiAJdG1wID0gUkVH
X1NFVF9GSUVMRCh0bXAsIFZNX0wyX0NOVEw0LCBWTUNfVEFQX1BERV9SRVFVRVNUX1BIWVNJQ0FM
LCAwKTsKIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1fTDJfQ05UTDQsIFZNQ19UQVBfUFRF
X1JFUVVFU1RfUEhZU0lDQUwsIDApOwotCVdSRUczMl9TT0MxNShHQywgMCwgbW1WTV9MMl9DTlRM
NCwgdG1wKTsKKwlXUkVHMzJfU09DMTVfUkxDKEdDLCAwLCBtbVZNX0wyX0NOVEw0LCB0bXApOwog
fQogCiBzdGF0aWMgdm9pZCBnZnhodWJfdjFfMF9lbmFibGVfc3lzdGVtX2RvbWFpbihzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
