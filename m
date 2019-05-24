Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027A129F53
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 21:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B046E0A2;
	Fri, 24 May 2019 19:47:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2016E0A2
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 19:47:30 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3323.namprd12.prod.outlook.com (20.178.31.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Fri, 24 May 2019 19:47:27 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Fri, 24 May 2019
 19:47:27 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 5/8] drm/amdkfd: Add function to set queue gws
Thread-Topic: [PATCH 5/8] drm/amdkfd: Add function to set queue gws
Thread-Index: AQHVEbildK0c5t4MI0qIpTfpjiDYF6Z6r5OA
Date: Fri, 24 May 2019 19:47:27 +0000
Message-ID: <19ff1e8d-1a56-b89f-4a9b-30a17ef10655@amd.com>
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
 <1558651263-3478-5-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558651263-3478-5-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YT1PR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::23)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1031626-b3da-4f00-e23c-08d6e080a645
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3323; 
x-ms-traffictypediagnostic: DM6PR12MB3323:
x-microsoft-antispam-prvs: <DM6PR12MB3323770AE4D6AC0D19A4CA1D92020@DM6PR12MB3323.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(346002)(39860400002)(136003)(199004)(189003)(486006)(11346002)(4326008)(476003)(76176011)(102836004)(386003)(6506007)(2616005)(31696002)(3846002)(6116002)(25786009)(53546011)(6512007)(53936002)(64126003)(65826007)(6436002)(229853002)(6246003)(5660300002)(6486002)(99286004)(446003)(2906002)(58126008)(110136005)(54906003)(52116002)(8676002)(68736007)(81156014)(81166006)(86362001)(8936002)(305945005)(14454004)(26005)(2501003)(72206003)(73956011)(65956001)(65806001)(71190400001)(14444005)(66066001)(186003)(31686004)(36756003)(64756008)(66556008)(66476007)(478600001)(66446008)(7736002)(66946007)(316002)(71200400001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3323;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LRKp2Po61c3EwhkYsHBYnkz9Frh62SjK+pnEazZB9IObqZd4iBqweXwyS2LRqgaHj4RFHNh26tAxn1o/xIzNG09PdwzfDqyvwlukwUV75JZZnrl0iZLFdINUTSWIesjcLLA1RNf5wlX54NiQCq3UbeH1iMTM9RLPm0Utzkcirg8Zh9CwDtX59tMBGPl+cjjbhMh57Ha6V74fn9uDI7GL5o6xcNwoveaGsinnlML5g8dtZYp4htRyLO6P3q8wGiLPcHVwOG0Ils0wxk/fvJ+Yyrk/EVv86FR6/CM/FDmKwevS9+QlFpSuJOVVFTrTfWFj+WYECZHSP1PxU9ThpTiuvcCaWeXsVH7+5NraeVuqnIoUk5ykkSiojAyacA2fOwvrpMqSyBH2edxreMCc/lKyAB/ecehbGwM5jKwBHaS3aZo=
Content-ID: <24ADA04804BFCA4B97DF277B8B86519B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1031626-b3da-4f00-e23c-08d6e080a645
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 19:47:27.2249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3323
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxRtZ0anDt8+zC9X8zdneA1Xx+kwllTiehJbZO9CJxE=;
 b=DyPF8OadlDVfHQ6NknsJ9MwLfAkI2cCfYfp1cWrQZ+2+XFGECG9G0mJ35Bvb3fQu0F5P3Iua2fTveVsBc6OvB7Y1c6XvvgYTkMEAjrbjc1TuwFM7N1SLt/iypjg0mKaarP8ZFd0f7SM466lysh+Of8eE3wncXGvPD1r3oQ10jbw=
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
Cc: "Keely, Sean" <Sean.Keely@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0yMyA2OjQxIHAubS4sIFplbmcsIE9hayB3cm90ZToNCj4gQWRkIGZ1bmN0aW9u
cyBpbiBwcm9jZXNzIHF1ZXVlIG1hbmFnZXIgdG8NCj4gc2V0L3Vuc2V0IHF1ZXVlIGd3cy4gQWxz
byBzZXQgcHJvY2VzcydzIG51bWJlcg0KPiBvZiBnd3MgdXNlZC4gQ3VycmVudGx5IG9ubHkgb25l
IHF1ZXVlIGluDQo+IHByb2Nlc3MgY2FuIHVzZSBhbmQgdXNlIGFsbCBnd3MuDQo+DQo+IENoYW5n
ZS1JZDogSTAzZTQ4MGM4NjkyZGIzZWFiZmMzYTE4OGNjZTg5MDRkNWQ5NjJhYjcNCj4gU2lnbmVk
LW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAgICAgICAgIHwgIDYgKysrDQo+ICAg
Li4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMgfCA1NyAr
KysrKysrKysrKysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25z
KCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJp
di5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KPiBpbmRleCA1OTY5
ZTM3Li40MGE1YzY3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfcHJpdi5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgN
Cj4gQEAgLTQ1NCw2ICs0NTQsOSBAQCBzdHJ1Y3QgcXVldWVfcHJvcGVydGllcyB7DQo+ICAgICoN
Cj4gICAgKiBAZGV2aWNlOiBUaGUga2ZkIGRldmljZSB0aGF0IGNyZWF0ZWQgdGhpcyBxdWV1ZS4N
Cj4gICAgKg0KPiArICogQGd3czogUG9pbnRpbmcgdG8gZ3dzIGtnZF9tZW0gaWYgdGhpcyBpcyBh
IGd3cyBjb250cm9sIHF1ZXVlOyBOVUxMDQo+ICsgKiBvdGhlcndpc2UuDQo+ICsgKg0KPiAgICAq
IFRoaXMgc3RydWN0dXJlIHJlcHJlc2VudHMgdXNlciBtb2RlIGNvbXB1dGUgcXVldWVzLg0KPiAg
ICAqIEl0IGNvbnRhaW5zIGFsbCB0aGUgbmVjZXNzYXJ5IGRhdGEgdG8gaGFuZGxlIHN1Y2ggcXVl
dWVzLg0KPiAgICAqDQo+IEBAIC00NzUsNiArNDc4LDcgQEAgc3RydWN0IHF1ZXVlIHsNCj4gICAN
Cj4gICAJc3RydWN0IGtmZF9wcm9jZXNzCSpwcm9jZXNzOw0KPiAgIAlzdHJ1Y3Qga2ZkX2RldgkJ
KmRldmljZTsNCj4gKwl2b2lkICpnd3M7DQo+ICAgfTsNCj4gICANCj4gICAvKg0KPiBAQCAtODY4
LDYgKzg3Miw4IEBAIGludCBwcW1fdXBkYXRlX3F1ZXVlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21h
bmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCwNCj4gICAJCQlzdHJ1Y3QgcXVldWVfcHJvcGVy
dGllcyAqcCk7DQo+ICAgaW50IHBxbV9zZXRfY3VfbWFzayhzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9t
YW5hZ2VyICpwcW0sIHVuc2lnbmVkIGludCBxaWQsDQo+ICAgCQkJc3RydWN0IHF1ZXVlX3Byb3Bl
cnRpZXMgKnApOw0KPiAraW50IHBxbV9zZXRfZ3dzKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFn
ZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCwNCj4gKwkJCXZvaWQgKmd3cyk7DQo+ICAgc3RydWN0
IGtlcm5lbF9xdWV1ZSAqcHFtX2dldF9rZXJuZWxfcXVldWUoc3RydWN0IHByb2Nlc3NfcXVldWVf
bWFuYWdlciAqcHFtLA0KPiAgIAkJCQkJCXVuc2lnbmVkIGludCBxaWQpOw0KPiAgIGludCBwcW1f
Z2V0X3dhdmVfc3RhdGUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFu
YWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFu
YWdlci5jDQo+IGluZGV4IGU2NTJlMjUuLjU3NjQ0OTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMNCj4g
QEAgLTI2LDYgKzI2LDcgQEANCj4gICAjaW5jbHVkZSAia2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2Vy
LmgiDQo+ICAgI2luY2x1ZGUgImtmZF9wcml2LmgiDQo+ICAgI2luY2x1ZGUgImtmZF9rZXJuZWxf
cXVldWUuaCINCj4gKyNpbmNsdWRlICJhbWRncHVfYW1ka2ZkLmgiDQo+ICAgDQo+ICAgc3RhdGlj
IGlubGluZSBzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9ub2RlICpnZXRfcXVldWVfYnlfcWlkKA0KPiAg
IAkJCXN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCkN
Cj4gQEAgLTc0LDYgKzc1LDU1IEBAIHZvaWQga2ZkX3Byb2Nlc3NfZGVxdWV1ZV9mcm9tX2Rldmlj
ZShzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICpwZGQpDQo+ICAgCXBkZC0+YWxyZWFkeV9kZXF1
ZXVlZCA9IHRydWU7DQo+ICAgfQ0KPiAgIA0KPiAraW50IHBxbV9zZXRfZ3dzKHN0cnVjdCBwcm9j
ZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCwNCj4gKwkJCXZvaWQgKmd3
cykNCj4gK3sNCj4gKwlzdHJ1Y3Qga2ZkX2RldiAqZGV2ID0gTlVMTDsNCj4gKwlzdHJ1Y3QgcHJv
Y2Vzc19xdWV1ZV9ub2RlICpwcW47DQo+ICsJc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRk
Ow0KPiArCXN0cnVjdCBrZ2RfbWVtICptZW07DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCXBxbiA9
IGdldF9xdWV1ZV9ieV9xaWQocHFtLCBxaWQpOw0KPiArCWlmICghcHFuKSB7DQo+ICsJCXByX2Vy
cigiUXVldWUgaWQgZG9lcyBub3QgbWF0Y2ggYW55IGtub3duIHF1ZXVlXG4iKTsNCj4gKwkJcmV0
dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKHBxbi0+cSkNCj4gKwkJZGV2ID0gcHFu
LT5xLT5kZXZpY2U7DQo+ICsJaWYgKFdBUk5fT04oIWRldikpDQo+ICsJCXJldHVybiAtRU5PREVW
Ow0KPiArDQo+ICsJcGRkID0ga2ZkX2dldF9wcm9jZXNzX2RldmljZV9kYXRhKGRldiwgcHFtLT5w
cm9jZXNzKTsNCj4gKwlpZiAoIXBkZCkgew0KPiArCQlwcl9lcnIoIlByb2Nlc3MgZGV2aWNlIGRh
dGEgZG9lc24ndCBleGlzdFxuIik7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKw0K
PiArCS8qIE9ubHkgYWxsb3cgb25lIHF1ZXVlIHBlciBwcm9jZXNzIGNhbiBoYXZlIEdXUyBhc3Np
Z25lZCAqLw0KPiArCWlmIChnd3MgJiYgcGRkLT5xcGQubnVtX2d3cykNCj4gKwkJcmV0dXJuIC1F
SU5WQUw7DQo+ICsNCj4gKwlpZiAoIWd3cyAmJiBwZGQtPnFwZC5udW1fZ3dzID09IDApDQo+ICsJ
CXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJaWYgKGd3cykNCj4gKwkJcmV0ID0gYW1kZ3B1X2Ft
ZGtmZF9hZGRfZ3dzX3RvX3Byb2Nlc3MocGRkLT5wcm9jZXNzLT5rZ2RfcHJvY2Vzc19pbmZvLA0K
PiArCQkJZ3dzLCAmbWVtKTsNCj4gKwllbHNlDQo+ICsJCWFtZGdwdV9hbWRrZmRfcmVtb3ZlX2d3
c19mcm9tX3Byb2Nlc3MocGRkLT5wcm9jZXNzLT5rZ2RfcHJvY2Vzc19pbmZvLA0KPiArCQkJcHFu
LT5xLT5nd3MpOw0KPiArCWlmICh1bmxpa2VseShyZXQpKQ0KDQpyZXQgbWF5IGJlIHVuaW5pdGlh
bGl6ZWQgaGVyZS4gWW91IHByb2JhYmx5IGdldCBhIGNvbXBpbGVyIHdhcm5pbmcgZm9yIA0KdGhh
dC4gUGxlYXNlIGNoZWNrIGZvciBjb21waWxlciB3YXJuaW5ncyBhbmQgaW5pdGlhbGl6ZSByZXQg
YXQgdGhlIHN0YXJ0IA0Kb2YgdGhlIGZ1bmN0aW9uLg0KDQoNCj4gKwkJcmV0dXJuIHJldDsNCj4g
Kw0KPiArCXBxbi0+cS0+Z3dzID0gZ3dzID8gbWVtIDogTlVMTDsNCg0KSSB0aGluayB0aGVyZSBp
cyBhIGNoYW5jZSB0aGF0IHNvbWUgY29tcGlsZXJzIHdpbGwgY29tcGxhaW4gaGVyZSB0aGF0IA0K
bWVtIGNhbiBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQuIEl0IG1heSBiZSBzYWZlciB0byBpbml0aWFs
aXplIG1lbSB0byBOVUxMIA0KYXQgdGhlIHN0YXJ0IG9mIHRoZSBmdW5jdGlvbiwganVzdCBpbiBj
YXNlLiBUaGVuIHlvdSBjYW4gYWxzbyBqdXN0IA0KYXNzaWduIG1lbSBoZXJlIHdpdGhvdXQgdGhl
IGNvbmRpdGlvbmFsLg0KDQpXaXRoIHRoZXNlIHR3byBpc3N1ZXMgZml4ZWQsIHRoaXMgcGF0Y2gg
aXMgUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIA0KPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
DQoNCg0KPiArCXBkZC0+cXBkLm51bV9nd3MgPSBnd3MgPyBhbWRncHVfYW1ka2ZkX2dldF9udW1f
Z3dzKGRldi0+a2dkKSA6IDA7DQo+ICsNCj4gKwlyZXR1cm4gcHFuLT5xLT5kZXZpY2UtPmRxbS0+
b3BzLnVwZGF0ZV9xdWV1ZShwcW4tPnEtPmRldmljZS0+ZHFtLA0KPiArCQkJCQkJCXBxbi0+cSk7
DQo+ICt9DQo+ICsNCj4gICB2b2lkIGtmZF9wcm9jZXNzX2RlcXVldWVfZnJvbV9hbGxfZGV2aWNl
cyhzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnApDQo+ICAgew0KPiAgIAlzdHJ1Y3Qga2ZkX3Byb2Nlc3Nf
ZGV2aWNlICpwZGQ7DQo+IEBAIC0zMzAsNiArMzgwLDEzIEBAIGludCBwcW1fZGVzdHJveV9xdWV1
ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVuc2lnbmVkIGludCBxaWQpDQo+
ICAgCQkJaWYgKHJldHZhbCAhPSAtRVRJTUUpDQo+ICAgCQkJCWdvdG8gZXJyX2Rlc3Ryb3lfcXVl
dWU7DQo+ICAgCQl9DQo+ICsNCj4gKwkJaWYgKHBxbi0+cS0+Z3dzKSB7DQo+ICsJCQlhbWRncHVf
YW1ka2ZkX3JlbW92ZV9nd3NfZnJvbV9wcm9jZXNzKHBxbS0+cHJvY2Vzcy0+a2dkX3Byb2Nlc3Nf
aW5mbywNCj4gKwkJCQlwcW4tPnEtPmd3cyk7DQo+ICsJCQlwZGQtPnFwZC5udW1fZ3dzID0gMDsN
Cj4gKwkJfQ0KPiArDQo+ICAgCQlrZnJlZShwcW4tPnEtPnByb3BlcnRpZXMuY3VfbWFzayk7DQo+
ICAgCQlwcW4tPnEtPnByb3BlcnRpZXMuY3VfbWFzayA9IE5VTEw7DQo+ICAgCQl1bmluaXRfcXVl
dWUocHFuLT5xKTsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
