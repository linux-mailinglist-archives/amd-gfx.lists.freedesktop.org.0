Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B937221387
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 07:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5596A8982A;
	Fri, 17 May 2019 05:46:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780072.outbound.protection.outlook.com [40.107.78.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC968982A
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 05:46:43 +0000 (UTC)
Received: from BYAPR12MB3048.namprd12.prod.outlook.com (20.178.53.221) by
 BYAPR12MB2616.namprd12.prod.outlook.com (20.176.255.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Fri, 17 May 2019 05:46:40 +0000
Received: from BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::3cb3:69b4:ec3e:db29]) by BYAPR12MB3048.namprd12.prod.outlook.com
 ([fe80::3cb3:69b4:ec3e:db29%4]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 05:46:40 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: fix sw SMU wrong UVD/VCE powergate
 setting
Thread-Topic: [PATCH] drm/amd/powerplay: fix sw SMU wrong UVD/VCE powergate
 setting
Thread-Index: AQHVDHOhPvBtNcol2USkFEGm08Npo6Zuzscg
Date: Fri, 17 May 2019 05:46:40 +0000
Message-ID: <BYAPR12MB3048E9B082E8889A326C7148FE0B0@BYAPR12MB3048.namprd12.prod.outlook.com>
References: <20190517054430.13736-1-evan.quan@amd.com>
In-Reply-To: <20190517054430.13736-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c3ec43b-c78b-4e73-5c44-08d6da8b0906
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2616; 
x-ms-traffictypediagnostic: BYAPR12MB2616:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB2616BB6D613E1698DF46179FFE0B0@BYAPR12MB2616.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(346002)(366004)(39860400002)(199004)(13464003)(189003)(6306002)(33656002)(53936002)(55016002)(4326008)(966005)(25786009)(7736002)(256004)(478600001)(102836004)(6436002)(305945005)(72206003)(2501003)(6246003)(14454004)(9686003)(81166006)(74316002)(8936002)(81156014)(8676002)(14444005)(316002)(52536014)(229853002)(68736007)(66556008)(486006)(186003)(73956011)(7696005)(11346002)(476003)(6506007)(53546011)(76176011)(6116002)(2906002)(110136005)(3846002)(99286004)(66446008)(71190400001)(71200400001)(64756008)(66476007)(5660300002)(86362001)(66066001)(446003)(66946007)(76116006)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2616;
 H:BYAPR12MB3048.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cASzbaJ39v2e/Y4kQ2G7HkDQk3Ef6/SSKXVN+yloe+YmzMRB08c0tjMoTiWxBuW4Gha95fcIQAPpK7w1y9Jdri6pjKmy9g0EN5xsBC2Sr1mXrXB9KAwO76CANwQGxdG50HCcIA882D9Jhtepq13qqok7G2wtUUjUIFkO84Sb+qkXRNf6GClWgeppicTD65FAgFj6FRjTHBU6UWjvpz/QY6qcS3l7eu3VaHrE3fKeYxivqUeiN60cr4r2D1ZhufpNOwF3QVYhbPsRx/NPyFTkTCBS6rJwUUp+SLcN18vP4fs9I935PxZdehb3FeamZDjD5wcUbUH3oFEQz9Aly5AyH4A0IHb756dvt8jh3wlurmSo7LtEYtQE/AomqmlDKEFzURvF+LLdtgiFboQTnuMKDO2+11QEFCEixQOZ4phWXV4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3ec43b-c78b-4e73-5c44-08d6da8b0906
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 05:46:40.4196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1C3mt1F7okYIRUAGGCm32BrAa4oBSRU/JLV7XYNU6M=;
 b=yofA6kobWJYZ9OntSh4Q7Cu0DWu51c99H4CJVRll4AvJjO3Iv0UOQoEb+CVG/SXZZSI/I2RwzJU10cuOxwUZ1DjyrmzeX75VnSms7vwyXHHLJTJ3rVIgsxuUUDrDAu2FOrdzONmh0dbI3KZKmkGW8MpIC7YTmApMU+hz+qgdv3c=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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

UmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgRXZhbiBRdWFuDQpTZW50OiBGcmlkYXksIE1heSAx
NywgMjAxOSAxOjQ1IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBR
dWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9w
b3dlcnBsYXk6IGZpeCBzdyBTTVUgd3JvbmcgVVZEL1ZDRSBwb3dlcmdhdGUgc2V0dGluZw0KDQpb
Q0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQoNClRoZSBVVkQvVkNFIGJpdHMgYXJlIHNldCB3cm9u
Z2x5LiBUaGlzIGNhdXNlcyB0aGUgVVZEL1ZDRSBjbG9ja3MgYXJlIG5vdCBicm91Z2h0IGJhY2sg
Y29ycmVjdGx5IG9uIG5lZWRlZC4NCg0KQ2hhbmdlLUlkOiBJNmVkYTY3ZWEzYmU0NWZkNWY0MjJj
ZGI3ODM1NjkxNWJmMDZmZjQxZQ0KU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5A
YW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5j
IHwgMTIgKysrKysrLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMN
CmluZGV4IDBlZWE5M2M4ZGZmNy4uYTNhN2FmY2E3NTE2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jDQpAQCAtMTgxNCwyNCArMTgxNCwyNCBAQCBzdGF0aWMg
aW50IHNtdV92MTFfMF91cGRhdGVfb2Q4X3NldHRpbmdzKHN0cnVjdCBzbXVfY29udGV4dCAqc211
LA0KDQogc3RhdGljIGludCBzbXVfdjExXzBfZHBtX3NldF91dmRfZW5hYmxlKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LCBib29sIGVuYWJsZSkgIHsNCi0gICAgICAgaWYgKCFzbXVfZmVhdHVyZV9p
c19zdXBwb3J0ZWQoc211LCBGRUFUVVJFX0RQTV9WQ0VfQklUKSkNCisgICAgICAgaWYgKCFzbXVf
ZmVhdHVyZV9pc19zdXBwb3J0ZWQoc211LCBGRUFUVVJFX0RQTV9VVkRfQklUKSkNCiAgICAgICAg
ICAgICAgICByZXR1cm4gMDsNCg0KLSAgICAgICBpZiAoZW5hYmxlID09IHNtdV9mZWF0dXJlX2lz
X2VuYWJsZWQoc211LCBGRUFUVVJFX0RQTV9WQ0VfQklUKSkNCisgICAgICAgaWYgKGVuYWJsZSA9
PSBzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgRkVBVFVSRV9EUE1fVVZEX0JJVCkpDQogICAg
ICAgICAgICAgICAgcmV0dXJuIDA7DQoNCi0gICAgICAgcmV0dXJuIHNtdV9mZWF0dXJlX3NldF9l
bmFibGVkKHNtdSwgRkVBVFVSRV9EUE1fVkNFX0JJVCwgZW5hYmxlKTsNCisgICAgICAgcmV0dXJu
IHNtdV9mZWF0dXJlX3NldF9lbmFibGVkKHNtdSwgRkVBVFVSRV9EUE1fVVZEX0JJVCwgDQorIGVu
YWJsZSk7DQogfQ0KDQogc3RhdGljIGludCBzbXVfdjExXzBfZHBtX3NldF92Y2VfZW5hYmxlKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LCBib29sIGVuYWJsZSkgIHsNCi0gICAgICAgaWYgKCFzbXVf
ZmVhdHVyZV9pc19zdXBwb3J0ZWQoc211LCBGRUFUVVJFX0RQTV9VVkRfQklUKSkNCisgICAgICAg
aWYgKCFzbXVfZmVhdHVyZV9pc19zdXBwb3J0ZWQoc211LCBGRUFUVVJFX0RQTV9WQ0VfQklUKSkN
CiAgICAgICAgICAgICAgICByZXR1cm4gMDsNCg0KLSAgICAgICBpZiAoZW5hYmxlID09IHNtdV9m
ZWF0dXJlX2lzX2VuYWJsZWQoc211LCBGRUFUVVJFX0RQTV9VVkRfQklUKSkNCisgICAgICAgaWYg
KGVuYWJsZSA9PSBzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgRkVBVFVSRV9EUE1fVkNFX0JJ
VCkpDQogICAgICAgICAgICAgICAgcmV0dXJuIDA7DQoNCi0gICAgICAgcmV0dXJuIHNtdV9mZWF0
dXJlX3NldF9lbmFibGVkKHNtdSwgRkVBVFVSRV9EUE1fVVZEX0JJVCwgZW5hYmxlKTsNCisgICAg
ICAgcmV0dXJuIHNtdV9mZWF0dXJlX3NldF9lbmFibGVkKHNtdSwgRkVBVFVSRV9EUE1fVkNFX0JJ
VCwgDQorIGVuYWJsZSk7DQogfQ0KDQogc3RhdGljIGludCBzbXVfdjExXzBfZ2V0X2N1cnJlbnRf
cnBtKHN0cnVjdCBzbXVfY29udGV4dCAqc211LA0KLS0NCjIuMjEuMA0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QN
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
