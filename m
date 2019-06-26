Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36045626B
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 08:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5DD6E288;
	Wed, 26 Jun 2019 06:37:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730067.outbound.protection.outlook.com [40.107.73.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FA46E288
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 06:37:22 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3439.namprd12.prod.outlook.com (20.178.243.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 06:37:21 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::2c36:7d1c:2e3f:55fd]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::2c36:7d1c:2e3f:55fd%3]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 06:37:21 +0000
From: Kevin Wang <kevwa@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: warn on smu interface version mismatch
Thread-Topic: [PATCH] drm/amd/powerplay: warn on smu interface version mismatch
Thread-Index: AQHVK+fJXp+C2SF0xkCEf4zbx9jaSqateYCogAAB3gA=
Date: Wed, 26 Jun 2019 06:37:20 +0000
Message-ID: <5e98ee72-5b99-a244-37f7-fa8a00216b8e@amd.com>
References: <20190626062402.18551-1-xiaojie.yuan@amd.com>
 <BN8PR12MB36021167B2EBF7F48CE93CCA89E20@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB36021167B2EBF7F48CE93CCA89E20@BN8PR12MB3602.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:203:36::30) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6b5c9c2-ba38-4054-90da-08d6fa00bd94
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3439; 
x-ms-traffictypediagnostic: MN2PR12MB3439:
x-microsoft-antispam-prvs: <MN2PR12MB34397F37033847EE38B75E3DA2E20@MN2PR12MB3439.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(346002)(376002)(39860400002)(189003)(199004)(99286004)(52116002)(66446008)(6486002)(11346002)(446003)(386003)(26005)(53546011)(6506007)(2616005)(486006)(476003)(6246003)(71190400001)(71200400001)(25786009)(76176011)(72206003)(102836004)(186003)(5660300002)(64756008)(14454004)(66476007)(73956011)(66946007)(66556008)(478600001)(66066001)(6116002)(36756003)(3846002)(8676002)(305945005)(68736007)(2906002)(2501003)(81156014)(81166006)(8936002)(7736002)(256004)(229853002)(53936002)(31696002)(4326008)(6512007)(316002)(110136005)(6436002)(14444005)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3439;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DNkUqdtUTzW+uuXbTqkGOj2D4Uhu2KmA/ZzK+CMjgGufijbhd5ODlsd+s7PSdyxu2w6/oUO+u4sB1Ok9P6j5LBIx9QzodZoKXE6jhx59BkDuWMMcZ1T176XN6/LJBXKGPNoZf9qXCqE9vbN0nNW6cYuJ5dEzfQqXEb44bxsIqqvKbqbO8WAHl7cKtGzGYBOOAQsQ912WWJ2hiKYfqJDq/Tba+A8skOVG8NZKeixMbkoy15aDEKdUkupwPUNAawtOHnAblINhuSa+KKhvLuzgagIAJ6dEPJN4nos2Qlez/nQAo6EeQ4zXyhXV4TgsIz1hoISBV9VcQflt4VWn/1FsJd6yW48O1RBQD7dA9bqwq9xFDtZOMcV0bgUkuL4iQcT86Za/tJkw4kvlJJcdRMwLp8G0XXHjO5gp8UIG/BAbkfA=
Content-ID: <2D5F5A1971942C49BE5101A0C1EBA037@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b5c9c2-ba38-4054-90da-08d6fa00bd94
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 06:37:20.9746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3439
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZBGsA39PpDdU5XkXhdm5/ChSLNuOazi9gHcFfwTkm0=;
 b=xsAMLWbuq83RG13H/g/ANNZbthgPUzIGAdR6klIi22vHYnygH6E3wtYgKDAPodv8rr/Sp30fRMANsrLyf77sAxfgXskjBYG1KGVr6ntoKpwwXrGfAXlqbhR6spP4Otbfp2l6m91vGiA4+Mw6Q70dRrHKHgCSDzfoEo/WkRIMOps=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cGxlYXNlIGFkZCB0aGlzIG1lc3NhZ2UgaW4gcGF0Y2ggY29tbWl0LiBhZnRlcg0KUmV2aWV3ZWQt
Ynk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQoNCkJlc3QgUmVnYXJkcywNCktl
dmluDQoNCk9uIDYvMjYvMTkgMjozNCBQTSwgWXVhbiwgWGlhb2ppZSB3cm90ZToNCj4gQ3VycmVu
dCBTTVUgSUYgdmVyc2lvbiBjaGVjayBpcyB0b28gc3RyaWN0LCBkcml2ZXIgd2l0aCBvbGQgc211
MTFfZHJpdmVyX2lmLmggc29tZXRpbWVzIHdvcmtzIGZpbmUgd2l0aCBuZXcgU01VIGZpcm13YXJl
LiBXZSBwcmVmZXIgdG8gc2VlIGEgd2FybmluZyBpbnN0ZWFkIGEgZXJyb3IgZm9yIGRlYnVnIHB1
cnBvc2VzLg0KPg0KPiBCUiwNCj4gWGlhb2ppZQ0KPg0KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IEZyb206IFl1YW4sIFhpYW9qaWUNCj4gU2VudDogV2VkbmVz
ZGF5LCBKdW5lIDI2LCAyMDE5IDI6MjQ6MTkgUE0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IENjOiBXYW5nLCBLZXZpbihZYW5nKTsgWXVhbiwgWGlhb2ppZQ0KPiBTdWJq
ZWN0OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiB3YXJuIG9uIHNtdSBpbnRlcmZhY2UgdmVy
c2lvbiBtaXNtYXRjaA0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUu
eXVhbkBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9z
bXVfdjExXzAuYyB8IDMgKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvc211X3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjEx
XzAuYw0KPiBpbmRleCBjM2Y0OGZhZTZmMzIuLjMzOWQwNjNlMjRmZiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCj4gQEAgLTI3Miw4ICsyNzIsNyBA
QCBzdGF0aWMgaW50IHNtdV92MTFfMF9jaGVja19md192ZXJzaW9uKHN0cnVjdCBzbXVfY29udGV4
dCAqc211KQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgInNtdSBmdyB2ZXJzaW9uID0gMHgl
MDh4ICglZC4lZC4lZClcbiIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBzbXUtPnNtY19p
Zl92ZXJzaW9uLCBpZl92ZXJzaW9uLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgc211X3Zl
cnNpb24sIHNtdV9tYWpvciwgc211X21pbm9yLCBzbXVfZGVidWcpOw0KPiAtICAgICAgICAgICAg
ICAgcHJfZXJyKCJTTVUgZHJpdmVyIGlmIHZlcnNpb24gbm90IG1hdGNoZWRcbiIpOw0KPiAtICAg
ICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsNCj4gKyAgICAgICAgICAgICAgIHByX3dhcm4oIlNN
VSBkcml2ZXIgaWYgdmVyc2lvbiBub3QgbWF0Y2hlZFxuIik7DQo+ICAgICAgICAgIH0NCj4NCj4g
ICAgICAgICAgcmV0dXJuIHJldDsNCj4gLS0NCj4gMi4yMC4xDQo+DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
