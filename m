Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C20215062A
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 11:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ACA89A4B;
	Mon, 24 Jun 2019 09:52:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700046.outbound.protection.outlook.com [40.107.70.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BE989A4B
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 09:52:06 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3919.namprd12.prod.outlook.com (10.255.238.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 09:52:04 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5%6]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 09:52:04 +0000
From: "Cui, Flora" <fcui@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Cui, Flora"
 <Flora.Cui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: fix scheduler timeout calc
Thread-Topic: [PATCH] drm/amdgpu: fix scheduler timeout calc
Thread-Index: AQHVKmnfrLQa+/IR2EO2XNtDTszxdaaqi7sAgAAEJoA=
Date: Mon, 24 Jun 2019 09:52:04 +0000
Message-ID: <d6aad1b3-8a8d-f773-c67b-4e719cadca43@amd.com>
References: <1561366217-13261-1-git-send-email-flora.cui@amd.com>
 <44e2f73b-2102-8361-034d-6176eb952ce3@gmail.com>
In-Reply-To: <44e2f73b-2102-8361-034d-6176eb952ce3@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR02CA0205.apcprd02.prod.outlook.com
 (2603:1096:201:20::17) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cef687ed-6801-47e5-5dea-08d6f8899c9c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3919; 
x-ms-traffictypediagnostic: MN2PR12MB3919:
x-microsoft-antispam-prvs: <MN2PR12MB39193F307494AC40BBF62CD6FAE00@MN2PR12MB3919.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(346002)(376002)(39860400002)(199004)(189003)(446003)(2616005)(476003)(66574012)(53936002)(229853002)(65806001)(71200400001)(71190400001)(3846002)(6116002)(31686004)(14444005)(36756003)(66066001)(65956001)(486006)(6246003)(256004)(8676002)(11346002)(8936002)(31696002)(66476007)(66556008)(68736007)(66946007)(64756008)(81156014)(81166006)(66446008)(6512007)(6506007)(386003)(76176011)(52116002)(73956011)(64126003)(26005)(102836004)(7736002)(2501003)(25786009)(305945005)(99286004)(72206003)(478600001)(6486002)(14454004)(65826007)(2906002)(186003)(58126008)(5660300002)(110136005)(316002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3919;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VY16MXxpfmNHj0j8NJnDKLFgrmQXuxmkpceE5VPTOpaNb+qoSwe9vxxTJeVL16UmR7I0wAIu/5glzdAE6XegRJinzrmbOi7wyQ+IPI9QdQGhAcYESEOaXXVZYT9EDR9BKiDiqz0NDTJcpKj2tePi4OjmfmYdcIc27NkFBjBjdOurGN+goK2Yak8tEQUCehTYONDPd+/4mUn1vdBie/PDZIIt0WaXmaLob8xdEAv8T8apKrXxYH1gZoyjWrgtRrcA+PP9NFz2sxSc3Q6n7QAS4FDno22IyFqXhcXmjJCjlk6R3Zf5Y9ZxIwksdiYg+GhMhh5JE5ueoOiezUl2GGOU4rse708vzrYGU1b8uwgLlSKOZ+k8goNYJzNzJDmuUmJPLcQ3c/cs7e+5FSwevJv3dWz/ZFnoWpsaCLck1/Qxf/8=
Content-ID: <AB38F41A7012534DA2325FD0117F6E95@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef687ed-6801-47e5-5dea-08d6f8899c9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 09:52:04.6392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3919
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWsPYsc5tyjdn2IdUupc6P1u1IIiI0ZhOUgXFrzQgQ0=;
 b=TaGB57JCycttPsmOKGFO0mCea3T3nKyfo/7aiXJoCZeohpE4w1XxlOW/IrBMhOVcFw7Lh9S7aSd7NHOZBOuvGByvKGARFQxU5Apj5iDuTARI7DXh7kGwc1XTwWNhr05U2FAKZ1DQe6NTeorvcu9gJSNa4OGRHepED2B4rG8S+V0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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

T0suIHdpbGwgdXBkYXRlIGluIHYyLg0KDQrlnKggNi8yNC8yMDE5IDU6MzYgUE0sIENocmlzdGlh
biBLw7ZuaWcg5YaZ6YGTOg0KPiBBbSAyNC4wNi4xOSB1bSAxMDo1MCBzY2hyaWViIEN1aSwgRmxv
cmE6DQo+PiBzY2hlZHVsZXIgdGltZW91dCBpcyBpbiBqaWZmaWVzDQo+Pg0KPj4gQ2hhbmdlLUlk
OiBJMjY3MDhjMTYzZGI5NDNmZjhkOTMwZGQ4MWJjYWI0YjRiOWQ4NGViMg0KPj4gU2lnbmVkLW9m
Zi1ieTogRmxvcmEgQ3VpIDxmbG9yYS5jdWlAYW1kLmNvbT4NCj4NCj4gSSBhY3R1YWxseSBzdWdn
ZXN0ZWQgdG8gZG8gdGhpcyBjb25zaXN0ZW50bHkgaW4gDQo+IGFtZGdwdV9kZXZpY2VfZ2V0X2pv
Yl90aW1lb3V0X3NldHRpbmdzIGFmdGVyIHBhcnNpbmcgdGhlIHZhbHVlLg0KPg0KPiBCVFc6IFRo
ZSB0ZXN0IGZvciBuZWdhdGl2ZSB2YWx1ZXMgdGhlcmUgaXMgc3RpbGwgbm90IGNvcnJlY3QgZWl0
aGVyLg0KPg0KPiBDYW4geW91IGZpeCB1cCBib3RoPyBDYXVzZSBvdGhlcndpc2Ugd2UgYXJlIG5v
dCBhYmxlIHRvIGNvbXBsZXRlbHkgDQo+IGRpc2FibGUgdGhlIHRpbWVvdXQgZm9yIHRlc3Rpbmcu
DQo+DQo+IENocmlzdGlhbi4NCj4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2ZlbmNlLmMgfCAzICsrKw0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZmVuY2UuYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2ZlbmNlLmMNCj4+IGluZGV4IGNiY2FhN2MuLjJlZGFhNmMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYw0KPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMNCj4+IEBAIC00ODEsNiArNDgxLDkgQEAg
aW50IGFtZGdwdV9mZW5jZV9kcml2ZXJfaW5pdF9yaW5nKHN0cnVjdCANCj4+IGFtZGdwdV9yaW5n
ICpyaW5nLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgfQ0KPj4gwqAgK8KgwqDCoMKgwqDCoMKgIGlmICh0aW1lb3V0ICE9IE1BWF9T
Q0hFRFVMRV9USU1FT1VUKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGltZW91dCA9IG1z
ZWNzX3RvX2ppZmZpZXModGltZW91dCk7DQo+PiArDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgciA9
IGRybV9zY2hlZF9pbml0KCZyaW5nLT5zY2hlZCwgJmFtZGdwdV9zY2hlZF9vcHMsKCkNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVtX2h3X3N1Ym1pc3Npb24s
IGFtZGdwdV9qb2JfaGFuZ19saW1pdCwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdGltZW91dCwgcmluZy0+bmFtZSk7DQo+DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
