Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC71AB679
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Sep 2019 12:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083046E249;
	Fri,  6 Sep 2019 10:56:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780040.outbound.protection.outlook.com [40.107.78.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36BC6E248
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Sep 2019 10:55:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDzIwQ+gFz6i5m2X6Fz7p9yHjVW54mhc1zTBU4oZLDqz3mwOFexeMHYenVGeV1UEcoilq/nYLDT+E7cqvf0yQX3uHUTMW9O8jQ68EPZn7J1LMGgeU3ZzmSwmRei6NO1EnRCTyE3uZNNgghaKYleqEqwCEx2E7/TQ1vsSFBAphNwprBCUeQyIKQHuZzhrZCgOGQnEomo7svwGi35oxbqZIQ3yJ6ssXXRNhu0IZY0Bay23rgnyg+K20JkuGBulRnUPqjOOKnFnVWb30/cX1tQxoexz00uFHkWrogwv9vNIA3mmTJSowzlVQoY41MtKbmRVPLhzCfoz6aqQG7wNEYVoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvSZRHQj/FNnil+d4pksXx1+ygugMH34wP01S1ktrDU=;
 b=NXp9usZzrMyJ85KvXsw7Kau6OUUbwsmAsQQlAvZqDsHhvx7L9EQvHLvikHXfyVkUQ9u6tsRdOJ3T4TwvxqhPRYEoc9tYrmJXe54YZtP6xv7E3cD4+cUAsV5omLCwhrOak+7+NY6qHmajwqfWC5gj4MWh3B7nfvl2av4ami6QDOs9HKtpllt+5vfP1oZ5MO+BTlCgbsETLLQnLc8sIop9/e7IxmoueC2FTwVEWvfS1yHD9eqU/6+Ux9MsEr857zJn4c0U983laTVITD9U6bJNQqrD9EDVO4pqtmcA+w3BgcRlm/UqRU8gzmawgFsHxa7a6iwi2N6gaLMiaDCjs7wIjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB2926.namprd12.prod.outlook.com (20.179.84.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.17; Fri, 6 Sep 2019 10:55:58 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2220.022; Fri, 6 Sep 2019
 10:55:58 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 1/3] drm/amdgpu: move umc late init from gmc to umc block
Thread-Topic: [PATCH 1/3] drm/amdgpu: move umc late init from gmc to umc block
Thread-Index: AQHVZJGI2Apq2LLJKUuTM87RSuXNj6ceajBQgAALIpA=
Date: Fri, 6 Sep 2019 10:55:58 +0000
Message-ID: <MN2PR12MB305452B841A942530DA27EBEB0BA0@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190906090011.20271-1-tao.zhou1@amd.com>
 <BYAPR12MB28068DED16FFF7844B430D83F1BA0@BYAPR12MB2806.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB28068DED16FFF7844B430D83F1BA0@BYAPR12MB2806.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea547ead-e13d-4476-6254-08d732b8cc82
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2926; 
x-ms-traffictypediagnostic: MN2PR12MB2926:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2926DDDD436B88014BAC47BFB0BA0@MN2PR12MB2926.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(189003)(199004)(13464003)(71190400001)(71200400001)(7736002)(6116002)(14444005)(86362001)(8676002)(81156014)(81166006)(305945005)(256004)(8936002)(2501003)(6636002)(66066001)(3846002)(14454004)(229853002)(5660300002)(6246003)(25786009)(478600001)(55016002)(9686003)(53936002)(76176011)(76116006)(52536014)(6506007)(53546011)(26005)(2906002)(102836004)(186003)(476003)(11346002)(446003)(486006)(74316002)(66476007)(64756008)(316002)(66446008)(99286004)(6436002)(7696005)(66556008)(66946007)(110136005)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2926;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6PJx3ZhSkOW+T6WKudcal019f9xbSJf85XQqM99v1pUIi3CliGwr5y+1cB1Q7bkhH/a1x4bruL3PzWjymWc4pLkQl5zN5uGZ70BKjeRN3y0bNuU39j6aQhstmvCn99O9f39otQntqEHqzUqLQVNKPg1yjOJYnp8UWb6QW5iCVLttyt8qmdzMQaw1NtZFjCm2auR7ZOBz6BasK+RhmF4qEbsw0qy/2/ojQ0J5PKD3AQUSITNC+gfqDYCGkHeFkL+kV8JI4ooGNiv5RplIWg5N5zUIRQW5vaoVOBiJKESoMEE5Bds9jXOrFD9Y3H4tMkBqE+2tmwVw/Q9SyRWOugPzg2SLHWggVs1IbxI7sqOXJRzhy5kM7VpvUDKmpL8MmwTPLDNOVk86liXwyrlwFC6jcyRZjNTwhQ6+gnWkKAgCjxU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea547ead-e13d-4476-6254-08d732b8cc82
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 10:55:58.0603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCWzkoY28K2sCZ8XOcVWHJi+Fd6xnkiyPsiPT+tw9qN4nA4vEDaCt5KpUkTWe5Nv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2926
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvSZRHQj/FNnil+d4pksXx1+ygugMH34wP01S1ktrDU=;
 b=cburLqb9RZjcWfPfehJnZtHUsG0OuqXXmvV6XX7Msg/cYmFA0m5D9ffiS6ZAoEaVAsABsABWr2ooF8Y3qmEzU3TVOZuCIbh+Cb589fF43yaERIEH9E3Lzv1J+Mr/Mz6byFNk0z7rSZH3qV2BYC4kARPKcKIVFq38oJLUyoUUq7k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hlbiwgR3VjaHVuIDxH
dWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTZW50OiAyMDE55bm0OeaciDbml6UgMTg6MDENCj4gVG86
IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7DQo+IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQo+IFN1Ympl
Y3Q6IFJFOiBbUEFUQ0ggMS8zXSBkcm0vYW1kZ3B1OiBtb3ZlIHVtYyBsYXRlIGluaXQgZnJvbSBn
bWMgdG8gdW1jDQo+IGJsb2NrDQo+IA0KPiANCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KPiBTZW50OiBGcmlk
YXksIFNlcHRlbWJlciA2LCAyMDE5IDU6MDEgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZw0KPiA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgQ2hl
biwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KPiBDYzogWmhvdTEsIFRhbyA8VGFvLlpo
b3UxQGFtZC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAxLzNdIGRybS9hbWRncHU6IG1vdmUgdW1j
IGxhdGUgaW5pdCBmcm9tIGdtYyB0byB1bWMNCj4gYmxvY2sNCj4gDQo+IHVtYyBsYXRlIGluaXQg
aXMgdW1jIHNwZWNpZmljLCBpdCdzIG1vcmUgc3VpdGFibGUgdG8gYmUgcHV0IGluIHVtYyBibG9j
aw0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlICAgICB8ICAyICstDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMgfCA0OCAtLS0tLS0tLS0t
LS0tLS0tDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaCB8ICAyIC0N
Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jIHwgNzMNCj4gKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dW1jLmggfCAgMiArDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAg
fCAgOCArKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgICB8ICAx
ICsNCj4gIDcgZmlsZXMgY2hhbmdlZCwgODIgaW5zZXJ0aW9ucygrKSwgNTQgZGVsZXRpb25zKC0p
ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3VtYy5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFr
ZWZpbGUNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZQ0KPiBpbmRleCA4
NDYxNGE3MWJiNGQuLjkxMzY5YzgyM2NlMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
TWFrZWZpbGUNCj4gQEAgLTU1LDcgKzU1LDcgQEAgYW1kZ3B1LXkgKz0gYW1kZ3B1X2RldmljZS5v
IGFtZGdwdV9rbXMubyBcDQo+ICAJYW1kZ3B1X3ZmX2Vycm9yLm8gYW1kZ3B1X3NjaGVkLm8gYW1k
Z3B1X2RlYnVnZnMubw0KPiBhbWRncHVfaWRzLm8gXA0KPiAgCWFtZGdwdV9nbWMubyBhbWRncHVf
bW1odWIubyBhbWRncHVfeGdtaS5vIGFtZGdwdV9jc2Eubw0KPiBhbWRncHVfcmFzLm8gYW1kZ3B1
X3ZtX2NwdS5vIFwNCj4gIAlhbWRncHVfdm1fc2RtYS5vIGFtZGdwdV9wbXUubyBhbWRncHVfZGlz
Y292ZXJ5Lm8NCj4gYW1kZ3B1X3Jhc19lZXByb20ubyBhbWRncHVfbmJpby5vIFwNCj4gLQlzbXVf
djExXzBfaTJjLm8NCj4gKwlhbWRncHVfdW1jLm8gc211X3YxMV8wX2kyYy5vDQo+IA0KPiAgYW1k
Z3B1LSQoQ09ORklHX1BFUkZfRVZFTlRTKSArPSBhbWRncHVfcG11Lm8NCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMNCj4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmMNCj4gaW5kZXggNTE4OTBiMWQ4NTIyLi5k
YzA0NGVlYzE4OGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9nbWMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21j
LmMNCj4gQEAgLTMwNCw1MSArMzA0LDMgQEAgYm9vbCBhbWRncHVfZ21jX2ZpbHRlcl9mYXVsdHMo
c3RydWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQ2NF90IGFkZHIsDQo+ICAJZ21jLT5m
YXVsdF9oYXNoW2hhc2hdLmlkeCA9IGdtYy0+bGFzdF9mYXVsdCsrOw0KPiAgCXJldHVybiBmYWxz
ZTsNCj4gIH0NCj4gLQ0KPiAtaW50IGFtZGdwdV9nbWNfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwNCj4gLQkJCSAgICAgdm9pZCAqcmFzX2loX2luZm8pDQo+IC17DQo+
IC0JaW50IHI7DQo+IC0Jc3RydWN0IHJhc19paF9pZiAqaWhfaW5mbyA9IChzdHJ1Y3QgcmFzX2lo
X2lmICopcmFzX2loX2luZm87DQo+IC0Jc3RydWN0IHJhc19mc19pZiBmc19pbmZvID0gew0KPiAt
CQkuc3lzZnNfbmFtZSA9ICJ1bWNfZXJyX2NvdW50IiwNCj4gLQkJLmRlYnVnZnNfbmFtZSA9ICJ1
bWNfZXJyX2luamVjdCIsDQo+IC0JfTsNCj4gLQ0KPiAtCWlmICghaWhfaW5mbykNCj4gLQkJcmV0
dXJuIC1FSU5WQUw7DQo+IC0NCj4gLQlpZiAoIWFkZXYtPmdtYy51bWNfcmFzX2lmKSB7DQo+IC0J
CWFkZXYtPmdtYy51bWNfcmFzX2lmID0ga21hbGxvYyhzaXplb2Yoc3RydWN0DQo+IHJhc19jb21t
b25faWYpLCBHRlBfS0VSTkVMKTsNCj4gLQkJaWYgKCFhZGV2LT5nbWMudW1jX3Jhc19pZikNCj4g
LQkJCXJldHVybiAtRU5PTUVNOw0KPiAtCQlhZGV2LT5nbWMudW1jX3Jhc19pZi0+YmxvY2sgPSBB
TURHUFVfUkFTX0JMT0NLX19VTUM7DQo+IC0JCWFkZXYtPmdtYy51bWNfcmFzX2lmLT50eXBlID0N
Cj4gQU1ER1BVX1JBU19FUlJPUl9fTVVMVElfVU5DT1JSRUNUQUJMRTsNCj4gLQkJYWRldi0+Z21j
LnVtY19yYXNfaWYtPnN1Yl9ibG9ja19pbmRleCA9IDA7DQo+IC0JCXN0cmNweShhZGV2LT5nbWMu
dW1jX3Jhc19pZi0+bmFtZSwgInVtYyIpOw0KPiAtCX0NCj4gLQlpaF9pbmZvLT5oZWFkID0gZnNf
aW5mby5oZWFkID0gKmFkZXYtPmdtYy51bWNfcmFzX2lmOw0KPiAtDQo+IC0JciA9IGFtZGdwdV9y
YXNfbGF0ZV9pbml0KGFkZXYsIGFkZXYtPmdtYy51bWNfcmFzX2lmLA0KPiAtCQkJCSAmZnNfaW5m
bywgaWhfaW5mbyk7DQo+IC0JaWYgKHIpDQo+IC0JCWdvdG8gZnJlZTsNCj4gLQ0KPiAtCWlmIChh
bWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBhZGV2LT5nbWMudW1jX3Jhc19pZi0+YmxvY2sp
KSB7DQo+IC0JCXIgPSBhbWRncHVfaXJxX2dldChhZGV2LCAmYWRldi0+Z21jLmVjY19pcnEsIDAp
Ow0KPiAtCQlpZiAocikNCj4gLQkJCWdvdG8gbGF0ZV9maW5pOw0KPiAtCX0gZWxzZSB7DQo+IC0J
CXIgPSAwOw0KPiAtCQlnb3RvIGZyZWU7DQo+IC0JfQ0KPiAtDQo+IC0JcmV0dXJuIDA7DQo+IC0N
Cj4gLWxhdGVfZmluaToNCj4gLQlhbWRncHVfcmFzX2xhdGVfZmluaShhZGV2LCBhZGV2LT5nbWMu
dW1jX3Jhc19pZiwgaWhfaW5mbyk7DQo+IC1mcmVlOg0KPiAtCWtmcmVlKGFkZXYtPmdtYy51bWNf
cmFzX2lmKTsNCj4gLQlhZGV2LT5nbWMudW1jX3Jhc19pZiA9IE5VTEw7DQo+IC0JcmV0dXJuIHI7
DQo+IC19DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z21jLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgNCj4gaW5k
ZXggMzMxY2U1MGEzYTllLi5iNmUxZDk4ZWYwMWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ21jLmgNCj4gQEAgLTIzMCw3ICsyMzAsNSBAQCB2b2lkIGFtZGdwdV9n
bWNfYWdwX2xvY2F0aW9uKHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgCQkJICAg
ICBzdHJ1Y3QgYW1kZ3B1X2dtYyAqbWMpOw0KPiAgYm9vbCBhbWRncHVfZ21jX2ZpbHRlcl9mYXVs
dHMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQ2NF90IGFkZHIsDQo+ICAJCQkgICAg
ICB1aW50MTZfdCBwYXNpZCwgdWludDY0X3QgdGltZXN0YW1wKTsgLWludA0KPiBhbWRncHVfZ21j
X3Jhc19sYXRlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+IC0JCQkgICAgIHZv
aWQgKmloX2luZm8pOw0KPiANCj4gICNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3VtYy5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAw
MDAwMC4uYzhkZTEyNzA5N2FiDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jDQo+IEBAIC0wLDAgKzEsNzMgQEANCj4gKy8qDQo+
ICsgKiBDb3B5cmlnaHQgMjAxOSBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuDQo+ICsgKg0K
PiArICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFu
eSBwZXJzb24NCj4gK29idGFpbmluZyBhDQo+ICsgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5k
IGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlDQo+ICsiU29mdHdhcmUiKSwNCj4g
KyAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGlu
ZyB3aXRob3V0DQo+ICtsaW1pdGF0aW9uDQo+ICsgKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwg
bW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwNCj4gK3N1YmxpY2Vuc2UsDQo+ICsg
KiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNv
bnMgdG8gd2hvbQ0KPiArdGhlDQo+ICsgKiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28s
IHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOg0KPiArICoNCj4gKyAqIFRoZSBh
Ym92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJl
DQo+ICtpbmNsdWRlZCBpbg0KPiArICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9u
cyBvZiB0aGUgU29mdHdhcmUuDQo+ICsgKg0KPiArICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVE
ICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsDQo+ICtFWFBSRVNTIE9SDQo+
ICsgKiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVT
IE9GDQo+ICtNRVJDSEFOVEFCSUxJVFksDQo+ICsgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIg
UFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4gTk8NCj4gRVZFTlQNCj4gK1NIQUxMDQo+
ICsgKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBPUiBBVVRIT1IoUykgQkUgTElBQkxFIEZPUiBB
TlkgQ0xBSU0sDQo+ICtEQU1BR0VTIE9SDQo+ICsgKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIg
SU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SDQo+ICtPVEhFUldJU0UsDQo+ICsgKiBB
UklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9S
DQo+IFRIRSBVU0UNCj4gK09SDQo+ICsgKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUu
DQo+ICsgKg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlICJhbWRncHUuaCINCj4gKyNpbmNsdWRl
ICJhbWRncHVfcmFzLmgiDQo+ICsNCj4gK2ludCBhbWRncHVfdW1jX3Jhc19sYXRlX2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHZvaWQNCj4gKypyYXNfaWhfaW5mbykgew0KPiArCWlu
dCByOw0KPiArCXN0cnVjdCByYXNfaWhfaWYgKmloX2luZm8gPSAoc3RydWN0IHJhc19paF9pZiAq
KXJhc19paF9pbmZvOw0KPiArCXN0cnVjdCByYXNfZnNfaWYgZnNfaW5mbyA9IHsNCj4gKwkJLnN5
c2ZzX25hbWUgPSAidW1jX2Vycl9jb3VudCIsDQo+ICsJCS5kZWJ1Z2ZzX25hbWUgPSAidW1jX2Vy
cl9pbmplY3QiLA0KPiArCX07DQo+ICsNCj4gKwlpZiAoIWloX2luZm8pDQo+ICsJCXJldHVybiAt
RUlOVkFMOw0KPiArDQo+ICsJaWYgKCFhZGV2LT5nbWMudW1jX3Jhc19pZikgew0KPiArCQlhZGV2
LT5nbWMudW1jX3Jhc19pZiA9DQo+ICsJCQlrbWFsbG9jKHNpemVvZihzdHJ1Y3QgcmFzX2NvbW1v
bl9pZiksIEdGUF9LRVJORUwpOw0KPiArCQlpZiAoIWFkZXYtPmdtYy51bWNfcmFzX2lmKQ0KPiAr
CQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJCWFkZXYtPmdtYy51bWNfcmFzX2lmLT5ibG9jayA9IEFN
REdQVV9SQVNfQkxPQ0tfX1VNQzsNCj4gKwkJYWRldi0+Z21jLnVtY19yYXNfaWYtPnR5cGUgPQ0K
PiBBTURHUFVfUkFTX0VSUk9SX19NVUxUSV9VTkNPUlJFQ1RBQkxFOw0KPiArCQlhZGV2LT5nbWMu
dW1jX3Jhc19pZi0+c3ViX2Jsb2NrX2luZGV4ID0gMDsNCj4gKwkJc3RyY3B5KGFkZXYtPmdtYy51
bWNfcmFzX2lmLT5uYW1lLCAidW1jIik7DQo+ICsJfQ0KPiArCWloX2luZm8tPmhlYWQgPSBmc19p
bmZvLmhlYWQgPSAqYWRldi0+Z21jLnVtY19yYXNfaWY7DQo+IFtHdWNodW5dV2UgaGF2ZSBvbmUg
YW1kZ3B1X3VtYyBtZW1iZXIgaW4gYWRldiBzdHJ1Y3R1cmUsIHNvIGlzIGl0DQo+IHJlYXNvbmFi
bGUgdG8gbW92ZSB1bWNfcmFzX2lmIGZyb20gZ21jIHRvIHRoaXMgdW1jIHNwZWNpZmljIHN0cnVj
dHVyZT8NCg0KW1Rhb10gSW4gZmFjdCwgdGhlIHJlZmluZW1lbnQgaXMgbm90IGZpbmlzaGVkLCBJ
IGFsc28gY29uc2lkZXIgbW92aW5nIHRoZSBjYWxsIGJhY2sgb2YgZWNjX2lycSB0byBjb21tb24g
ZmlsZS4gSSdsbCBjb250aW51ZSB0byByZWZpbmUgcmFzIGNvZGUgKGluY2x1ZGluZyB5b3VyIHN1
Z2dlc3Rpb24pIGluIGZ1dHVyZSdzIG5ldyBwYXRjaC4NCg0KPiANCj4gKwlyID0gYW1kZ3B1X3Jh
c19sYXRlX2luaXQoYWRldiwgYWRldi0+Z21jLnVtY19yYXNfaWYsDQo+ICsJCQkJICZmc19pbmZv
LCBpaF9pbmZvKTsNCj4gKwlpZiAocikNCj4gKwkJZ290byBmcmVlOw0KPiArDQo+ICsJaWYgKGFt
ZGdwdV9yYXNfaXNfc3VwcG9ydGVkKGFkZXYsIGFkZXYtPmdtYy51bWNfcmFzX2lmLT5ibG9jaykp
IHsNCj4gKwkJciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LT5nbWMuZWNjX2lycSwgMCk7
DQo+ICsJCWlmIChyKQ0KPiArCQkJZ290byBsYXRlX2Zpbmk7DQo+ICsJfSBlbHNlIHsNCj4gKwkJ
ciA9IDA7DQo+ICsJCWdvdG8gZnJlZTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gKw0K
PiArbGF0ZV9maW5pOg0KPiArCWFtZGdwdV9yYXNfbGF0ZV9maW5pKGFkZXYsIGFkZXYtPmdtYy51
bWNfcmFzX2lmLCBpaF9pbmZvKTsNCj4gK2ZyZWU6DQo+ICsJa2ZyZWUoYWRldi0+Z21jLnVtY19y
YXNfaWYpOw0KPiArCWFkZXYtPmdtYy51bWNfcmFzX2lmID0gTlVMTDsNCj4gKwlyZXR1cm4gcjsN
Cj4gK30NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91
bWMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaA0KPiBpbmRl
eCA5NzVhZmEwNGRmMDkuLjZmMjJjOTcwNDU1NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV91bWMuaA0KPiBAQCAtNTUsNiArNTUsNyBAQA0KPiANCj4gIHN0cnVjdCBh
bWRncHVfdW1jX2Z1bmNzIHsNCj4gIAl2b2lkICgqcmFzX2luaXQpKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KTsNCj4gKwlpbnQgKCpyYXNfbGF0ZV9pbml0KShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgdm9pZCAqcmFzX2loX2luZm8pOw0KPiAgCXZvaWQgKCpxdWVyeV9yYXNfZXJyb3Jf
Y291bnQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAgCQkJCQl2b2lkICpyYXNfZXJy
b3Jfc3RhdHVzKTsNCj4gIAl2b2lkICgqcXVlcnlfcmFzX2Vycm9yX2FkZHJlc3MpKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCBAQCAtDQo+IDc5LDQgKzgwLDUgQEAgc3RydWN0IGFtZGdwdV91
bWMgew0KPiAgCWNvbnN0IHN0cnVjdCBhbWRncHVfdW1jX2Z1bmNzICpmdW5jczsNCj4gIH07DQo+
IA0KPiAraW50IGFtZGdwdV91bWNfcmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgdm9pZA0KPiArKnJhc19paF9pbmZvKTsNCj4gICNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gaW5kZXggYmViNmM4NGFiOWUyLi4zZGI0MDM0MmI2
YzMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBAQCAtNzkz
LDkgKzc5MywxMSBAQCBzdGF0aWMgaW50IGdtY192OV8wX2VjY19sYXRlX2luaXQodm9pZCAqaGFu
ZGxlKQ0KPiAgCQkuY2IgPSBnbWNfdjlfMF9wcm9jZXNzX3Jhc19kYXRhX2NiLA0KPiAgCX07DQo+
IA0KPiAtCXIgPSBhbWRncHVfZ21jX3Jhc19sYXRlX2luaXQoYWRldiwgJnVtY19paF9pbmZvKTsN
Cj4gLQlpZiAocikNCj4gLQkJcmV0dXJuIHI7DQo+ICsJaWYgKGFkZXYtPnVtYy5mdW5jcyAmJiBh
ZGV2LT51bWMuZnVuY3MtPnJhc19sYXRlX2luaXQpIHsNCj4gKwkJciA9IGFkZXYtPnVtYy5mdW5j
cy0+cmFzX2xhdGVfaW5pdChhZGV2LCAmdW1jX2loX2luZm8pOw0KPiArCQlpZiAocikNCj4gKwkJ
CXJldHVybiByOw0KPiArCX0NCj4gDQo+ICAJaWYgKGFkZXYtPm1taHViX2Z1bmNzICYmIGFkZXYt
Pm1taHViX2Z1bmNzLT5yYXNfbGF0ZV9pbml0KSB7DQo+ICAJCXIgPSBhZGV2LT5tbWh1Yl9mdW5j
cy0+cmFzX2xhdGVfaW5pdChhZGV2KTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3VtY192Nl8xLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNf
djZfMS5jDQo+IGluZGV4IDA5ZTMxNmEyMmYxYS4uNGNkYjVjMDRjZDE3IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMNCj4gQEAgLTI3Myw2ICsyNzMsNyBAQCBzdGF0
aWMgdm9pZCB1bWNfdjZfMV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPiAqYWRldikN
Cj4gDQo+ICBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3VtY19mdW5jcyB1bWNfdjZfMV9mdW5jcyA9IHsN
Cj4gIAkucmFzX2luaXQgPSB1bWNfdjZfMV9yYXNfaW5pdCwNCj4gKwkucmFzX2xhdGVfaW5pdCA9
IGFtZGdwdV91bWNfcmFzX2xhdGVfaW5pdCwNCj4gIAkucXVlcnlfcmFzX2Vycm9yX2NvdW50ID0g
dW1jX3Y2XzFfcXVlcnlfcmFzX2Vycm9yX2NvdW50LA0KPiAgCS5xdWVyeV9yYXNfZXJyb3JfYWRk
cmVzcyA9IHVtY192Nl8xX3F1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzLA0KPiAgCS5lbmFibGVfdW1j
X2luZGV4X21vZGUgPSB1bWNfdjZfMV9lbmFibGVfdW1jX2luZGV4X21vZGUsDQo+IC0tDQo+IDIu
MTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
