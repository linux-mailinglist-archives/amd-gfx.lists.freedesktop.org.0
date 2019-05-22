Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35589271DA
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 23:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9365789C84;
	Wed, 22 May 2019 21:46:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720056.outbound.protection.outlook.com [40.107.72.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6029589C84
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 21:46:19 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2908.namprd12.prod.outlook.com (20.179.71.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Wed, 22 May 2019 21:46:17 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::2916:eda4:a1fd:fd36%3]) with mapi id 15.20.1922.013; Wed, 22 May 2019
 21:46:17 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 5/7] drm/amdkfd: Add function to set queue gws
Thread-Topic: [PATCH 5/7] drm/amdkfd: Add function to set queue gws
Thread-Index: AQHVELY/YFJPjdH/AE2NCtIZqiA5b6Z3riKA
Date: Wed, 22 May 2019 21:46:17 +0000
Message-ID: <05f3ae91-100b-60d9-08e5-627245e38c64@amd.com>
References: <1558540278-23734-1-git-send-email-Oak.Zeng@amd.com>
 <1558540278-23734-5-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558540278-23734-5-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTXPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::14) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af397087-4d6b-41c9-4b54-08d6defeeb8a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2908; 
x-ms-traffictypediagnostic: DM6PR12MB2908:
x-microsoft-antispam-prvs: <DM6PR12MB2908FCE8BF506765E4652DEC92000@DM6PR12MB2908.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(346002)(396003)(136003)(376002)(189003)(199004)(71200400001)(99286004)(186003)(76176011)(71190400001)(316002)(36756003)(52116002)(14444005)(486006)(256004)(31686004)(26005)(72206003)(14454004)(102836004)(2616005)(11346002)(446003)(65956001)(65806001)(6512007)(66066001)(386003)(53546011)(6506007)(476003)(86362001)(31696002)(68736007)(478600001)(7736002)(305945005)(25786009)(6436002)(66946007)(73956011)(6486002)(4326008)(3846002)(6116002)(229853002)(6246003)(53936002)(65826007)(2501003)(110136005)(66476007)(2906002)(66556008)(64756008)(5660300002)(58126008)(8936002)(81166006)(81156014)(66446008)(64126003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2908;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2XFgtTiei9fqRQPkfhHh+Jsn/PPDODNvsPZm1VvWubgcpoq8IFObhnkxP+Koj1XAhUNQ9Wb2hFMvPpjUeZvftGTCoRn9rwFzZiSjwqjhfM8/NQoHSfHUS23G10+OAVch4XysWbgUpE9S2xgQEbx/S2+0QmkNfL6rJI8Z6PEUkc2TTILGoWG1MkoVHva9JpYi/uk8Taoug/gjlawGxXXMbxAjPsq/iYQKjTlMvJMOO/P4A7PW19xj0aNwUiXVtB/Qh8Cw0z6ABER8/uX3j51k7VFIOoPkRBVKy5bNxsl1Y1WymN27KQLYJZJWQ6iu4YtlKS7pJ3Z7U25MnWgIMjpX3uk6aT0kANC6utXWWuxMueNERdAVOP/+8NlDu0MVtiX3/a16wjr46VB7od6k04k51ilBwThrTsn35PC46bZ6U1k=
Content-ID: <D25FB00AFCE21E4C8A11E7E718CDA269@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af397087-4d6b-41c9-4b54-08d6defeeb8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 21:46:17.7084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2908
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNNnNwsDss2PXFVSMyahcAs4yt0SrpV2Pu4t6ptdyoU=;
 b=yV+2ogbNAk1A30AnV7z7o2JoJkViUfqfkjo/8nuBMm37cLubaggsp/sba1eAbL2DymKpvoi8dL6XR6TeuLACNGD9euHOwVDkBN/2+xVar5pEQR12Ty6+6zkFyyh4P7q/T5Ll6hkIc4M8K58bcEfrgrKZ5JoEbz5lezL/9jm1IA8=
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

T24gMjAxOS0wNS0yMiAxMTo1MSBhLm0uLCBaZW5nLCBPYWsgd3JvdGU6DQo+IEFkZCBmdW5jdGlv
bnMgaW4gcHJvY2VzcyBxdWV1ZSBtYW5hZ2VyIHRvDQo+IHNldC9nZXQgcXVldWUgZ3dzLiBBbHNv
IHNldCBwcm9jZXNzJ3MgbnVtYmVyDQo+IG9mIGd3cyB1c2VkLiBDdXJyZW50bHkgb25seSBvbmUg
cXVldWUgaW4NCj4gcHJvY2VzcyBjYW4gdXNlIGFuZCB1c2UgYWxsIGd3cy4NCj4NCj4gQ2hhbmdl
LUlkOiBJMDNlNDgwYzg2OTJkYjNlYWJmYzNhMTg4Y2NlODkwNGQ1ZDk2MmFiNw0KPiBTaWduZWQt
b2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAgICAgICAgICAgICAgfCAgNiArKysNCj4gICAu
Li4vZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyB8IDU4ICsr
KysrKysrKysrKysrKysrKysrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMo
KykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+IGluZGV4IDU5Njll
MzcuLjQwYTVjNjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9wcml2LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0K
PiBAQCAtNDU0LDYgKzQ1NCw5IEBAIHN0cnVjdCBxdWV1ZV9wcm9wZXJ0aWVzIHsNCj4gICAgKg0K
PiAgICAqIEBkZXZpY2U6IFRoZSBrZmQgZGV2aWNlIHRoYXQgY3JlYXRlZCB0aGlzIHF1ZXVlLg0K
PiAgICAqDQo+ICsgKiBAZ3dzOiBQb2ludGluZyB0byBnd3Mga2dkX21lbSBpZiB0aGlzIGlzIGEg
Z3dzIGNvbnRyb2wgcXVldWU7IE5VTEwNCj4gKyAqIG90aGVyd2lzZS4NCj4gKyAqDQo+ICAgICog
VGhpcyBzdHJ1Y3R1cmUgcmVwcmVzZW50cyB1c2VyIG1vZGUgY29tcHV0ZSBxdWV1ZXMuDQo+ICAg
ICogSXQgY29udGFpbnMgYWxsIHRoZSBuZWNlc3NhcnkgZGF0YSB0byBoYW5kbGUgc3VjaCBxdWV1
ZXMuDQo+ICAgICoNCj4gQEAgLTQ3NSw2ICs0NzgsNyBAQCBzdHJ1Y3QgcXVldWUgew0KPiAgIA0K
PiAgIAlzdHJ1Y3Qga2ZkX3Byb2Nlc3MJKnByb2Nlc3M7DQo+ICAgCXN0cnVjdCBrZmRfZGV2CQkq
ZGV2aWNlOw0KPiArCXZvaWQgKmd3czsNCj4gICB9Ow0KPiAgIA0KPiAgIC8qDQo+IEBAIC04Njgs
NiArODcyLDggQEAgaW50IHBxbV91cGRhdGVfcXVldWUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFu
YWdlciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlkLA0KPiAgIAkJCXN0cnVjdCBxdWV1ZV9wcm9wZXJ0
aWVzICpwKTsNCj4gICBpbnQgcHFtX3NldF9jdV9tYXNrKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21h
bmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCwNCj4gICAJCQlzdHJ1Y3QgcXVldWVfcHJvcGVy
dGllcyAqcCk7DQo+ICtpbnQgcHFtX3NldF9nd3Moc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdl
ciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlkLA0KPiArCQkJdm9pZCAqZ3dzKTsNCj4gICBzdHJ1Y3Qg
a2VybmVsX3F1ZXVlICpwcW1fZ2V0X2tlcm5lbF9xdWV1ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9t
YW5hZ2VyICpwcW0sDQo+ICAgCQkJCQkJdW5zaWduZWQgaW50IHFpZCk7DQo+ICAgaW50IHBxbV9n
ZXRfd2F2ZV9zdGF0ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5h
Z2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5h
Z2VyLmMNCj4gaW5kZXggZTY1MmUyNS4uYTc4NDk0ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KPiBA
QCAtMjYsNiArMjYsNyBAQA0KPiAgICNpbmNsdWRlICJrZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIu
aCINCj4gICAjaW5jbHVkZSAia2ZkX3ByaXYuaCINCj4gICAjaW5jbHVkZSAia2ZkX2tlcm5lbF9x
dWV1ZS5oIg0KPiArI2luY2x1ZGUgImFtZGdwdV9hbWRrZmQuaCINCj4gICANCj4gICBzdGF0aWMg
aW5saW5lIHN0cnVjdCBwcm9jZXNzX3F1ZXVlX25vZGUgKmdldF9xdWV1ZV9ieV9xaWQoDQo+ICAg
CQkJc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlkKQ0K
PiBAQCAtNzQsNiArNzUsNTcgQEAgdm9pZCBrZmRfcHJvY2Vzc19kZXF1ZXVlX2Zyb21fZGV2aWNl
KHN0cnVjdCBrZmRfcHJvY2Vzc19kZXZpY2UgKnBkZCkNCj4gICAJcGRkLT5hbHJlYWR5X2RlcXVl
dWVkID0gdHJ1ZTsNCj4gICB9DQo+ICAgDQo+ICtpbnQgcHFtX3NldF9nd3Moc3RydWN0IHByb2Nl
c3NfcXVldWVfbWFuYWdlciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlkLA0KPiArCQkJdm9pZCAqZ3dz
KQ0KPiArew0KPiArCXN0cnVjdCBrZmRfZGV2ICpkZXYgPSBOVUxMOw0KPiArCXN0cnVjdCBwcm9j
ZXNzX3F1ZXVlX25vZGUgKnBxbjsNCj4gKwlzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICpwZGQ7
DQo+ICsNCj4gKwlwcW4gPSBnZXRfcXVldWVfYnlfcWlkKHBxbSwgcWlkKTsNCj4gKwlpZiAoIXBx
bikgew0KPiArCQlwcl9lcnIoIlF1ZXVlIGlkIGRvZXMgbm90IG1hdGNoIGFueSBrbm93biBxdWV1
ZVxuIik7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKw0KPiArCWlmIChwcW4tPnEp
DQo+ICsJCWRldiA9IHBxbi0+cS0+ZGV2aWNlOw0KPiArCWlmIChXQVJOX09OKCFkZXYpKQ0KPiAr
CQlyZXR1cm4gLUVOT0RFVjsNCj4gKw0KPiArCXBkZCA9IGtmZF9nZXRfcHJvY2Vzc19kZXZpY2Vf
ZGF0YShkZXYsIHBxbS0+cHJvY2Vzcyk7DQo+ICsJaWYgKCFwZGQpIHsNCj4gKwkJcHJfZXJyKCJQ
cm9jZXNzIGRldmljZSBkYXRhIGRvZXNuJ3QgZXhpc3RcbiIpOw0KPiArCQlyZXR1cm4gLUVJTlZB
TDsNCj4gKwl9DQo+ICsNCj4gKwkvKiBPbmx5IGFsbG93IG9uZSBxdWV1ZSBwZXIgcHJvY2VzcyBj
YW4gaGF2ZSBHV1MgYXNzaWduZWQgKi8NCj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHBxbiwgJnBx
bS0+cXVldWVzLCBwcm9jZXNzX3F1ZXVlX2xpc3QpIHsNCj4gKwkJaWYgKHBxbi0+cSAmJiBwcW4t
PnEtPmd3cykNCj4gKwkJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKw0KPiArCXBxbi0+cS0+
Z3dzID0gZ3dzOw0KPiArCXBkZC0+cXBkLm51bV9nd3MgPSBnd3MgPyBhbWRncHVfYW1ka2ZkX2dl
dF9udW1fZ3dzKGRldi0+a2dkKSA6IDA7DQo+ICsNCj4gKwlyZXR1cm4gcHFuLT5xLT5kZXZpY2Ut
PmRxbS0+b3BzLnVwZGF0ZV9xdWV1ZShwcW4tPnEtPmRldmljZS0+ZHFtLA0KPiArCQkJCQkJCXBx
bi0+cSk7DQoNCldoZW4gcHFtX3NldF9nd3MgaXMgY2FsbGVkIGR1cmluZyBwcW1fZGVzdHJveV9x
dWV1ZSwgdGhpcyBpcyANCnVubmVjZXNzYXJ5LiBJdCB3b3VsZCByZXN1bHQgaW4gdHdvIHByZWVt
cHRpb25zIGFuZCBydW5saXN0IHVwZGF0ZXMgDQpldmVyeSB0aW1lIGEgcXVldWUgaXMgZGVzdHJv
eWVkLiBTZWUgYmVsb3cuDQoNCg0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCAqcHFtX2dldF9n
d3Moc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlkKQ0K
PiArew0KPiArCXN0cnVjdCBwcm9jZXNzX3F1ZXVlX25vZGUgKnBxbjsNCj4gKw0KPiArCXBxbiA9
IGdldF9xdWV1ZV9ieV9xaWQocHFtLCBxaWQpOw0KPiArCWlmICghcHFuKSB7DQo+ICsJCXByX2Rl
YnVnKCJObyBxdWV1ZSAlZCBleGlzdHMgZm9yIGdldCBnd3Mgb3BlcmF0aW9uXG4iLCBxaWQpOw0K
PiArCQlyZXR1cm4gTlVMTDsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gcHFuLT5xLT5nd3M7DQo+
ICt9DQo+ICsNCj4gKw0KPiAgIHZvaWQga2ZkX3Byb2Nlc3NfZGVxdWV1ZV9mcm9tX2FsbF9kZXZp
Y2VzKHN0cnVjdCBrZmRfcHJvY2VzcyAqcCkNCj4gICB7DQo+ICAgCXN0cnVjdCBrZmRfcHJvY2Vz
c19kZXZpY2UgKnBkZDsNCj4gQEAgLTMxMyw2ICszNjUsMTIgQEAgaW50IHBxbV9kZXN0cm95X3F1
ZXVlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCkN
Cj4gICAJCXJldHVybiAtMTsNCj4gICAJfQ0KPiAgIA0KPiArCWlmIChwcW1fZ2V0X2d3cyhwcW0s
IHFpZCkpIHsNCg0KQWxsIHBxbV9nZXRfZ3dzIHJlYWxseSBkb2VzIGFuIGV4dHJhIGxvb2t1cCBv
ZiB0aGUgcHFuLCB3aGljaCB5b3UgDQphbHJlYWR5IGtub3cgaGVyZS4gSW5zdGVhZCwgY291bGQg
eW91IGp1c3QgcmVwbGFjZSB0aGlzIHdpdGg6DQoNCiDCoMKgwqAgaWYgKHBxbi0+cS0+Z3dzKSAu
Li4NCg0KQW5kIHJlbW92ZSBwcW1fZ2V0X2d3cy4NCg0KPiArCQlhbWRncHVfYW1ka2ZkX3JlbW92
ZV9nd3NfZnJvbV9wcm9jZXNzKHBxbS0+cHJvY2Vzcy0+a2dkX3Byb2Nlc3NfaW5mbywNCj4gKwkJ
CQlwcW1fZ2V0X2d3cyhwcW0sIHFpZCkpOw0KPiArCQlwcW1fc2V0X2d3cyhwcW0sIHFpZCwgTlVM
TCk7DQoNCklmIHlvdSBjYWxsIHBxbV9zZXRfZ3dzIGhlcmUsIGl0IHdpbGwgdW5uZWNlc3Nhcmls
eSBjYXVzZSBhIHByZWVtcHRpb24gDQphbmQgcnVubGlzdCB1cGRhdGUuIEl0IGFsc28gZG9lcyBt
b3JlIGxvb2t1cHMgb2YgcGRkIGFuZCBwcW4sIGJvdGggb2YgDQp3aGljaCB5b3UgYWxyZWFkeSBr
bm93IGhlcmUuIFlvdSBkb24ndCByZWFsbHkgbmVlZCB0byB1cGRhdGUgdGhlIHF1ZXVlIA0KdGhh
dCB5b3UncmUgYWJvdXQgdG8gZGVzdHJveS4gQWxsIHlvdSByZWFsbHkgbmVlZCB0byBkbyBoZXJl
IGlzIHVwZGF0ZSANCnBkZC0+cXBkLm51bV9nd3MuIFlvdSBjYW4gZG8gdGhhdCB3aXRob3V0IGNh
bGxpbmcgcHFtX3NldF9nd3MuDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KPiArCX0NCj4gKw0K
PiAgIAlpZiAocHFuLT5rcSkgew0KPiAgIAkJLyogZGVzdHJveSBrZXJuZWwgcXVldWUgKERJUSkg
Ki8NCj4gICAJCWRxbSA9IHBxbi0+a3EtPmRldi0+ZHFtOw0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
