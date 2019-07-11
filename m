Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B04D65891
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 16:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CE06E153;
	Thu, 11 Jul 2019 14:12:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800058.outbound.protection.outlook.com [40.107.80.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094DC6E153
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 14:12:54 +0000 (UTC)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (52.132.141.147) by
 DM5PR12MB2390.namprd12.prod.outlook.com (52.132.141.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 11 Jul 2019 14:12:52 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::900b:8d66:43ba:8b3d]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::900b:8d66:43ba:8b3d%4]) with mapi id 15.20.2073.008; Thu, 11 Jul 2019
 14:12:52 +0000
From: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: fix cp hang in eviction
Thread-Topic: [PATCH] drm/amdkfd: fix cp hang in eviction
Thread-Index: AQHVNzMOyh0y41xtzkOlOnqCEyNiHKbFdwsA
Date: Thu, 11 Jul 2019 14:12:52 +0000
Message-ID: <e10bc9ec-a35c-b397-9f1f-acc333cee846@amd.com>
References: <1562772046-7681-1-git-send-email-JinhuiEric.Huang@amd.com>
In-Reply-To: <1562772046-7681-1-git-send-email-JinhuiEric.Huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::41) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ef30677-5252-49ab-175c-08d70609dc86
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2390; 
x-ms-traffictypediagnostic: DM5PR12MB2390:
x-microsoft-antispam-prvs: <DM5PR12MB2390F713F08EACFBE9DCFB3F82F30@DM5PR12MB2390.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(189003)(199004)(7736002)(11346002)(53936002)(26005)(5640700003)(478600001)(31686004)(186003)(99286004)(65826007)(66946007)(256004)(14454004)(14444005)(446003)(316002)(6436002)(2616005)(2351001)(25786009)(58126008)(3846002)(6512007)(305945005)(68736007)(476003)(8676002)(64756008)(486006)(52116002)(71190400001)(386003)(86362001)(6916009)(36756003)(2501003)(102836004)(31696002)(66556008)(2906002)(6246003)(76176011)(65956001)(6116002)(8936002)(229853002)(66066001)(65806001)(66476007)(64126003)(5660300002)(6486002)(53546011)(71200400001)(6506007)(81156014)(4326008)(81166006)(66446008)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2390;
 H:DM5PR12MB2504.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s8ZQn7bG97NP3jpzaYN4teX/A0gqfUbkn8MCQCEWk+KLKWa5tXiiyFAxSp58lHTazz11456xqLrdkBfYM/TpxKZcwsWQtm3LPCBwVWmm76imbhxE1VSM4+f89mFSWTNPLbg6ZV6VDYJpsB5Zzen4Vw9JVMEbkWi95vOzqdHssQtSB7EuPstovtWI2tIaHfqx6yBaYlXVsCkeah+yQtDdmtUr/tNMHQzeSOg+oSzoRoQMrlQdwPPvYVSB3aPU5gOVXnJxXjpeg9LrZN/tyD6LPx8TpytxorSmuI9MZUOpL6OJPQJlRwzZe6hp5WrYGcjVDvd2wMd2usTHbULEizHrqLFZawCEtM8C4gslDTn2xB7FPVxMSAqaMcn6aLitvFF1X6+arQw/VbMAJr66YN5R8MM+1+LrIh0Bs1QsE3TNoC0=
Content-ID: <459751D4C82A7640A8F81203272F4307@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef30677-5252-49ab-175c-08d70609dc86
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 14:12:52.3330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jinhuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2390
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+ER42g97DTo2HEQQF29X4y6esVfVCbF2KQt1bpOeaA=;
 b=Ch/FM2DiWq/1GI6nXhFZ7Zr76EokOE9JIxckNwprly5p8+rQXIe8Chs6BbID6/1anDMRK9zisyMZWjEmJ/FUFvUgp08DB/RxkcXeOYBo8rMzmNlBcMrdonigPgOJYO5tECrXcXPmr+rJjOJwCom3djU3GeZBNPCtvDe1bqy0VbY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=JinHuiEric.Huang@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cGluZy4NCg0KT24gMjAxOS0wNy0xMCAxMToyMCBhLm0uLCBIdWFuZywgSmluSHVpRXJpYyB3cm90
ZToNCj4gVGhlIGNwIGhhbmcgb2NjdXJzIGluIE9DTCBjb25mb3JtYW5jZSB0ZXN0IG9ubHkgb24g
c3VwZXJtaWNybw0KPiBwbGF0Zm9ybSB3aGljaCBoYXMgNDAgY29yZXMgYW5kIHRoZSB0ZXN0IGdl
bmVyYXRlcyA0MCB0aHJlYWRzLg0KPiBUaGUgcm9vdCBjYXVzZSBpcyByYWNlIGNvbmRpdGlvbiBp
biBub24tcHJvdGVjdGVkIGZsYWdzLg0KPg0KPiBUaGUgZml4IGlzIHRvIGFkZCBmbGFncyBvZiBp
c19ldmljdGVkIGFuZCBpc19hY3RpdmUoaW5pdF9tcWQoKSkNCj4gaW50byBwcm90ZWN0ZWQgYXJl
YS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogRXJpYyBIdWFuZyA8SmluaHVpRXJpYy5IdWFuZ0BhbWQu
Y29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1
ZXVlX21hbmFnZXIuYyB8IDE2ICsrKysrKysrKy0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiBpbmRleCA5
ZmZkZGE1Li5mMjNlMTdiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiBAQCAtMTE1NywxMiArMTE1Nyw3
IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3F1ZXVlX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFu
YWdlciAqZHFtLCBzdHJ1Y3QgcXVldWUgKnEsDQo+ICAgDQo+ICAgCW1xZF9tZ3IgPSBkcW0tPm1x
ZF9tZ3JzW2dldF9tcWRfdHlwZV9mcm9tX3F1ZXVlX3R5cGUoDQo+ICAgCQkJcS0+cHJvcGVydGll
cy50eXBlKV07DQo+IC0JLyoNCj4gLQkgKiBFdmljdGlvbiBzdGF0ZSBsb2dpYzogbWFyayBhbGwg
cXVldWVzIGFzIGV2aWN0ZWQsIGV2ZW4gb25lcw0KPiAtCSAqIG5vdCBjdXJyZW50bHkgYWN0aXZl
LiBSZXN0b3JpbmcgaW5hY3RpdmUgcXVldWVzIGxhdGVyIG9ubHkNCj4gLQkgKiB1cGRhdGVzIHRo
ZSBpc19ldmljdGVkIGZsYWcgYnV0IGlzIGEgbm8tb3Agb3RoZXJ3aXNlLg0KPiAtCSAqLw0KPiAt
CXEtPnByb3BlcnRpZXMuaXNfZXZpY3RlZCA9ICEhcXBkLT5ldmljdGVkOw0KPiArDQo+ICAgCWlm
IChxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQSB8fA0KPiAgIAkJcS0+
cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUFfWEdNSSkNCj4gICAJCWRxbS0+
YXNpY19vcHMuaW5pdF9zZG1hX3ZtKGRxbSwgcSwgcXBkKTsNCj4gQEAgLTExNzMsOSArMTE2OCwx
NiBAQCBzdGF0aWMgaW50IGNyZWF0ZV9xdWV1ZV9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21h
bmFnZXIgKmRxbSwgc3RydWN0IHF1ZXVlICpxLA0KPiAgIAkJcmV0dmFsID0gLUVOT01FTTsNCj4g
ICAJCWdvdG8gb3V0X2RlYWxsb2NhdGVfZG9vcmJlbGw7DQo+ICAgCX0NCj4gKw0KPiArCWRxbV9s
b2NrKGRxbSk7DQo+ICsJLyoNCj4gKwkgKiBFdmljdGlvbiBzdGF0ZSBsb2dpYzogbWFyayBhbGwg
cXVldWVzIGFzIGV2aWN0ZWQsIGV2ZW4gb25lcw0KPiArCSAqIG5vdCBjdXJyZW50bHkgYWN0aXZl
LiBSZXN0b3JpbmcgaW5hY3RpdmUgcXVldWVzIGxhdGVyIG9ubHkNCj4gKwkgKiB1cGRhdGVzIHRo
ZSBpc19ldmljdGVkIGZsYWcgYnV0IGlzIGEgbm8tb3Agb3RoZXJ3aXNlLg0KPiArCSAqLw0KPiAr
CXEtPnByb3BlcnRpZXMuaXNfZXZpY3RlZCA9ICEhcXBkLT5ldmljdGVkOw0KPiAgIAltcWRfbWdy
LT5pbml0X21xZChtcWRfbWdyLCAmcS0+bXFkLCBxLT5tcWRfbWVtX29iaiwNCj4gICAJCQkJJnEt
PmdhcnRfbXFkX2FkZHIsICZxLT5wcm9wZXJ0aWVzKTsNCj4gLQlkcW1fbG9jayhkcW0pOw0KPiAg
IA0KPiAgIAlsaXN0X2FkZCgmcS0+bGlzdCwgJnFwZC0+cXVldWVzX2xpc3QpOw0KPiAgIAlxcGQt
PnF1ZXVlX2NvdW50Kys7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
