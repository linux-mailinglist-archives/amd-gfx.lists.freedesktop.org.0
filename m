Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B3475810
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 21:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB346E820;
	Thu, 25 Jul 2019 19:38:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750042.outbound.protection.outlook.com [40.107.75.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BB46E820
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 19:38:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crLdKFsN8kKw72WGMpJ9gTT7LPycgxkUGvFuINikLbFakF+Gb0pkIJeUrAkjLyzjrRmrIQi7N7m5+mWOO3CiZYKdlfKXNUBOauV36uqBMJIyqZsddjc0s+6mLvtrfDIM3+eZgJiHX/ywPT0GV5UxS/rrWCAdPoHMyuDCkRt5gWzQgDX3t1avFKfX+y2aQEVF+wdYCLnKvCKuP9o0Iji+T8E/OzEvBS6L+AlgZDzZMB9e6A3I8uzJuSJ5t+ogG9sV+GF8frVE0lwXCqXrRUkvRSW1pG+6OdwvZexOIPRy4kHpDUW0AmY7yQ7UqgpLV5xtCSOgUAzpLhspHMs4374row==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxkkoxKX5m6+BL0U7Q+2obDI6wIkAB3ODJ1uo8K/PKE=;
 b=kHv81PtyLqX3C2fcpU3F4oPSI0W5exOy6pxGl5yCbEKmWUuzOBOzYHERObdeEa2ZNRCYmstKX8aj1AGoGRB0TQDLQGdz8ETZlQekSipbG+5MJVRPGd8hl+LUljryEhxsPQoUxCSVqEBmBGjDhRVbjoeQITpDrr5NYT6pnGLgwC0Uva06OmEzlsQuzEEwQv3sn2o58P48d71l+YPMMDn/+48J2iowWG7UOTw/+UZMZu4uKJI1ZcGlExuI1K+Fl2uT9CcSp1YNua9E55VIrehcrL+WiYgH2Uy2oOovbxnmlqcG/1kFBEoC9k3WLzzu6nzhOlXAVCkRLRk/5jMFQUhVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB2533.namprd12.prod.outlook.com (52.132.141.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 19:38:09 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2%5]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 19:38:09 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "Thai, Thong" <Thong.Thai@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands as KMD
 commands
Thread-Topic: [PATCH v3 1/2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands as KMD
 commands
Thread-Index: AQHVQxT0X0EVv+XGEkifZPRxyRgLz6bbus2A
Date: Thu, 25 Jul 2019 19:38:09 +0000
Message-ID: <6eee2cef-9544-c1bd-0cd8-f008f427884e@amd.com>
References: <20190725181516.6114-1-thong.thai@amd.com>
In-Reply-To: <20190725181516.6114-1-thong.thai@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2607:fea8:a21f:e10f:c8fe:3df8:eaeb:cc1d]
x-clientproxiedby: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e56307e-6a51-4307-728a-08d711379f5d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2533; 
x-ms-traffictypediagnostic: DM5PR12MB2533:
x-microsoft-antispam-prvs: <DM5PR12MB2533C2724D30488D4F84886BE5C10@DM5PR12MB2533.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(189003)(199004)(6486002)(102836004)(66446008)(66556008)(64756008)(66476007)(66946007)(186003)(76176011)(53546011)(486006)(5660300002)(25786009)(53936002)(31696002)(6246003)(81156014)(478600001)(6436002)(81166006)(229853002)(7736002)(8936002)(86362001)(256004)(6512007)(2906002)(65826007)(58126008)(68736007)(110136005)(6116002)(36756003)(64126003)(14454004)(316002)(71190400001)(71200400001)(2501003)(8676002)(65956001)(446003)(476003)(65806001)(305945005)(11346002)(31686004)(6506007)(46003)(52116002)(2616005)(386003)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2533;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OkmEml0GjJi1kPrisrpPY0gl68TXfvsulPQydD4rDWBTG+3w0snu4YhS9vBf7DQgXxIWN/fhXqWC5XQpINSCN6DOqk3KEME6Ix/hCwq+0epMfMtdSQbehJlrCg8ImpZHEIbzbBSl+w21TcJQU1kd8iZ9gn2BoGlFWNkgZeaTm5k8IbP8l4l1qZISJBT2SssTMe5OJnAY5QvpdbDdy4aPmlVtS09HJFfdz551wJ+a1W262ABs6HokM998n7hlp84tg7rRwYl1yP3q5FY7MJgFej9HrxDMuxdiLGnW8LOgne3lSgitLbPl147XBbMxWh4WiHp6ZL3wCvRkOf3C3porKkIzImWBo5ZTUsapAKDirGD/SmS5DEBoJgn36AfT6hFYud1ui1Ik0wr1Rn50nUvVDeteL2k7XX7R088fT5R2saE=
Content-ID: <EF1D37B7A4617C46838499AEA984DDC8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e56307e-6a51-4307-728a-08d711379f5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 19:38:09.4987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoliu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2533
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxkkoxKX5m6+BL0U7Q+2obDI6wIkAB3ODJ1uo8K/PKE=;
 b=ra5yzrRCYTEM9cl4Uu4FCLSmqh3ecrX0lwSLItALqW1UeHN5TGCNleBjJONXG/uUwz1sgnBe/khVNwlIp9hjry3rLlaz8YxrOxIljTvEOK+M7GaVKahrHwCKjGt3HrvkaxIC5Rga5iXeMjkKUdshbbvNo0F4jCbRg9KEOxKm1ys=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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

DQpPbiAyMDE5LTA3LTI1IDI6MTUgcC5tLiwgVGhhaSwgVGhvbmcgd3JvdGU6DQo+IFNldHMgdGhl
IENNRF9TT1VSQ0UgYml0IGZvciBWQ04gMi4wIERlY29kZXIgUmluZyBCdWZmZXIgY29tbWFuZHMu
IFRoaXMNCj4gYml0IHdhcyBwcmV2aW91c2x5IHNldCBieSB0aGUgUkJDIEhXIG9uIG9sZGVyIGZp
cm13YXJlLiBOZXdlciBmaXJtd2FyZQ0KPiB1c2VzIGEgU1cgUkJDIGFuZCB0aGlzIGJpdCBoYXMg
dG8gYmUgc2V0IGJ5IHRoZSBkcml2ZXIuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRob25nIFRoYWkg
PHRob25nLnRoYWlAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Zjbi5oIHwgIDEgKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zj
bl92Ml8wLmMgICB8IDEyICsrKysrKy0tLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Zjbi5oDQo+IGluZGV4IDVlMjQ1M2VlNmIyOS4uNGQzYmY0YWRmMWViIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmgNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oDQo+IEBAIC0zMCw2ICszMCw3
IEBADQo+ICAgI2RlZmluZSBBTURHUFVfVkNOX0ZJUk1XQVJFX09GRlNFVAkyNTYNCj4gICAjZGVm
aW5lIEFNREdQVV9WQ05fTUFYX0VOQ19SSU5HUwkzDQo+ICAgDQo+ICsjZGVmaW5lIFZDTl9ERUNf
S01EX0NNRAkJCTB4ODAwMDAwMDANCg0KUGxlYXNlIGdldCB0aGlzIGxpbmUgYWxpZ25lZCB3aXRo
IG90aGVycywgd2l0aCB0aGF0IGZpeGVkLCB0aGUgcGF0Y2ggaXMNCg0KUmV2aWV3ZWQtYnk6IExl
byBMaXUgPGxlby5saXVAYW1kLmNvbT4NCg0KDQo+ICAgI2RlZmluZSBWQ05fREVDX0NNRF9GRU5D
RQkJMHgwMDAwMDAwMA0KPiAgICNkZWZpbmUgVkNOX0RFQ19DTURfVFJBUAkJMHgwMDAwMDAwMQ0K
PiAgICNkZWZpbmUgVkNOX0RFQ19DTURfV1JJVEVfUkVHCQkweDAwMDAwMDA0DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYw0KPiBpbmRleCBiYzk3MjY3ODdjOTcuLjcwOTFhZWY5
NWZmMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jDQo+IEBAIC0x
NDg4LDcgKzE0ODgsNyBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfMF9kZWNfcmluZ19pbnNlcnRfc3Rh
cnQoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KPiAgIAlhbWRncHVfcmluZ193cml0ZShyaW5n
LCBQQUNLRVQwKG1tVVZEX0dQQ09NX1ZDUFVfREFUQTBfSU5URVJOQUxfT0ZGU0VULCAwKSk7DQo+
ICAgCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDApOw0KPiAgIAlhbWRncHVfcmluZ193cml0ZShy
aW5nLCBQQUNLRVQwKG1tVVZEX0dQQ09NX1ZDUFVfQ01EX0lOVEVSTkFMX09GRlNFVCwgMCkpOw0K
PiAtCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNfQ01EX1BBQ0tFVF9TVEFSVCA8PCAx
KTsNCj4gKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBWQ05fREVDX0tNRF9DTUQgfCAoVkNOX0RF
Q19DTURfUEFDS0VUX1NUQVJUIDw8IDEpKTsNCj4gICB9DQo+ICAgDQo+ICAgLyoqDQo+IEBAIC0x
NTAxLDcgKzE1MDEsNyBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfMF9kZWNfcmluZ19pbnNlcnRfc3Rh
cnQoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KPiAgIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2Rl
Y19yaW5nX2luc2VydF9lbmQoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KPiAgIHsNCj4gICAJ
YW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMChtbVVWRF9HUENPTV9WQ1BVX0NNRF9JTlRF
Uk5BTF9PRkZTRVQsIDApKTsNCj4gLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBWQ05fREVDX0NN
RF9QQUNLRVRfRU5EIDw8IDEpOw0KPiArCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNf
S01EX0NNRCB8IChWQ05fREVDX0NNRF9QQUNLRVRfRU5EIDw8IDEpKTsNCj4gICB9DQo+ICAgDQo+
ICAgLyoqDQo+IEBAIC0xNTQ2LDcgKzE1NDYsNyBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfMF9kZWNf
cmluZ19lbWl0X2ZlbmNlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdTY0IGFkZHIsIHU2NA0K
PiAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCB1cHBlcl8zMl9iaXRzKGFkZHIpICYgMHhmZik7
DQo+ICAgDQo+ICAgCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1VVkRfR1BDT01f
VkNQVV9DTURfSU5URVJOQUxfT0ZGU0VULCAwKSk7DQo+IC0JYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgVkNOX0RFQ19DTURfRkVOQ0UgPDwgMSk7DQo+ICsJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywg
VkNOX0RFQ19LTURfQ01EIHwgKFZDTl9ERUNfQ01EX0ZFTkNFIDw8IDEpKTsNCj4gICANCj4gICAJ
YW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMChtbVVWRF9HUENPTV9WQ1BVX0RBVEEwX0lO
VEVSTkFMX09GRlNFVCwgMCkpOw0KPiAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4g
QEAgLTE1NTYsNyArMTU1Niw3IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2RlY19yaW5nX2VtaXRf
ZmVuY2Uoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1NjQgYWRkciwgdTY0DQo+ICAgDQo+ICAg
CWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1VVkRfR1BDT01fVkNQVV9DTURfSU5U
RVJOQUxfT0ZGU0VULCAwKSk7DQo+ICAgDQo+IC0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgVkNO
X0RFQ19DTURfVFJBUCA8PCAxKTsNCj4gKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBWQ05fREVD
X0tNRF9DTUQgfCAoVkNOX0RFQ19DTURfVFJBUCA8PCAxKSk7DQo+ICAgfQ0KPiAgIA0KPiAgIC8q
Kg0KPiBAQCAtMTYwMCw3ICsxNjAwLDcgQEAgc3RhdGljIHZvaWQgdmNuX3YyXzBfZGVjX3Jpbmdf
ZW1pdF9yZWdfd2FpdChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsDQo+ICAgDQo+ICAgCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1VVkRfR1BDT01fVkNQVV9DTURfSU5URVJOQUxf
T0ZGU0VULCAwKSk7DQo+ICAgDQo+IC0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgVkNOX0RFQ19D
TURfUkVHX1JFQURfQ09ORF9XQUlUIDw8IDEpOw0KPiArCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcs
IFZDTl9ERUNfS01EX0NNRCB8IChWQ05fREVDX0NNRF9SRUdfUkVBRF9DT05EX1dBSVQgPDwgMSkp
Ow0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgdm9pZCB2Y25fdjJfMF9kZWNfcmluZ19lbWl0X3Zt
X2ZsdXNoKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywNCj4gQEAgLTE2MjksNyArMTYyOSw3IEBA
IHN0YXRpYyB2b2lkIHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfd3JlZyhzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsDQo+ICAgDQo+ICAgCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDAobW1V
VkRfR1BDT01fVkNQVV9DTURfSU5URVJOQUxfT0ZGU0VULCAwKSk7DQo+ICAgDQo+IC0JYW1kZ3B1
X3Jpbmdfd3JpdGUocmluZywgVkNOX0RFQ19DTURfV1JJVEVfUkVHIDw8IDEpOw0KPiArCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIFZDTl9ERUNfS01EX0NNRCB8IChWQ05fREVDX0NNRF9XUklURV9S
RUcgPDwgMSkpOw0KPiAgIH0NCj4gICANCj4gICAvKioNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
