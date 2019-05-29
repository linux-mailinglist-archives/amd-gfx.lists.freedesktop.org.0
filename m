Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91D2D8D6
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 11:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B1A6E040;
	Wed, 29 May 2019 09:18:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810041.outbound.protection.outlook.com [40.107.81.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2729E6E040
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 09:18:08 +0000 (UTC)
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2623.namprd12.prod.outlook.com (52.135.103.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Wed, 29 May 2019 09:17:59 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c%7]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 09:17:59 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: gpu reset run IB test once
Thread-Topic: [PATCH] drm/amdgpu: gpu reset run IB test once
Thread-Index: AQHVFf9Gn5j/g1QJWUi/HwdmWmmyWQ==
Date: Wed, 29 May 2019 09:17:59 +0000
Message-ID: <SN6PR12MB280073F9E6D9035252740B0F871F0@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.88.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f3c833c-9017-4d83-116a-08d6e4168b40
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2623; 
x-ms-traffictypediagnostic: SN6PR12MB2623:
x-microsoft-antispam-prvs: <SN6PR12MB2623A49EF4EE378156B96CA1871F0@SN6PR12MB2623.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(39860400002)(376002)(346002)(189003)(199004)(6436002)(5640700003)(86362001)(8676002)(486006)(64756008)(14454004)(2906002)(52536014)(305945005)(66476007)(73956011)(66946007)(81156014)(76116006)(81166006)(102836004)(66556008)(91956017)(66446008)(55016002)(7736002)(72206003)(316002)(26005)(66066001)(478600001)(9686003)(5660300002)(6506007)(7696005)(25786009)(2351001)(2501003)(33656002)(74316002)(6916009)(6116002)(256004)(99286004)(68736007)(4326008)(14444005)(3846002)(186003)(54906003)(71190400001)(71200400001)(476003)(53936002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2623;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 39SrljnTVa1aPLHd6MSJK8EwvgJo87SQ4rR7Mj/bwMBFDTtL0w3fHCVkZbG9zO4/zpu/VbxhvqENseJuJLhmz4fEF9i4WMeGY5J1r1e2nxRPttL7ugSVxj5MKY7FRhj3X4mVhtw4IRpvLZ0f8C9qimbXEozj7iSh/mymaMtPo8rcxX6XcrZmojJDIip53qF9+YU1OslmlUc87nAWCeL2guC8Ax/zh/UXz5t6E/AU0NKYmoKuuPdF+n1oBUxYMgI4X4o4AAWhuA0dA6xPDkH/IrxRecYd9nNOeGwfQLZZNWPmasELHsvrDEl7542EnrkcAI/doWQyZY+NV//Y0u+QVYU1D4pCqBcswRd8p5iAyaCTFcCq+kn9p+JFoNPLm8jVdi1Xo6VoukAQxUfouclBg0oP0bn2YwUhFEN8VBiV7HU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3c833c-9017-4d83-116a-08d6e4168b40
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 09:17:59.4360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2623
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Kbg8Y0ITmHfs2sacVaTHOvzq2v+hS56U5aCoHpilnY=;
 b=KLcgMMgXFq/ssdtIxc53sDzy8Ke8ZHVjqMfHZVpf9JY7Np4v0GUPP+5poUsnA+ZBDoCjBB2NsxWJIEXqA9lkphNXQsqx93b1KE/+0JItNPQXRDFSuQerT7+dZHRg2M1TLRJBNTSLaeCwflJpaVi/o4Bf1uHKrnJOMd+r58G5P7w=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 JinHuiEric" <JinHuiEric.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y3VycmVudGx5IGdwdSByZXNldCB3aWxsIHNjaGVkdWxlIGxhdGVfaW5pdF93b3JrIHdoaWNoIHdp
bGwgZG8gb25lIElCCnRlc3QuIFRoYXQgd291bGQgcmFjZSB3aXRoIHRoZSBJQiB0ZXN0IGluIGdw
dSByZXNldCBpdHNlbGYuCgphZGQgYW5vdGhlciBkb19pcF9sYXRlX2luaXQoKSBmdW5jdGlvbiB3
aGljaCBza2lwcyB0aGUgbGF0ZV9pbml0X3dvcmsuCgpTaWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFu
IDx4aW5odWkucGFuQGFtZC5jb20+ClN1Z2dlc3RlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYyB8IDMwICsrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
NCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCAyNDFjZDJjNzU0MzMuLmExZGNlZTEyNWQxZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMTkwMCw3ICsx
OTAwLDcgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNlX3NldF9wZ19zdGF0ZShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwgZW51bSBhbWRfcG93ZXIKIH0KIAogLyoqCi0gKiBhbWRncHVfZGV2
aWNlX2lwX2xhdGVfaW5pdCAtIHJ1biBsYXRlIGluaXQgZm9yIGhhcmR3YXJlIElQcworICogYW1k
Z3B1X2RldmljZV9kb19pcF9sYXRlX2luaXQgLSBydW4gbGF0ZSBpbml0IGZvciBoYXJkd2FyZSBJ
UHMKICAqCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCiAgKgpAQCAtMTkxMSw3ICsx
OTExLDcgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNlX3NldF9wZ19zdGF0ZShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwgZW51bSBhbWRfcG93ZXIKICAqIGxhdGUgaW4gdGhlIGluaXQgcHJv
Y2Vzcy4KICAqIFJldHVybnMgMCBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZh
aWx1cmUuCiAgKi8KLXN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9sYXRlX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCitzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfZG9faXBfbGF0
ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCWludCBpID0gMCwgcjsKIApA
QCAtMTkzMiwxNCArMTkzMiwzMiBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfaXBfbGF0ZV9p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWFtZGdwdV9kZXZpY2Vfc2V0X2NnX3N0
YXRlKGFkZXYsIEFNRF9DR19TVEFURV9HQVRFKTsKIAlhbWRncHVfZGV2aWNlX3NldF9wZ19zdGF0
ZShhZGV2LCBBTURfUEdfU1RBVEVfR0FURSk7CiAKLQlxdWV1ZV9kZWxheWVkX3dvcmsoc3lzdGVt
X3dxLCAmYWRldi0+bGF0ZV9pbml0X3dvcmssCi0JCQkgICBtc2Vjc190b19qaWZmaWVzKEFNREdQ
VV9SRVNVTUVfTVMpKTsKLQogCWFtZGdwdV9kZXZpY2VfZmlsbF9yZXNldF9tYWdpYyhhZGV2KTsK
IAogCXJldHVybiAwOwogfQogCisvKioKKyAqIGFtZGdwdV9kZXZpY2VfaXBfbGF0ZV9pbml0IC0g
cnVuIGxhdGUgaW5pdCBmb3IgaGFyZHdhcmUgSVBzCisgKgorICogQGFkZXY6IGFtZGdwdV9kZXZp
Y2UgcG9pbnRlcgorICoKKyAqIHNjaGVkdWxlIGxhdGVfaW5pdF93b3JrIGFmdGVyIGxhdGVfaW5p
dC4KKyAqIFJldHVybiAwIG9uIHN1Y2Nlc3MuCisgKi8KK3N0YXRpYyBpbnQgYW1kZ3B1X2Rldmlj
ZV9pcF9sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJaW50IHI7CisK
KwlyID0gYW1kZ3B1X2RldmljZV9kb19pcF9sYXRlX2luaXQoYWRldik7CisJaWYgKHIpCisJCXJl
dHVybiByOworCisJcXVldWVfZGVsYXllZF93b3JrKHN5c3RlbV93cSwgJmFkZXYtPmxhdGVfaW5p
dF93b3JrLAorCQkJICAgbXNlY3NfdG9famlmZmllcyhBTURHUFVfUkVTVU1FX01TKSk7CisJcmV0
dXJuIDA7Cit9CisKIC8qKgogICogYW1kZ3B1X2RldmljZV9pcF9maW5pIC0gcnVuIGZpbmkgZm9y
IGhhcmR3YXJlIElQcwogICoKQEAgLTM1NDUsNyArMzU2Myw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X2RvX2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9oaXZlX2luZm8gKmhpdmUsCiAJCQkJaWYgKHZy
YW1fbG9zdCkKIAkJCQkJYW1kZ3B1X2RldmljZV9maWxsX3Jlc2V0X21hZ2ljKHRtcF9hZGV2KTsK
IAotCQkJCXIgPSBhbWRncHVfZGV2aWNlX2lwX2xhdGVfaW5pdCh0bXBfYWRldik7CisJCQkJciA9
IGFtZGdwdV9kZXZpY2VfZG9faXBfbGF0ZV9pbml0KHRtcF9hZGV2KTsKIAkJCQlpZiAocikKIAkJ
CQkJZ290byBvdXQ7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
