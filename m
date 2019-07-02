Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E475D6F6
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 21:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD9E89FDD;
	Tue,  2 Jul 2019 19:35:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750041.outbound.protection.outlook.com [40.107.75.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165F889FDD
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 19:35:54 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2762.namprd12.prod.outlook.com (20.176.118.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 19:35:52 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 19:35:52 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/amdgpu: allow direct submission in the VM backends
Thread-Topic: [PATCH 1/5] drm/amdgpu: allow direct submission in the VM
 backends
Thread-Index: AQHVLauRJ9vT3/h9vkSKB2HDY/JAMKa3v10A
Date: Tue, 2 Jul 2019 19:35:52 +0000
Message-ID: <a6e1e599-d972-1dc0-e0e7-5201895dee35@amd.com>
References: <20190628121812.1400-1-christian.koenig@amd.com>
In-Reply-To: <20190628121812.1400-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::21) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6532bec2-cbbf-4123-7f3b-08d6ff247e1f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2762; 
x-ms-traffictypediagnostic: DM6PR12MB2762:
x-microsoft-antispam-prvs: <DM6PR12MB276263314A8E5F482F49F71092F80@DM6PR12MB2762.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(199004)(189003)(8676002)(52116002)(81156014)(86362001)(72206003)(53546011)(102836004)(31696002)(81166006)(2501003)(14454004)(7736002)(386003)(8936002)(76176011)(229853002)(305945005)(446003)(11346002)(476003)(2616005)(64126003)(65806001)(66574012)(486006)(14444005)(256004)(2906002)(26005)(186003)(6506007)(65826007)(25786009)(71190400001)(99286004)(71200400001)(316002)(31686004)(66066001)(5660300002)(68736007)(65956001)(6512007)(53936002)(58126008)(110136005)(478600001)(6116002)(3846002)(66946007)(66476007)(66556008)(64756008)(66446008)(36756003)(6246003)(6436002)(6486002)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2762;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sz5afBcl7xQTjo7Oy/vUstlJQgksd6gg1pBrpnTAQuOHBgDhcMt3Joz+lf4oslMqRw9S/1EAp46Gaq36octv0s2VL1PSfmyY3GxaJOvw5Y0E403Nu8tdKGbCOILQvZtVVPk4mXWHIxltMpgU8uBfE6uPbNHjhzrh6CuvlHzRHH0gv2hUPBhsRjHqwKGRRZJGJZZ6nQYifLDOd1d9W8EeGu7eRIWv6UKl+7iaZ57lPbR3hkgoqLDrizFweVtFdzNxAaPcxmzEICJxG7qYfSebpbFqUc7i+v6EojjtRuWzqliPpDVHhtVr5Fsl2kLNYN50Qg0t4z9+K/7sNGtwLTPFiH5k8qBBl4KuEki0NLpQuHbY+ek9gwRYeVQ3beZpZkpfJN0E2a+WTsrHUT4g9ApDzF6oInFqiI+9UtOnjSd2j2Y=
Content-ID: <CE03D667B67C3449913CDB7366E346C3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6532bec2-cbbf-4123-7f3b-08d6ff247e1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 19:35:52.1361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDi4vGI/nvyTV8y22FLDZaNMFeYxpL9XnoSbyRhoT0w=;
 b=q8yGVAX90+kR77wRWjCQYo1snNagnLhZj9pnRQV9UQVauqUKQgJXw1FcseX4Bp0F8CLT1nDqRW+If4zFiW/bdEGS0rEsYF2HbDLjP5jHOJe5LV52AG8f9IcUtqLdm9oJ8yJvPHYYEMFySa5qG2TRxYRSHMb8YuYepf3JxqEAUAA=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBhc3N1bWVzIHRoYXQgcGFnZSB0YWJsZXMgYXJlIHJlc2lkZW50IHdoZW4gYSBwYWdlIGZh
dWx0IGlzIGhhbmRsZWQuIA0KSSB0aGluayBpdCdzIHBvc3NpYmxlIHRoYXQgYSBwYWdlIHRhYmxl
IGdldHMgZXZpY3RlZCB3aGlsZSBhIHBhZ2UgZmF1bHQgDQppcyBwZW5kaW5nLiBNYXliZSBub3Qg
d2l0aCBncmFwaGljcywgYnV0IGRlZmluaXRlbHkgd2l0aCBjb21wdXRlIHdoZXJlIA0Kd2F2ZXMg
Y2FuIGJlIHByZWVtcHRlZCB3aGlsZSB3YWl0aW5nIGZvciBhIHBhZ2UgZmF1bHQuIEluIHRoYXQg
Y2FzZSB0aGUgDQpkaXJlY3QgYWNjZXNzIHdvdWxkIGJyZWFrLg0KDQpFdmVuIHdpdGggZ3JhcGhp
Y3MgSSB0aGluayBpdCdzIHN0aWxsIHBvc3NpYmxlIHRoYXQgbmV3IHBhZ2UgdGFibGVzIG5lZWQg
DQp0byBiZSBhbGxvY2F0ZWQgdG8gaGFuZGxlIGEgcGFnZSBmYXVsdC4gV2hlbiB0aGF0IGhhcHBl
bnMsIHlvdSBuZWVkIHRvIA0Kd2FpdCBmb3IgZmVuY2VzIHRvIGxldCBuZXcgcGFnZSB0YWJsZXMg
YmUgdmFsaWRhdGVkIGFuZCBpbml0aWFsaXplZC4NCg0KUGF0Y2ggIzIgZGVhbHMgd2l0aCB1cGRh
dGluZyBwYWdlIGRpcmVjdG9yaWVzLiBUaGF0IHByZXR0eSBtdWNoIGltcGxpZXMgDQp0aGF0IHBh
Z2UgdGFibGVzIGhhdmUgbW92ZWQgb3IgYmVlbiByZWFsbG9jYXRlZC4gV291bGRuJ3QgdGhhdCBi
ZSBhIA0KY291bnRlci1pbmRpY2F0aW9uIGZvciB1c2luZyBkaXJlY3QgcGFnZSB0YWJsZSB1cGRh
dGVzPyBJbiBvdGhlciB3b3JkcywgDQppZiB5b3UgbmVlZCB0byB1cGRhdGUgcGFnZSBkaXJlY3Rv
cmllcywgYSBkaXJlY3QgcGFnZSB0YWJsZSB1cGRhdGVzIGlzIA0KdW5zYWZlIGJ5IGRlZmluaXRp
b24uDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KT24gMjAxOS0wNi0yOCA4OjE4IGEubS4sIENo
cmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IFRoaXMgYWxsb3dzIHVzIHRvIHVwZGF0ZSBwYWdlIHRh
YmxlcyBkaXJlY3RseSB3aGlsZSBpbiBhIHBhZ2UgZmF1bHQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggICAgICB8ICA1ICsrKysNCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fY3B1LmMgIHwgIDQgKysrDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYyB8IDI5ICsrKysr
KysrKysrKystLS0tLS0tLQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5o
DQo+IGluZGV4IDQ4OWExNjJjYTYyMC4uNTk0MWFjY2VhMDYxIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaA0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaA0KPiBAQCAtMTk3LDYgKzE5NywxMSBAQCBzdHJ1Y3Qg
YW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgew0KPiAgIAkgKi8NCj4gICAJc3RydWN0IGFtZGdwdV92
bSAqdm07DQo+ICAgDQo+ICsJLyoqDQo+ICsJICogQGRpcmVjdDogaWYgY2hhbmdlcyBzaG91bGQg
YmUgbWFkZSBkaXJlY3RseQ0KPiArCSAqLw0KPiArCWJvb2wgZGlyZWN0Ow0KPiArDQo+ICAgCS8q
Kg0KPiAgIAkgKiBAcGFnZXNfYWRkcjoNCj4gICAJICoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9jcHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bV9jcHUuYw0KPiBpbmRleCA1MjIyZDE2NWFiZmMuLmY5NGU0ODk2MDc5
YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX2Nw
dS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bV9jcHUuYw0K
PiBAQCAtNDksNiArNDksMTAgQEAgc3RhdGljIGludCBhbWRncHVfdm1fY3B1X3ByZXBhcmUoc3Ry
dWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwLCB2b2lkICpvd25lciwNCj4gICB7DQo+ICAg
CWludCByOw0KPiAgIA0KPiArCS8qIERvbid0IHdhaXQgZm9yIGFueXRoaW5nIGR1cmluZyBwYWdl
IGZhdWx0ICovDQo+ICsJaWYgKHAtPmRpcmVjdCkNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4gICAJ
LyogV2FpdCBmb3IgUFQgQk9zIHRvIGJlIGlkbGUuIFBUcyBzaGFyZSB0aGUgc2FtZSByZXN2LiBv
YmplY3QNCj4gICAJICogYXMgdGhlIHJvb3QgUEQgQk8NCj4gICAJICovDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2RtYS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYw0KPiBpbmRleCBkZGQxODFmNWVkMzcu
Ljg5MWQ1OTcwNjNjYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZtX3NkbWEuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm1fc2RtYS5jDQo+IEBAIC02OCwxNyArNjgsMTcgQEAgc3RhdGljIGludCBhbWRncHVfdm1f
c2RtYV9wcmVwYXJlKHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcCwNCj4gICAJaWYg
KHIpDQo+ICAgCQlyZXR1cm4gcjsNCj4gICANCj4gLQlyID0gYW1kZ3B1X3N5bmNfZmVuY2UocC0+
YWRldiwgJnAtPmpvYi0+c3luYywgZXhjbHVzaXZlLCBmYWxzZSk7DQo+IC0JaWYgKHIpDQo+IC0J
CXJldHVybiByOw0KPiArCXAtPm51bV9kd19sZWZ0ID0gbmR3Ow0KPiArDQo+ICsJaWYgKHAtPmRp
cmVjdCkNCj4gKwkJcmV0dXJuIDA7DQo+ICAgDQo+IC0JciA9IGFtZGdwdV9zeW5jX3Jlc3YocC0+
YWRldiwgJnAtPmpvYi0+c3luYywgcm9vdC0+dGJvLnJlc3YsDQo+IC0JCQkgICAgIG93bmVyLCBm
YWxzZSk7DQo+ICsJciA9IGFtZGdwdV9zeW5jX2ZlbmNlKHAtPmFkZXYsICZwLT5qb2ItPnN5bmMs
IGV4Y2x1c2l2ZSwgZmFsc2UpOw0KPiAgIAlpZiAocikNCj4gICAJCXJldHVybiByOw0KPiAgIA0K
PiAtCXAtPm51bV9kd19sZWZ0ID0gbmR3Ow0KPiAtCXJldHVybiAwOw0KPiArCXJldHVybiBhbWRn
cHVfc3luY19yZXN2KHAtPmFkZXYsICZwLT5qb2ItPnN5bmMsIHJvb3QtPnRiby5yZXN2LA0KPiAr
CQkJCW93bmVyLCBmYWxzZSk7DQo+ICAgfQ0KPiAgIA0KPiAgIC8qKg0KPiBAQCAtOTksMTMgKzk5
LDIxIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX3NkbWFfY29tbWl0KHN0cnVjdCBhbWRncHVfdm1f
dXBkYXRlX3BhcmFtcyAqcCwNCj4gICAJc3RydWN0IGRtYV9mZW5jZSAqZjsNCj4gICAJaW50IHI7
DQo+ICAgDQo+IC0JcmluZyA9IGNvbnRhaW5lcl9vZihwLT52bS0+ZW50aXR5LnJxLT5zY2hlZCwg
c3RydWN0IGFtZGdwdV9yaW5nLCBzY2hlZCk7DQo+ICsJaWYgKHAtPmRpcmVjdCkNCj4gKwkJcmlu
ZyA9IHAtPmFkZXYtPnZtX21hbmFnZXIucGFnZV9mYXVsdDsNCj4gKwllbHNlDQo+ICsJCXJpbmcg
PSBjb250YWluZXJfb2YocC0+dm0tPmVudGl0eS5ycS0+c2NoZWQsDQo+ICsJCQkJICAgIHN0cnVj
dCBhbWRncHVfcmluZywgc2NoZWQpOw0KPiAgIA0KPiAgIAlXQVJOX09OKGliLT5sZW5ndGhfZHcg
PT0gMCk7DQo+ICAgCWFtZGdwdV9yaW5nX3BhZF9pYihyaW5nLCBpYik7DQo+ICAgCVdBUk5fT04o
aWItPmxlbmd0aF9kdyA+IHAtPm51bV9kd19sZWZ0KTsNCj4gLQlyID0gYW1kZ3B1X2pvYl9zdWJt
aXQocC0+am9iLCAmcC0+dm0tPmVudGl0eSwNCj4gLQkJCSAgICAgIEFNREdQVV9GRU5DRV9PV05F
Ul9WTSwgJmYpOw0KPiArDQo+ICsJaWYgKHAtPmRpcmVjdCkNCj4gKwkJciA9IGFtZGdwdV9qb2Jf
c3VibWl0X2RpcmVjdChwLT5qb2IsIHJpbmcsICZmKTsNCj4gKwllbHNlDQo+ICsJCXIgPSBhbWRn
cHVfam9iX3N1Ym1pdChwLT5qb2IsICZwLT52bS0+ZW50aXR5LA0KPiArCQkJCSAgICAgIEFNREdQ
VV9GRU5DRV9PV05FUl9WTSwgJmYpOw0KPiAgIAlpZiAocikNCj4gICAJCWdvdG8gZXJyb3I7DQo+
ICAgDQo+IEBAIC0xMjAsNyArMTI4LDYgQEAgc3RhdGljIGludCBhbWRncHVfdm1fc2RtYV9jb21t
aXQoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwLA0KPiAgIAlyZXR1cm4gcjsNCj4g
ICB9DQo+ICAgDQo+IC0NCj4gICAvKioNCj4gICAgKiBhbWRncHVfdm1fc2RtYV9jb3B5X3B0ZXMg
LSBjb3B5IHRoZSBQVEVzIGZyb20gbWFwcGluZw0KPiAgICAqDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
