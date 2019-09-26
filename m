Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C27BFADA
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 23:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985586EDD2;
	Thu, 26 Sep 2019 21:10:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780055.outbound.protection.outlook.com [40.107.78.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB8A6EDD2
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 21:10:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VD+uiX3NU+vZgO2asfeGyMZt9kHp6idCrzZerTUKf58duvRU2k4ZounSnnnfaqfjv1zKUgxS0Ctt+EFQWMM+E60YWQHi5aHEm4cCNIaD7Q23ErybDNJxIvKf05eyrw45ZGLz6/Dlp3YdWvCHnvw3+H4zS5Nkjqx2RW1K5C/lxc35Zz7DNr8sSVWcZYn9f1+dKzlImcVGCvl6JfQEnTzredM654t9WD1BDoAGrfGb4Cofxn+h8KnLlzCwV+VlGiQZyn8XF9sqYq3jQ4OkQdn14sUe3KPoq/OQoBajMcd1J3C/6javoQSoTud2DKNdLsvkPbemqo1r8C3MCQ+K32lMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmMoNL2Hzao7pociYhfRm4X0QZsA7nsonGuCR+sCQ4c=;
 b=EN/BI9kKkeIru6ZLUZ2Yj/IrsD4/OAkQDv6FrQ02pp4MnxcGecrMHQKxJsnQuLG6VL6IbX7XuglLA7JR/gruc2YJF0R8OQc1+U/71vInEHLQD8K7Mia1sAcIUMPgBeGjYlYenvqomJvuYZg6YTSJl4hOhUp7WT6X8A6pmC81Si+05QohnSPslK2hsW7liesUpU0+CK6BqxtDNAJWf6xfnoEE+GkY34qRVJfubLDididAGFoYT/tuhnLyxNvYktVH5O0DXegQFCuv07VAgl5rnMHxqBJXlzgZSgCTuKnIANAgcfimO8v8t03M8HMls634bKRObwdX9yT9AefcHZRXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4026.namprd12.prod.outlook.com (10.255.175.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Thu, 26 Sep 2019 21:10:39 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 21:10:39 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored
 info
Thread-Topic: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored
 info
Thread-Index: AQHVdKMLfiETUwenfUKQugN+iTCqb6c+YuSAgAAPMYCAAAJUgA==
Date: Thu, 26 Sep 2019 21:10:39 +0000
Message-ID: <cdd75ee5-9706-59a4-54b5-478eb79669cb@amd.com>
References: <20190926194548.15119-1-Yong.Zhao@amd.com>
 <20190926194548.15119-2-Yong.Zhao@amd.com>
 <ae7610f9-97bb-45f4-56ed-7a3dcbc4758c@amd.com>
 <a1e7533b-90eb-9c0c-3fa2-e214ad2ad4aa@amd.com>
In-Reply-To: <a1e7533b-90eb-9c0c-3fa2-e214ad2ad4aa@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::43) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5dfec4d-d155-4085-8f57-08d742c5fb76
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB4026; 
x-ms-traffictypediagnostic: DM6PR12MB4026:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB402667BF4036DF1E7FE9249092860@DM6PR12MB4026.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(189003)(199004)(66446008)(66066001)(65956001)(14454004)(65806001)(6436002)(6246003)(229853002)(966005)(31696002)(86362001)(478600001)(6306002)(71200400001)(99286004)(256004)(25786009)(5660300002)(36756003)(66556008)(6512007)(6486002)(66476007)(66946007)(64756008)(76176011)(7736002)(110136005)(52116002)(8676002)(81166006)(81156014)(3846002)(446003)(2616005)(71190400001)(11346002)(2906002)(305945005)(102836004)(386003)(6506007)(53546011)(486006)(476003)(8936002)(26005)(2501003)(31686004)(6116002)(58126008)(316002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4026;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: imAtrPIjXxXLc6yxyyP4dfkLe0Wx5qanuI6Ez0a77DstP6oZncMS3jmqxP9iu94KmX60pZbnJ5e3hbemPm3xMH0+w6RGi/cip0XZC6kj0/1xf/WS0+Rdw76+8t8LMD7PBPLFSw0/0KDEk9BVGuGt+8ItLcB77wC4wYDJkMbG9xEH7DsQfX9xWMeSOp8xnTiUR1DpIV25h99WPG/bnsHR+VFUeMUwdF9OPrb/pJLzhIGDx+8LonZp/hYKikyEYS5CKdFh1SnCc2W1yeYshN1HvVeMmMtoCJ+NAOf/cU/WSFg4LqJvMQRQtr+u5j6CxASs8N5fRLgJK163h0xXn1rzIlOFVYd8JpsoPBzPH5zGOCw4XFXk24t82VYveTKba7TaIiMsUO0JpsFTsiVq/ofgjoLseyHCVrVEm0RQH/YHDzy5mQ4p9wpyoS+WOup68hxHedKlzFZ6S5KW0TTCOuWR+Q==
Content-ID: <6425172E20A8214DBCA50779E859BFC7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5dfec4d-d155-4085-8f57-08d742c5fb76
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 21:10:39.3095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXgW9RsrjKdtvhG1WhREqGGJNI9djeQzItmK3SHBPLcYQcVZIcGJK5rp9TpSV+xv6/ep2eGvByn8v1LTmltSfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4026
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmMoNL2Hzao7pociYhfRm4X0QZsA7nsonGuCR+sCQ4c=;
 b=r63V2/Yp7zhq4B8KUWaVzuPPVsmyLTZiahiGqzOzGQ1ZRQk0LoMzokoZv6JvOjjFzZWg4Z5agJDD/QwBeYAO7K0dTUbw7BSFDt9Q7/zpnsUjI8NTQd9CWKdQXLADQeoArbZLTNFGAPixt7lt3HSpOIzgNVdyV1qszMpNO6TzZuI=
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

DQpPbiAyMDE5LTA5LTI2IDU6MDIgcC5tLiwgTGl1LCBTaGFveXVuIHdyb3RlOg0KPiBJIHRoaW5r
IHRoaXMgaXMgb25seSBmb3Igbm9uZS1od3MgY2FzZSAuDQpZZXMuIFRoaXMgaXMgaW5zaWRlIGFu
IGlmICghcGFzaWQgJiYgZGV2LT5kcW0tPnNjaGVkX3BvbGljeSA9PSANCktGRF9TQ0hFRF9QT0xJ
Q1lfTk9fSFdTKS4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4gSFdTIG1hecKgIGR5bmFt
aWMgY2hhbmdlIHRoZQ0KPiBtYXBwaW5nIGFuZCBkcml2ZXIgd2lsbCBub3QgZ2V0IHVwZGF0ZWQg
LsKgIElmIHRoYXQncyB0aGUgY2FzZSAsIHBsZWFzZQ0KPiBzcGVjaWZ5IHRoaXMgaXMgZm9yIG5v
bmUgaGFyZHdhcmUgc2NoZWR1bGVyIGNhc2UgaW4gdGhlIGhlYWRlciAuDQo+DQo+IFJlZ2FyZHMN
Cj4NCj4gc2hhb3l1bi5saXUNCj4NCj4gT24gMjAxOS0wOS0yNiA0OjA3IHAubS4sIEt1ZWhsaW5n
LCBGZWxpeCB3cm90ZToNCj4+IE9uIDIwMTktMDktMjYgMzo0NiBwLm0uLCBaaGFvLCBZb25nIHdy
b3RlOg0KPj4+IEJlY2F1c2Ugd2UgcmVjb3JkIHRoZSBtYXBwaW5nIGluIHRoZSBzb2Z0d2FyZSwg
d2UgY2FuIHF1ZXJ5IHBhc2lkDQo+Pj4gdGhyb3VnaCB2bWlkIHVzaW5nIHRoZSBzdG9yZWQgbWFw
cGluZyBpbnN0ZWFkIG9mIHJlYWRpbmcgZnJvbSBBVEMNCj4+PiByZWdpc3RlcnMuDQo+Pj4NCj4+
PiBUaGlzIGFsc28gcHJlcGFyZXMgZm9yIHRoZSBkZWZlYXR1cmVkIEFUQyBibG9jayBpbiBmdXR1
cmUgQVNJQ3MuDQo+Pj4NCj4+PiBDaGFuZ2UtSWQ6IEk3ODFjYjlkMzBkYzBjYzkzMzc5OTA4ZmYx
Y2Y4ZGE3OThiYjI2ZjEzDQo+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9A
YW1kLmNvbT4NCj4+PiAtLS0NCj4+PiAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2ludF9wcm9jZXNzX3Y5LmMgfCA1ICsrKy0tDQo+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ludF9wcm9jZXNzX3Y5LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYw0KPj4+IGluZGV4IGFiOGE2OTVjNGEz
Yy4uNzU0YzA1MmI3ZDcyIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9pbnRfcHJvY2Vzc192OS5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2ludF9wcm9jZXNzX3Y5LmMNCj4+PiBAQCAtNTgsOCArNTgsOSBAQCBzdGF0aWMg
Ym9vbCBldmVudF9pbnRlcnJ1cHRfaXNyX3Y5KHN0cnVjdCBrZmRfZGV2ICpkZXYsDQo+Pj4gICAg
IAkJbWVtY3B5KHBhdGNoZWRfaWhyZSwgaWhfcmluZ19lbnRyeSwNCj4+PiAgICAgCQkJCWRldi0+
ZGV2aWNlX2luZm8tPmloX3JpbmdfZW50cnlfc2l6ZSk7DQo+Pj4gICAgIA0KPj4+IC0JCXBhc2lk
ID0gZGV2LT5rZmQya2dkLT5nZXRfYXRjX3ZtaWRfcGFzaWRfbWFwcGluZ19wYXNpZCgNCj4+PiAt
CQkJCWRldi0+a2dkLCB2bWlkKTsNCj4+PiArCQlwYXNpZCA9IGRldi0+ZHFtLT52bWlkX3Bhc2lk
W3ZtaWRdOw0KPj4+ICsJCWlmICghcGFzaWQpDQo+Pj4gKwkJCXByX2VycigicGFzaWQgaXMgbm90
IHF1ZXJpZWQgY29ycmVjdGx5XG4iKTsNCj4+IFRoaXMgZXJyb3IgbWVzc2FnZSBpcyBub3QgaGVs
cGZ1bC4gQSBoZWxwZnVsIG1lc3NhZ2UgbWF5IGJlIHNvbWV0aGluZw0KPj4gbGlrZSAiTm8gUEFT
SUQgYXNzaWduZWQgZm9yIFZNSUQgJWQiLiBUaGF0IHNhaWQsIHByaW50aW5nIGVycm9yIG1lc3Nh
Z2VzDQo+PiBpbiBhbiBpbnRlcnJ1cHQgaGFuZGxlciB0aGF0IGNhbiBiZSBwb3RlbnRpYWxseSB2
ZXJ5IGZyZXF1ZW50IGlzIG5vdCB0aGUNCj4+IGJlc3QgaWRlYS4gVGhlcmUgaXMgYWxyZWFkeSBh
IFdBUk5fT05DRSBhIGZldyBsaW5lcyBiZWxvdyB0aGF0IHNob3VsZCBiZQ0KPj4gdHJpZ2dlcmVk
IGlmIFBBU0lEIGlzIG5vdCBhc3NpZ25lZC4NCj4+DQo+PiBSZWdhcmRzLA0KPj4gICAgwqAgRmVs
aXgNCj4+DQo+Pg0KPj4+ICAgICANCj4+PiAgICAgCQkvKiBQYXRjaCB0aGUgcGFzaWQgZmllbGQg
Ki8NCj4+PiAgICAgCQlwYXRjaGVkX2locmVbM10gPSBjcHVfdG9fbGUzMigobGUzMl90b19jcHUo
cGF0Y2hlZF9paHJlWzNdKQ0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
