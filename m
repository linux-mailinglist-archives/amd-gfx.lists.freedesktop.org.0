Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28E6BFAF5
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 23:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6317D6EB12;
	Thu, 26 Sep 2019 21:36:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710059.outbound.protection.outlook.com [40.107.71.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4BE6EB12
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 21:36:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T49yt1PwgedA8w8CmFuEvw9deO90kp58VBjIG4bQRsN+cmp0Z2UfbrSUvQUuWlkVDRUQjUOJRvRsyql3Il8Wyh5JveDXOrmpK7jQq8g0/IPhXKfxzzkoZlRmD8ZImAlCgS8RlnHvxrejy1aIPT2psaaW+F2D9kN9Myzb4aGtViBU25SohaA1IORVDsMUusYHpwd8u9wHV4pNaqd+/YWDX+ncd5d4PBYQ1JldI4nsTFuu42nsrHmrZguEng4teqdRObw8fDFUXnIvMQjZHKNSZpIeMVeGxBAM3CJERqgkiIttCpzaOuJTBU+qatzwJy9w2Svpqll0cAgdsxqzljEa9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kDzulxCmYkjqd3jyHmtvtUQ5OfrDtG1uM4/VPNAhUs=;
 b=WrpfCECJkjjsYEya6b4Zd371YUSWWn7fdwEZ2aBOyWq+nP9a6Ideu+qxAtjy56h+cDNfMAl5q514jAEjOPdJdcGaZcnizGZDZMIwNRn5ce+NDNfLgqG8P5NiCFOTAbVhLW8smzZscPlc8Om3E8WM46kZyGW4iXcoZpECkpupiTv6sygtOoX5sB4oIFg2mqSSWxfNCeZMSIx9maLEFSS4DJnC2GYeNuy50ANb/j/ANe/gxwGDOxkSuhkoPxWkHaBjB5fMjslMcAUUtTFpzddnPS7Fh3Foe6ADUabIm+sbxk2moijrwSLJmq3CfOcRaX9ftzGQELbqwx22vUx8DPv0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3420.namprd12.prod.outlook.com (20.178.198.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 26 Sep 2019 21:36:15 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 21:36:15 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
 for non HWS mode
Thread-Topic: [PATCH 1/2] drm/amdkfd: Record vmid pasid mapping in the driver
 for non HWS mode
Thread-Index: AQHVdLEqfaqrBCzjNUSyTJI1+qxGEac+e3SA
Date: Thu, 26 Sep 2019 21:36:14 +0000
Message-ID: <d1129739-2f34-4bc3-96f7-a9a9c999313a@amd.com>
References: <20190926212640.28989-1-Yong.Zhao@amd.com>
In-Reply-To: <20190926212640.28989-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::19) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05d9ca2f-ce64-4051-7cee-08d742c98edb
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3420:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB342024937AAF7CFB2A7CF0A292860@DM6PR12MB3420.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(189003)(199004)(25786009)(81166006)(186003)(3846002)(6116002)(2906002)(8936002)(8676002)(66066001)(86362001)(31696002)(7736002)(65806001)(65956001)(76176011)(2501003)(36756003)(81156014)(52116002)(305945005)(6506007)(386003)(99286004)(14454004)(53546011)(6486002)(316002)(6436002)(71190400001)(71200400001)(478600001)(31686004)(256004)(5660300002)(6512007)(66556008)(64756008)(476003)(66446008)(2616005)(66476007)(66946007)(446003)(11346002)(110136005)(58126008)(486006)(102836004)(6246003)(229853002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3420;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qmb0wBLE6Ggt0uCQtUfMres5uHt2VyzpO16DwBXYS1C6MTHYCvE9gST+7Uu/OM4FJIZigFCktcKAIdZvYlpX/KlW9yg7LYBzwySazeWnn1xCmZtPgejMOfV+vNM3Iltzy6Oq3dj48tphOctIvXZW9fDW19+w5zCltYPRYHJSWCJGjf8FCOmJ83kQfceSR39UbQg7creXhDUclJXzIMChh9mwQ1Z7O8RVDR95hE9OESU6PICI66zH9tjZynYD3vhyM+ijIy92z8tfWN9764pvmCi/EfjLO0CqTa8gJWz6bq8CMbLCB7aqXktKVdsRqwfHrh5AsJEilhgE8fDAbfk96eTvsSQ6PHnEzbszZUcJbPcIY8n+MlFHxzODTJWLsYnzbrI+2Dv83e9sae1SUNmIKYAD14oIskzHdJbhTjQHKUQ=
Content-ID: <94BA296ADDDE114B89C72AC29DBE8A80@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d9ca2f-ce64-4051-7cee-08d742c98edb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 21:36:14.9972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5nNgXBn2sjRhXv/+oBFI1CilM6b06A7c+uk86K4qZdKVqCnUFSCOxSy9bsuwwowDJiEHGWpXMT1HCkxwy2OQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3420
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kDzulxCmYkjqd3jyHmtvtUQ5OfrDtG1uM4/VPNAhUs=;
 b=0GZZUu6V/BrriS9ej1UDn5WLyk6bA6tBXdtzmXqbJ3/jUWg6O/hYOeGJhWUWMaxeBMt+NlWV3uno/HCYGYpPdFRu5bchhMzKlLG4Ymwrk5b0yjITj/1KMQISxF0wArWfSFeFJPOsWhrmLaJAn8xyKMMznmC6rlz+RRDZdAAHRbU=
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

TWlub3Igbml0LXBpY2sgaW5saW5lLiBPdGhlcndpc2UgdGhpcyBwYXRjaCBpcw0KDQpSZXZpZXdl
ZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQoNCk9uIDIwMTkt
MDktMjYgNToyNyBwLm0uLCBaaGFvLCBZb25nIHdyb3RlOg0KPiBUaGlzIG1ha2VzIHBvc3NpYmxl
IHRoZSB2bWlkIHBhc2lkIG1hcHBpbmcgcXVlcnkgdGhyb3VnaCBzb2Z0d2FyZS4NCj4NCj4gQ2hh
bmdlLUlkOiBJYjUzOWFhZTI3N2EyMjdjYzM5ZjY0NjlhZTIzYzQ2YzRkMjg5Yjg3Yg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBZb25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29tPg0KPiAtLS0NCj4gICAuLi4v
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAzMyArKysrKysrKysr
KystLS0tLS0tDQo+ICAgLi4uL2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdl
ci5oIHwgIDMgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oICAg
ICAgICAgfCAgMiArKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTMg
ZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+IGluZGV4IGU3ZjBhMzJlMGU0NC4uNDU1ZjQ5
YTI1Y2NiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KPiBAQCAtMjI0LDIwICsyMjQsMzAgQEAgc3RhdGlj
IGludCBhbGxvY2F0ZV92bWlkKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KPiAg
IAkJCXN0cnVjdCBxY21fcHJvY2Vzc19kZXZpY2UgKnFwZCwNCj4gICAJCQlzdHJ1Y3QgcXVldWUg
KnEpDQo+ICAgew0KPiAtCWludCBiaXQsIGFsbG9jYXRlZF92bWlkOw0KPiArCWludCBhbGxvY2F0
ZWRfdm1pZCA9IC0xLCBpOw0KPiAgIA0KPiAtCWlmIChkcW0tPnZtaWRfYml0bWFwID09IDApDQo+
IC0JCXJldHVybiAtRU5PTUVNOw0KPiArCWZvciAoaSA9IGRxbS0+ZGV2LT52bV9pbmZvLmZpcnN0
X3ZtaWRfa2ZkOw0KPiArCQkJaSA8PSBkcW0tPmRldi0+dm1faW5mby5sYXN0X3ZtaWRfa2ZkOyBp
KyspIHsNCj4gKwkJaWYgKCFkcW0tPnZtaWRfcGFzaWRbaV0pIHsNCj4gKwkJCWFsbG9jYXRlZF92
bWlkID0gaTsNCj4gKwkJCWJyZWFrOw0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGFsbG9j
YXRlZF92bWlkIDwgMCkgew0KPiArCQlwcl9lcnIoIm5vIG1vcmUgdm1pZCB0byBhbGxvY2F0ZVxu
Iik7DQo+ICsJCXJldHVybiAtRU5PU1BDOw0KPiArCX0NCj4gKw0KPiArCXByX2RlYnVnKCJ2bWlk
IGFsbG9jYXRlZDogJWRcbiIsIGFsbG9jYXRlZF92bWlkKTsNCj4gKw0KPiArCWRxbS0+dm1pZF9w
YXNpZFthbGxvY2F0ZWRfdm1pZF0gPSBxLT5wcm9jZXNzLT5wYXNpZDsNCj4gICANCj4gLQliaXQg
PSBmZnMoZHFtLT52bWlkX2JpdG1hcCkgLSAxOw0KPiAtCWRxbS0+dm1pZF9iaXRtYXAgJj0gfigx
IDw8IGJpdCk7DQo+ICsJc2V0X3Bhc2lkX3ZtaWRfbWFwcGluZyhkcW0sIHEtPnByb2Nlc3MtPnBh
c2lkLCBhbGxvY2F0ZWRfdm1pZCk7DQo+ICAgDQo+IC0JYWxsb2NhdGVkX3ZtaWQgPSBiaXQgKyBk
cW0tPmRldi0+dm1faW5mby5maXJzdF92bWlkX2tmZDsNCj4gLQlwcl9kZWJ1Zygidm1pZCBhbGxv
Y2F0aW9uICVkXG4iLCBhbGxvY2F0ZWRfdm1pZCk7DQo+ICAgCXFwZC0+dm1pZCA9IGFsbG9jYXRl
ZF92bWlkOw0KPiAgIAlxLT5wcm9wZXJ0aWVzLnZtaWQgPSBhbGxvY2F0ZWRfdm1pZDsNCj4gICAN
Cj4gLQlzZXRfcGFzaWRfdm1pZF9tYXBwaW5nKGRxbSwgcS0+cHJvY2Vzcy0+cGFzaWQsIHEtPnBy
b3BlcnRpZXMudm1pZCk7DQo+ICAgCXByb2dyYW1fc2hfbWVtX3NldHRpbmdzKGRxbSwgcXBkKTsN
Cj4gICANCj4gICAJLyogcXBkLT5wYWdlX3RhYmxlX2Jhc2UgaXMgc2V0IGVhcmxpZXIgd2hlbiBy
ZWdpc3Rlcl9wcm9jZXNzKCkNCj4gQEAgLTI3OCw4ICsyODgsNiBAQCBzdGF0aWMgdm9pZCBkZWFs
bG9jYXRlX3ZtaWQoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQo+ICAgCQkJCXN0
cnVjdCBxY21fcHJvY2Vzc19kZXZpY2UgKnFwZCwNCj4gICAJCQkJc3RydWN0IHF1ZXVlICpxKQ0K
PiAgIHsNCj4gLQlpbnQgYml0ID0gcXBkLT52bWlkIC0gZHFtLT5kZXYtPnZtX2luZm8uZmlyc3Rf
dm1pZF9rZmQ7DQo+IC0NCj4gICAJLyogT24gR0ZYIHY3LCBDUCBkb2Vzbid0IGZsdXNoIFRDIGF0
IGRlcXVldWUgKi8NCj4gICAJaWYgKHEtPmRldmljZS0+ZGV2aWNlX2luZm8tPmFzaWNfZmFtaWx5
ID09IENISVBfSEFXQUlJKQ0KPiAgIAkJaWYgKGZsdXNoX3RleHR1cmVfY2FjaGVfbm9jcHNjaChx
LT5kZXZpY2UsIHFwZCkpDQo+IEBAIC0yODksOCArMjk3LDggQEAgc3RhdGljIHZvaWQgZGVhbGxv
Y2F0ZV92bWlkKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KPiAgIA0KPiAgIAkv
KiBSZWxlYXNlIHRoZSB2bWlkIG1hcHBpbmcgKi8NCj4gICAJc2V0X3Bhc2lkX3ZtaWRfbWFwcGlu
ZyhkcW0sIDAsIHFwZC0+dm1pZCk7DQo+ICsJZHFtLT52bWlkX3Bhc2lkW3FwZC0+dm1pZF0gPSAw
Ow0KPiAgIA0KPiAtCWRxbS0+dm1pZF9iaXRtYXAgfD0gKDEgPDwgYml0KTsNCj4gICAJcXBkLT52
bWlkID0gMDsNCj4gICAJcS0+cHJvcGVydGllcy52bWlkID0gMDsNCj4gICB9DQo+IEBAIC0xMDE3
LDcgKzEwMjUsOCBAQCBzdGF0aWMgaW50IGluaXRpYWxpemVfbm9jcHNjaChzdHJ1Y3QgZGV2aWNl
X3F1ZXVlX21hbmFnZXIgKmRxbSkNCj4gICAJCQkJZHFtLT5hbGxvY2F0ZWRfcXVldWVzW3BpcGVd
IHw9IDEgPDwgcXVldWU7DQo+ICAgCX0NCj4gICANCj4gLQlkcW0tPnZtaWRfYml0bWFwID0gKDEg
PDwgZHFtLT5kZXYtPnZtX2luZm8udm1pZF9udW1fa2ZkKSAtIDE7DQo+ICsJbWVtc2V0KGRxbS0+
dm1pZF9wYXNpZCwgMCwgc2l6ZW9mKGRxbS0+dm1pZF9wYXNpZCkpOw0KPiArDQo+ICAgCWRxbS0+
c2RtYV9iaXRtYXAgPSB+MFVMTCA+PiAoNjQgLSBnZXRfbnVtX3NkbWFfcXVldWVzKGRxbSkpOw0K
PiAgIAlkcW0tPnhnbWlfc2RtYV9iaXRtYXAgPSB+MFVMTCA+PiAoNjQgLSBnZXRfbnVtX3hnbWlf
c2RtYV9xdWV1ZXMoZHFtKSk7DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oDQo+IGluZGV4IGVlZDhmOTUwYjY2
My4uOTljOGIzNjMwMWVmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaA0KPiBAQCAtMTg4LDcgKzE4OCw4IEBA
IHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciB7DQo+ICAgCXVuc2lnbmVkIGludAkJKmFsbG9j
YXRlZF9xdWV1ZXM7DQo+ICAgCXVpbnQ2NF90CQlzZG1hX2JpdG1hcDsNCj4gICAJdWludDY0X3QJ
CXhnbWlfc2RtYV9iaXRtYXA7DQo+IC0JdW5zaWduZWQgaW50CQl2bWlkX2JpdG1hcDsNCj4gKwkv
KiB0aGUgcGFzaWQgbWFwcGluZyBmb3IgZWFjaCBrZmQgdm1pZCAqLw0KPiArCXVpbnQxNl90CQl2
bWlkX3Bhc2lkW1ZNSURfTlVNXTsNCj4gICAJdWludDY0X3QJCXBpcGVsaW5lc19hZGRyOw0KPiAg
IAlzdHJ1Y3Qga2ZkX21lbV9vYmoJKnBpcGVsaW5lX21lbTsNCj4gICAJdWludDY0X3QJCWZlbmNl
X2dwdV9hZGRyOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3ByaXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4gaW5kZXgg
MGQyYzdmYTFmYTQ2Li5hMDgwMTU3MjA4NDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3ByaXYuaA0KPiBAQCAtNDMsNiArNDMsOCBAQA0KPiAgIA0KPiAgICNpbmNsdWRlICJh
bWRfc2hhcmVkLmgiDQo+ICAgDQo+ICsjZGVmaW5lIFZNSURfTlVNIDE2DQo+ICsNCg0KQW55IGdv
b2QgcmVhc29uIHdoeSB0aGlzIGlzIG5vdCBkZWZpbmVkIGluIGtmZF9kZXZpY2VfcXVldWVfbWFu
YWdlci5oPyANCkl0J3Mgb25seSB1c2VkIHRoZXJlLg0KDQoNCj4gICAjZGVmaW5lIEtGRF9NQVhf
UklOR19FTlRSWV9TSVpFCTgNCj4gICANCj4gICAjZGVmaW5lIEtGRF9TWVNGU19GSUxFX01PREUg
MDQ0NA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
