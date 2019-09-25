Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3768BE48E
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 20:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4D56ED58;
	Wed, 25 Sep 2019 18:25:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700089.outbound.protection.outlook.com [40.107.70.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305F16ED58
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 18:25:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWddbLsuTS/1YzgSmWdiEZdAl0p0GVCdPdrgoAK1JqrkPn6fb5irx5YodOwmnq7q4wJi93lKkENgLlfeDkSCTCMhuQ49p1liwHKl7r/NKEkXw2PPYgZF7qHDTThN1fOhMPTzCs2Ex+jlB9OgpmHo03jthR7gjk4Gz2eWcb/gyoM82+j2JQIYf0j6Mcy5IJGDvEBmMXDAk2ijjs4WxHaNZbs/9ZYmwnn8HVnAwb83clFD5So1impBjTFUugQcmtBduDcnkQzpQpA5j8YiJcFSEaBsm5OjTHxpvwfNDuSDu/g51dwQXTILTv8c+76VHVHfZAn+knSeFsczF5Qvl/x6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/XFTZh8jq1t6Pdn6ZaAQ98bFU4BeNNns2HGDe4mZVA=;
 b=g+XuLgIQX6sKmpE2VSHDN9DeW0bi+/n5xnY/5++racRUeiwmEQ60NM7tEbXvMFeUhO9iAg8daHixHls4B+f/ZfPgMGfNZ9+WGDuKpua87RIG28OESfFZYlt6NYLUHxaVP+4pG4MdgeCyO6sU3/TcNWKvzb5RttMlKvlK3SIdeYAN7/9sMXiTTtbkI5419cNg4Ddn8bL/cx3Sqd+RAtPmFc9qb1DWSsx0DSGtGUW7hZKH9+yWbRhoRzWQ4XQ9oMmWzcsTdsqnw16Bi4trQRKoXmbQ1TbF5QeWna6g54HNafZWJOoWHccTrKFX8iZNCS2CS8/0LOpXP17Vn2mqIYZlvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4027.namprd12.prod.outlook.com (10.255.175.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Wed, 25 Sep 2019 18:25:43 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 18:25:43 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/amdkfd: Remove the control stack workaround for
 GFX10
Thread-Topic: [PATCH 3/3] drm/amdkfd: Remove the control stack workaround for
 GFX10
Thread-Index: AQHVc81D1t9sA71ODUCC2huHrgs+Cac8tawA
Date: Wed, 25 Sep 2019 18:25:43 +0000
Message-ID: <3d63ddfd-2773-b89d-c0dc-75ac1397b1fc@amd.com>
References: <20190925181527.17091-1-Yong.Zhao@amd.com>
 <20190925181527.17091-3-Yong.Zhao@amd.com>
In-Reply-To: <20190925181527.17091-3-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::21)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5f4c20d-b40e-4d92-6add-08d741e5c6bb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4027; 
x-ms-traffictypediagnostic: DM6PR12MB4027:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4027504D83C1E8164FE324F992870@DM6PR12MB4027.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(189003)(199004)(229853002)(76176011)(486006)(31696002)(2501003)(8936002)(52116002)(31686004)(71190400001)(71200400001)(66476007)(99286004)(8676002)(66946007)(6246003)(66556008)(64756008)(66446008)(66066001)(6512007)(6436002)(86362001)(81166006)(81156014)(316002)(25786009)(6486002)(36756003)(2906002)(305945005)(7736002)(3846002)(6116002)(65956001)(256004)(14444005)(102836004)(65806001)(26005)(478600001)(110136005)(386003)(6506007)(58126008)(11346002)(5660300002)(446003)(2616005)(14454004)(53546011)(186003)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4027;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J59o0T0Dqu/wU2cbeWW7ww+xlP9VSo2NynfYp4Sn50qFx/UeQScq7xtY0/TBHhY+99f7I/VXd6hzSzi/v5G59UGckZNl/MndrI45sRsboFIqfgfv1ioy8ePms4NCDdjw+dX79RUw3HP9dUfXf1PmYZqnkMX9jeal8HFLVIRS/m9XVARzmZiZSyAY5yyzcLlVJ+yUJMfFxAWaQq9my+b0j3xEtdKWYmc3frQD+4u3EWLQ5c1UuenE1moXm/BDdXuFNd+F9orw9mCGTRBj34OwQNKEZsYIQjbZaet8OcWq8R3OLgfAuc9WY85cqZFJxI4GeUDigz8uCKZyB880KoHjgc/fYak1n0JUV3Kp1gE6QjoACdQthU2XyfL5gN6n/8TW9+6agzXsHj+BOUiPVVillDmJYzpWNAw8iAhRNEA+fp4=
Content-ID: <69B2738EF0EB1849AFD762983F2ECCC5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f4c20d-b40e-4d92-6add-08d741e5c6bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 18:25:43.4831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ie2LyXBg9I1qzPPkwE2Otfc2Dbrpv+5wdEPn/GNX7aTXxAVF6qoNtL4cFm8dpyQh6myICnm/C3Gyp/0aESncAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4027
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/XFTZh8jq1t6Pdn6ZaAQ98bFU4BeNNns2HGDe4mZVA=;
 b=Bs6LWtKBpXhLtvWQG+c24fXcfPzRI6dzZ+D41LEdanx1fD+u6hPX+t1a/VCPuPUphRTyYVrAkOHXFEAyWW5mCzVHFZ/ZrdM2NmjwrjID/Jrw8NblitCJcCcv9EGBM1z1UTyyjsT3dhy25QZtyqHiYAm+RKWKla9W7GcAsER2lJE=
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

T24gMjAxOS0wOS0yNSAyOjE1IHAubS4sIFpoYW8sIFlvbmcgd3JvdGU6DQo+IFRoZSBHRlgxMCBk
b2VzIG5vdCBoYXZlIHRoaXMgaGFyZHdhcmUgYnVnIGFueSBtb3JlLCBzbyByZW1vdmUgaXQuDQoN
Ckkgd291bGRuJ3QgY2FsbCB0aGlzIGEgYnVnIGFuZCBhIHdvcmthcm91bmQuIE1vcmUgbGlrZSBh
IGNoYW5nZSBpbiB0aGUgDQpIVyBvciBGVyBiZWhhdmlvdXIgYW5kIGEgY29ycmVzcG9uZGluZyBk
cml2ZXIgY2hhbmdlLiBJLmUuIGluIEdGWHY4IHRoZSANCmNvbnRyb2wgc3RhY2sgd2FzIGluIHRo
ZSB1c2VyIG1vZGUgQ1dTUiBhbGxvY2F0aW9uLiBJbiBHRlh2OSBpdCBtb3ZlZCANCmludG8gYSBr
ZXJuZWwgbW9kZSBidWZmZXIgbmV4dCB0byB0aGUgTVFELiBTbyBpbiBHRlh2MTAgdGhlIGNvbnRy
b2wgDQpzdGFjayBtb3ZlZCBiYWNrIGludG8gdGhlIHVzZXIgbW9kZSBDV1NSIGJ1ZmZlcj8NCg0K
UmVnYXJkcywNCiDCoCBGZWxpeA0KDQo+DQo+IENoYW5nZS1JZDogSTQ0NmM5Njg1NTQ5YTA5YWM4
ODQ2YTQyZWUyMmQ4NmNmYjkzZmQ5OGMNCj4gU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25n
LlpoYW9AYW1kLmNvbT4NCj4gLS0tDQo+ICAgLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFk
X21hbmFnZXJfdjEwLmMgIHwgMzcgKystLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jDQo+IGluZGV4IDljZDNl
YjJkOTBiZC4uNGEyMzZiMmMyMzU0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jDQo+IEBAIC02OSwzNSArNjksMTMgQEAgc3Rh
dGljIHZvaWQgdXBkYXRlX2N1X21hc2soc3RydWN0IG1xZF9tYW5hZ2VyICptbSwgdm9pZCAqbXFk
LA0KPiAgIHN0YXRpYyBzdHJ1Y3Qga2ZkX21lbV9vYmogKmFsbG9jYXRlX21xZChzdHJ1Y3Qga2Zk
X2RldiAqa2ZkLA0KPiAgIAkJc3RydWN0IHF1ZXVlX3Byb3BlcnRpZXMgKnEpDQo+ICAgew0KPiAt
CWludCByZXR2YWw7DQo+IC0Jc3RydWN0IGtmZF9tZW1fb2JqICptcWRfbWVtX29iaiA9IE5VTEw7
DQo+ICsJc3RydWN0IGtmZF9tZW1fb2JqICptcWRfbWVtX29iajsNCj4gICANCj4gLQkvKiBGcm9t
IFY5LCAgZm9yIENXU1IsIHRoZSBjb250cm9sIHN0YWNrIGlzIGxvY2F0ZWQgb24gdGhlIG5leHQg
cGFnZQ0KPiAtCSAqIGJvdW5kYXJ5IGFmdGVyIHRoZSBtcWQsIHdlIHdpbGwgdXNlIHRoZSBndHQg
YWxsb2NhdGlvbiBmdW5jdGlvbg0KPiAtCSAqIGluc3RlYWQgb2Ygc3ViLWFsbG9jYXRpb24gZnVu
Y3Rpb24uDQo+IC0JICovDQo+IC0JaWYgKGtmZC0+Y3dzcl9lbmFibGVkICYmIChxLT50eXBlID09
IEtGRF9RVUVVRV9UWVBFX0NPTVBVVEUpKSB7DQo+IC0JCW1xZF9tZW1fb2JqID0ga3phbGxvYyhz
aXplb2Yoc3RydWN0IGtmZF9tZW1fb2JqKSwgR0ZQX05PSU8pOw0KPiAtCQlpZiAoIW1xZF9tZW1f
b2JqKQ0KPiAtCQkJcmV0dXJuIE5VTEw7DQo+IC0JCXJldHZhbCA9IGFtZGdwdV9hbWRrZmRfYWxs
b2NfZ3R0X21lbShrZmQtPmtnZCwNCj4gLQkJCUFMSUdOKHEtPmN0bF9zdGFja19zaXplLCBQQUdF
X1NJWkUpICsNCj4gLQkJCQlBTElHTihzaXplb2Yoc3RydWN0IHYxMF9jb21wdXRlX21xZCksIFBB
R0VfU0laRSksDQo+IC0JCQkmKG1xZF9tZW1fb2JqLT5ndHRfbWVtKSwNCj4gLQkJCSYobXFkX21l
bV9vYmotPmdwdV9hZGRyKSwNCj4gLQkJCSh2b2lkICopJihtcWRfbWVtX29iai0+Y3B1X3B0ciks
IHRydWUpOw0KPiAtCX0gZWxzZSB7DQo+IC0JCXJldHZhbCA9IGtmZF9ndHRfc2FfYWxsb2NhdGUo
a2ZkLCBzaXplb2Yoc3RydWN0IHYxMF9jb21wdXRlX21xZCksDQo+IC0JCQkJJm1xZF9tZW1fb2Jq
KTsNCj4gLQl9DQo+IC0NCj4gLQlpZiAocmV0dmFsKSB7DQo+IC0JCWtmcmVlKG1xZF9tZW1fb2Jq
KTsNCj4gKwlpZiAoa2ZkX2d0dF9zYV9hbGxvY2F0ZShrZmQsIHNpemVvZihzdHJ1Y3QgdjEwX2Nv
bXB1dGVfbXFkKSwNCj4gKwkJCSZtcWRfbWVtX29iaikpDQo+ICAgCQlyZXR1cm4gTlVMTDsNCj4g
LQl9DQo+ICAgDQo+ICAgCXJldHVybiBtcWRfbWVtX29iajsNCj4gLQ0KPiAgIH0NCj4gICANCj4g
ICBzdGF0aWMgdm9pZCBpbml0X21xZChzdHJ1Y3QgbXFkX21hbmFnZXIgKm1tLCB2b2lkICoqbXFk
LA0KPiBAQCAtMjUwLDE0ICsyMjgsNyBAQCBzdGF0aWMgaW50IGRlc3Ryb3lfbXFkKHN0cnVjdCBt
cWRfbWFuYWdlciAqbW0sIHZvaWQgKm1xZCwNCj4gICBzdGF0aWMgdm9pZCBmcmVlX21xZChzdHJ1
Y3QgbXFkX21hbmFnZXIgKm1tLCB2b2lkICptcWQsDQo+ICAgCQkJc3RydWN0IGtmZF9tZW1fb2Jq
ICptcWRfbWVtX29iaikNCj4gICB7DQo+IC0Jc3RydWN0IGtmZF9kZXYgKmtmZCA9IG1tLT5kZXY7
DQo+IC0NCj4gLQlpZiAobXFkX21lbV9vYmotPmd0dF9tZW0pIHsNCj4gLQkJYW1kZ3B1X2FtZGtm
ZF9mcmVlX2d0dF9tZW0oa2ZkLT5rZ2QsIG1xZF9tZW1fb2JqLT5ndHRfbWVtKTsNCj4gLQkJa2Zy
ZWUobXFkX21lbV9vYmopOw0KPiAtCX0gZWxzZSB7DQo+IC0JCWtmZF9ndHRfc2FfZnJlZShtbS0+
ZGV2LCBtcWRfbWVtX29iaik7DQo+IC0JfQ0KPiArCWtmZF9ndHRfc2FfZnJlZShtbS0+ZGV2LCBt
cWRfbWVtX29iaik7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBib29sIGlzX29jY3VwaWVkKHN0
cnVjdCBtcWRfbWFuYWdlciAqbW0sIHZvaWQgKm1xZCwNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
