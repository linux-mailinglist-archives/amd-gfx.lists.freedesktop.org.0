Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFFF3675C
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 00:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B64895F5;
	Wed,  5 Jun 2019 22:19:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3010895F5
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 22:19:14 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2873.namprd12.prod.outlook.com (20.179.71.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Wed, 5 Jun 2019 22:19:09 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 22:19:09 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/amdkfd: Refactor create_queue_nocpsch
Thread-Topic: [PATCH 3/6] drm/amdkfd: Refactor create_queue_nocpsch
Thread-Index: AQHVG7itZxcgfBvjJEe8Bh2oglWUjaaNofCA
Date: Wed, 5 Jun 2019 22:19:08 +0000
Message-ID: <9b915cd3-2d3f-5c78-bce2-9016ea3c9d81@amd.com>
References: <1559750793-16608-1-git-send-email-Oak.Zeng@amd.com>
 <1559750793-16608-3-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559750793-16608-3-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed5d2fcd-96f9-47db-ce87-08d6ea03d422
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2873; 
x-ms-traffictypediagnostic: DM6PR12MB2873:
x-microsoft-antispam-prvs: <DM6PR12MB2873C353CC8F4B4AE72806D892160@DM6PR12MB2873.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(39860400002)(376002)(366004)(51234002)(189003)(199004)(68736007)(99286004)(72206003)(65806001)(76176011)(54906003)(36756003)(305945005)(14454004)(229853002)(7736002)(6486002)(478600001)(66066001)(2501003)(52116002)(6512007)(14444005)(65956001)(256004)(25786009)(31696002)(86362001)(110136005)(5660300002)(2906002)(58126008)(66446008)(446003)(8676002)(64756008)(66476007)(66946007)(102836004)(186003)(66556008)(11346002)(81156014)(8936002)(316002)(6246003)(73956011)(65826007)(81166006)(3846002)(6116002)(2616005)(31686004)(6436002)(64126003)(71190400001)(53936002)(476003)(26005)(53546011)(71200400001)(6506007)(486006)(4326008)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2873;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xLwXWPZjndCqM0CrpFajvcqc33O33hJigEV9Q4fOQBCRquVezarcf/ZiDDVBuOaXa3RI1sioMTTuWdSEpb8bqNG4ossS/aQ5JgfeXlLoIFTzNj0YhmwYKWa7/wr/rnWZmirLzRXT+3XU6pC0XzvFxyk/upWERdmz8HB/K7gbqMaRWUG9N1uWlbDjS3rYL8qPl7hADJBjJyeD6c2DykOL/LxFsfM4Jay2BEW3og6KOzLHo4beTihehXgPYBDSFHDom83PrWPk/OwrMaCCGD9sWo0AqRxisCilV0NQ0VA+CqNcUxXM8jvrZwRJS3TRCwfzKTUPZBuqDhxsWBjyxs6mbBqm8z3/TDNSaV7WMZf7z9RrR0juPwf2gid1mA19m5qDjq7l24t+nTi3SNtWHmZY0GyEj7FbVLgyk4aWO6KcvRo=
Content-ID: <FAA91E8F84E84A4DACD23979F80C3ED3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5d2fcd-96f9-47db-ce87-08d6ea03d422
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 22:19:08.8593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2873
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdVhPyRn90PFvRq83qeqtae7lFDXJsxq59/NGgpLnrc=;
 b=e7TaBR8SJokVG8n3uvvCdVLK/xsktH8dhDg+fgJcX79Ol+yAN9LbPp1CtWQXmbSG8fMNOYhHhrWxPDcA4zGKjkYOtvmLvFN9HSCAjkF4V6VTvfot+4MUfJMqhuFjvWNPf8YgBIhVB4ZkYzkngSA5uJ5pGeeaL+vK1Is1fnzZBbw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>, "Freehill,
 Chris" <Chris.Freehill@amd.com>, "Liu, Alex" <Alex.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2hlcyAxLTMgYXJlIFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxp
bmdAYW1kLmNvbT4NCg0KT24gMjAxOS0wNi0wNSAxMjowNiBwLm0uLCBaZW5nLCBPYWsgd3JvdGU6
DQo+IFRoaXMgaXMgcHJlcGFyZSB3b3JrIHRvIGZpeCBhIGNpcmN1bGFyIGxvY2sgZGVwZW5kZW5j
eS4NCj4gTm8gbG9naWMgY2hhbmdlDQo+DQo+IENoYW5nZS1JZDogSTRlMGVlOTE4MjYwZTc3ODBk
ZTk3MmRkNzFmNGNlNzg3YjRmNmRkZTkNCj4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5a
ZW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIC4uLi9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZV9xdWV1ZV9tYW5hZ2VyLmMgIHwgMTcxICsrKysrKystLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspLCAxMTQgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFn
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdl
ci5jDQo+IGluZGV4IGRhYjZlZjQuLjNjMDQyZWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+IEBAIC00
MiwxMCArNDIsNiBAQA0KPiAgIHN0YXRpYyBpbnQgc2V0X3Bhc2lkX3ZtaWRfbWFwcGluZyhzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gICAJCQkJCXVuc2lnbmVkIGludCBwYXNp
ZCwgdW5zaWduZWQgaW50IHZtaWQpOw0KPiAgIA0KPiAtc3RhdGljIGludCBjcmVhdGVfY29tcHV0
ZV9xdWV1ZV9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KPiAtCQkJ
CQlzdHJ1Y3QgcXVldWUgKnEsDQo+IC0JCQkJCXN0cnVjdCBxY21fcHJvY2Vzc19kZXZpY2UgKnFw
ZCk7DQo+IC0NCj4gICBzdGF0aWMgaW50IGV4ZWN1dGVfcXVldWVzX2Nwc2NoKHN0cnVjdCBkZXZp
Y2VfcXVldWVfbWFuYWdlciAqZHFtLA0KPiAgIAkJCQllbnVtIGtmZF91bm1hcF9xdWV1ZXNfZmls
dGVyIGZpbHRlciwNCj4gICAJCQkJdWludDMyX3QgZmlsdGVyX3BhcmFtKTsNCj4gQEAgLTU1LDEz
ICs1MSwxNCBAQCBzdGF0aWMgaW50IHVubWFwX3F1ZXVlc19jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1
ZXVlX21hbmFnZXIgKmRxbSwNCj4gICANCj4gICBzdGF0aWMgaW50IG1hcF9xdWV1ZXNfY3BzY2go
c3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0pOw0KPiAgIA0KPiAtc3RhdGljIGludCBj
cmVhdGVfc2RtYV9xdWV1ZV9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFt
LA0KPiAtCQkJCQlzdHJ1Y3QgcXVldWUgKnEsDQo+IC0JCQkJCXN0cnVjdCBxY21fcHJvY2Vzc19k
ZXZpY2UgKnFwZCk7DQo+IC0NCj4gICBzdGF0aWMgdm9pZCBkZWFsbG9jYXRlX3NkbWFfcXVldWUo
c3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+ICAgCQkJCXN0cnVjdCBxdWV1ZSAq
cSk7DQo+ICAgDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZGVhbGxvY2F0ZV9ocWQoc3RydWN0IGRl
dmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+ICsJCQkJc3RydWN0IHF1ZXVlICpxKTsNCj4gK3N0
YXRpYyBpbnQgYWxsb2NhdGVfaHFkKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLCBz
dHJ1Y3QgcXVldWUgKnEpOw0KPiArc3RhdGljIGludCBhbGxvY2F0ZV9zZG1hX3F1ZXVlKHN0cnVj
dCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KPiArCQkJCXN0cnVjdCBxdWV1ZSAqcSk7DQo+
ICAgc3RhdGljIHZvaWQga2ZkX3Byb2Nlc3NfaHdfZXhjZXB0aW9uKHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yayk7DQo+ICAgDQo+ICAgc3RhdGljIGlubGluZQ0KPiBAQCAtMjIzLDYgKzIyMCw5IEBA
IHN0YXRpYyBpbnQgYWxsb2NhdGVfdm1pZChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRx
bSwNCj4gICAJLyogaW52YWxpZGF0ZSB0aGUgVk0gY29udGV4dCBhZnRlciBwYXNpZCBhbmQgdm1p
ZCBtYXBwaW5nIGlzIHNldCB1cCAqLw0KPiAgIAlrZmRfZmx1c2hfdGxiKHFwZF90b19wZGQocXBk
KSk7DQo+ICAgDQo+ICsJZHFtLT5kZXYtPmtmZDJrZ2QtPnNldF9zY3JhdGNoX2JhY2tpbmdfdmEo
DQo+ICsJCWRxbS0+ZGV2LT5rZ2QsIHFwZC0+c2hfaGlkZGVuX3ByaXZhdGVfYmFzZSwgcXBkLT52
bWlkKTsNCj4gKw0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+IEBAIC0yNjksNiArMjY5
LDcgQEAgc3RhdGljIGludCBjcmVhdGVfcXVldWVfbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVl
X21hbmFnZXIgKmRxbSwNCj4gICAJCQkJc3RydWN0IHF1ZXVlICpxLA0KPiAgIAkJCQlzdHJ1Y3Qg
cWNtX3Byb2Nlc3NfZGV2aWNlICpxcGQpDQo+ICAgew0KPiArCXN0cnVjdCBtcWRfbWFuYWdlciAq
bXFkX21ncjsNCj4gICAJaW50IHJldHZhbDsNCj4gICANCj4gICAJcHJpbnRfcXVldWUocSk7DQo+
IEBAIC0yOTgsMTggKzI5OSw0MSBAQCBzdGF0aWMgaW50IGNyZWF0ZV9xdWV1ZV9ub2Nwc2NoKHN0
cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KPiAgIAlxLT5wcm9wZXJ0aWVzLnRiYV9h
ZGRyID0gcXBkLT50YmFfYWRkcjsNCj4gICAJcS0+cHJvcGVydGllcy50bWFfYWRkciA9IHFwZC0+
dG1hX2FkZHI7DQo+ICAgDQo+IC0JaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVf
VFlQRV9DT01QVVRFKQ0KPiAtCQlyZXR2YWwgPSBjcmVhdGVfY29tcHV0ZV9xdWV1ZV9ub2Nwc2No
KGRxbSwgcSwgcXBkKTsNCj4gLQllbHNlIGlmIChxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FV
RVVFX1RZUEVfU0RNQSB8fA0KPiAtCQkJcS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9U
WVBFX1NETUFfWEdNSSkNCj4gLQkJcmV0dmFsID0gY3JlYXRlX3NkbWFfcXVldWVfbm9jcHNjaChk
cW0sIHEsIHFwZCk7DQo+IC0JZWxzZQ0KPiAtCQlyZXR2YWwgPSAtRUlOVkFMOw0KPiArCW1xZF9t
Z3IgPSBkcW0tPm1xZF9tZ3JzW2dldF9tcWRfdHlwZV9mcm9tX3F1ZXVlX3R5cGUoDQo+ICsJCQlx
LT5wcm9wZXJ0aWVzLnR5cGUpXTsNCj4gKwlpZiAocS0+cHJvcGVydGllcy50eXBlID09IEtGRF9R
VUVVRV9UWVBFX0NPTVBVVEUpIHsNCj4gKwkJcmV0dmFsID0gYWxsb2NhdGVfaHFkKGRxbSwgcSk7
DQo+ICsJCWlmIChyZXR2YWwpDQo+ICsJCQlnb3RvIGRlYWxsb2NhdGVfdm1pZDsNCj4gKwkJcHJf
ZGVidWcoIkxvYWRpbmcgbXFkIHRvIGhxZCBvbiBwaXBlICVkLCBxdWV1ZSAlZFxuIiwNCj4gKwkJ
CXEtPnBpcGUsIHEtPnF1ZXVlKTsNCj4gKwl9IGVsc2UgaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9
PSBLRkRfUVVFVUVfVFlQRV9TRE1BIHx8DQo+ICsJCXEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRf
UVVFVUVfVFlQRV9TRE1BX1hHTUkpIHsNCj4gKwkJcmV0dmFsID0gYWxsb2NhdGVfc2RtYV9xdWV1
ZShkcW0sIHEpOw0KPiArCQlpZiAocmV0dmFsKQ0KPiArCQkJZ290byBkZWFsbG9jYXRlX3ZtaWQ7
DQo+ICsJCWRxbS0+YXNpY19vcHMuaW5pdF9zZG1hX3ZtKGRxbSwgcSwgcXBkKTsNCj4gKwl9DQo+
ICAgDQo+IC0JaWYgKHJldHZhbCkgew0KPiAtCQlpZiAobGlzdF9lbXB0eSgmcXBkLT5xdWV1ZXNf
bGlzdCkpDQo+IC0JCQlkZWFsbG9jYXRlX3ZtaWQoZHFtLCBxcGQsIHEpOw0KPiAtCQlnb3RvIG91
dF91bmxvY2s7DQo+ICsJcmV0dmFsID0gYWxsb2NhdGVfZG9vcmJlbGwocXBkLCBxKTsNCj4gKwlp
ZiAocmV0dmFsKQ0KPiArCQlnb3RvIG91dF9kZWFsbG9jYXRlX2hxZDsNCj4gKw0KPiArCXJldHZh
bCA9IG1xZF9tZ3ItPmluaXRfbXFkKG1xZF9tZ3IsICZxLT5tcWQsICZxLT5tcWRfbWVtX29iaiwN
Cj4gKwkJCQkmcS0+Z2FydF9tcWRfYWRkciwgJnEtPnByb3BlcnRpZXMpOw0KPiArCWlmIChyZXR2
YWwpDQo+ICsJCWdvdG8gb3V0X2RlYWxsb2NhdGVfZG9vcmJlbGw7DQo+ICsNCj4gKwlpZiAocS0+
cHJvcGVydGllcy5pc19hY3RpdmUpIHsNCj4gKw0KPiArCQlpZiAoV0FSTihxLT5wcm9jZXNzLT5t
bSAhPSBjdXJyZW50LT5tbSwNCj4gKwkJCQkJInNob3VsZCBvbmx5IHJ1biBpbiB1c2VyIHRocmVh
ZCIpKQ0KPiArCQkJcmV0dmFsID0gLUVGQVVMVDsNCj4gKwkJZWxzZQ0KPiArCQkJcmV0dmFsID0g
bXFkX21nci0+bG9hZF9tcWQobXFkX21nciwgcS0+bXFkLCBxLT5waXBlLA0KPiArCQkJCQlxLT5x
dWV1ZSwgJnEtPnByb3BlcnRpZXMsIGN1cnJlbnQtPm1tKTsNCj4gKwkJaWYgKHJldHZhbCkNCj4g
KwkJCWdvdG8gb3V0X3VuaW5pdF9tcWQ7DQo+ICAgCX0NCj4gICANCj4gICAJbGlzdF9hZGQoJnEt
Pmxpc3QsICZxcGQtPnF1ZXVlc19saXN0KTsNCj4gQEAgLTMyOSw3ICszNTMsMjEgQEAgc3RhdGlj
IGludCBjcmVhdGVfcXVldWVfbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRx
bSwNCj4gICAJZHFtLT50b3RhbF9xdWV1ZV9jb3VudCsrOw0KPiAgIAlwcl9kZWJ1ZygiVG90YWwg
b2YgJWQgcXVldWVzIGFyZSBhY2NvdW50YWJsZSBzbyBmYXJcbiIsDQo+ICAgCQkJZHFtLT50b3Rh
bF9xdWV1ZV9jb3VudCk7DQo+ICsJZ290byBvdXRfdW5sb2NrOw0KPiAgIA0KPiArb3V0X3VuaW5p
dF9tcWQ6DQo+ICsJbXFkX21nci0+dW5pbml0X21xZChtcWRfbWdyLCBxLT5tcWQsIHEtPm1xZF9t
ZW1fb2JqKTsNCj4gK291dF9kZWFsbG9jYXRlX2Rvb3JiZWxsOg0KPiArCWRlYWxsb2NhdGVfZG9v
cmJlbGwocXBkLCBxKTsNCj4gK291dF9kZWFsbG9jYXRlX2hxZDoNCj4gKwlpZiAocS0+cHJvcGVy
dGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX0NPTVBVVEUpDQo+ICsJCWRlYWxsb2NhdGVfaHFk
KGRxbSwgcSk7DQo+ICsJZWxzZSBpZiAocS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9U
WVBFX1NETUEgfHwNCj4gKwkJcS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NE
TUFfWEdNSSkNCj4gKwkJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKGRxbSwgcSk7DQo+ICtkZWFsbG9j
YXRlX3ZtaWQ6DQo+ICsJaWYgKGxpc3RfZW1wdHkoJnFwZC0+cXVldWVzX2xpc3QpKQ0KPiArCQlk
ZWFsbG9jYXRlX3ZtaWQoZHFtLCBxcGQsIHEpOw0KPiAgIG91dF91bmxvY2s6DQo+ICAgCWRxbV91
bmxvY2soZHFtKTsNCj4gICAJcmV0dXJuIHJldHZhbDsNCj4gQEAgLTM3NSw1OCArNDEzLDYgQEAg
c3RhdGljIGlubGluZSB2b2lkIGRlYWxsb2NhdGVfaHFkKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFu
YWdlciAqZHFtLA0KPiAgIAlkcW0tPmFsbG9jYXRlZF9xdWV1ZXNbcS0+cGlwZV0gfD0gKDEgPDwg
cS0+cXVldWUpOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbnQgY3JlYXRlX2NvbXB1dGVfcXVl
dWVfbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gLQkJCQkJc3Ry
dWN0IHF1ZXVlICpxLA0KPiAtCQkJCQlzdHJ1Y3QgcWNtX3Byb2Nlc3NfZGV2aWNlICpxcGQpDQo+
IC17DQo+IC0Jc3RydWN0IG1xZF9tYW5hZ2VyICptcWRfbWdyOw0KPiAtCWludCByZXR2YWw7DQo+
IC0NCj4gLQltcWRfbWdyID0gZHFtLT5tcWRfbWdyc1tLRkRfTVFEX1RZUEVfQ09NUFVURV07DQo+
IC0NCj4gLQlyZXR2YWwgPSBhbGxvY2F0ZV9ocWQoZHFtLCBxKTsNCj4gLQlpZiAocmV0dmFsKQ0K
PiAtCQlyZXR1cm4gcmV0dmFsOw0KPiAtDQo+IC0JcmV0dmFsID0gYWxsb2NhdGVfZG9vcmJlbGwo
cXBkLCBxKTsNCj4gLQlpZiAocmV0dmFsKQ0KPiAtCQlnb3RvIG91dF9kZWFsbG9jYXRlX2hxZDsN
Cj4gLQ0KPiAtCXJldHZhbCA9IG1xZF9tZ3ItPmluaXRfbXFkKG1xZF9tZ3IsICZxLT5tcWQsICZx
LT5tcWRfbWVtX29iaiwNCj4gLQkJCQkmcS0+Z2FydF9tcWRfYWRkciwgJnEtPnByb3BlcnRpZXMp
Ow0KPiAtCWlmIChyZXR2YWwpDQo+IC0JCWdvdG8gb3V0X2RlYWxsb2NhdGVfZG9vcmJlbGw7DQo+
IC0NCj4gLQlwcl9kZWJ1ZygiTG9hZGluZyBtcWQgdG8gaHFkIG9uIHBpcGUgJWQsIHF1ZXVlICVk
XG4iLA0KPiAtCQkJcS0+cGlwZSwgcS0+cXVldWUpOw0KPiAtDQo+IC0JZHFtLT5kZXYtPmtmZDJr
Z2QtPnNldF9zY3JhdGNoX2JhY2tpbmdfdmEoDQo+IC0JCQlkcW0tPmRldi0+a2dkLCBxcGQtPnNo
X2hpZGRlbl9wcml2YXRlX2Jhc2UsIHFwZC0+dm1pZCk7DQo+IC0NCj4gLQlpZiAoIXEtPnByb3Bl
cnRpZXMuaXNfYWN0aXZlKQ0KPiAtCQlyZXR1cm4gMDsNCj4gLQ0KPiAtCWlmIChXQVJOKHEtPnBy
b2Nlc3MtPm1tICE9IGN1cnJlbnQtPm1tLA0KPiAtCQkgInNob3VsZCBvbmx5IHJ1biBpbiB1c2Vy
IHRocmVhZCIpKQ0KPiAtCQlyZXR2YWwgPSAtRUZBVUxUOw0KPiAtCWVsc2UNCj4gLQkJcmV0dmFs
ID0gbXFkX21nci0+bG9hZF9tcWQobXFkX21nciwgcS0+bXFkLCBxLT5waXBlLCBxLT5xdWV1ZSwN
Cj4gLQkJCQkJICAgJnEtPnByb3BlcnRpZXMsIGN1cnJlbnQtPm1tKTsNCj4gLQlpZiAocmV0dmFs
KQ0KPiAtCQlnb3RvIG91dF91bmluaXRfbXFkOw0KPiAtDQo+IC0JcmV0dXJuIDA7DQo+IC0NCj4g
LW91dF91bmluaXRfbXFkOg0KPiAtCW1xZF9tZ3ItPnVuaW5pdF9tcWQobXFkX21nciwgcS0+bXFk
LCBxLT5tcWRfbWVtX29iaik7DQo+IC1vdXRfZGVhbGxvY2F0ZV9kb29yYmVsbDoNCj4gLQlkZWFs
bG9jYXRlX2Rvb3JiZWxsKHFwZCwgcSk7DQo+IC1vdXRfZGVhbGxvY2F0ZV9ocWQ6DQo+IC0JZGVh
bGxvY2F0ZV9ocWQoZHFtLCBxKTsNCj4gLQ0KPiAtCXJldHVybiByZXR2YWw7DQo+IC19DQo+IC0N
Cj4gICAvKiBBY2Nlc3MgdG8gRFFNIGhhcyB0byBiZSBsb2NrZWQgYmVmb3JlIGNhbGxpbmcgZGVz
dHJveV9xdWV1ZV9ub2Nwc2NoX2xvY2tlZA0KPiAgICAqIHRvIGF2b2lkIGFzeW5jaHJvbml6ZWQg
YWNjZXNzDQo+ICAgICovDQo+IEBAIC05NzIsNDkgKzk1OCw2IEBAIHN0YXRpYyB2b2lkIGRlYWxs
b2NhdGVfc2RtYV9xdWV1ZShzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gICAJ
fQ0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbnQgY3JlYXRlX3NkbWFfcXVldWVfbm9jcHNjaChz
dHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gLQkJCQkJc3RydWN0IHF1ZXVlICpx
LA0KPiAtCQkJCQlzdHJ1Y3QgcWNtX3Byb2Nlc3NfZGV2aWNlICpxcGQpDQo+IC17DQo+IC0Jc3Ry
dWN0IG1xZF9tYW5hZ2VyICptcWRfbWdyOw0KPiAtCWludCByZXR2YWw7DQo+IC0NCj4gLQltcWRf
bWdyID0gZHFtLT5tcWRfbWdyc1tLRkRfTVFEX1RZUEVfU0RNQV07DQo+IC0NCj4gLQlyZXR2YWwg
PSBhbGxvY2F0ZV9zZG1hX3F1ZXVlKGRxbSwgcSk7DQo+IC0JaWYgKHJldHZhbCkNCj4gLQkJcmV0
dXJuIHJldHZhbDsNCj4gLQ0KPiAtCXJldHZhbCA9IGFsbG9jYXRlX2Rvb3JiZWxsKHFwZCwgcSk7
DQo+IC0JaWYgKHJldHZhbCkNCj4gLQkJZ290byBvdXRfZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlOw0K
PiAtDQo+IC0JZHFtLT5hc2ljX29wcy5pbml0X3NkbWFfdm0oZHFtLCBxLCBxcGQpOw0KPiAtCXJl
dHZhbCA9IG1xZF9tZ3ItPmluaXRfbXFkKG1xZF9tZ3IsICZxLT5tcWQsICZxLT5tcWRfbWVtX29i
aiwNCj4gLQkJCQkmcS0+Z2FydF9tcWRfYWRkciwgJnEtPnByb3BlcnRpZXMpOw0KPiAtCWlmIChy
ZXR2YWwpDQo+IC0JCWdvdG8gb3V0X2RlYWxsb2NhdGVfZG9vcmJlbGw7DQo+IC0NCj4gLQlpZiAo
IXEtPnByb3BlcnRpZXMuaXNfYWN0aXZlKQ0KPiAtCQlyZXR1cm4gMDsNCj4gLQ0KPiAtCXJldHZh
bCA9IG1xZF9tZ3ItPmxvYWRfbXFkKG1xZF9tZ3IsIHEtPm1xZCwgMCwgMCwgJnEtPnByb3BlcnRp
ZXMsDQo+IC0JCQkJY3VycmVudC0+bW0pOw0KPiAtCWlmIChyZXR2YWwpDQo+IC0JCWdvdG8gb3V0
X3VuaW5pdF9tcWQ7DQo+IC0NCj4gLQlyZXR1cm4gMDsNCj4gLQ0KPiAtb3V0X3VuaW5pdF9tcWQ6
DQo+IC0JbXFkX21nci0+dW5pbml0X21xZChtcWRfbWdyLCBxLT5tcWQsIHEtPm1xZF9tZW1fb2Jq
KTsNCj4gLW91dF9kZWFsbG9jYXRlX2Rvb3JiZWxsOg0KPiAtCWRlYWxsb2NhdGVfZG9vcmJlbGwo
cXBkLCBxKTsNCj4gLW91dF9kZWFsbG9jYXRlX3NkbWFfcXVldWU6DQo+IC0JZGVhbGxvY2F0ZV9z
ZG1hX3F1ZXVlKGRxbSwgcSk7DQo+IC0NCj4gLQlyZXR1cm4gcmV0dmFsOw0KPiAtfQ0KPiAtDQo+
ICAgLyoNCj4gICAgKiBEZXZpY2UgUXVldWUgTWFuYWdlciBpbXBsZW1lbnRhdGlvbiBmb3IgY3Ag
c2NoZWR1bGVyDQo+ICAgICovDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
