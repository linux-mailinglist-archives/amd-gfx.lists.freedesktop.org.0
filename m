Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446C3A124E
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 09:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B9889FC0;
	Thu, 29 Aug 2019 07:08:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760085.outbound.protection.outlook.com [40.107.76.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCA789FAD;
 Thu, 29 Aug 2019 07:08:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtJGpd1QIIl9/dJRtEsOImJJmH0Lf0p7fODOhLSyzlxmgkHwrv6TD2Hm1PBP4kO3JgxGD1iFUSFonuVKKrEo/JTkvxeJGEy7CVrd0tL+MPkYSuBqpFHOBV9r6Waz6pWffc3KwqzDKo/dblTk8Uyy1N71kI3goAjawSowGa24y9RDNoGaWjLEU5VmQoEFX1db39t9TERWQlrJuJj8qYq/4xXnFOqlJFcZaKYdo1jIhchL4w1idJE59VG6uFwfv7AbnFesrw787S+2/Qz+ERWjF5yMmdChD+RUsb6zMwhlQvVOUr2XUZ63pex4cWhX7q9FQcKSNVqcrM8iC7YisyfcQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D676pyXUFUZJcFc6uzbA4gkOqFt+TpxwZ1ER3z9APIE=;
 b=OqVUbUFjByWN/zV8+/ygJzTEHdvHbXnbka4ehAYQ92dLpjOy9KIoRHU/PxFr9LVSuf3gOCz/cM1paOY0jlccGg9r1a9PCHd8+OousW8GlDkpnRcws+xmHeQBqy+cYkyAn1PvrT1hv6338WgjbAQR6cIWmG3gJY1lhqX0ZI2gG/Tgy2MR4c+sZJn38wujZR3VdVgKWgMmpJhgiG/Kdc9Tsq0tK1LvqbIIvPn8rhkOZkln9jCJ3MhUMeVR1DH9ThjsdpV1/zFc7vSG26tQB4Q1HcNPmM24EYh7ENIyJ2FIWLhhNR6Fl0ygvFM/SnV/yR+a5RLdI97QzMKi40XOja6ZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1402.namprd12.prod.outlook.com (10.168.236.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 07:08:18 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 07:08:18 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Ho, Kenny" <Kenny.Ho@amd.com>, "y2kenny@gmail.com" <y2kenny@gmail.com>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "tj@kernel.org" <tj@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Greathouse, Joseph" <Joseph.Greathouse@amd.com>, "jsparks@cray.com"
 <jsparks@cray.com>, "lkaplan@cray.com" <lkaplan@cray.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>
Subject: Re: [PATCH RFC v4 13/16] drm, cgroup: Allow more aggressive memory
 reclaim
Thread-Topic: [PATCH RFC v4 13/16] drm, cgroup: Allow more aggressive memory
 reclaim
Thread-Index: AQHVXi/lvhOTtllJXECcy5akeEg7N6cRtKcA
Date: Thu, 29 Aug 2019 07:08:18 +0000
Message-ID: <464ad318-48dd-3f78-d82b-83a8e7175ff9@amd.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-14-Kenny.Ho@amd.com>
In-Reply-To: <20190829060533.32315-14-Kenny.Ho@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::27) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 231e0165-96ce-475f-940c-08d72c4fab55
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1402; 
x-ms-traffictypediagnostic: DM5PR12MB1402:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1402E19E42B2D41F671B90CD83A20@DM5PR12MB1402.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(199004)(189003)(110136005)(229853002)(2616005)(305945005)(476003)(2501003)(316002)(58126008)(65806001)(65956001)(6436002)(486006)(386003)(8936002)(7736002)(53936002)(5660300002)(36756003)(6486002)(446003)(11346002)(76176011)(52116002)(186003)(46003)(31686004)(25786009)(6116002)(478600001)(6512007)(86362001)(14454004)(31696002)(256004)(14444005)(8676002)(71200400001)(102836004)(71190400001)(66476007)(64756008)(81166006)(66556008)(6246003)(81156014)(66446008)(66946007)(2906002)(2201001)(99286004)(6506007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1402;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NATbp094FCpKVh/6awPusSTXgaCCFGGJVKA9JuLLR0BU348vFb3EwXLBO/pkWHHXjzSnyO2YutGJBhZ5FEi0pmH3SLfPCpjCCA5YJhZrzAuRmULFb2Jx3UCz2BufuIJfDJdxqq9PfDKwKHYGM/GFVJIA7fhvsK9Vx162U5nDj17n7XD3N741+U5tuB40FwsUIREM1C2ZHNhIlJQyFSsSLuiB9Cowz3IPTgrqjdTQz4VHWnJ5gGXnJ9XQzGj+aH41+l9p+ZfKJF5OVfhaUl5RkO/F2uITz7OASgOUWi1dZ9S2qzSG93ncNoV0+Uxl9/cDxt2+PLyb8wEaVHW/gBsaqxnKMCls+JPkbFBlagIIv3zG8BaydTKtfavh3uXqwVulj3UnKNDJCeq1xlNcniJk0Upf99xd15AzjBWVk8s0UIQ=
Content-ID: <492B6C2A21B49B4A8CB6451CCD4330D8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231e0165-96ce-475f-940c-08d72c4fab55
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 07:08:18.6224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V2woqs3MGldMmVtM1qfCjpS2/F4W1FjO6pIhxZZXiokdbYCHd0Vv386DNg7+AAkC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1402
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D676pyXUFUZJcFc6uzbA4gkOqFt+TpxwZ1ER3z9APIE=;
 b=EnOrsvYR9RmQ/+WYf2TkOBdsH5bOOov2cgzHzH8vWkADedcpTaN2L09dTkkHQgc5/40rU+JK5f9ZVtwosOrf5qJOT3Nuk6mDXrgBZ8RoiBjr7u9Dm4lmJg6NPiL9elg4CeR7SMV9DsqowjhnjvruEC+AZInN/YB6BMJPx1fU2YY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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

QW0gMjkuMDguMTkgdW0gMDg6MDUgc2NocmllYiBLZW5ueSBIbzoNCj4gQWxsb3cgRFJNIFRUTSBt
ZW1vcnkgbWFuYWdlciB0byByZWdpc3RlciBhIHdvcmtfc3RydWN0LCBzdWNoIHRoYXQsIHdoZW4N
Cj4gYSBkcm1jZ3JwIGlzIHVuZGVyIG1lbW9yeSBwcmVzc3VyZSwgbWVtb3J5IHJlY2xhaW1pbmcg
Y2FuIGJlIHRyaWdnZXJlZA0KPiBpbW1lZGlhdGVseS4NCj4NCj4gQ2hhbmdlLUlkOiBJMjVhYzA0
ZTJkYjljMTlmZjEyNjUyYjg4ZWJmZjE4YjQ0YjI3MDZkOA0KPiBTaWduZWQtb2ZmLWJ5OiBLZW5u
eSBIbyA8S2VubnkuSG9AYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYyAgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIGlu
Y2x1ZGUvZHJtL2RybV9jZ3JvdXAuaCAgICAgICAgfCAxNiArKysrKysrKysrKw0KPiAgIGluY2x1
ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggfCAgMiArKw0KPiAgIGtlcm5lbC9jZ3JvdXAvZHJt
LmMgICAgICAgICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrKw0KPiAgIDQgZmlsZXMgY2hh
bmdlZCwgOTcgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4gaW5kZXggZDdl
M2QzMTI4ZWJiLi43MmVmYWU2OTRiN2UgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPiBAQCAt
MTU5MCw2ICsxNTkwLDQ2IEBAIGludCB0dG1fYm9fZXZpY3RfbW0oc3RydWN0IHR0bV9ib19kZXZp
Y2UgKmJkZXYsIHVuc2lnbmVkIG1lbV90eXBlKQ0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKHR0
bV9ib19ldmljdF9tbSk7DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCB0dG1fYm9fcmVjbGFpbV93cShz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ICt7DQo+ICsJc3RydWN0IHR0bV9vcGVyYXRpb25f
Y3R4IGN0eCA9IHsNCj4gKwkJLmludGVycnVwdGlibGUgPSBmYWxzZSwNCj4gKwkJLm5vX3dhaXRf
Z3B1ID0gZmFsc2UsDQo+ICsJCS5mbGFncyA9IFRUTV9PUFRfRkxBR19GT1JDRV9BTExPQw0KPiAr
CX07DQo+ICsJc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPQ0KPiArCSAgICBjb250
YWluZXJfb2Yod29yaywgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyLCByZWNsYWltX3dxKTsN
Cj4gKwlzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiA9IG1hbi0+YmRldjsNCj4gKwlzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmZW5jZTsNCj4gKwlpbnQgbWVtX3R5cGU7DQo+ICsJaW50IHJldDsNCj4gKw0K
PiArCWZvciAobWVtX3R5cGUgPSAwOyBtZW1fdHlwZSA8IFRUTV9OVU1fTUVNX1RZUEVTOyBtZW1f
dHlwZSsrKQ0KPiArCQlpZiAoJmJkZXYtPm1hblttZW1fdHlwZV0gPT0gbWFuKQ0KPiArCQkJYnJl
YWs7DQo+ICsNCj4gKwlXQVJOX09OKG1lbV90eXBlID49IFRUTV9OVU1fTUVNX1RZUEVTKTsNCj4g
KwlpZiAobWVtX3R5cGUgPj0gVFRNX05VTV9NRU1fVFlQRVMpDQo+ICsJCXJldHVybjsNCj4gKw0K
PiArCWlmICghZHJtY2dfbWVtX3ByZXNzdXJlX3NjYW4oYmRldiwgbWVtX3R5cGUpKQ0KPiArCQly
ZXR1cm47DQo+ICsNCj4gKwlyZXQgPSB0dG1fbWVtX2V2aWN0X2ZpcnN0KGJkZXYsIG1lbV90eXBl
LCBOVUxMLCAmY3R4LCBOVUxMKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm47DQo+ICsNCj4g
KwlzcGluX2xvY2soJm1hbi0+bW92ZV9sb2NrKTsNCj4gKwlmZW5jZSA9IGRtYV9mZW5jZV9nZXQo
bWFuLT5tb3ZlKTsNCj4gKwlzcGluX3VubG9jaygmbWFuLT5tb3ZlX2xvY2spOw0KPiArDQo+ICsJ
aWYgKGZlbmNlKSB7DQo+ICsJCXJldCA9IGRtYV9mZW5jZV93YWl0KGZlbmNlLCBmYWxzZSk7DQo+
ICsJCWRtYV9mZW5jZV9wdXQoZmVuY2UpOw0KPiArCX0NCg0KV2h5IGRvIHlvdSB3YW50IHRvIGJs
b2NrIGZvciB0aGUgZmVuY2UgaGVyZT8gVGhhdCBpcyBhIHJhdGhlciBiYWQgaWRlYSANCmFuZCB3
b3VsZCBicmVhayBwaXBlLWxpbmluZy4NCg0KQXBhcnQgZnJvbSB0aGF0IEkgZG9uJ3QgdGhpbmsg
d2Ugc2hvdWxkIHB1dCB0aGF0IGludG8gVFRNLg0KDQpJbnN0ZWFkIGRybWNnX3JlZ2lzdGVyX2Rl
dmljZV9tbSgpIHNob3VsZCBnZXQgYSBmdW5jdGlvbiBwb2ludGVyIHdoaWNoIA0KaXMgY2FsbGVk
IGZyb20gYSB3b3JrIGl0ZW0gd2hlbiB0aGUgZ3JvdXAgaXMgdW5kZXIgcHJlc3N1cmUuDQoNClRU
TSBjYW4gdGhlbiBwcm92aWRlcyB0aGUgZnVuY3Rpb24gd2hpY2ggY2FuIGJlIGNhbGxlZCwgYnV0
IHRoZSBhY3R1YWxseSANCnJlZ2lzdHJhdGlvbiBpcyBqb2Igb2YgdGhlIGRldmljZSBhbmQgbm90
IFRUTS4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPiArDQo+ICt9DQo+ICsNCj4gICBpbnQg
dHRtX2JvX2luaXRfbW0oc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVuc2lnbmVkIHR5cGUs
DQo+ICAgCQkJdW5zaWduZWQgbG9uZyBwX3NpemUpDQo+ICAgew0KPiBAQCAtMTYyNCw2ICsxNjY0
LDEzIEBAIGludCB0dG1fYm9faW5pdF9tbShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdW5z
aWduZWQgdHlwZSwNCj4gICAJCUlOSVRfTElTVF9IRUFEKCZtYW4tPmxydVtpXSk7DQo+ICAgCW1h
bi0+bW92ZSA9IE5VTEw7DQo+ICAgDQo+ICsJcHJfZXJyKCJkcm1jZyAlcCB0eXBlICVkXG4iLCBi
ZGV2LT5kZGV2LCB0eXBlKTsNCj4gKw0KPiArCWlmICh0eXBlIDw9IFRUTV9QTF9WUkFNKSB7DQo+
ICsJCUlOSVRfV09SSygmbWFuLT5yZWNsYWltX3dxLCB0dG1fYm9fcmVjbGFpbV93cSk7DQo+ICsJ
CWRybWNnX3JlZ2lzdGVyX2RldmljZV9tbShiZGV2LT5kZGV2LCB0eXBlLCAmbWFuLT5yZWNsYWlt
X3dxKTsNCj4gKwl9DQo+ICsNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1C
T0wodHRtX2JvX2luaXRfbW0pOw0KPiBAQCAtMTcwMSw2ICsxNzQ4LDggQEAgaW50IHR0bV9ib19k
ZXZpY2VfcmVsZWFzZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikNCj4gICAJCW1hbiA9ICZi
ZGV2LT5tYW5baV07DQo+ICAgCQlpZiAobWFuLT5oYXNfdHlwZSkgew0KPiAgIAkJCW1hbi0+dXNl
X3R5cGUgPSBmYWxzZTsNCj4gKwkJCWRybWNnX3VucmVnaXN0ZXJfZGV2aWNlX21tKGJkZXYtPmRk
ZXYsIGkpOw0KPiArCQkJY2FuY2VsX3dvcmtfc3luYygmbWFuLT5yZWNsYWltX3dxKTsNCj4gICAJ
CQlpZiAoKGkgIT0gVFRNX1BMX1NZU1RFTSkgJiYgdHRtX2JvX2NsZWFuX21tKGJkZXYsIGkpKSB7
DQo+ICAgCQkJCXJldCA9IC1FQlVTWTsNCj4gICAJCQkJcHJfZXJyKCJEUk0gbWVtb3J5IG1hbmFn
ZXIgdHlwZSAlZCBpcyBub3QgY2xlYW5cbiIsDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
cm1fY2dyb3VwLmggYi9pbmNsdWRlL2RybS9kcm1fY2dyb3VwLmgNCj4gaW5kZXggYzExZGYzODhm
ZGYyLi42ZDk3MDdlMWViNzIgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jZ3JvdXAu
aA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY2dyb3VwLmgNCj4gQEAgLTUsNiArNSw3IEBADQo+
ICAgI2RlZmluZSBfX0RSTV9DR1JPVVBfSF9fDQo+ICAgDQo+ICAgI2luY2x1ZGUgPGxpbnV4L2Nn
cm91cF9kcm0uaD4NCj4gKyNpbmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4NCj4gICAjaW5jbHVk
ZSA8ZHJtL3R0bS90dG1fYm9fYXBpLmg+DQo+ICAgI2luY2x1ZGUgPGRybS90dG0vdHRtX2JvX2Ry
aXZlci5oPg0KPiAgIA0KPiBAQCAtMjUsMTIgKzI2LDE3IEBAIHN0cnVjdCBkcm1jZ19wcm9wcyB7
DQo+ICAgCXM2NAkJCW1lbV9id19hdmdfYnl0ZXNfcGVyX3VzX2RlZmF1bHQ7DQo+ICAgDQo+ICAg
CXM2NAkJCW1lbV9oaWdoc19kZWZhdWx0W1RUTV9QTF9QUklWKzFdOw0KPiArDQo+ICsJc3RydWN0
IHdvcmtfc3RydWN0CSptZW1fcmVjbGFpbV93cVtUVE1fUExfUFJJVl07DQo+ICAgfTsNCj4gICAN
Cj4gICAjaWZkZWYgQ09ORklHX0NHUk9VUF9EUk0NCj4gICANCj4gICB2b2lkIGRybWNnX2Rldmlj
ZV91cGRhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldmljZSk7DQo+ICAgdm9pZCBkcm1jZ19kZXZp
Y2VfZWFybHlfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2aWNlKTsNCj4gK3ZvaWQgZHJtY2df
cmVnaXN0ZXJfZGV2aWNlX21tKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCB0
eXBlLA0KPiArCQlzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndxKTsNCj4gK3ZvaWQgZHJtY2dfdW5yZWdp
c3Rlcl9kZXZpY2VfbW0oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHR5cGUp
Ow0KPiAgIGJvb2wgZHJtY2dfdHJ5X2NoZ19ib19hbGxvYyhzdHJ1Y3QgZHJtY2cgKmRybWNnLCBz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgIAkJc2l6ZV90IHNpemUpOw0KPiAgIHZvaWQgZHJt
Y2dfdW5jaGdfYm9fYWxsb2Moc3RydWN0IGRybWNnICpkcm1jZywgc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwNCj4gQEAgLTUzLDYgKzU5LDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkcm1jZ19kZXZp
Y2VfZWFybHlfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2aWNlKQ0KPiAgIHsNCj4gICB9DQo+
ICAgDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZHJtY2dfcmVnaXN0ZXJfZGV2aWNlX21tKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsDQo+ICsJCXVuc2lnbmVkIGludCB0eXBlLCBzdHJ1Y3Qgd29ya19z
dHJ1Y3QgKndxKQ0KPiArew0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZHJtY2df
dW5yZWdpc3Rlcl9kZXZpY2VfbW0oc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gKwkJdW5zaWdu
ZWQgaW50IHR5cGUpDQo+ICt7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgZHJt
Y2dfdHJ5X2NoZ19ib19hbGxvYyhzdHJ1Y3QgZHJtY2cgKmRybWNnLA0KPiAgIAkJc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwJc2l6ZV90IHNpemUpDQo+ICAgew0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVy
LmgNCj4gaW5kZXggZTFhODA1ZDY1YjgzLi41MjljZWY5MmJjZjYgMTAwNjQ0DQo+IC0tLSBhL2lu
Y2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19kcml2ZXIuaA0KPiBAQCAtMjA1LDYgKzIwNSw4IEBAIHN0cnVjdCB0dG1fbWVtX3R5cGVf
bWFuYWdlciB7DQo+ICAgCSAqIFByb3RlY3RlZCBieSBAbW92ZV9sb2NrLg0KPiAgIAkgKi8NCj4g
ICAJc3RydWN0IGRtYV9mZW5jZSAqbW92ZTsNCj4gKw0KPiArCXN0cnVjdCB3b3JrX3N0cnVjdCBy
ZWNsYWltX3dxOw0KPiAgIH07DQo+ICAgDQo+ICAgLyoqDQo+IGRpZmYgLS1naXQgYS9rZXJuZWwv
Y2dyb3VwL2RybS5jIGIva2VybmVsL2Nncm91cC9kcm0uYw0KPiBpbmRleCAwNGZiOWEzOTg3NDAu
LjBlYTdmMDYxOWUyNSAxMDA2NDQNCj4gLS0tIGEva2VybmVsL2Nncm91cC9kcm0uYw0KPiArKysg
Yi9rZXJuZWwvY2dyb3VwL2RybS5jDQo+IEBAIC04MDQsNiArODA0LDI5IEBAIHZvaWQgZHJtY2df
ZGV2aWNlX2Vhcmx5X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gICB9DQo+ICAgRVhQ
T1JUX1NZTUJPTChkcm1jZ19kZXZpY2VfZWFybHlfaW5pdCk7DQo+ICAgDQo+ICt2b2lkIGRybWNn
X3JlZ2lzdGVyX2RldmljZV9tbShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQg
dHlwZSwNCj4gKwkJc3RydWN0IHdvcmtfc3RydWN0ICp3cSkNCj4gK3sNCj4gKwlpZiAoZGV2ID09
IE5VTEwgfHwgdHlwZSA+PSBUVE1fUExfUFJJVikNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJbXV0
ZXhfbG9jaygmZHJtY2dfbXV0ZXgpOw0KPiArCWRldi0+ZHJtY2dfcHJvcHMubWVtX3JlY2xhaW1f
d3FbdHlwZV0gPSB3cTsNCj4gKwltdXRleF91bmxvY2soJmRybWNnX211dGV4KTsNCj4gK30NCj4g
K0VYUE9SVF9TWU1CT0woZHJtY2dfcmVnaXN0ZXJfZGV2aWNlX21tKTsNCj4gKw0KPiArdm9pZCBk
cm1jZ191bnJlZ2lzdGVyX2RldmljZV9tbShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25l
ZCBpbnQgdHlwZSkNCj4gK3sNCj4gKwlpZiAoZGV2ID09IE5VTEwgfHwgdHlwZSA+PSBUVE1fUExf
UFJJVikNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJbXV0ZXhfbG9jaygmZHJtY2dfbXV0ZXgpOw0K
PiArCWRldi0+ZHJtY2dfcHJvcHMubWVtX3JlY2xhaW1fd3FbdHlwZV0gPSBOVUxMOw0KPiArCW11
dGV4X3VubG9jaygmZHJtY2dfbXV0ZXgpOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTChkcm1jZ191
bnJlZ2lzdGVyX2RldmljZV9tbSk7DQo+ICsNCj4gICAvKioNCj4gICAgKiBkcm1jZ190cnlfY2hn
X2JvX2FsbG9jIC0gY2hhcmdlIEdFTSBidWZmZXIgdXNhZ2UgZm9yIGEgZGV2aWNlIGFuZCBjZ3Jv
dXANCj4gICAgKiBAZHJtY2c6IHRoZSBEUk0gY2dyb3VwIHRvIGJlIGNoYXJnZWQgdG8NCj4gQEAg
LTEwMTMsNiArMTAzNiwxMyBAQCB2b2lkIGRybWNnX21lbV90cmFja19tb3ZlKHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqb2xkX2JvLCBib29sIGV2aWN0LA0KPiAgIA0KPiAgIAkJZGRyLT5tZW1f
Yndfc3RhdHNbRFJNQ0dfTUVNX0JXX0FUVFJfQllURV9DUkVESVRdDQo+ICAgCQkJLT0gbW92ZV9p
bl9ieXRlczsNCj4gKw0KPiArCQlpZiAoZGV2LT5kcm1jZ19wcm9wcy5tZW1fcmVjbGFpbV93cVtu
ZXdfbWVtX3R5cGVdDQo+ICsJCQkhPSBOVUxMICYmDQo+ICsJCQlkZHItPm1lbV9zdGF0c1tuZXdf
bWVtX3R5cGVdID4NCj4gKwkJCQlkZHItPm1lbV9oaWdoc1tuZXdfbWVtX3R5cGVdKQ0KPiArCQkJ
c2NoZWR1bGVfd29yayhkZXYtPg0KPiArCQkJCWRybWNnX3Byb3BzLm1lbV9yZWNsYWltX3dxW25l
d19tZW1fdHlwZV0pOw0KPiAgIAl9DQo+ICAgCW11dGV4X3VubG9jaygmZGV2LT5kcm1jZ19tdXRl
eCk7DQo+ICAgfQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
