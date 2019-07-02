Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 245C75D693
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 21:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A30D899DB;
	Tue,  2 Jul 2019 19:07:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690076.outbound.protection.outlook.com [40.107.69.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B7F899DB
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 19:07:10 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3148.namprd12.prod.outlook.com (20.178.31.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 19:07:09 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 19:07:09 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: Print a warning when the runlist becomes
 oversubscribed
Thread-Topic: [PATCH 1/1] drm/amdkfd: Print a warning when the runlist becomes
 oversubscribed
Thread-Index: AQHVJ6Bu8AHyw8lXiEi/31pwu70W9qa3w26A
Date: Tue, 2 Jul 2019 19:07:08 +0000
Message-ID: <62b2f458-0b8e-f069-5ac2-2a56bcf5674d@amd.com>
References: <20190620194309.11148-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190620194309.11148-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ebce4d7-ce95-4fdd-8aef-08d6ff207af1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3148; 
x-ms-traffictypediagnostic: DM6PR12MB3148:
x-microsoft-antispam-prvs: <DM6PR12MB314872AFD5091696049D7DF392F80@DM6PR12MB3148.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(189003)(199004)(99286004)(386003)(229853002)(6506007)(6246003)(446003)(71190400001)(71200400001)(53936002)(53546011)(65956001)(66066001)(65806001)(2616005)(6512007)(68736007)(52116002)(11346002)(76176011)(110136005)(31686004)(2906002)(58126008)(6436002)(31696002)(476003)(6486002)(66946007)(3846002)(486006)(5660300002)(72206003)(66476007)(66556008)(64756008)(66446008)(26005)(81156014)(81166006)(8676002)(86362001)(65826007)(14454004)(186003)(6116002)(478600001)(73956011)(7736002)(305945005)(64126003)(36756003)(256004)(102836004)(25786009)(6636002)(14444005)(8936002)(2501003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3148;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2heLf17fgnvZk5VIetTNKkjyW/1TIGCFsY1se6f2yzZ0TAS/vlhVXLBa4NgE/MsQXwYydck0viG3HHoEstg/HfHQUkt28yAOfcNHZ+pNgtoY8kDOfCbWY2uIVKVRRhL2T1NvQjIYOBISPnbHQS+xtzbhtNONm0mtquzq28H7mDXHSfo8Yz3u/7l4HkO7AYG7qK5e4+fsF+bwGNZ/gfsjpYZ5O5+tdV5rMD6BDLI/Shbw0TVts+vL3K3XlAvTaO8Ddbht3lTcUZU5UUVHxaMaza6NJGuUyfB6PZl80HdBVcogZyC0I+3CHYHMHDfg06hHOUF84OrenqYbKr3E78zLQ8VxNCvZNgWb5R9HOw+NwgL+03/LUM3wqb3q8fjT+knhJ7DZL0k/ZrA214GjMzMS7wP+tfYpI2XCIIWhhYDUPmA=
Content-ID: <07BC49E72F324F468552A6F1FB46C4EE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebce4d7-ce95-4fdd-8aef-08d6ff207af1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 19:07:08.9078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3148
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgMxFoPKrlSRGEGN2gyd9PVKx4xWPVKNjKKATlt5Lu4=;
 b=g9cqS83g3c7aBeKcoBqAyHYmM5bnYwXmcWoNrRcriZbWN+BXA6GEtM+hZMQAbI6+jeXFw2bMDLlXqPk75icnGQwpacu80XuVBPrUBKIi2M+RC6AaHG0ccurGmRT0JYHh3yGYplvy3BnmStlqhY+9mrljuXu14GEAvE5jUWgHKi0=
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

UGluZy4NCg0KU2hhb3l1biwgZG8geW91IG1pbmQgcmV2aWV3aW5nIHRoaXMgcGF0Y2g/DQoNClRo
YW5rcywNCiDCoCBGZWxpeA0KDQpPbiAyMDE5LTA2LTIwIDM6NDMgcC5tLiwgS3VlaGxpbmcsIEZl
bGl4IHdyb3RlOg0KPiBPdmVyc3Vic2NyaXB0aW9uIG9mIHF1ZXVlcyBvciBwcm9jZXNzZXMgcmVz
dWx0cyBpbiBwb29yIHBlcmZvcm1hbmNlDQo+IG1vc3RseSBiZWNhdXNlIEhXUyBibGluYmx5IHNj
aGVkdWxlcyBidXN5IGFuZCBpZGxlIHF1ZXVlcywgcmVzdWx0aW5nDQo+IGluIHBvb3Igb2NjdXBh
bmN5IGlmIG1hbnkgcXVldWVzIGFyZSBpZGxlLg0KPg0KPiBMZXQgdXNlcnMga25vdyB3aXRoIGEg
d2FybmluZyBtZXNzYWdlIHdoZW4gdHJhbnNpdGlvbmluZyBmcm9tIGENCj4gbm9uLW92ZXJzdWJz
Y3JpYmVkIHRvIGFuIG92ZXJzdWJzY3JpYmVkIHJ1bmxpc3QuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcGFja2V0X21hbmFnZXIuYyB8IDYgKysrKystDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAgICAgICAgICAgfCAxICsN
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5h
Z2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcGFja2V0X21hbmFnZXIuYw0K
PiBpbmRleCBjNzJjOGY1ZmQ1NGMuLmNjZjZiMjMxMDMxNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMNCj4gQEAgLTIwMywxMSAr
MjAzLDE1IEBAIHN0YXRpYyBpbnQgcG1fY3JlYXRlX3J1bmxpc3RfaWIoc3RydWN0IHBhY2tldF9t
YW5hZ2VyICpwbSwNCj4gICANCj4gICAJcHJfZGVidWcoIkZpbmlzaGVkIG1hcCBwcm9jZXNzIGFu
ZCBxdWV1ZXMgdG8gcnVubGlzdFxuIik7DQo+ICAgDQo+IC0JaWYgKGlzX292ZXJfc3Vic2NyaXB0
aW9uKQ0KPiArCWlmIChpc19vdmVyX3N1YnNjcmlwdGlvbikgew0KPiArCQlpZiAoIXBtLT5pc19v
dmVyX3N1YnNjcmlwdGlvbikNCj4gKwkJCXByX3dhcm4oIlJ1bmxpc3QgaXMgZ2V0dGluZyBvdmVy
c3Vic2NyaWJlZC4gRXhwZWN0IHJlZHVjZWQgUk9DbSBwZXJmb3JtYW5jZS5cbiIpOw0KPiAgIAkJ
cmV0dmFsID0gcG0tPnBtZi0+cnVubGlzdChwbSwgJnJsX2J1ZmZlcltybF93cHRyXSwNCj4gICAJ
CQkJCSpybF9ncHVfYWRkciwNCj4gICAJCQkJCWFsbG9jX3NpemVfYnl0ZXMgLyBzaXplb2YodWlu
dDMyX3QpLA0KPiAgIAkJCQkJdHJ1ZSk7DQo+ICsJfQ0KPiArCXBtLT5pc19vdmVyX3N1YnNjcmlw
dGlvbiA9IGlzX292ZXJfc3Vic2NyaXB0aW9uOw0KPiAgIA0KPiAgIAlmb3IgKGkgPSAwOyBpIDwg
YWxsb2Nfc2l6ZV9ieXRlcyAvIHNpemVvZih1aW50MzJfdCk7IGkrKykNCj4gICAJCXByX2RlYnVn
KCIweCUyWCAiLCBybF9idWZmZXJbaV0pOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX3ByaXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9w
cml2LmgNCj4gaW5kZXggNDA3MGU2ZDI0ZWY3Li5kNGJiYTAxMjRkMjkgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KPiBAQCAtOTM3LDYgKzkzNyw3IEBAIHN0cnVj
dCBwYWNrZXRfbWFuYWdlciB7DQo+ICAgCWJvb2wgYWxsb2NhdGVkOw0KPiAgIAlzdHJ1Y3Qga2Zk
X21lbV9vYmogKmliX2J1ZmZlcl9vYmo7DQo+ICAgCXVuc2lnbmVkIGludCBpYl9zaXplX2J5dGVz
Ow0KPiArCWJvb2wgaXNfb3Zlcl9zdWJzY3JpcHRpb247DQo+ICAgDQo+ICAgCWNvbnN0IHN0cnVj
dCBwYWNrZXRfbWFuYWdlcl9mdW5jcyAqcG1mOw0KPiAgIH07DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
