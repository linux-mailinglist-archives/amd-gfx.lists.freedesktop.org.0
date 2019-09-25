Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD56BE46D
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 20:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D866EC85;
	Wed, 25 Sep 2019 18:15:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760042.outbound.protection.outlook.com [40.107.76.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DE66EC60
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 18:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mm8neTIPJKx3wiApYRRmCH55+iw+aBHSxHeKmsz1OWaz1diEuVvjghas7Zvv42/NMUNWwNlsVXtowLihwEpRku/NXjzKWfnfY8E95w8kpN2Ot2fufazIzboYtJy19cDm1ZqxW0jTVvo38CWOcFRE8VHQjKgmBM1kf6ygy4xZsqOEzwm2jLnkwfmfUwd/dhcpG3o7CA97i6ZEGu+FOeFNPD+w0SqR3lkzThKng4VrmRAA+60x2vaVgObUB9o+tZuuDB55Nhl1oKxqGVeyxY07I1su9RgBRHjTeTlbFXanMdNvgxmXF3kcnMWCNUz4iGbk09zcUanDXXHq6XOaTd9c9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xScQekMySSOt8Uy7t0c8reG7zRoUtIRWfgfJxrxm2Q=;
 b=IbDMUeBMmz/c46XLv/yIBkPWjJlSOKilPxvQlDy1PO7umAsqy0bmCO3ot5UN9fxhLC+n37ULJQB4m3CfADPP70Dbj0SJwh7+9OER0isv2t4VleH2jHSixP8kU5PHOJb+57J5/OukjmUDr4QYzvrzWjw40LxNIAGzdLBujBo3arrSKfeUwpIJoEQ/l/o2xuR2r2xX16U+QQ4JhZKIBIX9Pnfd7duAs4OhnKsPkgHzL/U1IAGU3b/Im8vUkHLX+CyeOem/T0M6d8R64IkJZtjM9BTaz71WZzgApPow74zxR1TO6PvADqNM9utA5MAEscI0CJ2hb+p0WWAlDohC2Mdgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB2681.namprd12.prod.outlook.com (20.176.116.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Wed, 25 Sep 2019 18:15:42 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 18:15:41 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: Export setup_vm_pt_regs() logic for gfxhub 2.0
Thread-Topic: [PATCH 1/3] drm/amdgpu: Export setup_vm_pt_regs() logic for
 gfxhub 2.0
Thread-Index: AQHVc8093kQ+hgY+9kmNX+wTQoEqTA==
Date: Wed, 25 Sep 2019 18:15:41 +0000
Message-ID: <20190925181527.17091-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::14) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67e11a3e-bb7e-41e2-ee0a-08d741e4600b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2681; 
x-ms-traffictypediagnostic: DM6PR12MB2681:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2681A744908876E291B818F4F0870@DM6PR12MB2681.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:343;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(189003)(199004)(6512007)(486006)(36756003)(8936002)(2906002)(476003)(6116002)(6916009)(50226002)(305945005)(7736002)(1076003)(66066001)(2351001)(102836004)(386003)(26005)(2501003)(4326008)(3846002)(71190400001)(71200400001)(66556008)(81156014)(66946007)(64756008)(6486002)(2616005)(99286004)(86362001)(6506007)(5640700003)(6436002)(186003)(14454004)(81166006)(8676002)(66476007)(52116002)(25786009)(66446008)(256004)(316002)(5660300002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2681;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2McIbIDrEpFlmQglKPSFZPLPpvj+zEx2/BXCBw1TKxaWYpTXht5CzUGSVsAMsnpBpHa3mBRHayULzzC3AcAS9nDfs+4HMxELSh0ujo0f3qv9bf2L/FfI/5rLPM9DktFJXdePg8RbJ2FH1cvoe2ob9g5N7QpcgViM3jQ9w5ZaIEYQinAFI6/vzwmj4NP2+0B5DCvQxCd3cnsdepso8wJyZt8pgbVRoSWzouXOcdUy+BFoQxGdmj3FABW3Mq4lIAEjkBTway9kTL0E8pCUwygNpHaS1OX7TJ4VLIKQh3vPXnfyy5NAJCgtUYLbhF0XcMMkQA8BicraaH+HnlAVe4P3q46MVuRPTxm0bLybufb2kkMiGdD93NQ7ikm1mO9Lf6hXCLoI6sGcDtX/ba9K7ArYLBfCcu0u9piJpMV3ovCLP18=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e11a3e-bb7e-41e2-ee0a-08d741e4600b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 18:15:41.8566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3tWq4XPvgiOcOIzTcG+M+2VXTGzu+EL+7JW41UG3Hqj4WWMW3dAI52R7v7ugLAJv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2681
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xScQekMySSOt8Uy7t0c8reG7zRoUtIRWfgfJxrxm2Q=;
 b=EqkIbFudXDucLuiAtTFnzeD8Z9MI+1Itm7ywp8vf6oDpLA0aFtArbYM0mjVHEWP2GM9JKdlshiWK4IVrP1cAVfkjnmWKJTkx+tomwsPVesaubDRdJ2TKXzEri1q9rM/EBprGW/BPY8eax+AsDDiP+pwOxCLntq20blDopYhkCa8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIEtGRCBjb2RlIHdpbGwgY2FsbCB0aGlzIGZ1bmN0aW9uIGxhdGVyLgoKQ2hhbmdlLUlkOiBJ
ODhhNTMzNjhjZGVlNzE5YjJjNzUzOTNlNWNkYmQ4MjkwNTg0NTQ4ZQpTaWduZWQtb2ZmLWJ5OiBZ
b25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeGh1Yl92Ml8wLmMgfCAyMCArKysrKysrKysrKystLS0tLS0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuaCB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeGh1Yl92Ml8wLmMKaW5kZXggYTkyMzg3MzVkMzYxLi5iNjAxYzY3NDBlZjUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92Ml8wLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuYwpAQCAtNDYsMjEgKzQ2LDI1IEBAIHU2
NCBnZnhodWJfdjJfMF9nZXRfbWNfZmJfb2Zmc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogCXJldHVybiAodTY0KVJSRUczMl9TT0MxNShHQywgMCwgbW1HQ01DX1ZNX0ZCX09GRlNFVCkg
PDwgMjQ7CiB9CiAKLXN0YXRpYyB2b2lkIGdmeGh1Yl92Ml8wX2luaXRfZ2FydF9wdF9yZWdzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQordm9pZCBnZnhodWJfdjJfMF9zZXR1cF92bV9wdF9y
ZWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCB2bWlkLAorCQkJCXVpbnQ2
NF90IHBhZ2VfdGFibGVfYmFzZSkKIHsKLQl1aW50NjRfdCB2YWx1ZSA9IGFtZGdwdV9nbWNfcGRf
YWRkcihhZGV2LT5nYXJ0LmJvKTsKKwkvKiB0d28gcmVnaXN0ZXJzIGRpc3RhbmNlIGJldHdlZW4g
bW1HQ1ZNX0NPTlRFWFQwXyogdG8gbW1HQ1ZNX0NPTlRFWFQxXyogKi8KKwlpbnQgb2Zmc2V0ID0g
bW1HQ1ZNX0NPTlRFWFQxX1BBR0VfVEFCTEVfQkFTRV9BRERSX0xPMzIKKwkJCS0gbW1HQ1ZNX0NP
TlRFWFQwX1BBR0VfVEFCTEVfQkFTRV9BRERSX0xPMzI7CiAKKwlXUkVHMzJfU09DMTVfT0ZGU0VU
KEdDLCAwLCBtbUdDVk1fQ09OVEVYVDBfUEFHRV9UQUJMRV9CQVNFX0FERFJfTE8zMiwKKwkJCQlv
ZmZzZXQgKiB2bWlkLCBsb3dlcl8zMl9iaXRzKHBhZ2VfdGFibGVfYmFzZSkpOwogCi0JV1JFRzMy
X1NPQzE1KEdDLCAwLCBtbUdDVk1fQ09OVEVYVDBfUEFHRV9UQUJMRV9CQVNFX0FERFJfTE8zMiwK
LQkJICAgICBsb3dlcl8zMl9iaXRzKHZhbHVlKSk7Ci0KLQlXUkVHMzJfU09DMTUoR0MsIDAsIG1t
R0NWTV9DT05URVhUMF9QQUdFX1RBQkxFX0JBU0VfQUREUl9ISTMyLAotCQkgICAgIHVwcGVyXzMy
X2JpdHModmFsdWUpKTsKKwlXUkVHMzJfU09DMTVfT0ZGU0VUKEdDLCAwLCBtbUdDVk1fQ09OVEVY
VDBfUEFHRV9UQUJMRV9CQVNFX0FERFJfSEkzMiwKKwkJCQlvZmZzZXQgKiB2bWlkLCB1cHBlcl8z
Ml9iaXRzKHBhZ2VfdGFibGVfYmFzZSkpOwogfQogCiBzdGF0aWMgdm9pZCBnZnhodWJfdjJfMF9p
bml0X2dhcnRfYXBlcnR1cmVfcmVncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKLQln
ZnhodWJfdjJfMF9pbml0X2dhcnRfcHRfcmVncyhhZGV2KTsKKwl1aW50NjRfdCBwdF9iYXNlID0g
YW1kZ3B1X2dtY19wZF9hZGRyKGFkZXYtPmdhcnQuYm8pOworCisJZ2Z4aHViX3YyXzBfc2V0dXBf
dm1fcHRfcmVncyhhZGV2LCAwLCBwdF9iYXNlKTsKIAogCVdSRUczMl9TT0MxNShHQywgMCwgbW1H
Q1ZNX0NPTlRFWFQwX1BBR0VfVEFCTEVfU1RBUlRfQUREUl9MTzMyLAogCQkgICAgICh1MzIpKGFk
ZXYtPmdtYy5nYXJ0X3N0YXJ0ID4+IDEyKSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhodWJfdjJfMC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
aHViX3YyXzAuaAppbmRleCAwNjgwNzk0MDc0OGIuLjM5MmI4Y2Q5NGZjMCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4aHViX3YyXzAuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhodWJfdjJfMC5oCkBAIC0zMSw1ICszMSw3IEBAIHZvaWQgZ2Z4
aHViX3YyXzBfc2V0X2ZhdWx0X2VuYWJsZV9kZWZhdWx0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAogCQkJCQkgIGJvb2wgdmFsdWUpOwogdm9pZCBnZnhodWJfdjJfMF9pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KTsKIHU2NCBnZnhodWJfdjJfMF9nZXRfbWNfZmJfb2Zmc2V0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKK3ZvaWQgZ2Z4aHViX3YyXzBfc2V0dXBfdm1fcHRf
cmVncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwKKwkJCQl1aW50
NjRfdCBwYWdlX3RhYmxlX2Jhc2UpOwogCiAjZW5kaWYKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
