Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E79E84FA0
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 17:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97796E72B;
	Wed,  7 Aug 2019 15:17:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690056.outbound.protection.outlook.com [40.107.69.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6281E6E72B
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 15:17:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VE6U9vXo/QtHFVEerZB+NZtQlYnh46fCdXdJ409bEmHJq3MqFO6l2jZZVNKK9zNeQ8NN2i/9Vf1aA0Iw7rK1L/HmvFK5WGZhVaCZTTgGjWej8hfOaFxSi0Vkmnt1hZk+HswttR0roor+O/c8CNWJUMRKeTaL0xlplyjiBO2OV9ht/vJH2fdvwnPWeyVqnoO22fbQa0356zYgfIKZuDJ44T4Kb7jCTuGi4aELCj/yE8uYv1288Gt+OFr6cVyfsM1ffGVdkDSU27sJ1XpETRDYQLRrZiLDTsBVsZ4CzSbqiyS/kOInqwvLYO/Aj+/pYfXDPTUZJqJ2zTj/Yudq5eAccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+lgTZck4+yEij0bKmOTU3l2RzdUlrVIHshEFHUivpo=;
 b=ibnwNoghv7WYVQXJ3V/DLwzL4+a1AXoNYE6f7TmX47XJPRv3DwBynEcNovBtLeSPb+HvSj740SFqSTfS/qzv7YIf7ETU0Tzi4eIMtBdnMIjyNrYtMl6hXPXQB7HKe+GOnM/EZMUA8X0I8ZSZoYYEY5+i8QWD4AGLy0mxw4JaoXCUDMfpTrRQ6j2R+93viGW2p7I8DLRzqe1a17ZaDbSJq0/uuhEWxOg2a1gzR4gGp6/6U0046IjgD8e2uI9RctZ6iKIwleYZ8SvybrGmNAkl2haihtckc/zChz/gjS/btpiq1XCfLyPzGQldzSwwRlckUSntE8TH6aYbYtx0iyQMpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2545.namprd12.prod.outlook.com (52.132.11.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 15:17:22 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 15:17:22 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 1/2] drm/amdgpu: Export function to flush TLB of specific
 vm hub
Thread-Topic: [PATCH 1/2] drm/amdgpu: Export function to flush TLB of specific
 vm hub
Thread-Index: AQHVSUvmAo7H+DIhNU2zNHDc6cD8iqbsUDAAgAKusiCAAGjbAIAAahrw
Date: Wed, 7 Aug 2019 15:17:21 +0000
Message-ID: <BL0PR12MB2580FE8417C1C4AB87F4679780D40@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <1564761834-19210-1-git-send-email-Oak.Zeng@amd.com>
 <855377a1-69ca-891e-1dad-5b93f57671da@gmail.com>
 <BL0PR12MB2580778BFD71E211AC18CFAF80D40@BL0PR12MB2580.namprd12.prod.outlook.com>
 <65784ad0-7693-9c98-82ee-66713c99f49b@gmail.com>
In-Reply-To: <65784ad0-7693-9c98-82ee-66713c99f49b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68e57602-37bb-4176-e216-08d71b4a588c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2545; 
x-ms-traffictypediagnostic: BL0PR12MB2545:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR12MB254503F96EC88A2D629FE6F580D40@BL0PR12MB2545.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(13464003)(189003)(199004)(486006)(6306002)(2906002)(6436002)(14454004)(66066001)(53936002)(229853002)(8676002)(81156014)(102836004)(6506007)(8936002)(256004)(76176011)(11346002)(99286004)(81166006)(52536014)(6636002)(53546011)(66574012)(4326008)(86362001)(5660300002)(55016002)(966005)(476003)(446003)(9686003)(2501003)(54906003)(66476007)(3846002)(6116002)(110136005)(76116006)(71200400001)(71190400001)(33656002)(25786009)(26005)(478600001)(66446008)(64756008)(7696005)(305945005)(66946007)(74316002)(66556008)(68736007)(316002)(6246003)(7736002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2545;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BUAu3ylZqqAm16pQqexZNG2rQn5JlDhc5pJT83BpMQGESWD3h40DD1kPExsdisePktUH0WZ8NRxOGHeJuMc/ue9h2hYYCJrXYR2JJLBX5osfcaw7BsTv7q7yW+mXxGLqmLNv3v0umyglIe+8vOW5WZsX43cwC14qE7acoWyOhbnuJg7Hcm3Bh9CGoP7t5LDKGMfd5RBlFtO4MOtwjj7TDlBMNzxgQBZn0uMsS08eMlR4Vien9bQGKdK01+h3npRBg04B90VUMfJvjK3uEKWG4noWkv51AadMDu7p0ScE/ga/gS/O7AuRl4ltrPy9LjlCweXO/xtGh7UEm/s3pk3ZmGvZyuEBNC+7DtOydGDwGSQzEd/ouEFh8R8lTxLpNsJWNTMswXX9eUQG57dPia5IuWLtrjljxeuH8BmJwiZjpCg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e57602-37bb-4176-e216-08d71b4a588c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 15:17:22.0164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2545
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+lgTZck4+yEij0bKmOTU3l2RzdUlrVIHshEFHUivpo=;
 b=IQKynd+bcLmmaJUsrfyrX2bToN1/By1xaQzBN0EAKKpAPA8L3EH86DDdaXNgTtDK51GFS143hUY5y4jphGBhPehhHTvTehdjZUpPhV8ATU/dJfrhfeCvc1s1y/2xLAJoj4CrA6RGZF6d0nKH6xAfUh5XdnOl5lQT0VZB1uzatE0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzLiBJIHJlYWxpemVkIEkgZGlkbid0IHJlYWQgdGhlIGNvZGUgY2FyZWZ1bCBlbm91Z2gu
Li5UaGUgd29ya2Fyb3VuZCBpcyBvbmx5IGZvciBuYXZpMTAgYW5kIG5hdmkxMiAtIEkgZGlkbid0
IHJlYWQgdGhpcyBjb3JyZWN0bHkgYW5kIHdhcyB0aGlua2luZyBnZnhodWIgdGxiIGludmFsaWRh
dGlvbiB3YXMgZG9uZSB0d2ljZS4NCg0KSSB1bmRlcnN0YW5kIHRoZSBjb2RlcyBub3cuIEkgdGhp
bmsgdGhlIEhXIFNETUEgYnVnIGhhcyBiZWVuIGZpeGVkIGluIG5hdmkxNCBzbyB3ZSBkb24ndCBu
ZWVkIHRoYXQgV0EgZm9yIDE0Lg0KDQpSZWdhcmRzLA0KT2FrDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2Vu
QGdtYWlsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCA3LCAyMDE5IDQ6NTEgQU0NClRv
OiBaZW5nLCBPYWsgPE9hay5aZW5nQGFtZC5jb20+OyBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQu
Y29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoYW5nLCBIYXdraW5nIDxIYXdr
aW5nLlpoYW5nQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+DQpDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyBMaXUsIFNoYW95
dW4gPFNoYW95dW4uTGl1QGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHJtL2Ft
ZGdwdTogRXhwb3J0IGZ1bmN0aW9uIHRvIGZsdXNoIFRMQiBvZiBzcGVjaWZpYyB2bSBodWINCg0K
PiBEb2VzIHRoZSBjb2RlZCBiZWxvdyBpbnZhbGlkYXRlIFRMQiBvbiBib3RoIG1tIGFuZCBnZngg
aHViPw0KTm8sIGp1c3QgdGhlIGdmeCBodWIuIFRoZSBWTUhVQnMgb24gTmF2aSBhcmUgdW5mb3J0
dW5hdGVseSByZWFsbHkgYnVnZ3ksIHNvIHdlIGhhZCB0byBkbyBhIGxvdCBvZiB3b3JrYXJvdW5k
cyB0byBnZXQgdGhlbSBpbnRvIGEgc3RhdGUgd2hlcmUgdGhleSBhY3R1YWxseSBkaWQgd2hhdCB3
YXMgZXhwZWN0ZWQgZnJvbSB0aGVtLg0KDQpPbmUgbWFqb3IgaXNzdWUgZm9yIGV4YW1wbGUgaXMg
dGhhdCB5b3UgY2FuJ3QgZG8gTU1JTyBiYXNlZCBWTSBpbnZhbGlkYXRpb24gd2hlbiB0aGUgZW5n
aW5lIGlzIGJ1c3kuIFRvIHdvcmsgYXJvdW5kIHRoaXMgd2UgZG8gdGhlIGludmFsaWRhdGlvbiB3
aXRoIHRoZSAoSUlSQykgU0RNQSBlbmdpbmUgYXMgc29vbiBhcyB0aGF0IG9uZSBpcyB3b3JraW5n
Lg0KDQpUaGUgaXMgdGhlIGNvZGUgeW91IGFyZSBub3RpbmcgYmVsb3cuDQoNClJlZ2FyZHMsDQpD
aHJpc3RpYW4uDQoNCkFtIDA3LjA4LjE5IHVtIDA0OjQwIHNjaHJpZWIgWmVuZywgT2FrOg0KPiBP
aywgd2lsbCBkbyBpdC4NCj4NCj4gQlRXLCBkb2VzIHRob3NlIGNvZGVzIGJlbG93IHJlYWxseSBu
ZWVkZWQsIGluIGZ1bmN0aW9uIA0KPiBnbWNfdjEwXzBfZmx1c2hfZ3B1X3RsYi4gSSB0aGluayBp
ZiB3ZSBoYXZlIHRoZSBidWcsIHRoZW4gYmVmb3JlIGJlbG93IA0KPiBjb2Rlcywgd2hlbiB3ZSBm
bHVzaCBUTEIgb2YgZ2Z4aHViIHRocm91Z2ggbW1pbywgaXQgaGFzIGFscmVhZHkgDQo+IHRyaWdn
ZXJlZCB0aGUgYnVnLiBBbHNvIGFzIHdlIGFscmVhZHkgaW52YWxpZGF0ZWQgdGxiIG9uIGJvdGgg
bW0gYW5kIA0KPiBnZnggaHViIChpbiB0aGUgc2FtZSBmdW5jdGlvbiBnbWNfdjEwXzBfZmx1c2hf
Z3B1X3RsYiksIHdoYXQgaXMgdGhlIA0KPiBwb2ludCBvZiBiZWxvdyBjb2Rlcz8gRG9lcyB0aGUg
Y29kZWQgYmVsb3cgaW52YWxpZGF0ZSBUTEIgb24gYm90aCBtbSANCj4gYW5kIGdmeCBodWI/IEFs
c28gQFpoYW5nLCBIYXdraW5nQERldWNoZXIsIEFsZXhhbmRlcg0KPg0KPiAJLyogVGhlIFNETUEg
b24gTmF2aSBoYXMgYSBidWcgd2hpY2ggY2FuIHRoZW9yZXRpY2FsbHkgcmVzdWx0IGluIG1lbW9y
eQ0KPiAJICogY29ycnVwdGlvbiBpZiBhbiBpbnZhbGlkYXRpb24gaGFwcGVucyBhdCB0aGUgc2Ft
ZSB0aW1lIGFzIGFuIFZBDQo+IAkgKiB0cmFuc2xhdGlvbi4gQXZvaWQgdGhpcyBieSBkb2luZyB0
aGUgaW52YWxpZGF0aW9uIGZyb20gdGhlIFNETUENCj4gCSAqIGl0c2VsZi4NCj4gCSAqLw0KPiAJ
ciA9IGFtZGdwdV9qb2JfYWxsb2Nfd2l0aF9pYihhZGV2LCAxNiAqIDQsICZqb2IpOw0KPiAJaWYg
KHIpDQo+IAkJZ290byBlcnJvcl9hbGxvYzsNCj4NCj4gCWpvYi0+dm1fcGRfYWRkciA9IGFtZGdw
dV9nbWNfcGRfYWRkcihhZGV2LT5nYXJ0LmJvKTsNCj4gCWpvYi0+dm1fbmVlZHNfZmx1c2ggPSB0
cnVlOw0KPiAJYW1kZ3B1X3JpbmdfcGFkX2liKHJpbmcsICZqb2ItPmlic1swXSk7DQo+IAlyID0g
YW1kZ3B1X2pvYl9zdWJtaXQoam9iLCAmYWRldi0+bW1hbi5lbnRpdHksDQo+IAkJCSAgICAgIEFN
REdQVV9GRU5DRV9PV05FUl9VTkRFRklORUQsICZmZW5jZSk7DQo+DQo+IFJlZ2FyZHMsDQo+IE9h
aw0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJpc3RpYW4gS8O2
bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBB
dWd1c3QgNSwgMjAxOSA1OjM3IEFNDQo+IFRvOiBaZW5nLCBPYWsgPE9hay5aZW5nQGFtZC5jb20+
OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogS3VlaGxpbmcsIEZlbGl4IDxG
ZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgWmhvdTEsIFRhbyANCj4gPFRhby5aaG91MUBhbWQuY29t
PjsgTGl1LCBTaGFveXVuIDxTaGFveXVuLkxpdUBhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEvMl0gZHJtL2FtZGdwdTogRXhwb3J0IGZ1bmN0aW9uIHRvIGZsdXNoIFRMQiBvZiANCj4g
c3BlY2lmaWMgdm0gaHViDQo+DQo+IEFtIDAyLjA4LjE5IHVtIDE4OjA0IHNjaHJpZWIgWmVuZywg
T2FrOg0KPj4gVGhpcyBpcyBmb3Iga2ZkIHRvIHJldXNlIGFtZGdwdSBUTEIgaW52YWxpZGF0aW9u
IGZ1bmN0aW9uLiBUaGVyZSBpcyANCj4+IGFscmVhZHkgYSBnbWMgZnVuY3Rpb24gZmx1c2hfZ3B1
X3RsYiB0byBmbHVzaCBUTEIgb24gYWxsIHZtIGh1Yi4gT24gDQo+PiBnZngxMCwga2ZkIG9ubHkg
bmVlZHMgdG8gZmx1c2ggVExCIG9uIGdmeCBodWIgYnV0IG5vdCBvbiBtbSBodWIuIFNvIA0KPj4g
ZXhwb3J0IGEgZnVuY3Rpb24gZm9yIEtGRCBmbHVzaCBUTEIgb25seSBvbiBnZnggaHViLg0KPiBJ
IHdvdWxkIHJhdGhlciBnbyBhaGVhZCBhbmQgYWRkIGFub3RoZXIgcGFyYW1ldGVyIHRvIGZsdXNo
X2dwdV90bGIgdG8gbm90ZSB3aGljaCBodWIgbmVlZHMgZmx1c2hpbmcuDQo+DQo+IFdlIGNhbiBw
cm9iYWJseSBlYXNpbHkgZXh0ZW5kIHRoZSBmZXcgY2FsbGVycyB0byBmbHVzaCBhbGwgaHVicyBu
ZWVkZWQuDQo+DQo+IENocmlzdGlhbi4NCj4NCj4+IENoYW5nZS1JZDogSTU4ZmYwMDk2OWY4ODQz
OGNmZDNkYzdlOWRlYjdiZmYwYzFiYjQxMzMNCj4+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxP
YWsuWmVuZ0BhbWQuY29tPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ21jLmggfCA0ICsrKysNCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192MTBfMC5jICB8IDEgKw0KPj4gICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dtYy5oDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaA0KPj4g
aW5kZXggMDcxMTQ1YS4uMGJkNGE0ZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nbWMuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dtYy5oDQo+PiBAQCAtODgsNiArODgsOSBAQCBzdHJ1Y3QgYW1kZ3B1X3ZtaHVi
IHsNCj4+ICAgICAqIEdQVSBNQyBzdHJ1Y3R1cmVzLCBmdW5jdGlvbnMgJiBoZWxwZXJzDQo+PiAg
ICAgKi8NCj4+ICAgIHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIHsNCj4+ICsJLyogZmx1c2ggdm0g
dGxiIG9mIHNwZWNpZmljIGh1YiAqLw0KPj4gKwl2b2lkICgqZmx1c2hfdm1faHViKShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwNCj4+ICsJCQkJICAgdW5zaWduZWQg
aW50IHZtaHViLCB1aW50MzJfdCBmbHVzaF90eXBlKTsNCj4+ICAgIAkvKiBmbHVzaCB0aGUgdm0g
dGxiIHZpYSBtbWlvICovDQo+PiAgICAJdm9pZCAoKmZsdXNoX2dwdV90bGIpKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LA0KPj4gICAgCQkJICAgICAgdWludDMyX3Qgdm1pZCwgdWludDMyX3Qg
Zmx1c2hfdHlwZSk7IEBAIC0xODAsNiArMTgzLDcgQEAgDQo+PiBzdHJ1Y3QgYW1kZ3B1X2dtYyB7
DQo+PiAgICAJc3RydWN0IHJhc19jb21tb25faWYgICAgKnJhc19pZjsNCj4+ICAgIH07DQo+PiAg
ICANCj4+ICsjZGVmaW5lIGFtZGdwdV9nbWNfZmx1c2hfdm1faHViKGFkZXYsIHZtaWQsIHZtaHVi
LCB0eXBlKSANCj4+ICsoKGFkZXYpLT5nbWMuZ21jX2Z1bmNzLT5mbHVzaF92bV9odWIoKGFkZXYp
LCAodm1pZCksICh2bWh1YiksDQo+PiArKHR5cGUpKSkNCj4+ICAgICNkZWZpbmUgYW1kZ3B1X2dt
Y19mbHVzaF9ncHVfdGxiKGFkZXYsIHZtaWQsIHR5cGUpIChhZGV2KS0+Z21jLmdtY19mdW5jcy0+
Zmx1c2hfZ3B1X3RsYigoYWRldiksICh2bWlkKSwgKHR5cGUpKQ0KPj4gICAgI2RlZmluZSBhbWRn
cHVfZ21jX2VtaXRfZmx1c2hfZ3B1X3RsYihyLCB2bWlkLCBhZGRyKSAociktPmFkZXYtPmdtYy5n
bWNfZnVuY3MtPmVtaXRfZmx1c2hfZ3B1X3RsYigociksICh2bWlkKSwgKGFkZHIpKQ0KPj4gICAg
I2RlZmluZSBhbWRncHVfZ21jX2VtaXRfcGFzaWRfbWFwcGluZyhyLCB2bWlkLCBwYXNpZCkgDQo+
PiAociktPmFkZXYtPmdtYy5nbWNfZnVuY3MtPmVtaXRfcGFzaWRfbWFwcGluZygociksICh2bWlk
KSwgKHBhc2lkKSkgDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3YxMF8wLmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMN
Cj4+IGluZGV4IDRlM2FjMTAuLjI0NzUxNWQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3YxMF8wLmMNCj4+IEBAIC00MTYsNiArNDE2LDcgQEAgc3RhdGljIHZvaWQgZ21j
X3YxMF8wX2dldF92bV9wZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBsZXZlbCwN
Cj4+ICAgIH0NCj4+ICAgIA0KPj4gICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1
bmNzIGdtY192MTBfMF9nbWNfZnVuY3MgPSB7DQo+PiArCS5mbHVzaF92bV9odWIgPSBnbWNfdjEw
XzBfZmx1c2hfdm1faHViLA0KPj4gICAgCS5mbHVzaF9ncHVfdGxiID0gZ21jX3YxMF8wX2ZsdXNo
X2dwdV90bGIsDQo+PiAgICAJLmVtaXRfZmx1c2hfZ3B1X3RsYiA9IGdtY192MTBfMF9lbWl0X2Zs
dXNoX2dwdV90bGIsDQo+PiAgICAJLmVtaXRfcGFzaWRfbWFwcGluZyA9IGdtY192MTBfMF9lbWl0
X3Bhc2lkX21hcHBpbmcsDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
