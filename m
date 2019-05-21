Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E9C2587C
	for <lists+amd-gfx@lfdr.de>; Tue, 21 May 2019 21:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A97A89449;
	Tue, 21 May 2019 19:54:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810040.outbound.protection.outlook.com [40.107.81.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47D089449
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 May 2019 19:54:36 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3899.namprd12.prod.outlook.com (10.255.174.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 21 May 2019 19:54:34 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Tue, 21 May 2019
 19:54:34 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/amdkfd: Add function to set queue gws
Thread-Topic: [PATCH 4/7] drm/amdkfd: Add function to set queue gws
Thread-Index: AQHVC14Wf2+vLi2Wok+mGqHV/KPpwqZ2B0cA
Date: Tue, 21 May 2019 19:54:34 +0000
Message-ID: <2e81186b-dae0-91e0-b9a1-b0cc6354fc10@amd.com>
References: <1557952664-12218-1-git-send-email-Oak.Zeng@amd.com>
 <1557952664-12218-4-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1557952664-12218-4-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5eb7cfc-5365-4494-14cb-08d6de262584
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3899; 
x-ms-traffictypediagnostic: DM6PR12MB3899:
x-microsoft-antispam-prvs: <DM6PR12MB389915C57462CA2C393894B492070@DM6PR12MB3899.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0044C17179
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(39860400002)(376002)(346002)(199004)(189003)(3846002)(6116002)(110136005)(58126008)(486006)(2906002)(186003)(26005)(71200400001)(76176011)(66066001)(65956001)(65806001)(52116002)(71190400001)(6506007)(102836004)(53546011)(386003)(5660300002)(36756003)(2616005)(476003)(14444005)(256004)(446003)(11346002)(72206003)(305945005)(7736002)(73956011)(99286004)(478600001)(66476007)(66556008)(64756008)(66446008)(66946007)(65826007)(68736007)(14454004)(64126003)(31696002)(7520500002)(86362001)(25786009)(6512007)(6246003)(6486002)(6436002)(31686004)(229853002)(53936002)(316002)(81166006)(8936002)(8676002)(81156014)(2501003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3899;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sjxo/V3eTnS+jv9zM/mIAH7ngJALuCcO3f0y/CDmyJ/ldma5EuvPt/9cAccNFAcYv0eshc4gxccomT4xQ73im9yfRaDBQ0eTDChxSyq25uG0qqfQ+lxRZP7l9+bUyOYrIbMoW4XQnYe4jwpJ22k9vflbi/9hoYBBlBz8DEnAiC5eK9FV6/HsbAHv3Kj4H+YIrn4/qs3b+ieTzb8HSsWBTnxvtAcSd73BlWpceC5xe8FCNmqAYN6AcKZTUeCh3CVffjm8A9qQzSoUJF/7IDCIYT0Q2E7S5M6dqN+mY06nYyE0u+quEf86c8hJBzEDpzzpOvNpwsHOucX7N5PpVzAZZu7yKnfqu1tYPDiypGpIu8inp7RgY5Lrnj98BAw7WHp46j7EohkNquqKuCybYB9ceYCzsoMeovLFuMEmp3djUuM=
Content-ID: <E363DF7D292D5B49BAD2AB7E8B48CA3F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5eb7cfc-5365-4494-14cb-08d6de262584
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2019 19:54:34.3593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3899
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aPHFHwA/VtIzXjB8uhdHxTTNi83kdClIZ0zx0OHa08=;
 b=kXDjzeGolPVihbG9N/gdgcoQtJZZ5udN7VsRrViQoTjN/v9pSqrfHEIV/lCJiEdt6SAzkAt/xsxqZmWoFjUwJ79Wq0uGxBU3YoReqcIU5HSRQKqVLv4S7L76MVKZ2RgBqxRq00n9vR+zkLMVoAWnCQR1k1ctHlcZaAOwgRTJGDM=
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
Cc: "Keely, Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0xNSA0OjM3IHAubS4sIFplbmcsIE9hayB3cm90ZToNCj4gQWRkIGZ1bmN0aW9u
cyBpbiBwcm9jZXNzIHF1ZXVlIG1hbmFnZXIgdG8NCj4gc2V0L2dldCBxdWV1ZSBnd3MuIEFsc28g
c2V0IHByb2Nlc3MncyBudW1iZXINCj4gb2YgZ3dzIHVzZWQuIEN1cnJlbnRseSBvbmx5IG9uZSBx
dWV1ZSBpbg0KPiBwcm9jZXNzIGNhbiB1c2UgYW5kIHVzZSBhbGwgZ3dzLg0KPg0KPiBDaGFuZ2Ut
SWQ6IEkwM2U0ODBjODY5MmRiM2VhYmZjM2ExODhjY2U4OTA0ZDVkOTYyYWI3DQo+IFNpZ25lZC1v
ZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oICAgICAgICAgICAgICB8ICA2ICsrKw0KPiAgIC4u
Li9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jIHwgNTAgKysr
KysrKysrKysrKysrKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygr
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4gaW5kZXggNTk2OWUz
Ny4uNDBhNWM2NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3ByaXYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+
IEBAIC00NTQsNiArNDU0LDkgQEAgc3RydWN0IHF1ZXVlX3Byb3BlcnRpZXMgew0KPiAgICAqDQo+
ICAgICogQGRldmljZTogVGhlIGtmZCBkZXZpY2UgdGhhdCBjcmVhdGVkIHRoaXMgcXVldWUuDQo+
ICAgICoNCj4gKyAqIEBnd3M6IFBvaW50aW5nIHRvIGd3cyBrZ2RfbWVtIGlmIHRoaXMgaXMgYSBn
d3MgY29udHJvbCBxdWV1ZTsgTlVMTA0KPiArICogb3RoZXJ3aXNlLg0KPiArICoNCj4gICAgKiBU
aGlzIHN0cnVjdHVyZSByZXByZXNlbnRzIHVzZXIgbW9kZSBjb21wdXRlIHF1ZXVlcy4NCj4gICAg
KiBJdCBjb250YWlucyBhbGwgdGhlIG5lY2Vzc2FyeSBkYXRhIHRvIGhhbmRsZSBzdWNoIHF1ZXVl
cy4NCj4gICAgKg0KPiBAQCAtNDc1LDYgKzQ3OCw3IEBAIHN0cnVjdCBxdWV1ZSB7DQo+ICAgDQo+
ICAgCXN0cnVjdCBrZmRfcHJvY2VzcwkqcHJvY2VzczsNCj4gICAJc3RydWN0IGtmZF9kZXYJCSpk
ZXZpY2U7DQo+ICsJdm9pZCAqZ3dzOw0KPiAgIH07DQo+ICAgDQo+ICAgLyoNCj4gQEAgLTg2OCw2
ICs4NzIsOCBAQCBpbnQgcHFtX3VwZGF0ZV9xdWV1ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5h
Z2VyICpwcW0sIHVuc2lnbmVkIGludCBxaWQsDQo+ICAgCQkJc3RydWN0IHF1ZXVlX3Byb3BlcnRp
ZXMgKnApOw0KPiAgIGludCBwcW1fc2V0X2N1X21hc2soc3RydWN0IHByb2Nlc3NfcXVldWVfbWFu
YWdlciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlkLA0KPiAgIAkJCXN0cnVjdCBxdWV1ZV9wcm9wZXJ0
aWVzICpwKTsNCj4gK2ludCBwcW1fc2V0X2d3cyhzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2Vy
ICpwcW0sIHVuc2lnbmVkIGludCBxaWQsDQo+ICsJCQl2b2lkICpnd3MpOw0KPiAgIHN0cnVjdCBr
ZXJuZWxfcXVldWUgKnBxbV9nZXRfa2VybmVsX3F1ZXVlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21h
bmFnZXIgKnBxbSwNCj4gICAJCQkJCQl1bnNpZ25lZCBpbnQgcWlkKTsNCj4gICBpbnQgcHFtX2dl
dF93YXZlX3N0YXRlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwNCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFn
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFn
ZXIuYw0KPiBpbmRleCBlNjUyZTI1Li44ZTQ1Mjk2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQo+IEBA
IC0yNiw2ICsyNiw3IEBADQo+ICAgI2luY2x1ZGUgImtmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5o
Ig0KPiAgICNpbmNsdWRlICJrZmRfcHJpdi5oIg0KPiAgICNpbmNsdWRlICJrZmRfa2VybmVsX3F1
ZXVlLmgiDQo+ICsjaW5jbHVkZSAiYW1kZ3B1X2FtZGtmZC5oIg0KPiAgIA0KPiAgIHN0YXRpYyBp
bmxpbmUgc3RydWN0IHByb2Nlc3NfcXVldWVfbm9kZSAqZ2V0X3F1ZXVlX2J5X3FpZCgNCj4gICAJ
CQlzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVuc2lnbmVkIGludCBxaWQpDQo+
IEBAIC03NCw2ICs3NSw1NSBAQCB2b2lkIGtmZF9wcm9jZXNzX2RlcXVldWVfZnJvbV9kZXZpY2Uo
c3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkKQ0KPiAgIAlwZGQtPmFscmVhZHlfZGVxdWV1
ZWQgPSB0cnVlOw0KPiAgIH0NCj4gICANCj4gK2ludCBwcW1fc2V0X2d3cyhzdHJ1Y3QgcHJvY2Vz
c19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVuc2lnbmVkIGludCBxaWQsDQo+ICsJCQl2b2lkICpnd3Mp
DQo+ICt7DQo+ICsJc3RydWN0IGtmZF9kZXYgKmRldiA9IE5VTEw7DQo+ICsJc3RydWN0IHByb2Nl
c3NfcXVldWVfbm9kZSAqcHFuOw0KPiArCXN0cnVjdCBrZmRfcHJvY2Vzc19kZXZpY2UgKnBkZDsN
Cj4gKw0KPiArCXBxbiA9IGdldF9xdWV1ZV9ieV9xaWQocHFtLCBxaWQpOw0KPiArCWlmICghcHFu
KSB7DQo+ICsJCXByX2VycigiUXVldWUgaWQgZG9lcyBub3QgbWF0Y2ggYW55IGtub3duIHF1ZXVl
XG4iKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKHBxbi0+cSkN
Cj4gKwkJZGV2ID0gcHFuLT5xLT5kZXZpY2U7DQo+ICsJaWYgKFdBUk5fT04oIWRldikpDQo+ICsJ
CXJldHVybiAtRU5PREVWOw0KPiArDQo+ICsJcGRkID0ga2ZkX2dldF9wcm9jZXNzX2RldmljZV9k
YXRhKGRldiwgcHFtLT5wcm9jZXNzKTsNCj4gKwlpZiAoIXBkZCkgew0KPiArCQlwcl9lcnIoIlBy
b2Nlc3MgZGV2aWNlIGRhdGEgZG9lc24ndCBleGlzdFxuIik7DQo+ICsJCXJldHVybiAtRUlOVkFM
Ow0KPiArCX0NCj4gKw0KPiArCS8qIE9ubHkgYWxsb3cgb25lIHF1ZXVlIHBlciBwcm9jZXNzIGNh
biBoYXZlIEdXUyBhc3NpZ25lZCAqLw0KPiArCWxpc3RfZm9yX2VhY2hfZW50cnkocHFuLCAmcHFt
LT5xdWV1ZXMsIHByb2Nlc3NfcXVldWVfbGlzdCkgew0KPiArCQlpZiAocHFuLT5xICYmIHBxbi0+
cS0+Z3dzKQ0KPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+ICsJcHFuLT5xLT5n
d3MgPSBnd3M7DQo+ICsJcGRkLT5xcGQubnVtX2d3cyA9IGd3cyA/IGFtZGdwdV9hbWRrZmRfZ2V0
X251bV9nd3MoZGV2LT5rZ2QpIDogMDsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArc3Rh
dGljIHZvaWQgKnBxbV9nZXRfZ3dzKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwg
dW5zaWduZWQgaW50IHFpZCkNCj4gK3sNCj4gKwlzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9ub2RlICpw
cW47DQo+ICsNCj4gKwlwcW4gPSBnZXRfcXVldWVfYnlfcWlkKHBxbSwgcWlkKTsNCj4gKwlpZiAo
IXBxbikgew0KPiArCQlwcl9kZWJ1ZygiTm8gcXVldWUgJWQgZXhpc3RzIGZvciBnZXQgZ3dzIG9w
ZXJhdGlvblxuIiwgcWlkKTsNCj4gKwkJcmV0dXJuIE5VTEw7DQo+ICsJfQ0KPiArDQo+ICsJcmV0
dXJuIHBxbi0+cS0+Z3dzOw0KPiArfQ0KPiArDQoNClRoaXMgaXMgYW4gdW51c2VkIHN0YXRpYyBm
dW5jdGlvbi4gVGhhdCB3aWxsIHByb2JhYmx5IGdlbmVyYXRlIGEgDQpjb21waWxlciB3YXJuaW5n
LiBNYXliZSB0aGlzIGh1bmsgZnJvbSBwYXRjaCAjNiBzaG91bGQgYmUgbW92ZWQgdG8gdGhpcyAN
CnBhdGNoLiBUaGVuIHlvdSdsbCBhbHNvIG5lZWQgdG8gcmVvcmRlciBwYXRjaCA1IGJlZm9yZSB0
aGlzIG9uZSwgb3IgDQpsZWF2ZSBvdXQgdGhlIGNhbGwgZm9yIGFtZGdwdV9hbWRrZmRfcmVtb3Zl
X2d3c19mcm9tX3Byb2Nlc3MgdW50aWwgcGF0Y2ggIzY6DQoNCi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQpAQCAtMzYzLDYg
KzM2MywxMiBAQCBpbnQgcHFtX2Rlc3Ryb3lfcXVldWUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFu
YWdlciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlkKQ0KICAgICAgICAgICAgICAgICByZXR1cm4gLTE7
DQogICAgICAgICB9DQoNCisgICAgICAgaWYgKHBxbV9nZXRfZ3dzKHBxbSwgcWlkKSkgew0KKyAg
ICAgICAgICAgICAgIGFtZGdwdV9hbWRrZmRfcmVtb3ZlX2d3c19mcm9tX3Byb2Nlc3MocHFtLT5w
cm9jZXNzLT5rZ2RfcHJvY2Vzc19pbmZvLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwcW1fZ2V0X2d3cyhwcW0sIHFpZCkpOw0KKyAgICAgICAgICAgICAgIHBxbV9zZXRfZ3dzKHBx
bSwgcWlkLCBOVUxMKTsNCisgICAgICAgfQ0KKw0KICAgICAgICAgaWYgKHBxbi0+a3EpIHsNCiAg
ICAgICAgICAgICAgICAgLyogZGVzdHJveSBrZXJuZWwgcXVldWUgKERJUSkgKi8NCiAgICAgICAg
ICAgICAgICAgZHFtID0gcHFuLT5rcS0+ZGV2LT5kcW07DQoNCg0KPiArDQo+ICAgdm9pZCBrZmRf
cHJvY2Vzc19kZXF1ZXVlX2Zyb21fYWxsX2RldmljZXMoc3RydWN0IGtmZF9wcm9jZXNzICpwKQ0K
PiAgIHsNCj4gICAJc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkOw0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
