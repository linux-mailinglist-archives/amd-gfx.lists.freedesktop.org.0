Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D703C3D8
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 08:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4723789143;
	Tue, 11 Jun 2019 06:14:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710068.outbound.protection.outlook.com [40.107.71.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0354489143
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 06:14:23 +0000 (UTC)
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3487.namprd12.prod.outlook.com (20.178.241.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Tue, 11 Jun 2019 06:14:22 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::2462:ab5d:a6e9:d586]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::2462:ab5d:a6e9:d586%4]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 06:14:22 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Huang, Trigger" <Trigger.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: fix pm_load_smu_firmware for SR-IOV
Thread-Topic: [PATCH] drm/amdgpu: fix pm_load_smu_firmware for SR-IOV
Thread-Index: AQHVIAtlK2fL++If8Uy1gqKVSabOnqaV8Yuw
Date: Tue, 11 Jun 2019 06:14:21 +0000
Message-ID: <MN2PR12MB35369B14CA7D949832DDFDCDFBED0@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <1560226110-10201-1-git-send-email-Trigger.Huang@amd.com>
In-Reply-To: <1560226110-10201-1-git-send-email-Trigger.Huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6efc30c7-4420-4af0-cf6e-08d6ee340bc3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3487; 
x-ms-traffictypediagnostic: MN2PR12MB3487:
x-microsoft-antispam-prvs: <MN2PR12MB348750C513F930D2B63A3B17FBED0@MN2PR12MB3487.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(136003)(396003)(39860400002)(199004)(189003)(13464003)(33656002)(72206003)(478600001)(73956011)(66946007)(66476007)(76116006)(66446008)(64756008)(25786009)(68736007)(66556008)(6246003)(316002)(110136005)(305945005)(3846002)(74316002)(4744005)(71200400001)(256004)(6116002)(71190400001)(4326008)(86362001)(55016002)(26005)(446003)(76176011)(14454004)(476003)(9686003)(102836004)(486006)(99286004)(6506007)(53546011)(2501003)(7696005)(186003)(229853002)(2906002)(11346002)(81156014)(66066001)(8676002)(52536014)(8936002)(81166006)(5660300002)(53936002)(6436002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3487;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1aFoUYGsqJB8BPa82uwfqFTdXTtzXHjoy8oer4YX3yWbxYxFjDkTOvMgAeSUMZYVsFYmKpG731IrS+KaQQE7jLLgIoF6s+Lw09YfC60GNhARlimTmzEyBU0XxNS419D5SZCFvpI3a1MGJ6aPZ3/RPR2HvLHHrh2yCePfT4DsNJU/1r3y8c5AzwFjJIzdh9ZITBI/s5dHCh4LCNwzc6Uru5uHoPYMc90g+Y8pndAnvAmuYN+iyJ57IdFkL7FCDVJfuigL/eIr8cdYGDckdMFHwTd/nZC9SIo9ztMFkpBhQlB0JASA9rp2Y9l+l/QTX6BRibjuqno1hQJns0MXwm0dgLtoBx/BSt/6iju4YNqIM2LNrKCHg6/0qQPXtTI+hMuorHlHSJ7whmTblfqXgpo2jXWNahk1z4yqPigMWH1wP+Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efc30c7-4420-4af0-cf6e-08d6ee340bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 06:14:22.0207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prliang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3487
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6ezwrC7SyiYGkVEAbtsHx/M80gxotM46Mp4xiv2a7Y=;
 b=tBAPELwpy3B4Xv5DYu82+K5c/PkdaUUAVRVdy8r7AzRYhtPTWbSXDuYYFwT7Ej/pqwc/TQlfUxGvlMli3knmZpwnXn+qj8Y7HZCV6OHPwi0FOJne/QoVFPT0tjbyiw1ivgDCnCWXdI+husnvK81fgbSO1vH7uh1guGvVNwM/YAs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Huang, Trigger" <Trigger.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgoKVGhhbmtzLApQ
cmlrZQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogVHJpZ2dlciBIdWFuZyA8
VHJpZ2dlci5IdWFuZ0BhbWQuY29tPgo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTEsIDIwMTkgMTI6
MDkgUE0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogSHVhbmcsIFRy
aWdnZXIgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT47IExpYW5nLCBQcmlrZQo+IDxQcmlrZS5MaWFu
Z0BhbWQuY29tPgo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogZml4IHBtX2xvYWRfc211
X2Zpcm13YXJlIGZvciBTUi1JT1YKPiAKPiBGb3IgU1ItSU9WIFZGLCBwb3dlcnBsYXkgbWF5IG5v
dCBiZSBzdXBwb3J0ZWQsIGluIHRoaXMgY2FzZSwgZXJyb3IgJy1FSU5WQUwnCj4gc2hvdWxkIG5v
dCBiZSByZXR1cm5lZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUcmlnZ2VyIEh1YW5nIDxUcmlnZ2Vy
Lkh1YW5nQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wbS5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwo+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKPiBpbmRleCAyMWI1YmUxLi40Mjc2
ZDYzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKPiBAQCAtMjcw
OSw3ICsyNzA5LDEwIEBAIGludCBhbWRncHVfcG1fbG9hZF9zbXVfZmlybXdhcmUoc3RydWN0Cj4g
YW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgKnNtdV92ZXJzaW8KPiAgCQkJcmV0dXJuIHI7
Cj4gIAkJfQo+ICAJCSpzbXVfdmVyc2lvbiA9IGFkZXYtPnBtLmZ3X3ZlcnNpb247Cj4gKwl9IGVs
c2UgaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkgewo+ICsJCXIgPSAwOwo+ICAJfQo+ICsKPiAg
CXJldHVybiByOwo+ICB9Cj4gCj4gLS0KPiAyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
