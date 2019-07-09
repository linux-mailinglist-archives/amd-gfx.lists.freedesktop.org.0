Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE42462E73
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 05:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB3F89711;
	Tue,  9 Jul 2019 03:04:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690066.outbound.protection.outlook.com [40.107.69.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1538896E9
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 03:04:28 +0000 (UTC)
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1260.namprd12.prod.outlook.com (10.168.239.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 03:04:26 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::1550:bfd9:51c1:ad2]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::1550:bfd9:51c1:ad2%4]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 03:04:26 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/psp: add a mutex to protect access to the psp
 ring
Thread-Topic: [PATCH] drm/amdgpu/psp: add a mutex to protect access to the psp
 ring
Thread-Index: AQHVNbwUR8fNZZVgrkirm+erQi7v7KbBmnvw
Date: Tue, 9 Jul 2019 03:04:26 +0000
Message-ID: <DM5PR12MB1418289E2F08C97183CFA757FCF10@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190708183622.5705-1-alexander.deucher@amd.com>
In-Reply-To: <20190708183622.5705-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e30c5ef-1921-4d2b-fbf7-08d7041a26d2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1260; 
x-ms-traffictypediagnostic: DM5PR12MB1260:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1260D4CB32E2992855F96D33FCF10@DM5PR12MB1260.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(13464003)(189003)(199004)(316002)(68736007)(4326008)(6116002)(478600001)(76176011)(72206003)(966005)(3846002)(2501003)(7696005)(2906002)(9686003)(55016002)(73956011)(6246003)(66946007)(52536014)(76116006)(66476007)(6306002)(66446008)(64756008)(66556008)(6436002)(25786009)(33656002)(53936002)(256004)(229853002)(476003)(7736002)(305945005)(11346002)(14454004)(486006)(74316002)(66066001)(99286004)(81166006)(110136005)(26005)(5660300002)(186003)(71190400001)(71200400001)(8936002)(446003)(6506007)(53546011)(8676002)(86362001)(81156014)(14444005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1260;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CzGK8qce6BuqdRYqzZfmxRX+xosGivNa5fq0KrwEIVax43YT3BBc5FuVpRUd55kSRG2Zdpsw29P222c4lPY3V4ZVM2V3CO+0f6hxpRV147r2P3hOHtkBpyHJj1vSVffyFi2mtOViUeoiQ0SkkoKcbj+4uMKK6sgXxwGJwWz7e3LAvy1G4X9b1SMhGv2vxMFHPeo4dj3qr8S1SZagrRfIY9MKpuYN+Nc/u48G7k11OYIsYyz2kHEjztaeBUgmLirRTNGfzK0AaDO+q+9FwoEHjbk2ipY1MoFy6gkNAZGM4lCXJa1vznmx3oYKVcZqJ9umjoRGs13xmr/WgJVxvsMMjtQo2dTRJoNP9B77d6cvBgIyuJSeInnOG6E7dFjENbxNdyb8s7RBeea6NQrcBjvoQKZpyCAFzGQLbCL2+uciZ4g=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e30c5ef-1921-4d2b-fbf7-08d7041a26d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 03:04:26.1004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1260
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niiHThtCIwZGNu+q7UmlrHgajHfo1N5S1YPAq1THFHg=;
 b=s4YQav/7KgnppFIkLaHfKkv1l/aYiCxrJNOOmDZA8X6iJvnYrdCA6blhQ1vxycufRE4ks+6cIA24p3NBQKCA/lm3UTgzNYn3uYUpHlVgWPAI6eF4UfZzXXluvbdJs7xbkYuo8UvV5E48obrhb0yGPmrxlnYHzm9mECwOX+kKU4Y=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxl
eCBEZXVjaGVyDQpTZW50OiAyMDE55bm0N+aciDnml6UgMjozNg0KVG86IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hl
ckBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1L3BzcDogYWRkIGEgbXV0ZXgg
dG8gcHJvdGVjdCBhY2Nlc3MgdG8gdGhlIHBzcCByaW5nDQoNCldlIG5lZWQgdG8gc2VyaWFsaXpl
IGFjY2VzcyB0byB0aGUgcHNwIHJpbmcgaWYgdGhlcmUgYXJlIG11bHRpcGxlIGNhbGxlcnMgYXQg
cnVudGltZS4NCg0KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jIHwgIDEgKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyAgICB8
IDE2ICsrKysrKysrKysrKysrLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cHNwLmggICAgfCAgMSArDQogMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
DQppbmRleCAzMDk4OWI0NTUwNDcuLjhmMGYyMDdiZjNkOSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQpAQCAtMjU0NCw2ICsyNTQ0LDcgQEAgaW50IGFt
ZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCiAJaGFzaF9pbml0
KGFkZXYtPm1uX2hhc2gpOw0KIAltdXRleF9pbml0KCZhZGV2LT5sb2NrX3Jlc2V0KTsNCiAJbXV0
ZXhfaW5pdCgmYWRldi0+dmlydC5kcG1fbXV0ZXgpOw0KKwltdXRleF9pbml0KCZhZGV2LT5wc3Au
bXV0ZXgpOw0KIA0KIAlyID0gYW1kZ3B1X2RldmljZV9jaGVja19hcmd1bWVudHMoYWRldik7DQog
CWlmIChyKQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYw0KaW5kZXggMGRk
MmZiYjBmYjJhLi41YjBmMGI1NzQ0YzAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wc3AuYw0KQEAgLTEzMSw2ICsxMzEsOCBAQCBwc3BfY21kX3N1Ym1pdF9idWYoc3RydWN0
IHBzcF9jb250ZXh0ICpwc3AsDQogCWludCBpbmRleDsNCiAJaW50IHRpbWVvdXQgPSAyMDAwOw0K
IA0KKwltdXRleF9sb2NrKCZwc3AtPm11dGV4KTsNCisNCiAJbWVtc2V0KHBzcC0+Y21kX2J1Zl9t
ZW0sIDAsIFBTUF9DTURfQlVGRkVSX1NJWkUpOw0KIA0KIAltZW1jcHkocHNwLT5jbWRfYnVmX21l
bSwgY21kLCBzaXplb2Yoc3RydWN0IHBzcF9nZnhfY21kX3Jlc3ApKTsgQEAgLTE0MCw2ICsxNDIs
NyBAQCBwc3BfY21kX3N1Ym1pdF9idWYoc3RydWN0IHBzcF9jb250ZXh0ICpwc3AsDQogCQkJICAg
ICBmZW5jZV9tY19hZGRyLCBpbmRleCk7DQogCWlmIChyZXQpIHsNCiAJCWF0b21pY19kZWMoJnBz
cC0+ZmVuY2VfdmFsdWUpOw0KKwkJbXV0ZXhfdW5sb2NrKCZwc3AtPm11dGV4KTsNCiAJCXJldHVy
biByZXQ7DQogCX0NCiANCkBAIC0xNjIsOCArMTY1LDEwIEBAIHBzcF9jbWRfc3VibWl0X2J1Zihz
dHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwNCiAJCQkJICB1Y29kZS0+dWNvZGVfaWQpOw0KIAkJRFJN
X1dBUk4oInBzcCBjb21tYW5kIGZhaWxlZCBhbmQgcmVzcG9uc2Ugc3RhdHVzIGlzICglZClcbiIs
DQogCQkJICBwc3AtPmNtZF9idWZfbWVtLT5yZXNwLnN0YXR1cyk7DQotCQlpZiAoIXRpbWVvdXQp
DQorCQlpZiAoIXRpbWVvdXQpIHsNCisJCQltdXRleF91bmxvY2soJnBzcC0+bXV0ZXgpOw0KIAkJ
CXJldHVybiAtRUlOVkFMOw0KKwkJfQ0KIAl9DQogDQogCS8qIGdldCB4R01JIHNlc3Npb24gaWQg
ZnJvbSByZXNwb25zZSBidWZmZXIgKi8gQEAgLTE3Myw2ICsxNzgsNyBAQCBwc3BfY21kX3N1Ym1p
dF9idWYoc3RydWN0IHBzcF9jb250ZXh0ICpwc3AsDQogCQl1Y29kZS0+dG1yX21jX2FkZHJfbG8g
PSBwc3AtPmNtZF9idWZfbWVtLT5yZXNwLmZ3X2FkZHJfbG87DQogCQl1Y29kZS0+dG1yX21jX2Fk
ZHJfaGkgPSBwc3AtPmNtZF9idWZfbWVtLT5yZXNwLmZ3X2FkZHJfaGk7DQogCX0NCisJbXV0ZXhf
dW5sb2NrKCZwc3AtPm11dGV4KTsNCiANCiAJcmV0dXJuIHJldDsNCiB9DQpAQCAtMTE4OSwxMCAr
MTE5NSwxNiBAQCBzdGF0aWMgaW50IHBzcF9yZXN1bWUodm9pZCAqaGFuZGxlKQ0KIA0KIGludCBw
c3BfZ3B1X3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAgew0KKwlpbnQgcmV0Ow0K
Kw0KIAlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlICE9IEFNREdQVV9GV19MT0FEX1BTUCkN
CiAJCXJldHVybiAwOw0KIA0KLQlyZXR1cm4gcHNwX21vZGUxX3Jlc2V0KCZhZGV2LT5wc3ApOw0K
KwltdXRleF9sb2NrKCZhZGV2LT5wc3AubXV0ZXgpOw0KKwlyZXQgPSBwc3BfbW9kZTFfcmVzZXQo
JmFkZXYtPnBzcCk7DQorCW11dGV4X3VubG9jaygmYWRldi0+cHNwLm11dGV4KTsNCisNCisJcmV0
dXJuIHJldDsNCiB9DQogDQogaW50IHBzcF9ybGNfYXV0b2xvYWRfc3RhcnQoc3RydWN0IHBzcF9j
b250ZXh0ICpwc3ApIGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgNCmluZGV4
IDYwMzlhY2M4NDM0Ni4uZTI4Y2Y1ZTQwMTZlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcHNwLmgNCkBAIC0yMDEsNiArMjAxLDcgQEAgc3RydWN0IHBzcF9jb250ZXh0DQog
CXVpbnQ4X3QJCQkJKnRhX3Jhc19zdGFydF9hZGRyOw0KIAlzdHJ1Y3QgcHNwX3hnbWlfY29udGV4
dAkJeGdtaV9jb250ZXh0Ow0KIAlzdHJ1Y3QgcHNwX3Jhc19jb250ZXh0CQlyYXM7DQorCXN0cnVj
dCBtdXRleAkJCW11dGV4Ow0KIH07DQogDQogc3RydWN0IGFtZGdwdV9wc3BfZnVuY3Mgew0KLS0N
CjIuMjAuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
