Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D0B11971
	for <lists+amd-gfx@lfdr.de>; Thu,  2 May 2019 14:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCC189483;
	Thu,  2 May 2019 12:56:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700078.outbound.protection.outlook.com [40.107.70.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB2A89483
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 May 2019 12:56:39 +0000 (UTC)
Received: from SN1PR12CA0072.namprd12.prod.outlook.com (2603:10b6:802:20::43)
 by CY4PR12MB1192.namprd12.prod.outlook.com (2603:10b6:903:40::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.13; Thu, 2 May
 2019 12:56:38 +0000
Received: from CO1NAM03FT042.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by SN1PR12CA0072.outlook.office365.com
 (2603:10b6:802:20::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via Frontend
 Transport; Thu, 2 May 2019 12:56:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT042.mail.protection.outlook.com (10.152.81.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Thu, 2 May 2019 12:56:37 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 2 May 2019
 07:56:35 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Use FW addr returned by PSP for VF MM
Date: Thu, 2 May 2019 20:56:31 +0800
Message-ID: <1556801791-8460-1-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(396003)(346002)(136003)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(356004)(26005)(2906002)(6666004)(186003)(77096007)(316002)(6916009)(70206006)(16586007)(5660300002)(86362001)(53936002)(4326008)(70586007)(50466002)(47776003)(48376002)(68736007)(50226002)(81166006)(476003)(8676002)(426003)(36756003)(81156014)(2616005)(2351001)(126002)(305945005)(336012)(478600001)(486006)(72206003)(8936002)(51416003)(53416004)(7696005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1192; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c5db2d7-a959-4d08-093a-08d6cefd9d0c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CY4PR12MB1192; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1192:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1192BDF41F15A3C088490879FE340@CY4PR12MB1192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-Forefront-PRVS: 0025434D2D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QTPQpUhfXJEQDKKmQ8W/PG5iSF+agnlP0TyHGf0N4tB4Hmlb97mu4t9BH9H7BWQ8id2k4+yxJoKmJ12bnoHQfmTGZMbnK9MhME6KTRJ4k7TDNb9m3qdIIcsi5rC+kkmRdWIScBuLQoY/pEZzqb9TRm5Iw6W0ruwRjSmPg2/zk+DT0H4ilXyn3oBC57LQ3mYHKi/7au5dv8XOGCD6hJCxeOgajB2MqO8giFc+6j1UBqHbfPqjSsrtmHhnLDXxDXeQTSUvAECdNVUlYy4PHleEUO2kQCdrWA1gsRcf3LttLI03XO1zOSH50fGMEGIbK4yss/HiH7J/lx3Hw825dX9rF3pniUR3ChRW70h3mRUspEIBV2s9d+uNeYYzsuSa7ElUVSY1V4ZEbcEWcCYju8F13jYB9DdNJBnQty4iyP9YAto=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2019 12:56:37.3503 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5db2d7-a959-4d08-093a-08d6cefd9d0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1192
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJk270MEpnvhfBIcYsXhLsBuUQGtK3uCGd2HJ2W6gEw=;
 b=qtHv5nASN8JVFckkVCYui+jGAFyYibjNtYQgrAg6h4y0eVrMDVje+WxTOvkQR8ZbEcEgX4fhOo3L078HzIwta2pRIRcD5E219N1fEkp3/aMkNpsKYK9vm+avPYc9dd2zoVU+CoA0aBAtk6d3Pe7+MvoxZztXIn+CYcFzV8VUmOc=
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
Cc: Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T25lIFZlZ2ExMCBTUi1JT1YgVkYsIHRoZSBGVyBhZGRyZXNzIHJldHVybmVkIGJ5IFBTUCBzaG91
bGQgYmUKc2V0IGludG8gdGhlIGluaXQgdGFibGUsIHdoaWxlIG5vdCB0aGUgb3JpZ2luYWwgQk8g
bWMgYWRkcmVzcy4Kb3RoZXJ3aXNlLCBVVkQgYW5kIFZDRSBJQiB0ZXN0IHdpbGwgZmFpbCB1bmRl
ciBWZWdhMTAgU1ItSU9WCgpyZWZlcmVuY2U6Cgljb21taXQgYmZjZWE1MjA0Mjg3ICgiZHJtL2Ft
ZGdwdTpjaGFuZ2UgVkVHQSBib290aW5nIHdpdGggZmlybXdhcmUgbG9hZGVkIGJ5IFBTUCIpCglj
b21taXQgYWE1ODczZGNhNDYzICgiZHJtL2FtZGdwdTogQ2hhbmdlIFZDRSBib290aW5nIHdpdGgg
ZmlybXdhcmUgbG9hZGVkIGJ5IFBTUCIpCgpTaWduZWQtb2ZmLWJ5OiBUcmlnZ2VyIEh1YW5nIDxU
cmlnZ2VyLkh1YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZk
X3Y3XzAuYyB8IDE2ICsrKysrKysrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3ZjZV92NF8wLmMgfCAxNyArKysrKysrKysrKy0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMSBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZk
X3Y3XzAuYwppbmRleCBkYzQ2MWRmLi4yMTkxZDNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3V2ZF92N18wLmMKQEAgLTc4NywxMCArNzg3LDEzIEBAIHN0YXRpYyBpbnQgdXZkX3Y3XzBfc3Jp
b3Zfc3RhcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQkJCQkJICAgMHhGRkZGRkZG
RiwgMHgwMDAwMDAwNCk7CiAJCQkvKiBtYyByZXN1bWUqLwogCQkJaWYgKGFkZXYtPmZpcm13YXJl
LmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9QU1ApIHsKLQkJCQlNTVNDSF9WMV8wX0lOU0VS
VF9ESVJFQ1RfV1QoU09DMTVfUkVHX09GRlNFVChVVkQsIGksIG1tVVZEX0xNSV9WQ1BVX0NBQ0hF
XzY0QklUX0JBUl9MT1cpLAotCQkJCQkJCSAgICBsb3dlcl8zMl9iaXRzKGFkZXYtPmZpcm13YXJl
LnVjb2RlW0FNREdQVV9VQ09ERV9JRF9VVkRdLm1jX2FkZHIpKTsKLQkJCQlNTVNDSF9WMV8wX0lO
U0VSVF9ESVJFQ1RfV1QoU09DMTVfUkVHX09GRlNFVChVVkQsIGksIG1tVVZEX0xNSV9WQ1BVX0NB
Q0hFXzY0QklUX0JBUl9ISUdIKSwKLQkJCQkJCQkgICAgdXBwZXJfMzJfYml0cyhhZGV2LT5maXJt
d2FyZS51Y29kZVtBTURHUFVfVUNPREVfSURfVVZEXS5tY19hZGRyKSk7CisJCQkJTU1TQ0hfVjFf
MF9JTlNFUlRfRElSRUNUX1dUKFNPQzE1X1JFR19PRkZTRVQoVVZELCBpLAorCQkJCQkJCW1tVVZE
X0xNSV9WQ1BVX0NBQ0hFXzY0QklUX0JBUl9MT1cpLAorCQkJCQkJCWFkZXYtPmZpcm13YXJlLnVj
b2RlW0FNREdQVV9VQ09ERV9JRF9VVkRdLnRtcl9tY19hZGRyX2xvKTsKKwkJCQlNTVNDSF9WMV8w
X0lOU0VSVF9ESVJFQ1RfV1QoU09DMTVfUkVHX09GRlNFVChVVkQsIGksCisJCQkJCQkJbW1VVkRf
TE1JX1ZDUFVfQ0FDSEVfNjRCSVRfQkFSX0hJR0gpLAorCQkJCQkJCWFkZXYtPmZpcm13YXJlLnVj
b2RlW0FNREdQVV9VQ09ERV9JRF9VVkRdLnRtcl9tY19hZGRyX2hpKTsKKwkJCQlNTVNDSF9WMV8w
X0lOU0VSVF9ESVJFQ1RfV1QoU09DMTVfUkVHX09GRlNFVChVVkQsIDAsIG1tVVZEX1ZDUFVfQ0FD
SEVfT0ZGU0VUMCksIDApOwogCQkJCW9mZnNldCA9IDA7CiAJCQl9IGVsc2UgewogCQkJCU1NU0NI
X1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFVWRCwgaSwgbW1VVkRfTE1J
X1ZDUFVfQ0FDSEVfNjRCSVRfQkFSX0xPVyksCkBAIC03OTgsMTAgKzgwMSwxMSBAQCBzdGF0aWMg
aW50IHV2ZF92N18wX3NyaW92X3N0YXJ0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJ
CU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFVWRCwgaSwgbW1V
VkRfTE1JX1ZDUFVfQ0FDSEVfNjRCSVRfQkFSX0hJR0gpLAogCQkJCQkJCSAgICB1cHBlcl8zMl9i
aXRzKGFkZXYtPnV2ZC5pbnN0W2ldLmdwdV9hZGRyKSk7CiAJCQkJb2Zmc2V0ID0gc2l6ZTsKKwkJ
CQlNTVNDSF9WMV8wX0lOU0VSVF9ESVJFQ1RfV1QoU09DMTVfUkVHX09GRlNFVChVVkQsIDAsIG1t
VVZEX1ZDUFVfQ0FDSEVfT0ZGU0VUMCksCisJCQkJCQkJQU1ER1BVX1VWRF9GSVJNV0FSRV9PRkZT
RVQgPj4gMyk7CisKIAkJCX0KIAotCQkJTU1TQ0hfVjFfMF9JTlNFUlRfRElSRUNUX1dUKFNPQzE1
X1JFR19PRkZTRVQoVVZELCBpLCBtbVVWRF9WQ1BVX0NBQ0hFX09GRlNFVDApLAotCQkJCQkJICAg
IEFNREdQVV9VVkRfRklSTVdBUkVfT0ZGU0VUID4+IDMpOwogCQkJTU1TQ0hfVjFfMF9JTlNFUlRf
RElSRUNUX1dUKFNPQzE1X1JFR19PRkZTRVQoVVZELCBpLCBtbVVWRF9WQ1BVX0NBQ0hFX1NJWkUw
KSwgc2l6ZSk7CiAKIAkJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZG
U0VUKFVWRCwgaSwgbW1VVkRfTE1JX1ZDUFVfQ0FDSEUxXzY0QklUX0JBUl9MT1cpLApkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3ZjZV92NF8wLmMKaW5kZXggZjNmNTkzOC4uYzBlYzI3OSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjRfMC5jCkBAIC0yNDQsMTMgKzI0NCwxOCBAQCBzdGF0
aWMgaW50IHZjZV92NF8wX3NyaW92X3N0YXJ0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQog
CQlNTVNDSF9WMV8wX0lOU0VSVF9ESVJFQ1RfV1QoU09DMTVfUkVHX09GRlNFVChWQ0UsIDAsIG1t
VkNFX0xNSV9TV0FQX0NOVEwxKSwgMCk7CiAJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChT
T0MxNV9SRUdfT0ZGU0VUKFZDRSwgMCwgbW1WQ0VfTE1JX1ZNX0NUUkwpLCAwKTsKIAorCQlvZmZz
ZXQgPSBBTURHUFVfVkNFX0ZJUk1XQVJFX09GRlNFVDsKIAkJaWYgKGFkZXYtPmZpcm13YXJlLmxv
YWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9QU1ApIHsKKwkJCXVpbnQzMl90IGxvdyA9IGFkZXYt
PmZpcm13YXJlLnVjb2RlW0FNREdQVV9VQ09ERV9JRF9WQ0VdLnRtcl9tY19hZGRyX2xvOworCQkJ
dWludDMyX3QgaGkgPSBhZGV2LT5maXJtd2FyZS51Y29kZVtBTURHUFVfVUNPREVfSURfVkNFXS50
bXJfbWNfYWRkcl9oaTsKKwkJCXVpbnQ2NF90IHRtcl9tY19hZGRyID0gKHVpbnQ2NF90KShoaSkg
PDwgMzIgfCBsb3c7CisKIAkJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdf
T0ZGU0VUKFZDRSwgMCwKLQkJCQkJCW1tVkNFX0xNSV9WQ1BVX0NBQ0hFXzQwQklUX0JBUjApLAot
CQkJCQkJYWRldi0+ZmlybXdhcmUudWNvZGVbQU1ER1BVX1VDT0RFX0lEX1ZDRV0ubWNfYWRkciA+
PiA4KTsKKwkJCQkJCW1tVkNFX0xNSV9WQ1BVX0NBQ0hFXzQwQklUX0JBUjApLCB0bXJfbWNfYWRk
ciA+PiA4KTsKIAkJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VU
KFZDRSwgMCwKIAkJCQkJCW1tVkNFX0xNSV9WQ1BVX0NBQ0hFXzY0QklUX0JBUjApLAotCQkJCQkJ
KGFkZXYtPmZpcm13YXJlLnVjb2RlW0FNREdQVV9VQ09ERV9JRF9WQ0VdLm1jX2FkZHIgPj4gNDAp
ICYgMHhmZik7CisJCQkJCQkodG1yX21jX2FkZHIgPj4gNDApICYgMHhmZik7CisJCQlNTVNDSF9W
MV8wX0lOU0VSVF9ESVJFQ1RfV1QoU09DMTVfUkVHX09GRlNFVChWQ0UsIDAsIG1tVkNFX1ZDUFVf
Q0FDSEVfT0ZGU0VUMCksIDApOwogCQl9IGVsc2UgewogCQkJTU1TQ0hfVjFfMF9JTlNFUlRfRElS
RUNUX1dUKFNPQzE1X1JFR19PRkZTRVQoVkNFLCAwLAogCQkJCQkJbW1WQ0VfTE1JX1ZDUFVfQ0FD
SEVfNDBCSVRfQkFSMCksCkBAIC0yNTgsNiArMjYzLDkgQEAgc3RhdGljIGludCB2Y2VfdjRfMF9z
cmlvdl9zdGFydChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCU1NU0NIX1YxXzBfSU5T
RVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFZDRSwgMCwKIAkJCQkJCW1tVkNFX0xNSV9W
Q1BVX0NBQ0hFXzY0QklUX0JBUjApLAogCQkJCQkJKGFkZXYtPnZjZS5ncHVfYWRkciA+PiA0MCkg
JiAweGZmKTsKKwkJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VU
KFZDRSwgMCwgbW1WQ0VfVkNQVV9DQUNIRV9PRkZTRVQwKSwKKwkJCQkJCW9mZnNldCAmIH4weDBm
MDAwMDAwKTsKKwogCQl9CiAJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdf
T0ZGU0VUKFZDRSwgMCwKIAkJCQkJCW1tVkNFX0xNSV9WQ1BVX0NBQ0hFXzQwQklUX0JBUjEpLApA
QCAtMjcyLDEwICsyODAsNyBAQCBzdGF0aWMgaW50IHZjZV92NF8wX3NyaW92X3N0YXJ0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJCQkJbW1WQ0VfTE1JX1ZDUFVfQ0FDSEVfNjRCSVRf
QkFSMiksCiAJCQkJCQkoYWRldi0+dmNlLmdwdV9hZGRyID4+IDQwKSAmIDB4ZmYpOwogCi0JCW9m
ZnNldCA9IEFNREdQVV9WQ0VfRklSTVdBUkVfT0ZGU0VUOwogCQlzaXplID0gVkNFX1Y0XzBfRldf
U0laRTsKLQkJTU1TQ0hfVjFfMF9JTlNFUlRfRElSRUNUX1dUKFNPQzE1X1JFR19PRkZTRVQoVkNF
LCAwLCBtbVZDRV9WQ1BVX0NBQ0hFX09GRlNFVDApLAotCQkJCQlvZmZzZXQgJiB+MHgwZjAwMDAw
MCk7CiAJCU1NU0NIX1YxXzBfSU5TRVJUX0RJUkVDVF9XVChTT0MxNV9SRUdfT0ZGU0VUKFZDRSwg
MCwgbW1WQ0VfVkNQVV9DQUNIRV9TSVpFMCksIHNpemUpOwogCiAJCW9mZnNldCA9IChhZGV2LT5m
aXJtd2FyZS5sb2FkX3R5cGUgIT0gQU1ER1BVX0ZXX0xPQURfUFNQKSA/IG9mZnNldCArIHNpemUg
OiAwOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
