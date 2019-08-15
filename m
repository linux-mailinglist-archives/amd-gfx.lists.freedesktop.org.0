Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD2F8F346
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 20:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8F46EA29;
	Thu, 15 Aug 2019 18:24:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780042.outbound.protection.outlook.com [40.107.78.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693D16EA29
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 18:24:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oxap8rmkSb+rGDCBMwzkoY2oPM1GEKZKN+pLbw0hWyB4OYVE9lQNvUiCAfHFBuqra0tItOtBtw4paOdTcV0OrI2F723e0PJGUqhW8s+TIjmYTq+2MhNVpUBJtGcdzGRJOXHmI33s6TNi36pK+MCpdMx1qDHz0zdO/9TNVVwNicVf/sB4iMJ9kLiQFEKevKa4uIOkAQ82WX1F4EYSoVZEdDqqFvOVSr/pmTcDWK5GugEZj8ax+W6kiafXbTIdxOo79GQRYJYnV6rCUDe7K9uU+WrsV/Bro+nkAl+RZXMdH2E3H9k7iUw6fygFa8BpDrrL5UiMSviy82FrsA1ShWgUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtCHMyIHuly7GxzBI0N3o/RsC0Yq7ZI2O4DwClq7hr0=;
 b=JfAVRlaAm4yMwrbKuX9tMpFtpps4l2+jrLasFYkYu74xWRdLYFfzMhszXHu67Ow3qHkyeSxvnuEYcX0jaaIKYiVn7kVNuIstdcu2S0o4Ww1U9Ec8sgsXfndjWDJzZ1+2yxuRUFzrBLTI23kaIaZONjK50ENNJePkvUPk7ap0M7HzRZs9/sykTdTP21qmAk2fq0/4nzu6VnF2d7TmsiCopHITCYJrdzfin6YSqA8wXK2xnYqntO5G/aFnJmMTA/upG7HjueFfR5hjgivQWApYFo+mKcLEgiwyHmSIPNX8k9hgND8eBpdnUTSPaCyytGT/sbqcOrlmN5gsKZKYVPoWGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB1340.namprd12.prod.outlook.com (10.168.238.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Thu, 15 Aug 2019 18:24:53 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 18:24:53 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "Thai, Thong" <Thong.Thai@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] Revert "drm/amdgpu: use direct loading on renoir vcn
 for the moment"
Thread-Topic: [PATCH 1/2] Revert "drm/amdgpu: use direct loading on renoir vcn
 for the moment"
Thread-Index: AQHVU5YFIc6l9g5xeECfJNK23Sws5Kb8hkiA
Date: Thu, 15 Aug 2019 18:24:53 +0000
Message-ID: <28e7815b-98d8-4e74-561f-baf8cd8e5af8@amd.com>
References: <20190815181940.4897-1-thong.thai@amd.com>
In-Reply-To: <20190815181940.4897-1-thong.thai@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::23) To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea4bc336-ff7c-4f57-0214-08d721adddb9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1340; 
x-ms-traffictypediagnostic: DM5PR12MB1340:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1340C5C97FCE331B600D9999E5AC0@DM5PR12MB1340.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(189003)(199004)(66066001)(66446008)(186003)(316002)(64756008)(66556008)(64126003)(65956001)(65806001)(256004)(6506007)(110136005)(53546011)(71190400001)(386003)(65826007)(66946007)(7736002)(2501003)(58126008)(26005)(71200400001)(6486002)(305945005)(486006)(52116002)(25786009)(478600001)(14454004)(6246003)(81166006)(76176011)(86362001)(3846002)(6116002)(81156014)(229853002)(102836004)(53936002)(36756003)(6512007)(66476007)(5660300002)(11346002)(99286004)(31686004)(2906002)(2616005)(446003)(6436002)(8936002)(8676002)(31696002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1340;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: f9Jeusn3e5Rvg9Oa5JVe62kC6JsLsAtrGnP4UQdZDEhkIHwYhE86xGbvNUuJP13am7ak7vqKLs71qBEaCs+Stpj0t0eJqZ18LCUqsqq493EuGjiPJJIfziwF6gOkiIlkxHkL05Olchz9C4YS1C14MZVFvbFgSVagSXNBR1xtHFoAxLLKXa/mWzPgviSfEu7OFWYDeWu7z4zNQQUOh0aRCEflhtAmaAYYwFD3qjM44fXW5KzMNUkjFsYpztcGHQf2S2R6irmELL38e/vvVwRlQINuyZKMfLxGdc+tO0bmFaOla+MXWZbcx79nLC9sM7olclBuRfRR+2N8lvs3/tO4NbBlHLwnJ/stedmJ06FJCGag3dipNsFho7UnFmsB0GKw+bQIqXBAy1hXosTnRzmoV1173vu4HSs8vYcrWWQ3twE=
Content-ID: <6EC505CE8AB1A1409536FD5C269AAFB4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4bc336-ff7c-4f57-0214-08d721adddb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 18:24:53.1231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BDQWJB2+xzu9JwqLw+tRqdFu2VFH6I68cLHAIraShr4hK6Ci76O6ubOGzXzAJML
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1340
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtCHMyIHuly7GxzBI0N3o/RsC0Yq7ZI2O4DwClq7hr0=;
 b=obatN9i1h2K9xzEvNW/DG5gd1qtxpZQz1XDVD9cc1m5axddvHlbf5oJBhRFtR/Sbw03F+L+XYdLSmAXvUQmJcRzXxqtf+agfkIh2Ok1QKTNzUvs/OmVnfSY/JlevpwZlh98pOLTL/2taB/OgcD4ojHyrWldmqkSNiA8ymzuOAXI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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

VGhpcyBwYXRjaCBpczoNCg0KUmV2aWV3ZWQtYnk6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4N
Cg0KT24gMjAxOS0wOC0xNSAyOjE5IHAubS4sIFRoYWksIFRob25nIHdyb3RlOg0KPiBUaGlzIHJl
dmVydHMgY29tbWl0IDY5ZmNkNzM0N2Y2ZmIxMWVkYzdlYWVhN2M3YjljZmYwMDQ0Y2UxN2UuDQo+
IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyB8IDkgKysr
LS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyAgIHwgOSAr
KystLS0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRp
b25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdmNuLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMNCj4gaW5k
ZXggOGI0M2M1YjIxYWU5Li4zNWEwYTEzOTZiZTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdmNuLmMNCj4gQEAgLTg0LDggKzg0LDcgQEAgaW50IGFtZGdwdV92Y25f
c3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJY2FzZSBDSElQX1JFTk9J
UjoNCj4gICAJCWZ3X25hbWUgPSBGSVJNV0FSRV9SRU5PSVI7DQo+ICAgCQlpZiAoKGFkZXYtPmZp
cm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9QU1ApICYmDQo+IC0JCSAgICAoYWRl
di0+cGdfZmxhZ3MgJiBBTURfUEdfU1VQUE9SVF9WQ05fRFBHKSAmJg0KPiAtCQkgICAgYWRldi0+
YXNpY190eXBlICE9IENISVBfUkVOT0lSKSAvKiB0byBiZSByZW1vdmVkIHdoaWxlIHZjbiBwc3Ag
bG9hZGluZyB3b3JrcyAqLw0KPiArCQkgICAgKGFkZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBP
UlRfVkNOX0RQRykpDQo+ICAgCQkJYWRldi0+dmNuLmluZGlyZWN0X3NyYW0gPSB0cnVlOw0KPiAg
IAkJYnJlYWs7DQo+ICAgCWRlZmF1bHQ6DQo+IEBAIC0xMzksOCArMTM4LDcgQEAgaW50IGFtZGdw
dV92Y25fc3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJfQ0KPiAgIA0K
PiAgIAlib19zaXplID0gQU1ER1BVX1ZDTl9TVEFDS19TSVpFICsgQU1ER1BVX1ZDTl9DT05URVhU
X1NJWkU7DQo+IC0JaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSAhPSBBTURHUFVfRldfTE9B
RF9QU1AgfHwNCj4gLQkgICAgYWRldi0+YXNpY190eXBlID09IENISVBfUkVOT0lSKQ0KPiArCWlm
IChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgIT0gQU1ER1BVX0ZXX0xPQURfUFNQKQ0KPiAgIAkJ
Ym9fc2l6ZSArPSBBTURHUFVfR1BVX1BBR0VfQUxJR04obGUzMl90b19jcHUoaGRyLT51Y29kZV9z
aXplX2J5dGVzKSArIDgpOw0KPiAgIAlyID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwoYWRldiwg
Ym9fc2l6ZSwgUEFHRV9TSVpFLA0KPiAgIAkJCQkgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwg
JmFkZXYtPnZjbi52Y3B1X2JvLA0KPiBAQCAtMjMzLDggKzIzMSw3IEBAIGludCBhbWRncHVfdmNu
X3Jlc3VtZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJCXVuc2lnbmVkIG9mZnNl
dDsNCj4gICANCj4gICAJCWhkciA9IChjb25zdCBzdHJ1Y3QgY29tbW9uX2Zpcm13YXJlX2hlYWRl
ciAqKWFkZXYtPnZjbi5mdy0+ZGF0YTsNCj4gLQkJaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlw
ZSAhPSBBTURHUFVfRldfTE9BRF9QU1AgfHwNCj4gLQkJICAgIGFkZXYtPmFzaWNfdHlwZSA9PSBD
SElQX1JFTk9JUikgew0KPiArCQlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlICE9IEFNREdQ
VV9GV19MT0FEX1BTUCkgew0KPiAgIAkJCW9mZnNldCA9IGxlMzJfdG9fY3B1KGhkci0+dWNvZGVf
YXJyYXlfb2Zmc2V0X2J5dGVzKTsNCj4gICAJCQltZW1jcHlfdG9pbyhhZGV2LT52Y24uY3B1X2Fk
ZHIsIGFkZXYtPnZjbi5mdy0+ZGF0YSArIG9mZnNldCwNCj4gICAJCQkJICAgIGxlMzJfdG9fY3B1
KGhkci0+dWNvZGVfc2l6ZV9ieXRlcykpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvdmNuX3YyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92
Ml8wLmMNCj4gaW5kZXggODRhYTc3NDcwODAyLi5iMTJjNWU1N2YxOGIgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYw0KPiBAQCAtMTQyLDggKzE0Miw3IEBAIHN0YXRp
YyBpbnQgdmNuX3YyXzBfc3dfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAgCWlmIChyKQ0KPiAgIAkJ
cmV0dXJuIHI7DQo+ICAgDQo+IC0JaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURH
UFVfRldfTE9BRF9QU1AgJiYNCj4gLQkgICAgYWRldi0+YXNpY190eXBlICE9IENISVBfUkVOT0lS
KSB7DQo+ICsJaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9Q
U1ApIHsNCj4gICAJCWNvbnN0IHN0cnVjdCBjb21tb25fZmlybXdhcmVfaGVhZGVyICpoZHI7DQo+
ICAgCQloZHIgPSAoY29uc3Qgc3RydWN0IGNvbW1vbl9maXJtd2FyZV9oZWFkZXIgKilhZGV2LT52
Y24uZnctPmRhdGE7DQo+ICAgCQlhZGV2LT5maXJtd2FyZS51Y29kZVtBTURHUFVfVUNPREVfSURf
VkNOXS51Y29kZV9pZCA9IEFNREdQVV9VQ09ERV9JRF9WQ047DQo+IEBAIC0zNjAsOCArMzU5LDcg
QEAgc3RhdGljIHZvaWQgdmNuX3YyXzBfbWNfcmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQ0KPiAgIAl1aW50MzJfdCBvZmZzZXQ7DQo+ICAgDQo+ICAgCS8qIGNhY2hlIHdpbmRvdyAw
OiBmdyAqLw0KPiAtCWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xP
QURfUFNQICYmDQo+IC0JICAgIGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX1JFTk9JUikgew0KPiAr
CWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQKSB7DQo+
ICAgCQlXUkVHMzJfU09DMTUoVVZELCAwLCBtbVVWRF9MTUlfVkNQVV9DQUNIRV82NEJJVF9CQVJf
TE9XLA0KPiAgIAkJCShhZGV2LT5maXJtd2FyZS51Y29kZVtBTURHUFVfVUNPREVfSURfVkNOXS50
bXJfbWNfYWRkcl9sbykpOw0KPiAgIAkJV1JFRzMyX1NPQzE1KFVWRCwgMCwgbW1VVkRfTE1JX1ZD
UFVfQ0FDSEVfNjRCSVRfQkFSX0hJR0gsDQo+IEBAIC00MDYsOCArNDA0LDcgQEAgc3RhdGljIHZv
aWQgdmNuX3YyXzBfbWNfcmVzdW1lX2RwZ19tb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCBib29sIGluZGlyZWMNCj4gICAJdWludDMyX3Qgb2Zmc2V0Ow0KPiAgIA0KPiAgIAkvKiBjYWNo
ZSB3aW5kb3cgMDogZncgKi8NCj4gLQlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFN
REdQVV9GV19MT0FEX1BTUCAmJg0KPiAtCSAgICBhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9SRU5P
SVIpIHsNCj4gKwlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FE
X1BTUCkgew0KPiAgIAkJaWYgKCFpbmRpcmVjdCkgew0KPiAgIAkJCVdSRUczMl9TT0MxNV9EUEdf
TU9ERV8yXzAoU09DMTVfRFBHX01PREVfT0ZGU0VUXzJfMCgNCj4gICAJCQkJVVZELCAwLCBtbVVW
RF9MTUlfVkNQVV9DQUNIRV82NEJJVF9CQVJfTE9XKSwNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
