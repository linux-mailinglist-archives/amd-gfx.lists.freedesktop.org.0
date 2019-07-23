Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6871CCC
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 18:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120E96E2FD;
	Tue, 23 Jul 2019 16:23:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750051.outbound.protection.outlook.com [40.107.75.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8579A6E2FD
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 16:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeJ+zwbw5F47gTzlnkJfX9oKRaDQtoVvZB8sI9lQc0X33aehuQnBxF2jR9844o+OpzUJI3Fz12QbHg91ghryNHvF0hgJMYJzT5m1NAhr1wxFtTESr4ggq+Olv1wi8Ia15RGoBVZw2mhaNkD0qP5+11DQ91BdiBs8cigDt7AnvpVLRSFt1xk+5YPYV22po766WUD5qKoJloIM9T4pl2K8+pQj/7FuL64PLzOdJ+kE+NMqnhgBxa51eZKo6Zs5ALY/S8LOU4Cm6mr3wuTeSTajEu5fqsYKZWL5jk4m+ukWQCD52rVNsyRXnJaJ4S4CvIEw1Fs5WBJqy8dhI76I8CCz+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQSXKzy70MlqvH3nVuWgj+AxpVX19X/i+bLPb1EbAzo=;
 b=ndz2GVeecRcBOMVJRv9Cc8Oi9r3cHalefvL7pfSiDMP3xYhsi5OyYlxSLLqxwI4NPpParQ8WSUNm8vphWBAW1lSaJH2ivF2wd80r/UTTqcvIjF/1vke6z+jucr42sz2TUxv6nA8yoYIoV1eK5EIcQ6j6tcXdYvJVTesVNIIN8I/0WzkB9CyVfqV6CawP0oHJcQrt/dsybqXHZS6T5ZLxJC0yHG4KV3n2UquyKU9ZPNJRoAlOVRyfJiyQ2wMf/lV2za/Cr1r+74rVdQe8v2Yxz3QTnXHnj6JPBtIquru5Gtbb5f2WATiz6EdhefiulPbjofXkCC/bLdiLrdxS4cxa6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1905.namprd12.prod.outlook.com (10.175.97.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 16:23:25 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::9134:e36a:9204:a483]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::9134:e36a:9204:a483%4]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 16:23:25 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/amdgpu: adding xgmi error monitoring
Thread-Topic: [PATCH 3/3] drm/amdgpu: adding xgmi error monitoring
Thread-Index: AQHVO/kj31gMuuLsE0OkcxucTst+babNezsAgArypxA=
Date: Tue, 23 Jul 2019 16:23:24 +0000
Message-ID: <BN6PR12MB1618B763BE4D2BCDC786D2AD85C70@BN6PR12MB1618.namprd12.prod.outlook.com>
References: <20190716170825.97385-1-jonathan.kim@amd.com>
 <20190716170825.97385-2-jonathan.kim@amd.com>
 <CH2PR12MB3831ACCA7B895EB9A604F99385CE0@CH2PR12MB3831.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB3831ACCA7B895EB9A604F99385CE0@CH2PR12MB3831.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:1ca0:3f2:9d6f:eb5c:5991:9000]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82b2fa08-e36a-49a1-706b-08d70f8a164b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1905; 
x-ms-traffictypediagnostic: BN6PR12MB1905:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1905C91C890E463ABB6D721485C70@BN6PR12MB1905.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(189003)(199004)(13464003)(9686003)(86362001)(6436002)(81156014)(2906002)(55016002)(6246003)(6116002)(6306002)(33656002)(53936002)(14454004)(81166006)(186003)(8936002)(68736007)(71200400001)(71190400001)(5660300002)(229853002)(446003)(476003)(76176011)(102836004)(66476007)(316002)(66446008)(66556008)(64756008)(966005)(76116006)(478600001)(25786009)(110136005)(46003)(66946007)(11346002)(256004)(53546011)(52536014)(7736002)(305945005)(8676002)(99286004)(2501003)(486006)(6506007)(74316002)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1905;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: c015FqKoO0ekDTKmM0prRdO5YhcVo8JvMXnNB3JICe9VB8CmNNuaKjtt4smpPCT/wgqC6HG+A8pm1w9IYIEi3ia8vKbZypzxDpHxZ0aFAQDeGRG6QKAxtfonYkirkUsJII9UmknKfJ1/RPab/PgGTgsyB6K/0NCwOxBVs+3C+RcQntvu/jOUB8ONRjvGSubEmp7rg4lH3zJUpfcD8lNQq6DRa60yrdcVV6FFmeniIMD9mT4i5ygXURbh9EjLb6ETcPOSS1mjS8GLgzDJUPELUpuOBl8v7nNHbpAf9RZwwik2jqHHHPFfdcxwMUvqAf7sfBQjhbg8M9hmpPzm9PEkoP9hx9zcLI4qfmg3OfgYsPnBKyXp1jGKVmoWCgw0ivy/9xJCsBOf6Pkt5q63p+fbA3to9hG/07CHuAzaY5BkNvo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b2fa08-e36a-49a1-706b-08d70f8a164b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 16:23:24.8711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1905
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQSXKzy70MlqvH3nVuWgj+AxpVX19X/i+bLPb1EbAzo=;
 b=FmmOjNcwObcEDooMdudFrmSAd4mXaMmgAPym7DkwWWeiD/w+d3ujp0t0R0CL3uXeEPMsd6Z5R5WCpl7kCZs4C4rd8OT6vl9TF+hVv/cmQWsXKuaYCcQLM2W7YTqpTXq3SZzhlaXutvZZ7QEcHZ/0ip5rJ73WcWSwUxPV9mD0ZQU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtQnk6IEtlbnQgUnVzc2VsbCA8a2VudC5ydXNzZWxsQGFtZC5jb20+DQoNCiBLZW50
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS2ltLCBKb25hdGhhbg0K
U2VudDogVHVlc2RheSwgSnVseSAxNiwgMjAxOSAxOjEyIFBNDQpUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJFOiBbUEFUQ0ggMy8zXSBkcm0vYW1kZ3B1OiBhZGRp
bmcgeGdtaSBlcnJvciBtb25pdG9yaW5nDQoNCk5vdGUgcGF0Y2ggMSBzZW50IHRvIGludGVybmFs
IGFtZCBtYWlsaW5nIGxpc3QgZm9yIHJldmlldy4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEtpbSwgSm9uYXRoYW4gPEpvbmF0aGFuLktpbUBhbWQuY29tPg0KU2VudDogVHVl
c2RheSwgSnVseSAxNiwgMjAxOSAxOjA5IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCkNjOiBLaW0sIEpvbmF0aGFuIDxKb25hdGhhbi5LaW1AYW1kLmNvbT47IEtpbSwgSm9u
YXRoYW4gPEpvbmF0aGFuLktpbUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDMvM10gZHJtL2Ft
ZGdwdTogYWRkaW5nIHhnbWkgZXJyb3IgbW9uaXRvcmluZw0KDQptb25pdG9yIHhnbWkgZXJyb3Jz
IHZpYSBtYyBwaWUgc3RhdHVzIHRocm91Z2ggZmljYSByZWdpc3RlcnMuDQoNCkNoYW5nZS1JZDog
SWQ4MGI2YzJmNjM1YTI5NGFmZTM0M2NmNTVhMDM5MDJlOWExNzg3YTUNClNpZ25lZC1vZmYtYnk6
IEpvbmF0aGFuIEtpbSA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5jIHwgMzggKysrKysrKysrKysrKysrKysrKysrKy0t
DQogMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYw0KaW5kZXggZDExZWJhMDllYWRk
Li40Yjg3ZmRhMTVhYzUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfeGdtaS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdt
aS5jDQpAQCAtMjUsNyArMjUsNyBAQA0KICNpbmNsdWRlICJhbWRncHUuaCINCiAjaW5jbHVkZSAi
YW1kZ3B1X3hnbWkuaCINCiAjaW5jbHVkZSAiYW1kZ3B1X3NtdS5oIg0KLQ0KKyNpbmNsdWRlICJk
Zi9kZl8zXzZfb2Zmc2V0LmgiDQogDQogc3RhdGljIERFRklORV9NVVRFWCh4Z21pX211dGV4KTsN
CiANCkBAIC0xMzEsOSArMTMxLDM3IEBAIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV94Z21pX3Nob3df
ZGV2aWNlX2lkKHN0cnVjdCBkZXZpY2UgKmRldiwNCiANCiB9DQogDQorI2RlZmluZSBBTURHUFVf
WEdNSV9TRVRfRklDQUEobykJKChvKSB8IDB4NDU2ODAxKQ0KK3N0YXRpYyBzc2l6ZV90IGFtZGdw
dV94Z21pX3Nob3dfZXJyb3Ioc3RydWN0IGRldmljZSAqZGV2LA0KKwkJCQkgICAgICBzdHJ1Y3Qg
ZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCisJCQkJICAgICAgY2hhciAqYnVmKQ0KK3sNCisJc3Ry
dWN0IGRybV9kZXZpY2UgKmRkZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCisJc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsNCisJdWludDMyX3QgZmljYWFf
cGllX2N0bF9pbiwgZmljYWFfcGllX3N0YXR1c19pbjsNCisJdWludDY0X3QgZmljYV9vdXQ7DQor
CXVuc2lnbmVkIGludCBlcnJvcl9jb3VudCA9IDA7DQorDQorCWZpY2FhX3BpZV9jdGxfaW4gPSBB
TURHUFVfWEdNSV9TRVRfRklDQUEoMHgyMDApOw0KKwlmaWNhYV9waWVfc3RhdHVzX2luID0gQU1E
R1BVX1hHTUlfU0VUX0ZJQ0FBKDB4MjA4KTsNCiANCi1zdGF0aWMgREVWSUNFX0FUVFIoeGdtaV9k
ZXZpY2VfaWQsIFNfSVJVR08sIGFtZGdwdV94Z21pX3Nob3dfZGV2aWNlX2lkLCBOVUxMKTsNCisJ
ZmljYV9vdXQgPSBhZGV2LT5kZl9mdW5jcy0+Z2V0X2ZpY2EoYWRldiwgZmljYWFfcGllX2N0bF9p
bik7DQorCWlmIChmaWNhX291dCAhPSAweDFmKQ0KKwkJcHJfZXJyKCJ4R01JIGVycm9yIGNvdW50
ZXJzIG5vdCBlbmFibGVkIVxuIik7DQorDQorCWZpY2Ffb3V0ID0gYWRldi0+ZGZfZnVuY3MtPmdl
dF9maWNhKGFkZXYsIGZpY2FhX3BpZV9zdGF0dXNfaW4pOw0KKw0KKwlpZiAoKGZpY2Ffb3V0ICYg
MHhmZmZmKSA9PSAyKQ0KKwkJZXJyb3JfY291bnQgPSAoKGZpY2Ffb3V0ID4+IDYyKSAmIDB4MSkg
KyAoZmljYV9vdXQgPj4gNjMpOw0KIA0KKwlhZGV2LT5kZl9mdW5jcy0+c2V0X2ZpY2EoYWRldiwg
ZmljYWFfcGllX3N0YXR1c19pbiwgMCwgMCk7DQorDQorCXJldHVybiBzbnByaW50ZihidWYsIFBB
R0VfU0laRSwgIiVkXG4iLCBlcnJvcl9jb3VudCk7IH0NCisNCisNCitzdGF0aWMgREVWSUNFX0FU
VFIoeGdtaV9kZXZpY2VfaWQsIFNfSVJVR08sIGFtZGdwdV94Z21pX3Nob3dfZGV2aWNlX2lkLCAN
CitOVUxMKTsgc3RhdGljIERFVklDRV9BVFRSKHhnbWlfZXJyb3IsIFNfSVJVR08sIGFtZGdwdV94
Z21pX3Nob3dfZXJyb3IsIA0KK05VTEwpOw0KIA0KIHN0YXRpYyBpbnQgYW1kZ3B1X3hnbWlfc3lz
ZnNfYWRkX2Rldl9pbmZvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KIAkJCQkJIHN0cnVj
dCBhbWRncHVfaGl2ZV9pbmZvICpoaXZlKQ0KQEAgLTE0OCw2ICsxNzYsMTIgQEAgc3RhdGljIGlu
dCBhbWRncHVfeGdtaV9zeXNmc19hZGRfZGV2X2luZm8oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsDQogCQlyZXR1cm4gcmV0Ow0KIAl9DQogDQorCS8qIENyZWF0ZSB4Z21pIGVycm9yIGZpbGUg
Ki8NCisJcmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKGFkZXYtPmRldiwgJmRldl9hdHRyX3hnbWlf
ZXJyb3IpOw0KKwlpZiAocmV0KQ0KKwkJcHJfZXJyKCJmYWlsZWQgdG8gY3JlYXRlIHhnbWlfZXJy
b3JcbiIpOw0KKw0KKw0KIAkvKiBDcmVhdGUgc3lzZnMgbGluayB0byBoaXZlIGluZm8gZm9sZGVy
IG9uIHRoZSBmaXJzdCBkZXZpY2UgKi8NCiAJaWYgKGFkZXYgIT0gaGl2ZS0+YWRldikgew0KIAkJ
cmV0ID0gc3lzZnNfY3JlYXRlX2xpbmsoJmFkZXYtPmRldi0+a29iaiwgaGl2ZS0+a29iaiwNCi0t
DQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
