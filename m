Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9037DF9
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FC8897D4;
	Thu,  6 Jun 2019 20:17:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690088.outbound.protection.outlook.com [40.107.69.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CE0897D4
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:17:45 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3178.namprd12.prod.outlook.com (20.179.104.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 20:17:44 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 20:17:44 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/amdkfd: Fix sdma queue allocate race condition
Thread-Topic: [PATCH 6/6] drm/amdkfd: Fix sdma queue allocate race condition
Thread-Index: AQHVHJUy22pJMkh/5kCX3tBB6djGyqaPEJ6A
Date: Thu, 6 Jun 2019 20:17:43 +0000
Message-ID: <85e5bc85-7b5f-6e57-3d29-9d649f748a4a@amd.com>
References: <1559845507-3052-1-git-send-email-Oak.Zeng@amd.com>
 <1559845507-3052-3-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559845507-3052-3-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::24) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1d5ddd2-8a25-433c-99f8-08d6eabc086f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3178; 
x-ms-traffictypediagnostic: DM6PR12MB3178:
x-microsoft-antispam-prvs: <DM6PR12MB3178BA05261FD19E69A6A68592170@DM6PR12MB3178.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(366004)(396003)(136003)(51234002)(189003)(199004)(66066001)(65956001)(65826007)(14444005)(256004)(65806001)(53936002)(6486002)(102836004)(71190400001)(6512007)(8936002)(5660300002)(71200400001)(86362001)(2906002)(31696002)(26005)(36756003)(7736002)(72206003)(3846002)(6116002)(478600001)(305945005)(6436002)(476003)(11346002)(446003)(25786009)(14454004)(486006)(64756008)(66946007)(31686004)(66446008)(73956011)(66476007)(66556008)(186003)(68736007)(2616005)(316002)(4326008)(6246003)(64126003)(2501003)(386003)(6506007)(81166006)(81156014)(53546011)(229853002)(58126008)(54906003)(99286004)(52116002)(8676002)(76176011)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3178;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6DAGHUVQeioaeptUX/YuQ5PrsDGIqpc1PUL4QUd884Pqi9pF7DzNlQ1xUqnQFGlTxznx+u6ctlPHRQi7Kgnf4rqZ6evL7wWBl/OjlKUMiugx+LfEm7RNQ/+++p4nn9A66uXv7GfaaucATpboy7D0hHi2v8qlRA1/WN0ncnQ8yW3hqMLmE8v+Ru7j9rhFALmwpiL00lWyk4MEjcoGlH+zdjsaCzcHal2S8QOFTyQXG6bNUqIJ0V5pbglYTdzfPRfWIuEdo3jzarM8tRRshssRm3OlJg9xivHRhTKb8rFNwx5nVvLbIxp2SDQdGqKKGqrgrtxbptINqhu3aBYwtU5Czd/DKCg7+0Jlzoe35OSZgHOS1h4WhQmJfPq/YBm15IjtMZmuNuMKyzIDuSq3PJ+R5unZkD/og/HnWn7yS3Hc/+8=
Content-ID: <2B13A656842518419571AE8F6F2E8238@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d5ddd2-8a25-433c-99f8-08d6eabc086f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 20:17:43.8705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3178
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dENaLiWc6UqrBFg8F52/EdMMNwGTXNWGBsiQ3pTXiw=;
 b=nDnLEZozMKssrmQ3a9FuTpkab+0eGxO8f3vE9WUvWRMt1INQw7WGNNMDt/4xuDK3NlOGt7K1wBwKnJaoqdYrROphou55+i/EC/jvuNtdnYjcv+aATDj/ewHDB9gAIJ0pVZtyZP2YbcvwfD5wxY2PN5WwXSeQLKMjPDVmevoWdAs=
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

UGF0Y2hlcyA1IGFuZCA2IGFyZSBSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+DQoNCk9uIDIwMTktMDYtMDYgMjoyNSBwLm0uLCBaZW5nLCBPYWsgd3Jv
dGU6DQo+IFNETUEgcXVldWUgYWxsb2NhdGlvbiByZXF1aXJlcyB0aGUgZHFtIGxvY2sgYXQgaXQg
bW9kaWZ5DQo+IHRoZSBnbG9iYWwgZHFtIG1lbWJlcnMuIE1vdmUgdXAgdGhlIGRxbV9sb2NrIHNv
IHNkbWENCj4gcXVldWUgYWxsb2NhdGlvbiBpcyBlbmNsb3NlZCBpbiB0aGUgY3JpdGljYWwgc2Vj
dGlvbi4gTW92ZQ0KPiBtcWQgYWxsb2NhdGlvbiBvdXQgb2YgY3JpdGljYWwgc2VjdGlvbiB0byBh
dm9pZCBjaXJjdWxhcg0KPiBsb2NrIGRlcGVuZGVuY3kuDQo+DQo+IENoYW5nZS1JZDogSTk2YWJk
NDJlYWU2ZTc3YzgyYTViYTFiOGU2MDBhZjNlZmU4ZDc5MWQNCj4gU2lnbmVkLW9mZi1ieTogT2Fr
IFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIC4uLi9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgIHwgMjQgKysrKysrKysrKystLS0tLS0tLS0t
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Vf
cXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9x
dWV1ZV9tYW5hZ2VyLmMNCj4gaW5kZXggMTY2NjM2Yy4uY2QyNTliOCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2Vy
LmMNCj4gQEAgLTExMzMsMjMgKzExMzMsMjcgQEAgc3RhdGljIGludCBjcmVhdGVfcXVldWVfY3Bz
Y2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sIHN0cnVjdCBxdWV1ZSAqcSwNCj4g
ICAJaWYgKGRxbS0+dG90YWxfcXVldWVfY291bnQgPj0gbWF4X251bV9vZl9xdWV1ZXNfcGVyX2Rl
dmljZSkgew0KPiAgIAkJcHJfd2FybigiQ2FuJ3QgY3JlYXRlIG5ldyB1c2VybW9kZSBxdWV1ZSBi
ZWNhdXNlICVkIHF1ZXVlcyB3ZXJlIGFscmVhZHkgY3JlYXRlZFxuIiwNCj4gICAJCQkJZHFtLT50
b3RhbF9xdWV1ZV9jb3VudCk7DQo+IC0JCXJldHZhbCA9IC1FUEVSTTsNCj4gLQkJZ290byBvdXQ7
DQo+ICsJCXJldHVybiAtRVBFUk07DQo+ICAgCX0NCj4gICANCj4gKwltcWRfbWdyID0gZHFtLT5t
cWRfbWdyc1tnZXRfbXFkX3R5cGVfZnJvbV9xdWV1ZV90eXBlKA0KPiArCQkJcS0+cHJvcGVydGll
cy50eXBlKV07DQo+ICsJcS0+bXFkX21lbV9vYmogPSBtcWRfbWdyLT5hbGxvY2F0ZV9tcWQobXFk
X21nci0+ZGV2LCAmcS0+cHJvcGVydGllcyk7DQo+ICsJaWYgKCFxLT5tcWRfbWVtX29iaikNCj4g
KwkJcmV0dXJuIC1FTk9NRU07DQo+ICsNCj4gKwlkcW1fbG9jayhkcW0pOw0KPiAgIAlpZiAocS0+
cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUEgfHwNCj4gICAJCXEtPnByb3Bl
cnRpZXMudHlwZSA9PSBLRkRfUVVFVUVfVFlQRV9TRE1BX1hHTUkpIHsNCj4gICAJCXJldHZhbCA9
IGFsbG9jYXRlX3NkbWFfcXVldWUoZHFtLCBxKTsNCj4gICAJCWlmIChyZXR2YWwpDQo+IC0JCQln
b3RvIG91dDsNCj4gKwkJCWdvdG8gb3V0X3VubG9jazsNCj4gICAJfQ0KPiAgIA0KPiAgIAlyZXR2
YWwgPSBhbGxvY2F0ZV9kb29yYmVsbChxcGQsIHEpOw0KPiAgIAlpZiAocmV0dmFsKQ0KPiAgIAkJ
Z290byBvdXRfZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlOw0KPiAgIA0KPiAtCW1xZF9tZ3IgPSBkcW0t
Pm1xZF9tZ3JzW2dldF9tcWRfdHlwZV9mcm9tX3F1ZXVlX3R5cGUoDQo+IC0JCQlxLT5wcm9wZXJ0
aWVzLnR5cGUpXTsNCj4gICAJLyoNCj4gICAJICogRXZpY3Rpb24gc3RhdGUgbG9naWM6IG1hcmsg
YWxsIHF1ZXVlcyBhcyBldmljdGVkLCBldmVuIG9uZXMNCj4gICAJICogbm90IGN1cnJlbnRseSBh
Y3RpdmUuIFJlc3RvcmluZyBpbmFjdGl2ZSBxdWV1ZXMgbGF0ZXIgb25seQ0KPiBAQCAtMTE2MSwx
MiArMTE2NSw4IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3F1ZXVlX2Nwc2NoKHN0cnVjdCBkZXZpY2Vf
cXVldWVfbWFuYWdlciAqZHFtLCBzdHJ1Y3QgcXVldWUgKnEsDQo+ICAgCQlkcW0tPmFzaWNfb3Bz
LmluaXRfc2RtYV92bShkcW0sIHEsIHFwZCk7DQo+ICAgCXEtPnByb3BlcnRpZXMudGJhX2FkZHIg
PSBxcGQtPnRiYV9hZGRyOw0KPiAgIAlxLT5wcm9wZXJ0aWVzLnRtYV9hZGRyID0gcXBkLT50bWFf
YWRkcjsNCj4gLQlxLT5tcWRfbWVtX29iaiA9IG1xZF9tZ3ItPmFsbG9jYXRlX21xZChtcWRfbWdy
LT5kZXYsICZxLT5wcm9wZXJ0aWVzKTsNCj4gLQlpZiAoIXEtPm1xZF9tZW1fb2JqKQ0KPiAtCQln
b3RvIG91dF9kZWFsbG9jYXRlX2Rvb3JiZWxsOw0KPiAgIAltcWRfbWdyLT5pbml0X21xZChtcWRf
bWdyLCAmcS0+bXFkLCBxLT5tcWRfbWVtX29iaiwNCj4gICAJCQkJJnEtPmdhcnRfbXFkX2FkZHIs
ICZxLT5wcm9wZXJ0aWVzKTsNCj4gLQlkcW1fbG9jayhkcW0pOw0KPiAgIA0KPiAgIAlsaXN0X2Fk
ZCgmcS0+bGlzdCwgJnFwZC0+cXVldWVzX2xpc3QpOw0KPiAgIAlxcGQtPnF1ZXVlX2NvdW50Kys7
DQo+IEBAIC0xMTkyLDEzICsxMTkyLDEzIEBAIHN0YXRpYyBpbnQgY3JlYXRlX3F1ZXVlX2Nwc2No
KHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLCBzdHJ1Y3QgcXVldWUgKnEsDQo+ICAg
CWRxbV91bmxvY2soZHFtKTsNCj4gICAJcmV0dXJuIHJldHZhbDsNCj4gICANCj4gLW91dF9kZWFs
bG9jYXRlX2Rvb3JiZWxsOg0KPiAtCWRlYWxsb2NhdGVfZG9vcmJlbGwocXBkLCBxKTsNCj4gICBv
dXRfZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlOg0KPiAgIAlpZiAocS0+cHJvcGVydGllcy50eXBlID09
IEtGRF9RVUVVRV9UWVBFX1NETUEgfHwNCj4gICAJCXEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRf
UVVFVUVfVFlQRV9TRE1BX1hHTUkpDQo+ICAgCQlkZWFsbG9jYXRlX3NkbWFfcXVldWUoZHFtLCBx
KTsNCj4gLW91dDoNCj4gK291dF91bmxvY2s6DQo+ICsJZHFtX3VubG9jayhkcW0pOw0KPiArCW1x
ZF9tZ3ItPmZyZWVfbXFkKG1xZF9tZ3IsIHEtPm1xZCwgcS0+bXFkX21lbV9vYmopOw0KPiAgIAly
ZXR1cm4gcmV0dmFsOw0KPiAgIH0NCj4gICANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
