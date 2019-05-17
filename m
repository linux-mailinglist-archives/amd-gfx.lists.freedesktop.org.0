Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B072121B
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 04:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8289897FD;
	Fri, 17 May 2019 02:38:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780077.outbound.protection.outlook.com [40.107.78.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC93897FD
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 02:38:48 +0000 (UTC)
Received: from MN2PR12MB3039.namprd12.prod.outlook.com (20.178.243.144) by
 MN2PR12MB3662.namprd12.prod.outlook.com (10.255.86.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 17 May 2019 02:38:47 +0000
Received: from MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::8c2:3755:16e2:8765]) by MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::8c2:3755:16e2:8765%5]) with mapi id 15.20.1856.012; Fri, 17 May 2019
 02:38:47 +0000
From: "Tao, Yintian" <Yintian.Tao@amd.com>
To: "Tao, Yintian" <Yintian.Tao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/amdgpu: don't read DF register for SRIOV
Thread-Topic: [PATCH] drm/amdgpu: don't read DF register for SRIOV
Thread-Index: AQHVC+BvcbiF9icL4EuTF9l51G4NMaZum0Tg
Date: Fri, 17 May 2019 02:38:46 +0000
Message-ID: <MN2PR12MB3039577B5F8263EFC7E9BF97E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
References: <1558008651-21099-1-git-send-email-yttao@amd.com>
In-Reply-To: <1558008651-21099-1-git-send-email-yttao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c3da2c9-ab33-47ae-cba6-08d6da70c973
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3662; 
x-ms-traffictypediagnostic: MN2PR12MB3662:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB366282F8E641DD7F01B0945CE50B0@MN2PR12MB3662.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(346002)(376002)(39860400002)(189003)(199004)(51874003)(13464003)(8936002)(25786009)(8676002)(316002)(68736007)(4326008)(81166006)(81156014)(9686003)(86362001)(72206003)(446003)(11346002)(55016002)(476003)(52536014)(6306002)(486006)(966005)(478600001)(2906002)(14454004)(2501003)(66066001)(6116002)(3846002)(14444005)(256004)(5660300002)(186003)(26005)(71190400001)(7736002)(229853002)(71200400001)(6506007)(76176011)(305945005)(7696005)(53546011)(110136005)(74316002)(102836004)(33656002)(99286004)(76116006)(66946007)(73956011)(66476007)(66556008)(64756008)(53936002)(66446008)(6246003)(6436002)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3662;
 H:MN2PR12MB3039.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HXTfkX3kFSvjhq9Kr60WTvVFg+C+YIQtqVGGI56VPF8b/zERyRcM/ZioIt8q9JERAT5aJdMLP/PdlsjrkBUBU8eQ8lmJAo35MoBFTLgULQbKdeO60FwFsapjcw/69SozI0yZaIq/swfH8jR9HNLXwFz985hJo8dj2oq0uPZwdXUmz55pfiP+YnalARMSDo1cyTUQWB8UsBHB7+gKpn716iysPU3O76V/ICKr/x3LVEuTBn+uKZXYj97l5tXYY5imkbjEKiAVj2gVArAJyStBAhxwOnt4PcLhNu7BWyXYW0GF8P7P+Fym67vgAl9Lpc/roo5xRXo7UduT5+rLQjh4Xw4W63E5j+uJHJ+SaAf77mUlsttwGe1QGcPKoy0FxnYLclr5yckbvj4uk513xrswvF4kOxOEghMXla8MjZM89lM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3da2c9-ab33-47ae-cba6-08d6da70c973
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 02:38:46.8403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3662
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdjhV/JvJkY5YLAAfW1wlVbPbHvFMONKFh6ML2gUt2U=;
 b=jJfrN1Qn6MMXtWKmKinJVdryM0iFOeCafALeAogcmS5pLZ/6gQjQ3Yb4hemkvc9gDs635A0Kaeb2HNKLZiyXPU1KORq2ejaOJqEfunkB6CpL47mQoiph1mukdt0MiEAefS9pYver0dSgE2Lu/FO452dLxQuEfob0c6BNdHsV19E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yintian.Tao@amd.com; 
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
Cc: "Liu, Monk" <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZy4uLg0KDQpIaSBDaHJpc3RpYW4gYW5kIEFsZXgNCg0KDQpDYW4geW91IGhlbHAgcmV2aWV3
IHRoaXM/IFRoYW5rcyBpbiBhZHZhbmNlLg0KDQoNCkJlc3QgUmVnYXJkcw0KWWludGlhbiBUYW8N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBZaW50aWFuIFRhbw0KU2Vu
dDogVGh1cnNkYXksIE1heSAxNiwgMjAxOSA4OjExIFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCkNjOiBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+OyBUYW8sIFlpbnRp
YW4gPFlpbnRpYW4uVGFvQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IGRv
bid0IHJlYWQgREYgcmVnaXN0ZXIgZm9yIFNSSU9WDQoNCltDQVVUSU9OOiBFeHRlcm5hbCBFbWFp
bF0NCg0KVW5kZXIgU1JJT1YsIHJlYWRpbmcgREYgcmVnaXN0ZXIgaGFzIGNoYW5jZSB0byBsZWFk
IHRvIEFFUiBlcnJvciBpbiBob3N0IHNpZGUsIGp1c3Qgc2tpcCByZWFkaW5nIGl0Lg0KDQpTaWdu
ZWQtb2ZmLWJ5OiBNb25rIExpdSA8TW9uay5MaXVAYW1kLmNvbT4NClNpZ25lZC1vZmYtYnk6IFlp
bnRpYW4gVGFvIDx5dHRhb0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y5XzAuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQppbmRleCBh
NDE3NzYzLi5iNWJmOWVkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y5XzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0K
QEAgLTgzNyw3ICs4MzcsNyBAQCBzdGF0aWMgaW50IGdtY192OV8wX21jX2luaXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpDQoNCiAgICAgICAgaWYgKGFtZGdwdV9lbXVfbW9kZSAhPSAxKQ0K
ICAgICAgICAgICAgICAgIGFkZXYtPmdtYy52cmFtX3dpZHRoID0gYW1kZ3B1X2F0b21maXJtd2Fy
ZV9nZXRfdnJhbV93aWR0aChhZGV2KTsNCi0gICAgICAgaWYgKCFhZGV2LT5nbWMudnJhbV93aWR0
aCkgew0KKyAgICAgICBpZiAoIWFkZXYtPmdtYy52cmFtX3dpZHRoICYmICFhbWRncHVfc3Jpb3Zf
dmYoYWRldikpIHsNCiAgICAgICAgICAgICAgICAvKiBoYm0gbWVtb3J5IGNoYW5uZWwgc2l6ZSAq
Lw0KICAgICAgICAgICAgICAgIGlmIChhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpDQogICAgICAg
ICAgICAgICAgICAgICAgICBjaGFuc2l6ZSA9IDY0Ow0KLS0NCjIuNy40DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlz
dA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
