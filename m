Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B8C2C6B1
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 14:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D0889D86;
	Tue, 28 May 2019 12:37:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800079.outbound.protection.outlook.com [40.107.80.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE53E89D86
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 12:37:19 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3015.namprd12.prod.outlook.com (20.178.53.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Tue, 28 May 2019 12:37:17 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e%6]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 12:37:17 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: Fix reload driver error
Thread-Topic: [PATCH] drm/amdgpu/display: Fix reload driver error
Thread-Index: AQHVFUAbCbIrNzxF3kaMzALPexvNP6aAeaiA
Date: Tue, 28 May 2019 12:37:17 +0000
Message-ID: <43969788-21bb-7955-9ecf-97081fb6a112@amd.com>
References: <1559039303-30239-1-git-send-email-Emily.Deng@amd.com>
In-Reply-To: <1559039303-30239-1-git-send-email-Emily.Deng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::35) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60356fb3-55de-4bab-ecc2-08d6e3693829
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3015; 
x-ms-traffictypediagnostic: BYAPR12MB3015:
x-microsoft-antispam-prvs: <BYAPR12MB30158273870C3BAE31B9E690EC1E0@BYAPR12MB3015.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(346002)(376002)(396003)(39860400002)(199004)(189003)(7736002)(52116002)(316002)(229853002)(6246003)(6486002)(2501003)(2906002)(31686004)(66446008)(64756008)(68736007)(76176011)(6116002)(3846002)(5660300002)(6436002)(66476007)(99286004)(66946007)(73956011)(66556008)(66066001)(110136005)(6512007)(8936002)(81166006)(25786009)(256004)(476003)(53936002)(14454004)(446003)(26005)(11346002)(102836004)(71200400001)(2616005)(71190400001)(81156014)(305945005)(86362001)(31696002)(486006)(478600001)(72206003)(386003)(36756003)(6506007)(8676002)(186003)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3015;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rIDzzU1B3XEEfeQ6orqE6Jr1KHQcsFBtKBA62vhcQz3cIa9cTzgyYWZyVvlIDL+yJ9oE9mQFzvo3DpDgI6efRXVr1OVxHdg+vp607AnVX8GDwl4ceoA8AgovgsbcC0pCGjsnwpaByTjXfUTZfXTZ6ehnMg8n9qSkMUceN3Oe/3lia8zIeOPUtbf60w+oTRnTdIWqtOroEC86l7LAjbDzbEPOsfHQ0e1aMJ/LYS4KyYqQuAQ4TM3xAteuGSTV2ypFsmDF3yS77keKJzwKG9cC8iCZFb35mfWGC4UFNBFIbr4qteij2D7FiOEict+LZYeat+xtwrM7kKT2HeRaZ2NMQDOz4eWvC/OK7LFa/GpP+tgtZUvJF2YO8sje8wT1b+Z1094xvB5vNgfWqeESSS9+yZ21eB1DXz5wvhQOSY+XJJo=
Content-ID: <A85A51D0ACC7004083A8CAABA7884F4F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60356fb3-55de-4bab-ecc2-08d6e3693829
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 12:37:17.6754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3015
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96g2lwSF0Zph37W48G87gDQkXXoCxcfUEeFtWiDF59I=;
 b=BIpXNEZxjI8JDd22ummSL+jEP0COdZDDti2zWAgEx/q19B6g7GZb+NyKcJbTSSSxbF4lHMAzt8STdJGLKe2sCG95cHMy2s82sOVlInuIZNDRZq/Qu7UzHF7G5ymnphnLN7XIrN2JqpnDGWkfWT0aU/TPRYet/s+NKVAXD6IjyYs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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

T24gNS8yOC8xOSA2OjI4IEFNLCBFbWlseSBEZW5nIHdyb3RlOg0KPiBJc3N1ZToNCj4gV2lsbCBo
YXZlIGZvbGxvdyBlcnJvciB3aGVuIHJlbG9hZCBkcml2ZXI6DQo+IFsgMzk4Ni41Njc3MzldIHN5
c2ZzOiBjYW5ub3QgY3JlYXRlIGR1cGxpY2F0ZSBmaWxlbmFtZSAnL2RldmljZXMvcGNpMDAwMDow
MC8wMDAwOjAwOjA3LjAvZHJtX2RwX2F1eF9kZXYnDQo+IFsgMzk4Ni41Njc3NDNdIENQVTogNiBQ
SUQ6IDE3NjcgQ29tbTogbW9kcHJvYmUgVGFpbnRlZDogRyAgICAgICAgICAgT0UgICAgIDUuMC4w
LXJjMS1jdXN0b20gIzENCj4gWyAzOTg2LjU2Nzc0NV0gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFu
ZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MgVWJ1bnR1LTEuOC4yLTF1YnVudHUx
IDA0LzAxLzIwMTQNCj4gWyAzOTg2LjU2Nzc0Nl0gQ2FsbCBUcmFjZToNCj4gLi4uLi4uDQo+IFsg
Mzk4Ni41Njc4MDhdICBkcm1fZHBfYXV4X3JlZ2lzdGVyX2Rldm5vZGUrMHhkYy8weDE0MCBbZHJt
X2ttc19oZWxwZXJdDQo+IC4uLi4uLg0KPiBbIDM5ODYuNTY5MDgxXSBrb2JqZWN0X2FkZF9pbnRl
cm5hbCBmYWlsZWQgZm9yIGRybV9kcF9hdXhfZGV2IHdpdGggLUVFWElTVCwgZG9uJ3QgdHJ5IHRv
IHJlZ2lzdGVyIHRoaW5ncyB3aXRoIHRoZSBzYW1lIG5hbWUgaW4gdGhlIHNhbWUgZGlyZWN0b3J5
Lg0KPiANCj4gUmVwcm9kdWNlIHNlcXVlbmNlczoNCj4gMS5tb2Rwcm9iZSBhbWRncHUNCj4gMi5t
b2Rwcm9iZSAtciBhbWRncHUNCj4gMy5tb2Rwcm9iZSBhbWRncHUNCj4gDQo+IFJvb3QgY2F1c2U6
DQo+IFdoZW4gdW5sb2FkIGRyaXZlciwgaXQgZG9uJ3QgdW5yZWdpc3RlciBhdXguDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tb2RlLmggICAgICAgICAgICAgICB8
ICAxICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jICAgICAgfCAxOCArKysrKysrKysrKysrKysrKy0NCj4gICAuLi4vZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICAgfCAgNiArKysrKy0NCj4gICAzIGZp
bGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21vZGUuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tb2RlLmgNCj4gaW5kZXggZTQ4ZmQzNS4uNzIw
OTU1YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21v
ZGUuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW9kZS5oDQo+
IEBAIC01MjUsNiArNTI1LDcgQEAgZW51bSBhbWRncHVfY29ubmVjdG9yX2RpdGhlciB7DQo+ICAg
c3RydWN0IGFtZGdwdV9kbV9kcF9hdXggew0KPiAgIAlzdHJ1Y3QgZHJtX2RwX2F1eCBhdXg7DQo+
ICAgCXN0cnVjdCBkZGNfc2VydmljZSAqZGRjX3NlcnZpY2U7DQo+ICsJYm9vbCBoYXNfYXV4Ow0K
PiAgIH07DQo+ICAgDQo+ICAgc3RydWN0IGFtZGdwdV9pMmNfYWRhcHRlciB7DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiBpbmRl
eCA4ZmUxNjg1Li5kZTM2OWFlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gQEAgLTM3NjAsNiArMzc2MCwxNiBAQCBp
bnQgYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfZ2V0X3Byb3BlcnR5KHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IsDQo+ICAgCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0KPiArc3Rh
dGljIHZvaWQgYW1kZ3B1X2RtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IpDQo+ICt7DQo+ICsJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFt
ZGdwdV9kbV9jb25uZWN0b3IgPSB0b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7DQo+
ICsNCj4gKwlpZiAoYW1kZ3B1X2RtX2Nvbm5lY3Rvci0+ZG1fZHBfYXV4Lmhhc19hdXgpIHsNCj4g
KwkJZHJtX2RwX2F1eF91bnJlZ2lzdGVyKCZhbWRncHVfZG1fY29ubmVjdG9yLT5kbV9kcF9hdXgu
YXV4KTsNCj4gKwkJYW1kZ3B1X2RtX2Nvbm5lY3Rvci0+ZG1fZHBfYXV4Lmhhc19hdXggPSBmYWxz
ZTsNCj4gKwl9DQo+ICt9DQoNClRoaXMgaXMgYSBnb29kIGNhdGNoLCBidXQgSSdtIHByZXR0eSBz
dXJlIHdlIGRvbid0IG5lZWQgdGhlIGhhc19hdXggDQpzdGF0ZSBoZXJlIGZvciB0aGlzLg0KDQpZ
b3Ugc2hvdWxkIGJlIGFibGUgdG8gY2FsbCBkcm1fZHBfYXV4X3VucmVnaXN0ZXIgcmVnYXJkbGVz
cyBvZiB3aGV0aGVyIA0KZHJtX2RwX2F1eF9yZWdpc3RlciBzdWNjZWVkZWQgb3Igbm90Lg0KDQpO
aWNob2xhcyBLYXpsYXVza2FzDQoNCj4gKw0KPiAgIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb25u
ZWN0b3JfZGVzdHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0KPiAgIHsNCj4g
ICAJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IgPSB0b19hbWRncHVfZG1f
Y29ubmVjdG9yKGNvbm5lY3Rvcik7DQo+IEBAIC0zNzg4LDYgKzM3OTgsMTEgQEAgc3RhdGljIHZv
aWQgYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9kZXN0cm95KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpDQo+ICAgCWRybV9kcF9jZWNfdW5yZWdpc3Rlcl9jb25uZWN0b3IoJmFjb25uZWN0b3It
PmRtX2RwX2F1eC5hdXgpOw0KPiAgIAlkcm1fY29ubmVjdG9yX3VucmVnaXN0ZXIoY29ubmVjdG9y
KTsNCj4gICAJZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwKGNvbm5lY3Rvcik7DQo+ICsJaWYgKGFjb25u
ZWN0b3ItPmkyYykgew0KPiArCQlpMmNfZGVsX2FkYXB0ZXIoJmFjb25uZWN0b3ItPmkyYy0+YmFz
ZSk7DQo+ICsJCWtmcmVlKGFjb25uZWN0b3ItPmkyYyk7DQo+ICsJfQ0KPiArDQo+ICAgCWtmcmVl
KGNvbm5lY3Rvcik7DQo+ICAgfQ0KPiAgIA0KPiBAQCAtMzg0Niw3ICszODYxLDggQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGFtZGdwdV9kbV9jb25uZWN0b3JfZnVu
Y3MgPSB7DQo+ICAgCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gYW1kZ3B1X2RtX2Nvbm5lY3Rv
cl9hdG9taWNfZHVwbGljYXRlX3N0YXRlLA0KPiAgIAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBk
cm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfZGVzdHJveV9zdGF0ZSwNCj4gICAJLmF0b21pY19z
ZXRfcHJvcGVydHkgPSBhbWRncHVfZG1fY29ubmVjdG9yX2F0b21pY19zZXRfcHJvcGVydHksDQo+
IC0JLmF0b21pY19nZXRfcHJvcGVydHkgPSBhbWRncHVfZG1fY29ubmVjdG9yX2F0b21pY19nZXRf
cHJvcGVydHkNCj4gKwkuYXRvbWljX2dldF9wcm9wZXJ0eSA9IGFtZGdwdV9kbV9jb25uZWN0b3Jf
YXRvbWljX2dldF9wcm9wZXJ0eSwNCj4gKwkuZWFybHlfdW5yZWdpc3RlciA9IGFtZGdwdV9kbV9j
b25uZWN0b3JfdW5yZWdpc3Rlcg0KPiAgIH07DQo+ICAgDQo+ICAgc3RhdGljIGludCBnZXRfbW9k
ZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVz
LmMNCj4gaW5kZXggNmUyMDVlZS4uMTkwZTkyYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVz
LmMNCj4gQEAgLTM4NywxMiArMzg3LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2RwX21z
dF90b3BvbG9neV9jYnMgZG1fbXN0X2NicyA9IHsNCj4gICB2b2lkIGFtZGdwdV9kbV9pbml0aWFs
aXplX2RwX2Nvbm5lY3RvcihzdHJ1Y3QgYW1kZ3B1X2Rpc3BsYXlfbWFuYWdlciAqZG0sDQo+ICAg
CQkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcikNCj4gICB7
DQo+ICsJaW50IHJldDsNCj4gICAJYWNvbm5lY3Rvci0+ZG1fZHBfYXV4LmF1eC5uYW1lID0gImRt
ZGMiOw0KPiAgIAlhY29ubmVjdG9yLT5kbV9kcF9hdXguYXV4LmRldiA9IGRtLT5hZGV2LT5kZXY7
DQo+ICAgCWFjb25uZWN0b3ItPmRtX2RwX2F1eC5hdXgudHJhbnNmZXIgPSBkbV9kcF9hdXhfdHJh
bnNmZXI7DQo+ICAgCWFjb25uZWN0b3ItPmRtX2RwX2F1eC5kZGNfc2VydmljZSA9IGFjb25uZWN0
b3ItPmRjX2xpbmstPmRkYzsNCj4gICANCj4gLQlkcm1fZHBfYXV4X3JlZ2lzdGVyKCZhY29ubmVj
dG9yLT5kbV9kcF9hdXguYXV4KTsNCj4gKwlyZXQgPSBkcm1fZHBfYXV4X3JlZ2lzdGVyKCZhY29u
bmVjdG9yLT5kbV9kcF9hdXguYXV4KTsNCj4gKwlpZiAoIXJldCkNCj4gKwkJYWNvbm5lY3Rvci0+
ZG1fZHBfYXV4Lmhhc19hdXggPSB0cnVlOw0KPiArDQo+ICAgCWRybV9kcF9jZWNfcmVnaXN0ZXJf
Y29ubmVjdG9yKCZhY29ubmVjdG9yLT5kbV9kcF9hdXguYXV4LA0KPiAgIAkJCQkgICAgICBhY29u
bmVjdG9yLT5iYXNlLm5hbWUsIGRtLT5hZGV2LT5kZXYpOw0KPiAgIAlhY29ubmVjdG9yLT5tc3Rf
bWdyLmNicyA9ICZkbV9tc3RfY2JzOw0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
