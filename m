Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E7C3676A
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 00:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18518952F;
	Wed,  5 Jun 2019 22:24:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790041.outbound.protection.outlook.com [40.107.79.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762848952F
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 22:24:44 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2873.namprd12.prod.outlook.com (20.179.71.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Wed, 5 Jun 2019 22:24:43 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 22:24:43 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/amdkfd: Fix sdma queue allocate race condition
Thread-Topic: [PATCH 6/6] drm/amdkfd: Fix sdma queue allocate race condition
Thread-Index: AQHVG7iwhwvDMS2qckOdfEjVIowDj6aNo36A
Date: Wed, 5 Jun 2019 22:24:42 +0000
Message-ID: <a77d6d10-23b5-5a0d-734f-ba6918cb6b37@amd.com>
References: <1559750793-16608-1-git-send-email-Oak.Zeng@amd.com>
 <1559750793-16608-6-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559750793-16608-6-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0eda4b19-5c4f-409c-bf88-08d6ea049b52
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2873; 
x-ms-traffictypediagnostic: DM6PR12MB2873:
x-microsoft-antispam-prvs: <DM6PR12MB28739D27583BFC50A1E1BFAE92160@DM6PR12MB2873.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39850400004)(346002)(396003)(136003)(376002)(366004)(189003)(199004)(68736007)(99286004)(72206003)(65806001)(76176011)(54906003)(36756003)(305945005)(14454004)(229853002)(7736002)(6486002)(478600001)(66066001)(2501003)(52116002)(6512007)(14444005)(65956001)(256004)(25786009)(31696002)(86362001)(110136005)(5660300002)(2906002)(58126008)(66446008)(446003)(8676002)(64756008)(66476007)(66946007)(102836004)(186003)(66556008)(11346002)(81156014)(8936002)(316002)(6246003)(73956011)(65826007)(81166006)(3846002)(6116002)(2616005)(31686004)(6436002)(64126003)(71190400001)(53936002)(476003)(26005)(53546011)(71200400001)(6506007)(486006)(4326008)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2873;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R3jloDXIeDNAp8qziBT7T2IaprTPjPgpQr8M/5xkGCbyflA/mPVfMKipii4ubsGSij2lpfFlmUzMio+lIMOEI7U/SigOrsew9Ct/NLDNCxvE+W59pZcW2AK4H1qBcqlQMcWsIaPn5VcR03Kw0b1A1O+pGqsVQANhnPlEQCtPuinpkmh9PhnajXOfS+J8E34vHBBzzSHnPcd4h2GhovnmKuGOKoY2lWLs50cqXTZfj+SlAwXagQsDo6SRL1NH5aGoHq67WhhW6T+iaYnb3+89J2jKMLsWgboTUFq6gInDIV+jhwMUVtjOsUutq/F1mL+EI3wRVKHhTwNTZtV9U0RaXMWSA5J25uZtdpfOboU5qHPre5HsbB7PtNlQlA+dO2WxU9hIwUOXuS28PuRVjVBTOofOX040TzOssnGAeDMEuPY=
Content-ID: <DC70148FA8B57A4EBF278E842CA73C25@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eda4b19-5c4f-409c-bf88-08d6ea049b52
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 22:24:42.9052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2873
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypBh0hEm2zJW64KN4sWIsGCkxQId7C2xbXv5vhzPx3E=;
 b=Zk1KnMsrTOpDMeTCAeNp/dQOHUPYQ2obn+XjIDNuNVHlkr56bPtdN9quio+KgWzh+gX5z137y1IIUZxfHqPJUxvqVxF0cvl8YX2sH935NAsM79eakrhnyAzzDI2RUYYDeZ+hhDAPtMLRLsJ81LN+fRYZkgVXoH22tCOcE1fN1hc=
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

SSB0aGluayB0aGUgc2ltcGxlciB3YXkgdG8gZml4IHRoaXMsIGlzIHRvIHJlc3RydWN0dXJlIA0K
Y3JlYXRlX3F1ZXVlX2Nwc2NoIHNpbWlsYXIgdG8gdGhlIG5vY3BzY2ggdmVyc2lvbiB3aGVyZSB3
ZSBhbGxvY2F0ZSB0aGUgDQpNUUQgZWFybHkgYW5kIHRha2UgdGhlIERRTSBsb2NrIHJpZ2h0IGFm
dGVyIHRoYXQuIFRoYXQgd2F5IHlvdSBkb24ndCANCm5lZWQgbG9ja2VkIGFuZCB1bmxvY2tlZCB2
YXJpYW50cyBvZiBhbGxvY2F0ZV9zZG1hX3F1ZXVlIGFuZCANCmRlYWxsb2NhdGVfc2RtYV9xdWV1
ZS4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCk9uIDIwMTktMDYtMDUgMTI6MDYgcC5tLiwg
WmVuZywgT2FrIHdyb3RlOg0KPiBTRE1BIHF1ZXVlIGFsbG9jYXRpb24gcmVxdWlyZXMgdGhlIGRx
bSBsb2NrIGFzIGl0IG1vZGlmeQ0KPiB0aGUgZ2xvYmFsIGRxbSBtZW1iZXJzLiBJbnRyb2R1Y2Ug
ZnVuY3Rpb25zIHRvIGFsbG9jYXRlL2RlYWxsb2NhdGUNCj4gaW4gbG9ja2VkL3VubG9ja2VkIGNp
cmN1bXN0YW5jZS4NCj4NCj4gQ2hhbmdlLUlkOiBJZDMwODQ1MjRjNWY2NWQ5NjI5YjEyY2Y2YjQ4
NjJhNzUxNjk0NWNiMQ0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNv
bT4NCj4gLS0tDQo+ICAgLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21h
bmFnZXIuYyAgfCAzNCArKysrKysrKysrKysrKysrLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+IGluZGV4
IDZiMWEyZWUuLjUyZTRlZGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+IEBAIC01Myw2ICs1Myw4IEBA
IHN0YXRpYyBpbnQgbWFwX3F1ZXVlc19jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIg
KmRxbSk7DQo+ICAgDQo+ICAgc3RhdGljIHZvaWQgZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKHN0cnVj
dCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KPiAgIAkJCQlzdHJ1Y3QgcXVldWUgKnEpOw0K
PiArc3RhdGljIHZvaWQgZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlX2xvY2tlZChzdHJ1Y3QgZGV2aWNl
X3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gKwkJCQlzdHJ1Y3QgcXVldWUgKnEpOw0KPiAgIA0KPiAg
IHN0YXRpYyBpbmxpbmUgdm9pZCBkZWFsbG9jYXRlX2hxZChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21h
bmFnZXIgKmRxbSwNCj4gICAJCQkJc3RydWN0IHF1ZXVlICpxKTsNCj4gQEAgLTQzNCwxMCArNDM2
LDEwIEBAIHN0YXRpYyBpbnQgZGVzdHJveV9xdWV1ZV9ub2Nwc2NoX2xvY2tlZChzdHJ1Y3QgZGV2
aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gICAJCWRlYWxsb2NhdGVfaHFkKGRxbSwgcSk7DQo+
ICAgCX0gZWxzZSBpZiAocS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUEp
IHsNCj4gICAJCWRxbS0+c2RtYV9xdWV1ZV9jb3VudC0tOw0KPiAtCQlkZWFsbG9jYXRlX3NkbWFf
cXVldWUoZHFtLCBxKTsNCj4gKwkJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlX2xvY2tlZChkcW0sIHEp
Ow0KPiAgIAl9IGVsc2UgaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVfVFlQRV9T
RE1BX1hHTUkpIHsNCj4gICAJCWRxbS0+eGdtaV9zZG1hX3F1ZXVlX2NvdW50LS07DQo+IC0JCWRl
YWxsb2NhdGVfc2RtYV9xdWV1ZShkcW0sIHEpOw0KPiArCQlkZWFsbG9jYXRlX3NkbWFfcXVldWVf
bG9ja2VkKGRxbSwgcSk7DQo+ICAgCX0gZWxzZSB7DQo+ICAgCQlwcl9kZWJ1ZygicS0+cHJvcGVy
dGllcy50eXBlICVkIGlzIGludmFsaWRcbiIsDQo+ICAgCQkJCXEtPnByb3BlcnRpZXMudHlwZSk7
DQo+IEBAIC05MTQsOSArOTE2LDEyIEBAIHN0YXRpYyBpbnQgYWxsb2NhdGVfc2RtYV9xdWV1ZShz
dHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gICB7DQo+ICAgCWludCBiaXQ7DQo+
ICAgDQo+ICsJZHFtX2xvY2soZHFtKTsNCj4gICAJaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBL
RkRfUVVFVUVfVFlQRV9TRE1BKSB7DQo+IC0JCWlmIChkcW0tPnNkbWFfYml0bWFwID09IDApDQo+
ICsJCWlmIChkcW0tPnNkbWFfYml0bWFwID09IDApIHsNCj4gKwkJCWRxbV91bmxvY2soZHFtKTsN
Cj4gICAJCQlyZXR1cm4gLUVOT01FTTsNCj4gKwkJfQ0KPiAgIAkJYml0ID0gX19mZnM2NChkcW0t
PnNkbWFfYml0bWFwKTsNCj4gICAJCWRxbS0+c2RtYV9iaXRtYXAgJj0gfigxVUxMIDw8IGJpdCk7
DQo+ICAgCQlxLT5zZG1hX2lkID0gYml0Ow0KPiBAQCAtOTI1LDggKzkzMCwxMCBAQCBzdGF0aWMg
aW50IGFsbG9jYXRlX3NkbWFfcXVldWUoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0s
DQo+ICAgCQlxLT5wcm9wZXJ0aWVzLnNkbWFfcXVldWVfaWQgPSBxLT5zZG1hX2lkIC8NCj4gICAJ
CQkJZ2V0X251bV9zZG1hX2VuZ2luZXMoZHFtKTsNCj4gICAJfSBlbHNlIGlmIChxLT5wcm9wZXJ0
aWVzLnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQV9YR01JKSB7DQo+IC0JCWlmIChkcW0tPnhn
bWlfc2RtYV9iaXRtYXAgPT0gMCkNCj4gKwkJaWYgKGRxbS0+eGdtaV9zZG1hX2JpdG1hcCA9PSAw
KSB7DQo+ICsJCQlkcW1fdW5sb2NrKGRxbSk7DQo+ICAgCQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJ
CX0NCj4gICAJCWJpdCA9IF9fZmZzNjQoZHFtLT54Z21pX3NkbWFfYml0bWFwKTsNCj4gICAJCWRx
bS0+eGdtaV9zZG1hX2JpdG1hcCAmPSB+KDFVTEwgPDwgYml0KTsNCj4gICAJCXEtPnNkbWFfaWQg
PSBiaXQ7DQo+IEBAIC05NDIsMTMgKzk0OSwxNCBAQCBzdGF0aWMgaW50IGFsbG9jYXRlX3NkbWFf
cXVldWUoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+ICAgCQkJCWdldF9udW1f
eGdtaV9zZG1hX2VuZ2luZXMoZHFtKTsNCj4gICAJfQ0KPiAgIA0KPiArCWRxbV91bmxvY2soZHFt
KTsNCj4gICAJcHJfZGVidWcoIlNETUEgZW5naW5lIGlkOiAlZFxuIiwgcS0+cHJvcGVydGllcy5z
ZG1hX2VuZ2luZV9pZCk7DQo+ICAgCXByX2RlYnVnKCJTRE1BIHF1ZXVlIGlkOiAlZFxuIiwgcS0+
cHJvcGVydGllcy5zZG1hX3F1ZXVlX2lkKTsNCj4gICANCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0K
PiAgIA0KPiAtc3RhdGljIHZvaWQgZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKHN0cnVjdCBkZXZpY2Vf
cXVldWVfbWFuYWdlciAqZHFtLA0KPiArc3RhdGljIHZvaWQgZGVhbGxvY2F0ZV9zZG1hX3F1ZXVl
X2xvY2tlZChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gICAJCQkJc3RydWN0
IHF1ZXVlICpxKQ0KPiAgIHsNCj4gICAJaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVF
VUVfVFlQRV9TRE1BKSB7DQo+IEBAIC05NjIsNiArOTcwLDE0IEBAIHN0YXRpYyB2b2lkIGRlYWxs
b2NhdGVfc2RtYV9xdWV1ZShzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gICAJ
fQ0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyB2b2lkIGRlYWxsb2NhdGVfc2RtYV9xdWV1ZShzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gKwkJCQlzdHJ1Y3QgcXVldWUgKnEpDQo+
ICt7DQo+ICsJZHFtX2xvY2soZHFtKTsNCj4gKwlkZWFsbG9jYXRlX3NkbWFfcXVldWVfbG9ja2Vk
KGRxbSwgcSk7DQo+ICsJZHFtX3VubG9jayhkcW0pOw0KPiArfQ0KPiArDQo+ICAgLyoNCj4gICAg
KiBEZXZpY2UgUXVldWUgTWFuYWdlciBpbXBsZW1lbnRhdGlvbiBmb3IgY3Agc2NoZWR1bGVyDQo+
ICAgICovDQo+IEBAIC0xMzU2LDEwICsxMzcyLDEwIEBAIHN0YXRpYyBpbnQgZGVzdHJveV9xdWV1
ZV9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCj4gICANCj4gICAJaWYg
KHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVfVFlQRV9TRE1BKSB7DQo+ICAgCQlkcW0t
PnNkbWFfcXVldWVfY291bnQtLTsNCj4gLQkJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKGRxbSwgcSk7
DQo+ICsJCWRlYWxsb2NhdGVfc2RtYV9xdWV1ZV9sb2NrZWQoZHFtLCBxKTsNCj4gICAJfSBlbHNl
IGlmIChxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQV9YR01JKSB7DQo+
ICAgCQlkcW0tPnhnbWlfc2RtYV9xdWV1ZV9jb3VudC0tOw0KPiAtCQlkZWFsbG9jYXRlX3NkbWFf
cXVldWUoZHFtLCBxKTsNCj4gKwkJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlX2xvY2tlZChkcW0sIHEp
Ow0KPiAgIAl9DQo+ICAgDQo+ICAgCWxpc3RfZGVsKCZxLT5saXN0KTsNCj4gQEAgLTE1ODUsMTAg
KzE2MDEsMTAgQEAgc3RhdGljIGludCBwcm9jZXNzX3Rlcm1pbmF0aW9uX2Nwc2NoKHN0cnVjdCBk
ZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KPiAgIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KHEsICZx
cGQtPnF1ZXVlc19saXN0LCBsaXN0KSB7DQo+ICAgCQlpZiAocS0+cHJvcGVydGllcy50eXBlID09
IEtGRF9RVUVVRV9UWVBFX1NETUEpIHsNCj4gICAJCQlkcW0tPnNkbWFfcXVldWVfY291bnQtLTsN
Cj4gLQkJCWRlYWxsb2NhdGVfc2RtYV9xdWV1ZShkcW0sIHEpOw0KPiArCQkJZGVhbGxvY2F0ZV9z
ZG1hX3F1ZXVlX2xvY2tlZChkcW0sIHEpOw0KPiAgIAkJfSBlbHNlIGlmIChxLT5wcm9wZXJ0aWVz
LnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQV9YR01JKSB7DQo+ICAgCQkJZHFtLT54Z21pX3Nk
bWFfcXVldWVfY291bnQtLTsNCj4gLQkJCWRlYWxsb2NhdGVfc2RtYV9xdWV1ZShkcW0sIHEpOw0K
PiArCQkJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlX2xvY2tlZChkcW0sIHEpOw0KPiAgIAkJfQ0KPiAg
IA0KPiAgIAkJaWYgKHEtPnByb3BlcnRpZXMuaXNfYWN0aXZlKQ0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
