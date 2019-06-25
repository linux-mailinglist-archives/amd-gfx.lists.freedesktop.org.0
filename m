Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A6B55385
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 17:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A42E6E146;
	Tue, 25 Jun 2019 15:36:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680064.outbound.protection.outlook.com [40.107.68.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CB76E146
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 15:36:20 +0000 (UTC)
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1355.namprd12.prod.outlook.com (10.168.234.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 15:36:18 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 15:36:18 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: add missing
 smu_get_clk_info_from_vbios() call
Thread-Topic: [PATCH] drm/amd/powerplay: add missing
 smu_get_clk_info_from_vbios() call
Thread-Index: AQHVK2fInbz6n72zMU+oLQbp/TcoNaasgEjw
Date: Tue, 25 Jun 2019 15:36:18 +0000
Message-ID: <DM5PR12MB141832669A443FD2289C9228FCE30@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190625150742.9121-1-evan.quan@amd.com>
In-Reply-To: <20190625150742.9121-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e89b1b23-16e8-464d-2eba-08d6f982de36
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1355; 
x-ms-traffictypediagnostic: DM5PR12MB1355:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB13552E3860F6C0AF8BFE8D08FCE30@DM5PR12MB1355.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(136003)(396003)(366004)(13464003)(189003)(199004)(11346002)(71200400001)(71190400001)(76176011)(476003)(99286004)(486006)(2906002)(446003)(7696005)(5660300002)(110136005)(316002)(26005)(74316002)(186003)(6506007)(66066001)(52536014)(68736007)(6306002)(7736002)(9686003)(305945005)(86362001)(6436002)(33656002)(14454004)(66446008)(8936002)(8676002)(73956011)(66946007)(81156014)(53936002)(81166006)(66476007)(76116006)(66556008)(64756008)(4326008)(966005)(55016002)(6246003)(72206003)(2501003)(53546011)(256004)(102836004)(229853002)(25786009)(6116002)(3846002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1355;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j1vWCs3Yt1+5wT8zZLj8BsRHkThza3591P9S59kriLmEsbcdyztBmyaRAVhAAQRyop7xCDb7yhmLmNE/Hk0CP0YgYUB4RSyrTR279B3d6+vDzppJgky0pd2ExlVNux6pailne/kog34PC6LQsVUIiZJsFhVn8h7RypMxrR++9uZb9CVyARY5xqngUVCVgNqefDOUT+VpDIsj5qfSeiBAX8gsskdm5SqG7Lr6F77FWYkoGjTzwHLbmdBA3/up2WUcjjSJ7krMU9Azst9tlr6zGREKOC9TJ2b9HTXXbNJlutjOtK0GDe7XO5KeSRY1BehB4+Uj0m+8GI5cnHJ7umEXawklFgAFM4EZ2p3cD1ESNmm4ynpfM8+dK8sFXFx+ZkRbo6WXNvmsuEU9A3/lwYqPmevK5K5kLENFeP0t1iaJboE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e89b1b23-16e8-464d-2eba-08d6f982de36
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 15:36:18.6960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1355
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bhtkf6YFcNGGh6KMQc0D1gYRXnLU3DHanMjqQ3y6vOQ=;
 b=xsw8oh5ci/m1sdpaZ7KIVPN/H10lW1Bik4kLNPbhciPnNrYUvwnJMRxH3Jxb1wmgCq4nCclyVKV4Ha1Et2MYMqRAZVI8JkUudkm+qtI9CpeohIx7hOOlC+S5NlUj7IouUdGDmHqPwUMqSTgISGazqkAClV1vP+qUcoZofYnFL0Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGNvbW1lbnRzIGJlbG93IGlzIGFjdHVhbGx5IGZvciBjaGVja19wcHRhYmxlLCBpbnN0ZWFk
IG9mIGdldF9jbGtfaW5mb19mcm9tIHZiaW9zLiBQbGVhc2UgYWRqdXN0IHRoZSBjb21tZW50cyBh
cyB3ZWxsLg0KKiBjaGVjayBpZiB0aGUgZm9ybWF0X3JldmlzaW9uIGluIHZiaW9zIGlzIHVwIHRv
IHBwdGFibGUgaGVhZGVyDQoqIHZlcnNpb24sIGFuZCB0aGUgc3RydWN0dXJlIHNpemUgaXMgbm90
IDAuDQogKi8NCg0KV2l0aCB0aGF0IGZpeGVkLCB0aGUgcGF0Y2ggaXMgUmV2aWV3ZWQtYnk6IEhh
d2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVnYXJkcywNCkhhd2tpbmcN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5j
ZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgRXZhbiBRdWFuDQpTZW50OiAy
MDE55bm0NuaciDI15pelIDIzOjA4DQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
CkNjOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJt
L2FtZC9wb3dlcnBsYXk6IGFkZCBtaXNzaW5nIHNtdV9nZXRfY2xrX2luZm9fZnJvbV92Ymlvcygp
IGNhbGwNCg0KVGhpcyBzZWVtcyBhIG1lcmdlIGVycm9yLg0KDQpDaGFuZ2UtSWQ6IEk2NzM4OTcz
OTUxMmM4Mjk3ZGExMTg3NDI4NjgyY2M1OWY1NjBhYjAzDQpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1
YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jIHwgNCArKysrDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQppbmRleCBm
ZTgzYzVlMzExMWYuLjQ3YjIxYWQ0MzY1YyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jDQpAQCAtODIzLDYgKzgyMywxMCBAQCBzdGF0aWMgaW50IHNtdV9z
bWNfdGFibGVfaHdfaW5pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCiAJCSAqIGNoZWNrIGlm
IHRoZSBmb3JtYXRfcmV2aXNpb24gaW4gdmJpb3MgaXMgdXAgdG8gcHB0YWJsZSBoZWFkZXINCiAJ
CSAqIHZlcnNpb24sIGFuZCB0aGUgc3RydWN0dXJlIHNpemUgaXMgbm90IDAuDQogCQkgKi8NCisJ
CXJldCA9IHNtdV9nZXRfY2xrX2luZm9fZnJvbV92YmlvcyhzbXUpOw0KKwkJaWYgKHJldCkNCisJ
CQlyZXR1cm4gcmV0Ow0KKw0KIAkJcmV0ID0gc211X2NoZWNrX3BwdGFibGUoc211KTsNCiAJCWlm
IChyZXQpDQogCQkJcmV0dXJuIHJldDsNCi0tIA0KMi4yMS4wDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
